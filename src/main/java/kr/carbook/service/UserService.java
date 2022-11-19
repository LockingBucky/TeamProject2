package kr.carbook.service;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReserveBean;
import kr.carbook.dao.UserDao;

@Service
public class UserService {
	
	
	@Autowired
	private UserDao userDao; // 데이터베이스 주입
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	

	
	//요청한 아이디가 사용 가능한지 여부를 판단
	public boolean checkUserIdExist(String id) {
		
		String name = userDao.checkUserIdExist(id);
		System.out.println("UserService's id : " + id);
		if(name == null) {
			return true;
		}
		else
			return false;
		
	}
	

	public String getLicenseType() {
		return userDao.getLicenseType(loginUserBean);
	}
	
	public void addUserInfo(MemberBean joinUserBean) {
		System.out.println("UserService's joinUserBean : " + joinUserBean);
		userDao.addUserInfo(joinUserBean);
	}
	
    public void getLoginUserInfo(MemberBean tempLoginUserBean) {
		
		MemberBean tempLoginUserBean2=userDao.getLoginUserInfo(tempLoginUserBean);
		//가져온 데이터가 있다면
		if(tempLoginUserBean2 != null) {
			
			loginUserBean.setId(tempLoginUserBean2.getId());
			loginUserBean.setName(tempLoginUserBean2.getName());
			loginUserBean.setUserLogin(true);
		}	
    }
    
 // 진혁 업데이트 2022.11.17
 	// 진혁 업데이트 2022.11.17
  
     
     
  	public List<ReserveBean> getReserveList(String id){				
  		return userDao.getReserveList(id);
  	}	
  	public ReserveBean getMyPaymentHistory(int rent_seq) {
  		return userDao.getMyPaymentHistory(rent_seq);
  	}
  	
  // 예약에 관한 삭제 3테이블
  	public void deletePaymentHistoryPayment(String id) {
  		userDao.deletePaymentHistoryPayment(id);
  	}
  	
  	public void deletePaymentHistoryRent(int rent_seq) {
  		userDao.deletePaymentHistoryRent(rent_seq);
  	}
  	
//  	public void deletePaymentHistoryCouponMember(int coupon_member_seq) {
//  		userDao.deletePaymentHistoryCouponMember(coupon_member_seq);
//  	}
  	
 	// 웰컴 기념 쿠폰 생성
  	public void addWelcomeCoupon(String id) {
  		userDao.addWelcomeCoupon(id);
 	}

  	//쿠폰 리스트
  	public List<ReserveBean> getCouponList(String id){
 		return userDao.getCouponList(id);
 	}
  	
 	// 진혁 업데이트 2022.11.17
 	// 진혁 업데이트 2022.11.17

    
}





