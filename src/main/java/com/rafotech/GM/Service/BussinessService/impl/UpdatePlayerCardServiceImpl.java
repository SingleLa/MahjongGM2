package com.rafotech.GM.Service.BussinessService.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rafotech.GM.DB.Model.RechargeLog;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.IRechargeLogDao;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.LoginDB.Model.Player;
import com.rafotech.GM.Service.BaseService.UserService;
import com.rafotech.GM.Service.BussinessService.UpdatePlayerCardService;
import com.rafotech.GM.Service.LoginService.PlayService;
import com.rafotech.GM.Util.DataSource;
import com.rafotech.GM.Util.DataSourceContextHolder;
@Service
public class UpdatePlayerCardServiceImpl implements UpdatePlayerCardService {
	
	@Autowired UserService userService;
	@Autowired PlayService playService;
	@Resource RedisTemplate<Object, Object> redisTemplate;
	@Autowired IRechargeLogDao Log;
	@Override

	public boolean updatePlayCard(int playerId, int card,
			UserBean user) {
		// TODO Auto-generated method stub
		DataSourceContextHolder.setDbType(DataSource.dataSource_GM);
		//user  card - card  , useCard +  card
		User us = new User();
		us.setId(user.getId());
		us.setCard(user.getCard() - card);
		us.setUsecard(user.getUsecard() + card);
		userService.update(us);
		
		//添加日志
		
		
		//player  card + card
		DataSourceContextHolder.setDbType(DataSource.dataSource_login);
		Player p = new Player();
		Player play = playService.getPlayerById(playerId);
		p.setId(playerId);
		p.setCard(play.getCard() + card);
		playService.updatePlay(p);
		DataSourceContextHolder.setDbType(DataSource.dataSource_GM);
	
		RechargeLog rechargeLog = new RechargeLog();
		rechargeLog.setBuyid(playerId);
		rechargeLog.setIsplayer(1);
		rechargeLog.setCardNum(card);
		rechargeLog.setSellerid(user.getId());
		Log.insertSelective(rechargeLog);
		
		
		//redis  缓存处理
			
		String key = p.getId().toString();
		Object playerCard = redisTemplate.opsForHash().get(key, "card");
		if(playerCard!=null){
		   Map<String, String> map = new HashMap<>();
		   map.put("card", String.valueOf(p.getCard()));
		   redisTemplate.boundHashOps(key).put("card", String.valueOf(p.getCard()));
		    }	       
		redisTemplate.boundHashOps("hall_user_card_update").put("uid", String.valueOf(p.getId()));		
		return true;
	}

}
