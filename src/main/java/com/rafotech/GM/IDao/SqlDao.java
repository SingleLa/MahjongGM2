package com.rafotech.GM.IDao;

import java.util.Map;

import com.rafotech.GM.IDao.Bean.SqlAdapter;



public interface SqlDao {

	
	public Map queryBySql(SqlAdapter sql);
	
	public void insertBySql(SqlAdapter sql);
	
	public void updateBySql(SqlAdapter sql);
	
	public void deleteBySql(SqlAdapter sql);
}
