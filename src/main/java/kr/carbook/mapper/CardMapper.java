package kr.carbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.carbook.beans.CardBean;	

public interface CardMapper {
	
	// 아이디 정보 불러오기
	@Select("select id " + 
			"from member " + 
			"where id = #{id}")
	CardBean getId(String id);
	
	// 등록된 결제카드 리스트 불러오기 
	@Select("select card_name, card_num " + 
			"from card " + 
			"where id = #{id}")
	List<CardBean> getCardListInfo(String id);
	
	// 결제카드 등록하기
	@Insert("insert into card values("
			+ "#{id}, "
			+ "#{card_name}, "
			+ "#{card_num}, "
			+ "#{card_pw}, "
			+ "#{card_month}, "
			+ "#{card_year}, " 
			+ "#{business_num})")
	void registerCardInfo(CardBean cardBean);
	
	@Select("select card_Num from card where id = #{id}")
	String getCardNum(String id);
	
	// 결제카드 정보 삭제
//	@Delete("delete from card where id = #{id}")
//	void deleteCardInfo(String id);
}
