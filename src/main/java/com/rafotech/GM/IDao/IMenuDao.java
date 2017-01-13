package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.MenuMapper;
import com.rafotech.GM.DB.Model.Menu;
import com.rafotech.GM.IDao.Bean.MenuBean;

public interface IMenuDao extends MenuMapper{
	
	Menu  getMenuByParent(int parentId);
	
	List<MenuBean> getAllMenu();

}
