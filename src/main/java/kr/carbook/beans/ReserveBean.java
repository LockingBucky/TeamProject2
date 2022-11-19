package kr.carbook.beans;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReserveBean {
	
	//멤버 차량 렌트관련
	String id;
	int price;
	String startdate;
	String enddate;
	String car_name;
	String car_brand;	
	String car_img1;
	String car_img2;
	String bb_zone;	
	int car_seq;
	int rent_seq;
	
	//픽업 &리턴 장소
	String return_zone;
	String pickup_zone;
	
	//쿠폰 전용
	int coupon_member_seq;
	String open_start_date;
	String open_end_date;
	String coupon_name;
	int coupon_count;
	int coupon_price;
	
	//결제부분
	int payment_seq;

      


	
}
