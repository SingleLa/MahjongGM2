package com.rafotech.GM.DB.Dao;

import com.rafotech.GM.DB.Model.RechargeLog;

public interface RechargeLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RechargeLog record);

    int insertSelective(RechargeLog record);

    RechargeLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RechargeLog record);

    int updateByPrimaryKey(RechargeLog record);
}