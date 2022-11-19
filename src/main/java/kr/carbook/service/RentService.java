package kr.carbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.carbook.beans.CarBean;
import kr.carbook.beans.CarOption_Bean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.RentBean;
import kr.carbook.dao.RentDAO;

@Service
public class RentService {

	@Autowired
	private RentDAO rentDAO;
	
	//차량 시퀀스 이름 가져오는거
	  public List<CarBean> getCars(String pickup_zone) {
	  System.out.println("CARNAME's pickup= "+pickup_zone);
		 return rentDAO.getCars(pickup_zone);
	  }
	  public CarBean getCarInfo(int car_seq) {
			System.out.println("CARNAME: " +car_seq);
			return rentDAO.getCarInfo(car_seq);
		}
	  
	  public MemberBean getMember(String id) {
			return rentDAO.getMember(id);
		}
	
	//db넣는것
	public void addRentInfo(RentBean select_RentBean) {
		System.out.println("RentService's select_rentBean : " + select_RentBean);
		rentDAO.addRentInfo(select_RentBean);
	}
	//차량옵션
	public CarOption_Bean getOption(int car_seq) {
		System.out.println("optionService");
		return rentDAO.getOption(car_seq);
	}
	
}
