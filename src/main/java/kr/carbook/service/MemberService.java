package kr.carbook.service;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.carbook.beans.MemberBean;
import kr.carbook.dao.MemberDAO;

@Service
public class MemberService {
	
	
	@Autowired
	private MemberDAO memberDAO; // 데이터베이스 주입
	
	@Resource(name="loginUserBean")
	private MemberBean loginUserBean;
	
	//요청한 아이디가 사용 가능한지 여부를 판단
	public boolean checkUserIdExist(String id) {
		
		String name = memberDAO.checkUserIdExist(id);

		if(name == null) {
			return true;
		}
		else
			return false;
	}
	
	
    public void getLoginUserInfo(MemberBean tempLoginUserBean) {
		
		MemberBean tempLoginUserBean2=memberDAO.getLoginUserInfo(tempLoginUserBean);
		//가져온 데이터가 있다면
		if(tempLoginUserBean2 != null) {
			
			loginUserBean.setId(tempLoginUserBean2.getId());
			loginUserBean.setName(tempLoginUserBean2.getName());
			loginUserBean.setUserLogin(true);
		}	
    }
    
    public void addUserInfo(MemberBean joinUserBean) {
    	memberDAO.addUserInfo(joinUserBean);
    }
    

    
 //============================================= 이우철 ==============================================    
    
    
    // 수정한 정보 업데이트
    public void modifyUserInfo(MemberBean modifyUserBean) {
    	    	
    	modifyUserBean.setId(loginUserBean.getId());
    	
    	memberDAO.modifyUserInfo(modifyUserBean);
    }
    
    // 마이페이지 개인정보 가져오기
    public void getMemberBeanInfo(MemberBean memberBean) {
    	
    	MemberBean tempMemberBeanInfo = memberDAO.getMemberBeanInfo(loginUserBean.getId());
    	
    	memberBean.setId(loginUserBean.getId());
    	memberBean.setName(tempMemberBeanInfo.getName());
    	memberBean.setBirth(tempMemberBeanInfo.getBirth());
    	memberBean.setEmail(tempMemberBeanInfo.getEmail());
    	memberBean.setPhone(tempMemberBeanInfo.getPhone());
    	memberBean.setAddress(tempMemberBeanInfo.getAddress());
    	memberBean.setLicense_type(tempMemberBeanInfo.getLicense_type());
    	memberBean.setLicense_num(tempMemberBeanInfo.getLicense_num());
    	memberBean.setLicense_start(tempMemberBeanInfo.getLicense_start());
    	memberBean.setLicense_end(tempMemberBeanInfo.getLicense_end());
    }
    
    // 면허증 정보 넘기기
    public void registerLicenseInfo(MemberBean licenseBean) {
    	
    	licenseBean.setId(loginUserBean.getId());
    	    	
    	memberDAO.registerLicenseInfo(licenseBean);
    }
    
    //============================================이우철=============================================
}





