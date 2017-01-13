package com.rafotech.GM.Service.BaseService;

import java.util.List;
import java.util.Map;

import com.rafotech.GM.DB.Model.Card;
import com.rafotech.GM.IDao.Bean.UserBean;

public interface CardService {
	
	public	List<Card> getAllCard();
		
	public 	Card getCardById(int id);
	
	public int AddCard(Card card);
	
	public int updateCard(Card card);
	
	public int deleteCardById(int id);
	
	public Map<String, Object> rechargeCard(int agentId,int card,int award,UserBean user);
}
