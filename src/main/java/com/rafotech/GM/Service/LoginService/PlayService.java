package com.rafotech.GM.Service.LoginService;

import com.rafotech.GM.LoginDB.Model.Player;

public interface PlayService {
	
		public 	Player getPlayerById(int id);
	
		public int updatePlay(Player player);
}
