package com.rafotech.GM.IDao.Bean;

import com.rafotech.GM.DB.Model.RechargeLog;

public class RechargeLogBean extends RechargeLog{

	
	UserBean  seller;
	UserBean buyer;
	String playerName;
	public UserBean getSeller() {
		return seller;
	}
	public void setSeller(UserBean seller) {
		this.seller = seller;
	}
	public UserBean getBuyer() {
		return buyer;
	}
	public void setBuyer(UserBean buyer) {
		this.buyer = buyer;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
	
}
