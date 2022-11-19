package kr.carbook.mapper;

import org.apache.ibatis.annotations.Select;

import kr.carbook.beans.CouponBean;

public interface CouponMapper {
	
	@Select("select * from coupon_member where id = #{id}")
	CouponBean getCoupon(String id);
	
}
