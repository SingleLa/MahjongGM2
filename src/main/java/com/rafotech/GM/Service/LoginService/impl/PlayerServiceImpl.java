package com.rafotech.GM.Service.LoginService.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rafotech.GM.LoginDB.Dao.PlayerMapper;
import com.rafotech.GM.LoginDB.Model.Player;
import com.rafotech.GM.Service.LoginService.PlayService;

@Service
public class PlayerServiceImpl implements PlayService {
	
	@Autowired PlayerMapper playMapper; 
	
	@Override
	public Player getPlayerById(int id) {
		// TODO Auto-generated method stub
		Player p = playMapper.selectByPrimaryKey(id);
		return p;
	}

	@Override
	public int updatePlay(Player player) {
		// TODO Auto-generated method stub
		return playMapper.updateByPrimaryKeySelective(player);
	}

}
