package com.rafotech.GM.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import com.rafotech.GM.IDao.Bean.UserBean;

public class AllInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
          
        String requestUri = request.getRequestURI();  

        String contextPath = request.getContextPath();  
        String url = requestUri.substring(contextPath.length());  
        if (url.indexOf("login.do")!=-1){  
            return true;  
        }               
        UserBean user =  (UserBean)request.getSession().getAttribute("user");   
        Subject   currentUser = SecurityUtils.getSubject();
		
		if(user == null){                
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);  
            return false;  
        }else{  
        	//get请求 通过
        	if(request.getMethod().equals("GET")){
        		return true;
        	}
        	
        	//权限 验证
            String[] urlList = requestUri.split("/");
            String controller = urlList[urlList.length-2];
            String method = urlList[urlList.length-1];
            String  Permit = "";

            if(method.indexOf("ajaxQuery")== 0 || method.indexOf("query") == 0){
            	Permit = controller +"?query";
            }else 
            if(method.indexOf("ajaxAdd") == 0 || method.indexOf("add") == 0){
            	Permit = controller +"?add";
            }else 
            if(method.indexOf("ajaxDelete") == 0 || method.indexOf("delete") == 0){
            	Permit = controller +"?delete";	
            }else 
            if(method.indexOf("ajaxUpdate") == 0 || method.indexOf("update") == 0){
            	Permit = controller +"?update";	
            }
            //如果是admin 不用验证
            if(currentUser.isPermitted("isAdmin")){
            	 return true;   
            }
        	if(currentUser.isPermitted(Permit)){
//    			
   			   return true;   
        	}else{
        		JSONObject json = new JSONObject();
        		json.put("success", false);
    			json.put("errorMsg", "没有权限进行此操作");
    			response.setCharacterEncoding("UTF-8");  
    		    response.setContentType("application/json; charset=utf-8"); 
    			response.getWriter().append(json.toString());
            	return false;
        	}

	}      
	}

}
	


