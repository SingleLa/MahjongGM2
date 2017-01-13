package com.rafotech.GM.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import aj.org.objectweb.asm.Attribute;

import com.rafotech.GM.DB.Dao.UserMapper;
import com.rafotech.GM.IDao.IRoleMenuDao;
import com.rafotech.GM.IDao.IUserDao;
import com.rafotech.GM.IDao.Bean.MenuBean;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.LoginDB.Model.Player;
import com.rafotech.GM.Service.BaseService.MenuService;
import com.rafotech.GM.Service.LoginService.PlayService;
import com.rafotech.GM.Util.MD5Util;


@Controller

public class LoginController {
		
	

	@Autowired IUserDao userDao;
	@Autowired IRoleMenuDao roleMenuDao;
	@Autowired MenuService menuService;
	
	

	
	/**
	 * 
	 * @param model
	 * @return get方法请求  跳转登录页面
	 */
	@RequestMapping(value="/login.do",method=RequestMethod.GET)  
	public String loginForm(Model model,HttpServletRequest request, HttpServletResponse response){  
	
		
        
       
		
	        return "/login";  
	    }  
	

	/**
	 * 
	 * @param modelMap
	 * @param userName
	 * @param passWord
	 * @return 登录验证
 	 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String Login(ModelMap modelMap,HttpServletRequest request){
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		//就是代表当前的用户
		Subject currentUser = SecurityUtils.getSubject();
		//这里的token大家叫他令牌，也就相当于一张表格，你要去验证，你就得填个表，里面写好用户名密码，交给公安局的同志给你验证。
		UsernamePasswordToken token = new UsernamePasswordToken(
				userName, MD5Util.MD5(password));
		token.setRememberMe(true);
		
				
		
		try {
			//这里会调用MyShiro 的 doGetAuthenticationInfo 方法
			currentUser.login(token);
			} catch (AuthenticationException e) {
				//验证不通过
				modelMap.addAttribute("errorMsg", "用户名或密码错误");
				return "/login";
				//出现异常时返回结果
//				modelView.addObject("message", "login errors");
//				modelView.setViewName("/login");
				
				
			}
			if(currentUser.isAuthenticated()){
				
				System.out.println("success=============================");
				//验证 成功 返回结果
//				session.setAttribute("userinfo", user);
//				modelView.setViewName("/main");
				UserBean user=userDao.getUserBeanByName(userName);  
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				modelMap.addAttribute("user", user);
				//获取用户菜单
				List<MenuBean> menuList = menuService.getMenueTreeByUser(user);
				modelMap.addAttribute("menuList", menuList);
				session.setAttribute("menuList", menuList);
				return "/index";
			}else{
				System.out.println("fail=============================");
				//验证失败 返回结果
				modelMap.addAttribute("errorMsg", "用户名或密码错误");
				return "/login";
				
			}
			
		
		
	}
	
	/**
	 * 
	 * @param redirectAttributes
	 * @return 用户注销
	 */
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)    
	public String logout(ModelMap modelMap,HttpServletRequest request){   
	        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息  
	        SecurityUtils.getSubject().logout();    
	        request.getSession().removeAttribute("userName");
	        Map<String, Object> map = new HashMap<>();
	        map.put("msg", "已成功安全退出");
	        return "/login";  
	    }
	
	/**
	 * 错误页面 
	 * @return
	 */
	 @RequestMapping("/403")  
	 public String unauthorizedRole(){  
	        return "/403";  
	    }
}
