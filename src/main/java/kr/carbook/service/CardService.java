package kr.carbook.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.carbook.beans.CardBean;
import kr.carbook.beans.MemberBean;
import kr.carbook.dao.CardDAO;

@Service
public class CardService {
	
	@Autowired
	private CardDAO cardDAO;
	
	@Resource(name="loginUserBean")
	private MemberBean loginUserBean;
	
	 // 결제카드 아이디 정보
    public void getId(CardBean cardBean) {
    	
    	CardBean tempCardBean = cardDAO.getId(loginUserBean.getId());
    	
    	cardBean.setId(tempCardBean.getId());
    }
   
    // 등록된 결제카드 목록
    public List<CardBean> getCardListInfo(String id) {
        return cardDAO.getCardListInfo(id);
    }
   
    // 결제카드 정보 넘기기
    public void registerCardInfo(CardBean cardBean) {
    	
    	cardBean.setId(loginUserBean.getId());
    	
    	cardDAO.registerCardInfo(cardBean);
    }
    
	public String getCardNum(String id) {
		System.out.println("cardNum : " + cardDAO.getCardNum(id));
		return cardDAO.getCardNum(id);
	}
    // 결제카드 삭제하기 ** 수정사항(없으면 추가) 2002-11-15 오후 5:31 ** 이우철
//    public void deleteCardInfo(String id) {
//    	    	
//    	cardDAO.deleteCardInfo(id);
//    }

}
