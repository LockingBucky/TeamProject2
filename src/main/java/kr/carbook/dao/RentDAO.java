package kr.carbook.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.CarBean;
import kr.carbook.beans.CarOption_Bean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.RentBean;
import kr.carbook.mapper.RentMapper;

@Repository
public class RentDAO {

	@Autowired
	private RentMapper rentMapper;

	//차량정보 가져오는거
	public List<CarBean> getCars(String pickup_zone) {
		return rentMapper.getCars(pickup_zone);
	}
	//이건이제 시퀀스 통해서 가져올것.
	public CarBean getCarInfo(int car_seq) {
		return rentMapper.getCarInfo(car_seq);
	}
	
	//여기까지

	//유저 id가져오기
	public MemberBean getMember(String id) {
		return rentMapper.getMember(id);
	}

	//db넣는거
	public void addRentInfo(RentBean select_CarBean) {
		rentMapper.addRentInfo(select_CarBean);
	}
	
	//차량옵션 가져오기
	public CarOption_Bean getOption(int car_seq) {
		return rentMapper.getOption(car_seq);
	}
	
}

//현재 이곳이 문제가 발생.