package kr.carbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReserveBean;


public interface UserMapper {
	
	@Select("select name from member where id=#{id }")
	String checkUserIdExist(String id);
	
	@Insert("insert into member values("
			+ "#{id}, "
			+ "#{name}, "
			+ "#{pw}, " 
			+ "#{phone}, "
			+ "#{email}, "
			+ "#{address}, "
			+ "#{detailAddress}, "
			+ "null, "
			+ "null, "
			+ "null, "
			+ "null, "
			+ "#{birth })")
	void addUserInfo(MemberBean joinUserBean);
	
	@Select("select id, name "
			+ "from member "
			+ "where id=#{id } and pw=#{pw }")
	MemberBean getLoginUserInfo(MemberBean tempLoginUserBean);
	
	@Select("select license_type "
			+ "from member "
			+ "where id=#{id }")
	String getLicenseType(MemberBean loginMemberBean);
	
	
	// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17

	    // myReserve 리스트 페이지
		@Select("select r.startdate ,c.car_name , r.price, r.rent_seq "
				+ "from rent r, car c, member m "
				+ "where r.car_seq = c.car_seq and m.id = r.id and m.id = #{id}")
		List<ReserveBean> getReserveList(String id);	
		
		// myPayment 최종예약확인 페이지
		@Select("select r.startdate, r.enddate, r.rent_seq, c.car_name, r.pickup_zone, r.return_zone, r.price, c.car_img1, c.car_img2 "
				+ "from rent r, member m, car c "
				+ "where m.id = r.id and r.car_seq = c.car_seq "
				+ "and r.rent_seq = ${rent_seq}")
		ReserveBean getMyPaymentHistory(int rent_seq);
		
		
		// ※Reference 걸린 순서상 Payment -> Rent -> CouponMember 테이블 순으로 삭제가능
		// 예약에 관한 삭제 3테이블(join으로 여러 delete법 시도해봤지만 잘 안되어서 일단 보류)	
		@Delete("delete from coupon_member where id = #{id}")
		void deletePaymentHistoryPayment(String id);
		@Delete("delete from rent where rent_seq = #{rent_seq }")
		void deletePaymentHistoryRent(int rent_seq);
//		@Delete("delete from coupon_member where coupon_member_seq = #{coupon_member_seq}")
//		void deletePaymentHistoryCouponMember(int coupon_member_seq);

		

		//mycoupon 회원가입할때 같이 동시에 만들어지는 기념 무료 쿠폰추가 (10000원) ★★일회성임★★
		@Insert("insert into coupon_member values(coupon_member_seq.nextval, to_char(sysdate, 'yyyy-mm-dd'), "
				+ "'2023-04-18', '무료 회원 가입 기념 10000원 쿠폰', 10000, 1, #{id})")
		void addWelcomeCoupon(String id);
		
		
		
		//myVIP_coupon 리스트 페이지
		@Select("select cm.open_start_date, cm.open_end_date, cm.coupon_name, cm.coupon_price, cm.coupon_member_seq "
				+ "from member m, coupon_member cm "
				+ "where m.id = cm.id and m.id= #{id}")
		List<ReserveBean> getCouponList(String id);
		

		// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17
	
	
	
	
	
	
}
