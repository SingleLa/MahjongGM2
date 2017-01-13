package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.CardMapper;
import com.rafotech.GM.DB.Model.Card;

public interface ICardDao extends CardMapper{
		
	List<Card> selectAll();
}
