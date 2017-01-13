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

import com.rafotech.GM.DB.Dao.MenuMapper;
import com.rafotech.GM.DB.Model.Menu;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.MenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.MenuService;



@Controller
@RequestMapping(value="/menu")
public class MenuController {
	
	@Autowired MenuService menuService;
	@Autowired MenuMapper menuMapper;
	
	@RequestMapping(value="/getMenu.do",method=RequestMethod.GET)  
	public String getMenu(Model model,HttpServletRequest request, HttpServletResponse response){  
	       // model.addAttribute("user", "tom");  
				       
	        return "/menuConfig";  
	    } 
	
	@RequestMapping(value="/ajaxGetMenu.do",method=RequestMethod.POST)  
	public @ResponseBody JSONArray ajaxGetMenu(Model model,HttpServletRequest request, HttpServletResponse response){  
	        model.addAttribute("user", "tom");  
	        UserBean user = (UserBean) request.getSession().getAttribute("user");
	      //获取菜单
			JSONArray menuList = menuService.getMenuJsON();
			
	       
	        return menuList;  
	    } 
	
	@RequestMapping(value="/ajaxUpdateMenu.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> ajaxUpdateMenu(Model model,Menu mene){
		
		int num =  menuMapper.updateByPrimaryKey(mene);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(num == 1){
			map.put("success", true);
		}else{
			map.put("success", false);
		}
		return map;
	}
}	
	

	
