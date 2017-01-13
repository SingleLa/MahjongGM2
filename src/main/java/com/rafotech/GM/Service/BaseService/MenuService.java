package com.rafotech.GM.Service.BaseService;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;


import com.rafotech.GM.IDao.Bean.MenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;

public interface MenuService {
	
	public List<MenuBean> getMenueTreeByUser(UserBean user);
	
	public JSONArray getMenuJsON();
}
