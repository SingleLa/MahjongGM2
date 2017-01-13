package com.rafotech.GM.Service.BaseService;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.UserBean;

public interface UserService {
	
	    public List<UserBean> getUserBean(UserBean userBean); 
	    
	    public UserBean getUserBean(User user); 
	    
		public List<UserBean> getAllUser();
		
		public UserBean getUserRoleById(int userId);
		
		public int addUser(User user);
		
		public int deleteUser(int userId);
		
		public PageInfo<UserBean> getAgent(UserBean userBean,int pageNo, int pageSize);
		
		public int update(User user);
		
		public List<Integer> getParentId(UserBean userBean);
}
