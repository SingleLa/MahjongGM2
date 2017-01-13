package com.rafotech.GM.IDao;



import java.util.List;

import com.rafotech.GM.DB.Dao.UserMapper;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.UserBean;

public interface IUserDao extends UserMapper{
	
	UserBean getUserBeanByName(String userName);
	
	UserBean getUserBeanById(int userId);
	
	List<UserBean> getAllUser();
	
	List<UserBean> getUserByLike(User user);
	
	UserBean getUserBean(User user);
	
}
