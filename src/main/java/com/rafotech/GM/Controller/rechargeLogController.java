package com.rafotech.GM.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rafotech.GM.IDao.IRechargeLogDao;
import com.rafotech.GM.IDao.Bean.RechargeLogBean;
import com.rafotech.GM.IDao.Bean.UserBean;

@Controller
@RequestMapping(value="/recharge")
public class rechargeLogController {
	
	@Autowired IRechargeLogDao dao;
	
	@RequestMapping(value="/getRecharge.do",method=RequestMethod.GET)  
	public String getMenu(Model model,RechargeLogBean recharge,HttpServletRequest request, HttpServletResponse response){  
			UserBean user = (UserBean) request.getSession().getAttribute("user");
	       //  给一个默认值 
			if(recharge.getSellerid() == null && recharge.getBuyid() == null){
				recharge.setSellerid(user.getId());
				recharge.setIsplayer(0);
			}
			List<RechargeLogBean> list = new ArrayList<>();
			if(recharge.getIsplayer() == 0){
				 list = dao.getAllRechargrLog(recharge);
			}
			if(recharge.getIsplayer() == 1){
				 list = dao.getPlayerRechargrLog(recharge);
			}
			model.addAttribute("rechargeList", list);
			model.addAttribute("user", user);
	        return "/card/rechargeLog";  
	    } 
}
