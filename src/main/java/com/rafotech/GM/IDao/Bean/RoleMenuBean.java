package com.rafotech.GM.IDao.Bean;

import com.rafotech.GM.DB.Model.Menu;
import com.rafotech.GM.DB.Model.RoleMenu;

public class RoleMenuBean extends RoleMenu{
	
	private Menu menu;

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public RoleMenuBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoleMenuBean(Menu menu) {
		this.menu = menu;
		
		// TODO Auto-generated constructor stub
	}
	
	
}
