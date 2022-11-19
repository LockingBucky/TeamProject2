package kr.carbook.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.CardBean;
import kr.carbook.mapper.CardMapper;

@Repository
public class CardDAO {
	
	@Autowired
	private CardMapper cardMapper;
	
	// 결제카드 id 정보 가져오기
	public CardBean getId(String id) {
		return cardMapper.getId(id);
	}
	
	// 결제카드 목록
	public List<CardBean> getCardListInfo(String id) {
		return cardMapper.getCardListInfo(id);
	}
	
	// 결제카드 등록
	public void registerCardInfo(CardBean cardBean) {
		cardMapper.registerCardInfo(cardBean);
	}
	
	public String getCardNum(String id) {
		System.out.println("cardNum : " + cardMapper.getCardNum(id));
		return cardMapper.getCardNum(id);
	}
	
	// 결제카드 삭제 ** 수정사항(없으면 추가) 2002-11-15 ** 이우철
//	public void deleteCardInfo(String id) {
//		cardMapper.deleteCardInfo(id);
//	}
}
