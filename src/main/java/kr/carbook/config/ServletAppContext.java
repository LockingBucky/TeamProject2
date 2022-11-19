package kr.carbook.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.carbook.beans.MemberBean;
import kr.carbook.interceptor.CheckLoginInterceptor;
import kr.carbook.interceptor.InjectionInterceptor;
import kr.carbook.mapper.CardMapper;
import kr.carbook.mapper.CouponMapper;
import kr.carbook.mapper.MemberMapper;
import kr.carbook.mapper.RentMapper;
import kr.carbook.mapper.ReviewMapper;
import kr.carbook.mapper.UserMapper;

//Spring MVC 프로젝트에 관련된 설정을 하는 클래스
//(servlet-context에서 <annotation-driven/>와 같음)
@Configuration 
//Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록한다.
@EnableWebMvc
//스캔할 패키지를 지정한다.
@ComponentScan("kr.carbook.controller")
@ComponentScan("kr.carbook.dao")
@ComponentScan("kr.carbook.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
	
	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	
    //Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
   @Override
   public void configureViewResolvers(ViewResolverRegistry registry) {
      // TODO Auto-generated method stub
      WebMvcConfigurer.super.configureViewResolvers(registry);
      registry.jsp("/WEB-INF/views/", ".jsp");
      
   }
   
   // 정적 파일의 경로를 매핑한다.
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // TODO Auto-generated method stub
      WebMvcConfigurer.super.addResourceHandlers(registry);
      registry.addResourceHandler("/**").addResourceLocations("/resources/");
   }
   
   @Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		
		return source;
	}
   
    // 쿼리문과 접속 정보를 관리하는 객체
  	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}
  	
  	
  //Mapper ----------------------------------
  	@Bean
  	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception{
  		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
  		factoryBean.setSqlSessionFactory(factory);
  		return factoryBean;
  	}
  	
  	@Bean
  	public MapperFactoryBean<ReviewMapper> getReviewMapper(SqlSessionFactory factory) throws Exception{
  		MapperFactoryBean<ReviewMapper> factoryBean = new MapperFactoryBean<ReviewMapper>(ReviewMapper.class);
  		factoryBean.setSqlSessionFactory(factory);
  		return factoryBean;
  	}
  	
  	@Bean
    public MapperFactoryBean<CardMapper> getCardMapper(SqlSessionFactory factory) throws Exception{
       MapperFactoryBean<CardMapper> factoryBean = new MapperFactoryBean<CardMapper>(CardMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
    }
  	
  	@Bean
    public MapperFactoryBean<MemberMapper> getMemberMapper(SqlSessionFactory factory) throws Exception{
       MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
    }
  	
    @Bean
    public MapperFactoryBean<RentMapper> getCarMapper(SqlSessionFactory factory) throws Exception{
       MapperFactoryBean<RentMapper> factoryBean = new MapperFactoryBean<RentMapper>(RentMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
    }
    
    @Bean
    public MapperFactoryBean<CouponMapper> getCouponMapper(SqlSessionFactory factory) throws Exception{
       MapperFactoryBean<CouponMapper> factoryBean = new MapperFactoryBean<CouponMapper>(CouponMapper.class);
       factoryBean.setSqlSessionFactory(factory);
       return factoryBean;
    }
  	
  	// Error 경로
  	@Bean 
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}
	// Error
	// 소스(MyBatis드라이버 정보)와 메세지(유효성 검사)를 분리하는 코드
	@Bean 
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
  	
	
	//Interceptor 추가-------------------------------------------------------
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			WebMvcConfigurer.super.addInterceptors(registry);
			
			InjectionInterceptor injectionInterceptor = new InjectionInterceptor(loginUserBean);
			InterceptorRegistration injectionRegistry = registry.addInterceptor(injectionInterceptor);
			injectionRegistry.addPathPatterns("/**");
			
			
			
			// 커널에 올려놓은 Interceptor
			CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
			InterceptorRegistration loginRegistry = registry.addInterceptor(checkLoginInterceptor);
			
			// Interceptor 호출하면 알아서 핸들러 호출해준다
			loginRegistry.addPathPatterns("/user/modify", "/user/logout", "/myPage/*", "/order/*", "/review/write"); //로그인 안하면 다 못쓰게 
			//reg2.excludePathPatterns("/board/main", "/board/read"); // 제외 : 로그인하지 않아도 이용할 수 있는 카테고리
			
		}
		
		// 정적 데이터 처리부분 : 객체를 생성하여 반환
		@Bean
		public StandardServletMultipartResolver multipartResolver() {
			return new StandardServletMultipartResolver(); // 객체생성
		}
	
}
