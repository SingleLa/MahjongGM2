package com.rafotech.GM.LoginDB.Dao;

import com.rafotech.GM.LoginDB.Model.Player;

public interface PlayerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Player record);

    int insertSelective(Player record);

    Player selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Player record);

    int updateByPrimaryKey(Player record);
}