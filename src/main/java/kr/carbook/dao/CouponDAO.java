package kr.carbook.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.CouponBean;
import kr.carbook.mapper.CouponMapper;

@Repository
public class CouponDAO {
	
	@Autowired
	private CouponMapper couponMapper;
	
	public CouponBean getCoupon(String id) {
		System.out.println("coponDao");
		return couponMapper.getCoupon(id);
	}
	
}
