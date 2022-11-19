package kr.carbook.beans;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RentBean {



	// 예약 및 결제
	private int rent_seq;
	private int price;
	// 픽업위치 반납위치
	@NotBlank
	private String pickup_zone;
	@NotBlank
	private String return_zone;
	private int car_seq;
	private String id;
	// 픽업날짜 반납날짜 픽업시간
	@NotBlank
	private String startDate;
	@NotBlank
	private String endDate;
	@NotBlank
	private String time_pick;

	private String bb_zone;
	// 개인정보부분

	private String address;
	private String phone;
	private String email;

	// request파람으로 받을부분 빈이 다르니까.
	// 픽업차량 이름,가격,고유번호
	private String car_name;
	private String car_brand;
	private String car_img1;
	
	private Date start;
	private Date end;


	private boolean checkCoupon;

	
	public RentBean() {
		this.checkCoupon = false;
	}
}