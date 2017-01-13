package com.rafotech.GM.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.RoleService;
import com.rafotech.GM.Service.BaseService.UserService;
import com.rafotech.GM.Util.MD5Util;

@Controller
@RequestMapping(value="/userMsg")
public class UserMsgController {

	@Autowired UserService userService;
	
	
	
	@RequestMapping(value="/getUserMsg.do",method=RequestMethod.GET)  
	public String getUserMsg(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
			HttpSession session = request.getSession();
			UserBean user = (UserBean) session.getAttribute("user");
			model.addAttribute("userMsg",user);
	        return "/userMsg/msg";
	}
	@RequestMapping(value="/getUpdatePassword.do",method=RequestMethod.GET)  
	public String getUpdatePassword(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
		
	        return "/userMsg/updatePassword";
	}
	@RequestMapping(value="/ajaxUpdatePassword.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxUpdatePassword(String oldPassword,String passWord,String againPassword,HttpServletRequest request){  
	       	Map<String, Object> map = new HashMap<String, Object>();
			HttpSession session = request.getSession();
			UserBean user = (UserBean) session.getAttribute("user");
			if(!MD5Util.MD5(oldPassword).endsWith(user.getPassword())){
				map.put("success", false);
				map.put("errorMsg", "原始密码不正确，请重新输入密码！");
				 return map;
			}
			if(!passWord.equals(againPassword)){
				map.put("success", false);
				map.put("errorMsg", "重新输入密码与第一次不符！");
				 return map;
			}
			UserBean param = new UserBean();
			param.setId(user.getId());
			param.setPassword(MD5Util.MD5(passWord));
			userService.update(param);
			map.put("success", true);
	        return map;
	}
	
}
