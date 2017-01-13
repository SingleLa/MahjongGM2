package com.rafotech.GM.IDao.Bean;

import java.util.List;

import com.rafotech.GM.DB.Model.Menu;
import com.rafotech.GM.DB.Model.Permission;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.DB.Model.User;

public class RoleBean extends Role{
	
     	private	List<User> userList;
     	
     	private List<Permission> permissionList;
     	
     	private List<Menu> menuList;

		public List<User> getUserList() {
			return userList;
		}

		public void setUserList(List<User> userList) {
			this.userList = userList;
		}

		public List<Permission> getPermissionList() {
			return permissionList;
		}

		public void setPermissionList(List<Permission> permissionList) {
			this.permissionList = permissionList;
		}

		public List<Menu> getMenuList() {
			return menuList;
		}

		public void setMenuList(List<Menu> menuList) {
			this.menuList = menuList;
		}
     	
     	
}
