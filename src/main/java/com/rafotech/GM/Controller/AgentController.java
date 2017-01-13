package com.rafotech.GM.Controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.rafotech.GM.DB.Model.Area;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.IUserDao;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.AreaService;
import com.rafotech.GM.Service.BaseService.RoleService;
import com.rafotech.GM.Service.BaseService.UserService;
import com.rafotech.GM.Util.MD5Util;
import com.sun.net.httpserver.HttpContext;



@Controller
@RequestMapping(value="/agent")
public class AgentController {

	@Autowired UserService userService;
	@Autowired AreaService areaService;
	@Autowired RoleService roleService;
	
	@RequestMapping(value="/getAgent.do",method=RequestMethod.GET)  
	public String getArea(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
		   List<Area> areaList = areaService.getArea(null);
		   UserBean user = (UserBean) request.getSession().getAttribute("user");
		   model.addAttribute("user",user);
		   model.addAttribute("areaList",areaList);
        return "/agent/agent";  
    } 
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/ajaxAddAgent.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object>  ajaxAddAgent(UserBean userBean ,HttpServletRequest request, HttpServletResponse response){ 
		
		  UserBean user = (UserBean) request.getSession().getAttribute("user");
	      Map<String, Object> map = new HashMap<String, Object>();
		  UserBean params = new UserBean();
		  params.setUserName(userBean.getUserName());
		  List<UserBean> userList = userService.getUserBean(params);
		  int num = 0;
		  if(userList == null ){
			  //一个区域只有 一个区代理
			  if(userBean.getAgentType() == 2){
				  UserBean params2 = new UserBean();
				  params2.setAgentType(userBean.getAgentType());
				  params2.setAreaId(userBean.getAreaId());
				  List<UserBean> userList2 = userService.getUserBean(params2);
				  if(userList2 != null ){
					  map.put("success", false);
					  map.put("errorMsg", "区域代理只能存在一个，该区域已经存在区域代理！");
					  return map;  
				  }
			  }
			  
			  userBean.setPassword(MD5Util.MD5(userBean.getUserName()));
			  userBean.setCreaterid(user.getId());
			  userBean.setCreatetime(new Date());
			  num = userService.addUser(userBean);
			  map.put("success", true);
			  return map;  
		  }else{
			  map.put("success", false);
			  map.put("errorMsg", "电话号码重复");
			  return map;  
		  }
	      
	       
      
    } 
	
	@RequestMapping(value="/ajaxQueryAgent.do",method=RequestMethod.POST)  
	public @ResponseBody PageInfo<UserBean>  ajaxQueryAgent(UserBean userBean,int pageNo, int pageSize,HttpServletRequest request, HttpServletResponse response){  
	       if(userBean.getCreaterid() == null){
	    	   UserBean user = (UserBean) request.getSession().getAttribute("user");
				userBean.setCreaterid(user.getId());
	       }			
		   PageInfo<UserBean> page = userService.getAgent(userBean, pageNo,  pageSize);	      	       
        return page;  
    } 
	@RequestMapping(value="/ajaxQueryAgentById.do",method=RequestMethod.POST)  
	public @ResponseBody UserBean  ajaxQueryAgentById(int id,HttpServletRequest request, HttpServletResponse response){  
	    
		User user  = new User();
		user.setId(id);
		UserBean agent = userService.getUserBean(user);
		
        return agent;  
    } 
	@RequestMapping(value="/ajaxUpdateAgent.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object>  ajaxUpdateAgent(User user,HttpServletRequest request, HttpServletResponse response){  
	    
		Map<String, Object> map = new HashMap<>();
		int num  = userService.update(user);
		if(num == 0){
			map.put("success", false);
			map.put("error", "修改失败");
		}
		map.put("success", true);
        return map;  
    } 
}
