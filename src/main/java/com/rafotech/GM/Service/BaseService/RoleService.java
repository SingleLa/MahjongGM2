package com.rafotech.GM.Service.BaseService;

import java.util.List;

import com.rafotech.GM.DB.Model.RoleMenu;
import com.rafotech.GM.IDao.Bean.RoleBean;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;

public interface RoleService {
		
		
		public List<RoleBean>  getRole();
		
		public List<RoleMenuBean>  getRoleMenuByRoleId(int RoleId);
		
		public RoleMenuBean getByRoleMenuId(int roleMenuId);
		
		public int updateRoleMenu(RoleMenuBean menuRole);
		
		public int addRoleMenu(RoleMenu roleMenu);
		
		public int deleteRoleMenu(int id);
		
		public int addUserRole(int userId,int roleId);
		
		public int addRole(String roleName);
		
		public int deleteRole(int RoleId);
		
		public int deleteUserRole(int roleId,int userId);
		
		
}
