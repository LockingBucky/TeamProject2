package kr.carbook.beans;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CouponBean {
	
	int coupon_member_seq;
	Date open_start_date;
	Date open_end_date;
	String coupon_name;
	int coupon_price;
	int coupon_count;
	String id;
}
