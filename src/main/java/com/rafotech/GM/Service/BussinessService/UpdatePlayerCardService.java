package com.rafotech.GM.Service.BussinessService;

import java.util.Map;

import com.rafotech.GM.IDao.Bean.UserBean;

public interface UpdatePlayerCardService {
		
		public boolean updatePlayCard(int playerId , int card ,UserBean user);
}
