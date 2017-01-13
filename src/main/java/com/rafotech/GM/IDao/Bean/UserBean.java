package com.rafotech.GM.IDao.Bean;

import java.util.List;

import com.rafotech.GM.DB.Model.Area;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.DB.Model.User;

public class UserBean extends User{
	
	private List<Role> roleList;
	
	private Area area;

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	

}
