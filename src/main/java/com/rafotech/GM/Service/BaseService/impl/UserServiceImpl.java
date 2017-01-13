package com.rafotech.GM.Service.BaseService.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.DB.Model.UserRole;
import com.rafotech.GM.IDao.IRoleDao;
import com.rafotech.GM.IDao.IUserDao;
import com.rafotech.GM.IDao.IUserRoleDao;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.UserService;
@Service
public class UserServiceImpl implements UserService{
	
		@Autowired IUserDao userDao;
		@Autowired IRoleDao roleDao;
		@Autowired IUserRoleDao userRoleDao;

		@Override
		public List<UserBean> getAllUser() {
			
			
			return userDao.getAllUser();
		}

		@Override
		public UserBean getUserRoleById(int userId) {
			// TODO Auto-generated method stub
			return userDao.getUserBeanById(userId);
		}

		@Override
		@Transactional
		public int addUser(User user) {
			// TODO Auto-generated method stub
			
			
			User user2 = userDao.getUserBeanByName(user.getUserName());
			if(user2 != null){
				return 0;
			}
			int num = userDao.insertSelective(user);
			User user3 = userDao.getUserBean(user); 
			//查询默认的角色
			Role role = roleDao.selectByState(2);
			UserRole userRole =  new UserRole();
			userRole.setRoleId(role.getId());
			userRole.setUserId(user3.getId());
			userRoleDao.insertSelective(userRole);
			return num;
		}

		@Transactional
		public int deleteUser(int userId) {
			// TODO Auto-generated method stub
			int num = userDao.deleteByPrimaryKey(userId);
			if(num == 1){
				userRoleDao.deleteUserRoleByUserId(userId);
			}
			return num;
		}

		@Override
		public PageInfo<UserBean> getAgent(UserBean userBean,int pageNo, int pageSize) {
			// TODO Auto-generated method stub

			PageHelper.startPage(pageNo, pageSize);
			List<UserBean> list = userDao.getUserByLike(userBean);
			 PageInfo<UserBean> page = new PageInfo<UserBean>(list);
			return page;
		}

		@Override
		public List<UserBean> getUserBean(UserBean userBean) {
			// TODO Auto-generated method stub
			List<UserBean> list = userDao.getUserByLike(userBean);
			if(list.size() > 0 ){
				return list;
			}else{
				return null;
			}
			
		}

		@Override
		public UserBean getUserBean(User user) {
			// TODO Auto-generated method stub
			return userDao.getUserBean(user);
		}

		@Override
		public int update(User user) {
			// TODO Auto-generated method stub
			return userDao.updateByPrimaryKeySelective(user);
		}

		@Override
		public List<Integer> getParentId(UserBean userBean) {
			// TODO Auto-generated method stub
			return getCreater(userBean);
		}
		public List<Integer>  getCreater(UserBean userBean){
			List<Integer> list = new ArrayList<>();
			if(userBean!=null && userBean.getCreaterid()!=null){
				UserBean par = userDao.getUserBeanById(userBean.getCreaterid());
				list.add(par.getId());
				list.addAll(getCreater(par));
			}				
			return list;
		}
		
}
