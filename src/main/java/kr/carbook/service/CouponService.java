package kr.carbook.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.carbook.beans.CouponBean;

import kr.carbook.dao.CouponDAO;

@Service
public class CouponService {
	
	
	@Autowired
	private CouponDAO couponDAO; // 데이터베이스 주입
	

	
	public CouponBean getCoupon(String id) {
		System.out.println("couponService");
		return couponDAO.getCoupon(id);
	}
}





