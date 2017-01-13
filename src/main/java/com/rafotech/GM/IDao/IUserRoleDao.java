package com.rafotech.GM.IDao;

import com.rafotech.GM.DB.Dao.UserRoleMapper;
import com.rafotech.GM.DB.Model.UserRole;

public interface IUserRoleDao extends UserRoleMapper{
	
	  int deleteUserRoleByUserId(int userId);
	  
	  int deleteUserRole(UserRole userRole);

}
