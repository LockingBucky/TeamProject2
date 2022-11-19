package kr.carbook.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CarBean {
	
	// 픽업차량 이름,가격,고유번호
		private String car_brand;
		private int car_seq;
		private String car_name;
		private String bb_zone;
		private String pickup_zone;
		private String return_zone;
		private String car_img1;
		private String car_img2;
		private int price;
}
