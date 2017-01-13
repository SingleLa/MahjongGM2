package com.rafotech.GM.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rafotech.GM.DB.Model.Area;
import com.rafotech.GM.DB.Model.Card;
import com.rafotech.GM.DB.Model.User;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.LoginDB.Model.Player;
import com.rafotech.GM.Service.BaseService.CardService;
import com.rafotech.GM.Service.BaseService.UserService;
import com.rafotech.GM.Service.BussinessService.UpdatePlayerCardService;
import com.rafotech.GM.Service.LoginService.PlayService;
import com.rafotech.GM.Util.PropertyConfigUtil;

@Controller
@RequestMapping(value="/card")
public class CardController {

	@Autowired UserService userService;
	@Autowired CardService cardService;
	@Autowired PlayService playService;
	@Autowired  UpdatePlayerCardService updatePlayerCardService;
	
	@RequestMapping(value="/getCard.do",method=RequestMethod.GET)  
	public String getArea(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
		List<Card> list = cardService.getAllCard();
		model.addAttribute("cardList", list);
        return "/card/card";  
    } 
	@RequestMapping(value="/ajaxQueryCardById.do",method=RequestMethod.POST)  
	public @ResponseBody Card ajaxQueryCardById(int id){  
	       
		Card card = cardService.getCardById(id);
		
        return card ;  
    } 
	@RequestMapping(value="/ajaxAddCard.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxAddCard(Card card){  
	    
		Map<String, Object> map = new HashMap<String, Object>();  
		card.setCreatetime(new Date());
		int num = cardService.AddCard(card);
		if(num == 0){
			map.put("success", false);
			map.put("errorMsg", "添加失败");
		}else{
			map.put("success", true);
			
		}
        return map ;  
    } 
	@RequestMapping(value="/ajaxUpdateCardById.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxUpdateCardById(Card card){  
		
		Map<String, Object> map = new HashMap<String, Object>();  
		int num = cardService.updateCard(card);
		if(num == 0){
			map.put("success", false);
			map.put("errorMsg", "修改失败");
		}else{
			map.put("success", true);
			
		}
        return map ;   
    } 
	@RequestMapping(value="/ajaxDeleteCardById.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxDeleteCardById(int id){  
	       
		Map<String, Object> map = new HashMap<String, Object>();  
		
		int num = cardService.deleteCardById(id);
		if(num == 0){
			map.put("success", false);
			map.put("errorMsg", "删除失败");
		}else{
			map.put("success", true);
			
		}
        return map ;  
    } 
	
	@RequestMapping(value="/getSearch.do",method=RequestMethod.GET)  
	public String getSearch(Model model,HttpServletRequest request, HttpServletResponse response){  
	       
		
        return "/card/search";  
    } 
	@RequestMapping(value="/queryUserByUserName.do",method=RequestMethod.POST)  
	public String queryUserByUserName(Model model,String userName,HttpServletRequest request, HttpServletResponse response){  
	    
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		User params  = new User();
		params.setUserName(userName);
		UserBean agent = userService.getUserBean(params);
		List<Integer> list2 = userService.getParentId(agent);
		
		if(!list2.contains(user.getId())){

			model.addAttribute("msg", "无此代理信息");
			 return "/card/search";  
		}else{
			List<Card> list = cardService.getAllCard();
			model.addAttribute("cardList", list);
			model.addAttribute("agent", agent);
			 return "/card/sellCardToAgent";
		}
		
       
    } 
	
	@RequestMapping(value="/ajaxUpdateUser.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxUpdateUser(int userId,int card,int award,HttpServletRequest request, HttpServletResponse response){  
	    HttpSession session = request.getSession();
	    UserBean user = (UserBean) session.getAttribute("user");
	    Map<String, Object> map = new HashMap<>();
	    
		map = cardService.rechargeCard(userId, card, award, user);
		

        return map ;  
    } 
	
	@RequestMapping(value="/getSearchPlayer.do",method=RequestMethod.GET)  
	public String getSearchPlayer(Model model,HttpServletRequest request, HttpServletResponse response){  
	       		
        return "/card/searchPlayer";  
    } 
	
	@RequestMapping(value="/ajaxQueryPlayerById.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> queryPlayerById(int PlayerId ,HttpServletRequest request, HttpServletResponse response){  
	    Map<String, Object> map = new HashMap<>();
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
//		if(user.getAgentType() != 1){
//			map.put("success", false);
//			map.put("errorMsg", "您不是普通代理");
//		}
		
		Player p = playService.getPlayerById(PlayerId);
		map.put("success", true);
		map.put("player",p);
		
		return map;
       
    } 
	@RequestMapping(value="/ajaxUpdatePlayer.do",method=RequestMethod.POST)  
	public @ResponseBody Map<String, Object> ajaxUpdatePlayer(int playerId,int card,HttpServletRequest request){  
		HttpSession session = request.getSession();
		UserBean user = (UserBean) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		
		int userCard = user.getCard();
		if(userCard == 0 || userCard < card){
			map.put("success", false);
			map.put("errorMsg", "余额不足");
			return map;
		}
		boolean flag = updatePlayerCardService.updatePlayCard(playerId, card, user);
		if(flag){
			map.put("success", true);
		}
		return map;
       
    } 
	
}
