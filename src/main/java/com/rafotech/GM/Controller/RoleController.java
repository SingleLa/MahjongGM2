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

import com.rafotech.GM.DB.Model.RoleMenu;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.MenuBean;
import com.rafotech.GM.IDao.Bean.RoleBean;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.MenuService;
import com.rafotech.GM.Service.BaseService.RoleService;



@Controller
@RequestMapping(value="/role")
public class RoleController {
	
	@Autowired RoleService roleService;
	
	@RequestMapping(value="/getRole.do",method=RequestMethod.GET)  
	public String getRole(Model model,HttpServletRequest request, HttpServletResponse response){  
	       			
		List<RoleBean> lit = roleService.getRole();
		model.addAttribute("roleList", lit);
		
	        return "/role/roleConfig";  
	    } 
	@RequestMapping(value="/getRoleMenu.do",method=RequestMethod.GET)  
	public String updaterole(Model model,int roleId){  
	       
			
		List<RoleMenuBean>  lit = roleService.getRoleMenuByRoleId(roleId);
		model.addAttribute("roleId", roleId);
		model.addAttribute("menu", lit);
		
	        return "/role/add";  
	    } 
	
	@RequestMapping(value="/ajaxQueryRoleMenu.do",method=RequestMethod.POST)  
	public @ResponseBody RoleMenuBean ajaxGetRoleMenuBean(Model model,Integer roleMenuId){  
	         	        	     			
	       RoleMenuBean roleMenu = roleService.getByRoleMenuId(roleMenuId);
	        return roleMenu;  
	    } 
	
	@RequestMapping(value="/ajaxUpdateRoleMenu.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxUpdateRoleMenu(Model model,RoleMenuBean roleMenu){  
	      Map<String, Object> map = new HashMap<String, Object>();   	        	     			
	      int num = roleService.updateRoleMenu(roleMenu);
	      if(num == 1){
	    	  map.put("success", true);
	      }else{
	    	  map.put("success", false);
	      }
	        return map;  
	    } 
	@RequestMapping(value="/ajaxAddRoleMenu.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxAddRoleMenu(Model model,RoleMenu roleMenu){  
	      Map<String, Object> map = new HashMap<String, Object>();   	        	     			
	      int num = roleService.addRoleMenu(roleMenu);
	      if(num == 1){
	    	  map.put("success", true);
	      }else{
	    	  map.put("success", false);
	      }
	        return map;  
	    }
	@RequestMapping(value="/ajaxDeleteRoleMenu.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxDeleteRoleMenu(Model model,int id){  
	      Map<String, Object> map = new HashMap<String, Object>();   	        	     			
	      int num = roleService.deleteRoleMenu(id);
	      if(num == 1){
	    	  map.put("success", true);
	      }else{
	    	  map.put("success", false);
	      }
	        return map;  
	    }
	@RequestMapping(value="/ajaxAddRole.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxAddRole(Model model,String roleName){  
	      Map<String, Object> map = new HashMap<String, Object>();   	        	     			
	      int num = roleService.addRole(roleName);
	      if(num == 1){
	    	  map.put("success", true);
	      }else{
	    	  map.put("success", false);
	      }
	        return map;  
	    }
	@RequestMapping(value="/ajaxDeleteRole.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxDeleteRole(Model model,int roleId){  
	      Map<String, Object> map = new HashMap<String, Object>();   	        	     			
	      int num = roleService.deleteRole(roleId);
	      if(num != 1){
	    	  map.put("success", false);
	      }else{
	    	  map.put("success", true);
	      }
	        return map;  
	    }
}
