package com.rafotech.GM.Service.BaseService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.DB.Model.RoleMenu;
import com.rafotech.GM.DB.Model.UserRole;
import com.rafotech.GM.IDao.IRoleDao;
import com.rafotech.GM.IDao.IRoleMenuDao;
import com.rafotech.GM.IDao.IUserRoleDao;
import com.rafotech.GM.IDao.Bean.RoleBean;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;
import com.rafotech.GM.Service.BaseService.RoleService;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired IRoleDao roleDao;
	@Autowired IRoleMenuDao roleMenuDao;
	@Autowired IUserRoleDao userRoleDao;
	@Override
	public List<RoleBean> getRole() {
		// TODO Auto-generated method stub
		List<RoleBean> lit = roleDao.getAllRole();
		
		return lit;
	}
	@Override
	public List<RoleMenuBean>  getRoleMenuByRoleId(int roleId) {
		// TODO Auto-generated method stub
		Integer[] role = {roleId};
		return roleMenuDao.getRoleMenuBeanByRoleId(role);
	}
	@Override
	public RoleMenuBean getByRoleMenuId(int roleMenuId) {
		
		return roleMenuDao.getByRoleMenuId(roleMenuId);
	}
	@Override
	public int updateRoleMenu(RoleMenuBean menuRole) {
		// TODO Auto-generated method stub
		int num = roleMenuDao.updateByPrimaryKeySelective(menuRole);
		return num;
	}
	@Override
	public int addRoleMenu(RoleMenu roleMenu) {
		// TODO Auto-generated method stub
		RoleMenu r = new RoleMenu();
		r.setRoleId(roleMenu.getRoleId());
		r.setMenueId(roleMenu.getMenueId());
		List<RoleMenu> list =roleMenuDao.getByRoleMenu(r);
		if(list.size() > 0){
			return 0;
		}
		int num = roleMenuDao.insertSelective(roleMenu);
		return num;
	}
	@Override
	public int deleteRoleMenu(int id) {

		return roleMenuDao.deleteByPrimaryKey(id);
	}
	@Override
	public int addUserRole(int userId, int roleId) {
		// TODO Auto-generated method stub
		UserRole userrole = new UserRole();
		userrole.setUserId(userId);
		userrole.setRoleId(roleId);
		return userRoleDao.insertSelective(userrole);
	}
	@Override
	public int addRole(String roleName) {
		// TODO Auto-generated method stub
		Role role = new Role();
		role.setRoleName(roleName);
		role.setState(1);
		return roleDao.insertSelective(role);
	}
	@Override
	@Transactional
	public int deleteRole(int RoleId) {
		// TODO Auto-generated method stub
		int num = roleDao.deleteByPrimaryKey(RoleId);
		if(num != 0){
			RoleMenu roleMenu = new RoleMenu();
			roleMenu.setRoleId(RoleId);
			return  roleMenuDao.deleteRoleMenu(roleMenu);
		}
		return 0;
	}
	@Override
	public int deleteUserRole(int roleId, int userId) {
		UserRole ur =new UserRole();
		ur.setRoleId(roleId);
		ur.setUserId(userId);
		return userRoleDao.deleteUserRole(ur);
	}

}
