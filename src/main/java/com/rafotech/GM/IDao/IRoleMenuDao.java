package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.RoleMenuMapper;
import com.rafotech.GM.DB.Model.RoleMenu;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;

public interface IRoleMenuDao extends RoleMenuMapper{

	List<RoleMenuBean> getRoleMenuBeanByRoleId(Integer[] roleId);
	
	RoleMenuBean getByRoleMenuId(int roleMenuId);
	
	List<RoleMenu> getByRoleMenu(RoleMenu roleMenu);
	
	int deleteRoleMenu(RoleMenu roleMenu);
}
