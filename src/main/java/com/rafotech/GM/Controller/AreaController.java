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

import com.rafotech.GM.DB.Dao.AreaMapper;
import com.rafotech.GM.DB.Model.Area;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.AreaService;

@Controller
@RequestMapping(value="/area")
public class AreaController {
	
	@Autowired AreaService areaService;
	
	
	@RequestMapping(value="/getArea.do",method=RequestMethod.GET)  
	public String getArea(Model model,HttpServletRequest request, HttpServletResponse response){  
	       List<Area> list = areaService.getArea(null);
	       model.addAttribute("list", list);
	       System.out.println(new Date());
        return "/area/area";  
    } 
	@RequestMapping(value="/queryArea.do",method=RequestMethod.POST)  
	public String queryArea(Model model,String areaName){  
			Area param = new Area();
			param.setAreaName(areaName);
	       List<Area> list = areaService.getArea(param);
	       model.addAttribute("list", list);	       
        return "/area/area";  
    } 
	
	@RequestMapping(value="/ajaxAddArea.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> add(Model model,Area area){  
		  	Map<String, Object> map = new HashMap<String, Object>();
			Area param = new Area();
			param.setAreaName(area.getAreaName());
			List<Area> areaList = areaService.findArea(area);
			if(areaList != null && areaList.size() >0 ){
				map.put("success", false);
				map.put("errorMsg", "该区域名称已存在");
				return map; 
			}
			area.setCreateTime(new Date());
			int num =areaService.addArea(area);
		 
		   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
			   map.put("errorMsg", "添加失败！");
		   }
	        return map;  
	    }
	@RequestMapping(value="/ajaxDeleteArea.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> Delete(Model model,int id){  
		  	Map<String, Object> map = new HashMap<String, Object>();
		
	
			int num =areaService.deleteAreaById(id);
				   
		   if(num != 0){
			   map.put("success", true);
		   }else{
			   map.put("success", false);
			   map.put("errorMsg", "删除失败！");
		   }
	        return map;  
	    }
	
}
