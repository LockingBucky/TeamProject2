package kr.carbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.carbook.beans.CarBean;
import kr.carbook.beans.CarOption_Bean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.RentBean;

public interface RentMapper {

	//정보 넣기.
	@Insert("insert into rent values("
			+ "rent_seq.nextval, "
			+ "#{price}, "
			+ "#{pickup_zone}, "
			+ "#{return_zone}, "
			+ "#{car_seq}, "
			+ "#{id}, "
			+ "to_char(#{start, jdbcType=VARCHAR}, 'yyyy-mm-dd'), "
			+ "to_char(#{end, jdbcType=VARCHAR}, 'yyyy-mm-dd'), "
			+ "#{time_pick})")
	void addRentInfo(RentBean select_RentBean);
	
	//위치에따른 bb존에있는 차량 이름 가져오는 select문.
	//1번째

	@Select("select car_name, car_seq, price, car_brand, car_img1 from car where bb_zone=#{pickup_zone}")
    List<CarBean> getCars(String pickup_zone);
	
	//차량 이름을 통해서 시퀀스를 가져오는것. 이건 car-single에서 사용할것 같음.
	@Select("select car_seq, price, car_brand from car where car_name=#{car_name}")
	CarBean getCarSeq(String car_name);
	
	//차량 시퀀스를통해서 차량 정보 가져오기. 이건 CarSelect에서 사용
	@Select("select car_name, car_brand, price from car where car_seq=#{car_seq}")
	CarBean getCarInfo(int car_seq);
	
	//유저정보 가져오기
	@Select("select id, address, phone, email from member where id=#{id}")
	MemberBean getMember(String id);
	
	//차량 옵션가져오기
	@Select("select co.Maximum_Distance, co.max_power, co.seats, co.battary, co.bags, co.car_desc, c.car_img1, c.car_img2, c.car_img3, c.car_img4, c.car_img5, c.car_brand, c.car_name from car_option co, car c where co.car_seq = c.car_seq and car_option_seq=#{car_seq}")
	CarOption_Bean getOption(int car_seq);
	
	
	//일단 해야될것.
	//carselect 밑에부분에서 버튼을 누르면 차량이름을 보내주고 id을 보내서
	//getCarName을 통해서 시퀀스를 불러오고 그 불러온 시퀀스를 통해 
	//getCarInfo를 사용해서 내용을 불러온다. 불러온다음.
	//getCarOption을 통해 옵션 불러오기.

}
