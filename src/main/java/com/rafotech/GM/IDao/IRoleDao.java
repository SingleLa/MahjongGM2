package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.RoleMapper;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.IDao.Bean.RoleBean;

public interface IRoleDao extends RoleMapper{

	List<RoleBean> selectRoleByUserId(int userId);
	
	Role selectByState(int state);
	
	List<RoleBean> getAllRole();
}
