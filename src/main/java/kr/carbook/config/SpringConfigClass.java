package kr.carbook.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;




//public class SpringConfigClass implements WebApplicationInitializer{
//	
//	@Override
//	  public void onStartup(ServletContext servletContext) throws ServletException {
//	/*404error 가 나오고 콘솔에 onStartup 출력됨 
//	현재 Spring MVC라이브러리를 모두 setting하고 있는 상테이며  WebApplicationInitializer를 구현하고 있는
//	클래스가 있다면 자동으로 수행되므로  본래는 web.xml이 수행되어야 하지만 없으므로 
//SpringConfigClass가 작동되므로 404error여도 콘솔에 출력되는것임 -> 자바코드로 web.xml를 구현*/
//        //(web.xml에서 <servlet> 구현부와 같음)
//      // Spring MVC 프로젝트 설정을 위해 작성하는 클래스의 객체를 생성한다.
//      AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
//      servletAppContext.register(ServletAppContext.class);
//      
//      // 요청 발생 시 요청을 처리하는 서블릿을 DispatcherServlet으로 설정해준다.
//      DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
//      //매개변수로 선언된 servletContext객체를 이용하여 servlet 추가 load-on
//      ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//      
//      // 부가 설정
//      servlet.setLoadOnStartup(1);//가장먼저 받아들이겠다는 뜻
//      servlet.addMapping("/");
//      
//      //==================================================================
//       //(web.xml에서  <context-param>구현부와 같음)
//      // Bean을 정의하는 클래스를 지정한다
//      AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//      rootAppContext.register(RootAppContext.class);
//       //(web.xml에서  <listener>구현부와 같음)
//      ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
//      servletContext.addListener(listener);
//       //(web.xml에서  <filter>구현부와 같음)
//       // 파라미터 인코딩 설정
//      FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//      filter.setInitParameter("encoding", "UTF-8");
//       //dispatcher에 의해서 추가된 Servlet에 UTF-8로 encoding하겠다는 구현부
//      filter.addMappingForServletNames(null, false, "dispatcher");
//	          
//	   }
	
	
public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {
	   // DispatcherServlet에 매핑할 요청 주소를 셋팅한다.
	   @Override
	   protected String[] getServletMappings() {
	      // TODO Auto-generated method stub
	      return new String[] { "/" };
	   }

	   // Spring MVC 프로젝트 설정을 위한 클래스를 지정한다.
	   @Override
	   protected Class<?>[] getServletConfigClasses() {
	      // TODO Auto-generated method stub
	      return new Class[] { ServletAppContext.class };
	   }

	   // 프로젝트에서 사용할 Bean들을 정의기 위한 클래스를 지정한다.
	   @Override
	   protected Class<?>[] getRootConfigClasses() {
	      // TODO Auto-generated method stub
	      return new Class[] { RootAppContext.class };
	   }

	   // 파라미터 인코딩 필터 설정
	   @Override
	   protected Filter[] getServletFilters() {
	      // TODO Auto-generated method stub
	      CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
	      encodingFilter.setEncoding("UTF-8");
	      return new Filter[] {encodingFilter};
	   }
	   
	   // 정적데이터의 환경설정 : 용량
	   //null: 사용자가 입력한 내용을 임시기억할 아파치톰켓에서 제공하는 서버의 임시기억장소
		//52428800 :  업로드 데이터의 용량 (1024*50) 50M로 설정
		//524288000 : 파일데이터를 포함한 전체용량 500M 설정
		//0 : 파일의 임계값(데이터를 받아서 자동으로 저장)
	   
	   @Override
	   protected void customizeRegistration(Dynamic registration) {
		   super.customizeRegistration(registration);
		
		   // 1. 서버(임시기억장소|백업용) 2. 업로드할 용량(50Mb(1024*50)) 3. 전체용량  4.
		   MultipartConfigElement config1 = new MultipartConfigElement(null, 52428800, 524288000, 0);
		   registration.setMultipartConfig(config1);
	   }
	
}
