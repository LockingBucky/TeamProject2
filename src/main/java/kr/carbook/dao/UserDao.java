package kr.carbook.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReserveBean;
import kr.carbook.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	
	
	public String checkUserIdExist(String id) {
		
		return userMapper.checkUserIdExist(id); // sql 문 실행 
	}
	
	public void addUserInfo(MemberBean joinUserBean) {
		userMapper.addUserInfo(joinUserBean);
	}
	
	public MemberBean getLoginUserInfo(MemberBean tempLoginUserBean) {	
		return userMapper.getLoginUserInfo(tempLoginUserBean);
	}
	
	public ReserveBean getMyPaymentHistory(int rent_seq) {
		return userMapper.getMyPaymentHistory(rent_seq);
	}
	
	public String getLicenseType(MemberBean loginMemberBean) {
		return userMapper.getLicenseType(loginMemberBean);
	}
	
	// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17
		public List<ReserveBean> getReserveList(String id) {
			return userMapper.getReserveList(id);
		}

		// 예약에 관한 삭제 3테이블
		public void deletePaymentHistoryPayment(String id) {
			userMapper.deletePaymentHistoryPayment(id);
		}
		public void deletePaymentHistoryRent(int rent_seq) {
			userMapper.deletePaymentHistoryRent(rent_seq);
		}

//		public void deletePaymentHistoryCouponMember(int coupon_member_seq) {
//			userMapper.deletePaymentHistoryCouponMember(coupon_member_seq);
//		}

		// 웰컴 기념 쿠폰 생성
		public void addWelcomeCoupon(String id) {
			userMapper.addWelcomeCoupon(id);
		}

		// 쿠폰 리스트 확인
		public List<ReserveBean> getCouponList(String id) {
			return userMapper.getCouponList(id);
		}

		// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17

}
	

