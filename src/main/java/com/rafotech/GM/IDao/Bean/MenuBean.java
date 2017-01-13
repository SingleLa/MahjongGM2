package com.rafotech.GM.IDao.Bean;

import java.util.List;

import com.rafotech.GM.DB.Model.Menu;

public class MenuBean extends Menu{
	
    private	List<MenuBean> menuList;

	public List<MenuBean> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<MenuBean> menuList) {
		this.menuList = menuList;
	}

	public MenuBean() {
		
		super();
		// TODO Auto-generated constructor stub
	}
    
	
public MenuBean(Menu m ,List<MenuBean> list) {
		
		this.setId(m.getId());
		this.setLevel(m.getLevel());
		this.setMenuList(list);
		this.setMenuName(m.getMenuName());
		this.setMenuUrl(m.getMenuUrl());
		this.setParent(m.getParent());
		this.setState(m.getState());
	
		
	}
    
}
