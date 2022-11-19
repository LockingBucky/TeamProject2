package kr.carbook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.MemberBean;
import kr.carbook.mapper.MemberMapper;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	public String checkUserIdExist(String id) {
		
		return memberMapper.checkUserIdExist(id); // sql 문 실행 
	}
	
	public void addUserInfo(MemberBean joinUserBean) {
		memberMapper.addUserInfo(joinUserBean);
	}
	
	public MemberBean getLoginUserInfo(MemberBean tempLoginUserBean) {	
		return memberMapper.getLoginUserInfo(tempLoginUserBean);
	}
	

	
	//========================================이우철=================================================


		// 개인정보수정 업데이트 
		public void modifyUserInfo(MemberBean modifyUserBean) {
			memberMapper.modifyUserInfo(modifyUserBean);
		}
		
		// 마이페이지 개인정보 가져오기
		public MemberBean getMemberBeanInfo(String id) {
			return memberMapper.getMemberBeanInfo(id);
		}
		
		// 면허증 등록
		public void registerLicenseInfo(MemberBean licenseBean) {
			memberMapper.registerLicenseInfo(licenseBean);
		}
		
		//========================================이우철=================================================
}
