package com.rafotech.GM.Service.BaseService.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rafotech.GM.DB.Dao.CardMapper;
import com.rafotech.GM.DB.Model.Card;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.ICardDao;
import com.rafotech.GM.IDao.IRechargeLogDao;
import com.rafotech.GM.IDao.IUserDao;
import com.rafotech.GM.IDao.Bean.RechargeLogBean;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.CardService;
import com.rafotech.GM.Util.PropertyConfigUtil;
@Service
public class CardServiceImpl implements CardService {
	
	@Autowired  ICardDao carDao;
	@Autowired IUserDao userDao;
	@Autowired IRechargeLogDao Log;
	@Override
	public List<Card> getAllCard() {
		// TODO Auto-generated method stub
		return carDao.selectAll();
	}

	@Override
	public Card getCardById(int id) {
		// TODO Auto-generated method stub
		return carDao.selectByPrimaryKey(id);
	}

	@Override
	public int AddCard(Card card) {
		// TODO Auto-generated method stub
		return carDao.insertSelective(card);
	}

	@Override
	public int updateCard(Card card) {
		// TODO Auto-generated method stub
		return carDao.updateByPrimaryKeySelective(card);
	}

	@Override
	public int deleteCardById(int id) {
		// TODO Auto-generated method stub
		return carDao.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional
	/**
	 * 需要添加日志  添加 账单信息  暂无
	 */
	public Map<String, Object> rechargeCard(int agentId, int card, int award, UserBean user) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		
		//获取被充值人的信息
		UserBean agent = userDao.getUserBeanById(agentId);
		
		//List<Integer> parList = getCreater(agent);
		int agentType = agent.getAgentType();
		//获取 充值人的代理信息
		int userAgentType = user.getAgentType();
		//充值人为 admin 只能给总代理充值
		if(userAgentType == 4){
			if(agentType != 3){		
				map.put("success", false);
				map.put("errorMsg", "不能跨级充值");
				return map;			
			}
			//房卡从 admin 发 admin 无消耗
			UserBean params = new UserBean();
			params.setId(agentId);
			int card2 = card + award;
			params.setCard(card2+agent.getCard());
			params.setCardBaseCount(card+agent.getCardBaseCount());
			params.setCardAwardCount(award+agent.getCardAwardCount());
			userDao.updateByPrimaryKeySelective(params);
			RechargeLogBean log = new RechargeLogBean();
			log.setSellerid(user.getId());
			log.setBuyid(agentId);
			log.setAwardNum(award);
			log.setCardNum(card);
			log.setCreateTime(new Date());
			log.setRechargeType(0);
			Log.insertSelective(log);
			map.put("success", true);
			return map;
		}
		//总代理只能给区代理 充值
		if(userAgentType == 3){
			if(agentType != 2){				
				map.put("success", false);
				map.put("errorMsg", "不能跨级充值");
				return map;				
			}
			if(user.getCard() == null || user.getCard() <card){
		    	map.put("success", false);
		    	map.put("errorMsg", "余额不足 无法充值");
		    	return map;	
		    }
			//房卡从 总代理 发      总代理 有消耗
			User parentParams = new User();
			parentParams.setId(user.getId());
			parentParams.setCard(user.getCard() - card);
			parentParams.setUsecard(user.getUsecard()+card);
			userDao.updateByPrimaryKeySelective(parentParams);
			
			
			UserBean params = new UserBean();
			params.setId(agentId);
			int card2 = card + award;
			params.setCard(card2+agent.getCard());
			params.setCardBaseCount(card+agent.getCardBaseCount());
			params.setCardAwardCount(award+agent.getCardAwardCount());
			userDao.updateByPrimaryKeySelective(params);
			
			RechargeLogBean log = new RechargeLogBean();
			log.setSellerid(user.getId());
			log.setBuyid(agentId);
			log.setAwardNum(award);
			log.setCardNum(card);
			log.setCreateTime(new Date());
			log.setRechargeType(0);
			Log.insertSelective(log);
			map.put("success", true);
			return map;
		}
		//区代理只能给普通代理充值
		if(userAgentType == 2){
			if(agentType != 1){				
				map.put("success", false);
				map.put("errorMsg", "不能跨级充值");
				return map;			
			}
			if(user.getCard() == null || user.getCard() <card){
		    	map.put("success", false);
		    	map.put("errorMsg", "余额不足 无法充值");
		    	return map;	
		    }
			//房卡从 区代理 发      区代理 有消耗
			User parentParams = new User();
			parentParams.setId(user.getId());
			parentParams.setCard(user.getCard() - card);
			parentParams.setUsecard(user.getUsecard()+card);
			userDao.updateByPrimaryKeySelective(parentParams);
			
			UserBean params = new UserBean();
			params.setId(agentId);
			int card2 = card + award;
			params.setCard(card2+agent.getCard());
			params.setCardBaseCount(card+agent.getCardBaseCount());
			params.setCardAwardCount(award+agent.getCardAwardCount());
			userDao.updateByPrimaryKeySelective(params);
			//如果被重置的认识普代 查看他的复代理  如果复代理也是普代  则 复代理 会有提成
			if(agentType == 1){
				int parentId = agent.getCreaterid();
				User parent = userDao.selectByPrimaryKey(parentId);
				//如果 父代理 也是 普通代理
				if(parent.getAgentType() == 1){
					//有提成
					//获取提成比例
					String percentage = PropertyConfigUtil.getValue("percentage", "/common.properties");				
					Integer bascCard = (int)(parent.getCardBaseCount() * Float.valueOf(percentage));
					User father = new User();
					father.setId(parent.getId());
					father.setCard(parent.getCard()+bascCard);
					father.setCardCompensateCount(parent.getCardCompensateCount()+bascCard);
					userDao.updateByPrimaryKeySelective(father);
					RechargeLogBean log2 = new RechargeLogBean();
					log2.setPercentageNum(bascCard);
					log2.setBuyid(agentId);			
					log2.setCreateTime(new Date());		
					Log.insertSelective(log2);
					
				}
			}
			RechargeLogBean log = new RechargeLogBean();
			log.setSellerid(user.getId());
			log.setBuyid(agentId);
			log.setAwardNum(award);
			log.setCardNum(card);
			log.setCreateTime(new Date());
			log.setRechargeType(0);
			Log.insertSelective(log);

			map.put("success", true);
			return map;
		}
		
		
		
		map.put("success", false);
		return map;		
	}
	

	
}
