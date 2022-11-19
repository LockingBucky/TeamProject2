package kr.carbook.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.carbook.beans.MemberBean;

public interface MemberMapper {
	
	@Select("select name from member where id=#{id }")
	String checkUserIdExist(String id);
	
	@Insert("insert into member values("
			+ "#{id}, "
			+ "#{name}, "
			+ "#{pw}, " 
			+ "#{phone}, "
			+ "#{address}, "
			+ "#{license_type}, "
			+ "#{license_num}, "
			+ "#{license_start}, "
			+ "#{license_end}, "
			+ "#{birth}, "
			+ "#{gender}, "
			+ "#{email}, "
			+ "#{pw2})")
	void addUserInfo(MemberBean joinUserBean);
	
	@Select("select id, name "
			+ "from member "
			+ "where id=#{id} and pw=#{pw}")
	MemberBean getLoginUserInfo(MemberBean tempLoginUserBean);
	

	
	//========================================이우철=================================================
	
		// 사용자 정보 수정 
		@Update("update member " + 
				"set pw = #{pw}, phone = #{phone}, address = #{address}, birth = #{birth}, email = #{email} " + 
				"where id = #{id}")
		void modifyUserInfo(MemberBean modifyUserBean);
		
		// 마이페이지 개인정보 가져오기
		@Select("select license_type, license_num, license_start, license_end, id, name, birth, email, phone, address " + 
				"from member " + 
				"where id = #{id}")
		MemberBean getMemberBeanInfo(String id);
		
		// 면허증 등록
		@Update("update member " + 
				"set license_type = #{license_type}, license_num = #{license_num}, license_start = #{license_start}, license_end = #{license_end} " + 
				"where id = #{id}")
		void registerLicenseInfo(MemberBean licenseBean);
		
		//========================================이우철=================================================

}
