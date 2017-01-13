package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.RechargeLogMapper;
import com.rafotech.GM.IDao.Bean.RechargeLogBean;

public interface IRechargeLogDao extends RechargeLogMapper{
		
		List<RechargeLogBean> getAllRechargrLog(RechargeLogBean recharge);
		
		List<RechargeLogBean> getPlayerRechargrLog(RechargeLogBean recharge);
}
