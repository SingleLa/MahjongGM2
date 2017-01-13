package com.rafotech.GM.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.RoleBean;
import com.rafotech.GM.IDao.Bean.UserBean;

import com.rafotech.GM.Service.BaseService.RoleService;
import com.rafotech.GM.Service.BaseService.UserService;



@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired UserService userService;
	@Autowired RoleService roleService;
	
	@RequestMapping(value="/getUser.do",method=RequestMethod.GET)  
	public String getMenu(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
		
		
			List<UserBean> list = userService.getAllUser();
			model.addAttribute("userList", list);
			
	        return "/user/user";  
	    } 
	@RequestMapping(value="/addUser.do",method=RequestMethod.GET)  
	public String getAdd(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
			
	        return "/user/add";  
	    }
	
	
	@RequestMapping(value="/ajaxGetUserRole.do",method=RequestMethod.POST)  
	public @ResponseBody UserBean ajaxGetMenu(Model model,int userId){  
	       
			UserBean user = userService.getUserRoleById(userId); 
	       
	        return user;  
	    } 
	
	
	@RequestMapping(value="/ajaxAddUser.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> add(Model model,User user){  
	       
			//UserBean user = userService.getUserRoleById(userId); 
		   int num = userService.addUser(user);
		   Map<String, Object> map = new HashMap<String, Object>();
		   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
		   }
	        return map;  
	    } 
	@RequestMapping(value="/ajaxDeleteUser.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> delete(Model model,int userId){  
	       
			//UserBean user = userService.getUserRoleById(userId); 
		   int num = userService.deleteUser(userId);
		   Map<String, Object> map = new HashMap<String, Object>();
		   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
		   }
	        return map;  
	    } 
	@RequestMapping(value="/ajaxQueryUserRole.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxQueryUserRole(Model model,int userId){  
	       
			UserBean user = userService.getUserRoleById(userId); 
			List<RoleBean> role = roleService.getRole();
			Map<String, Object> map = new HashMap<>();
			map.put("user", user);
			map.put("role", role);
	        return map;  
	    } 
	@RequestMapping(value="/ajaxAddUserRole.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxAddUserRole(Model model,int userId,int roleId){  
	       
		   int num = roleService.addUserRole(userId, roleId);
		   Map<String, Object> map = new HashMap<String, Object>();
		   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
		   }
	        return map;
	          
	    } 
	@RequestMapping(value="/ajaxDeleteUserRole.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxDeleteUserRole(Model model,int roleId , int userId){  
	       
		   int num = roleService.deleteUserRole(roleId, userId);
		   Map<String, Object> map = new HashMap<String, Object>();
		   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
		   }
	        return map;
	          
	    } 
	
}
