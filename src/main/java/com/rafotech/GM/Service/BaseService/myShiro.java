package com.rafotech.GM.Service.BaseService;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rafotech.GM.DB.Dao.UserMapper;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.IDao.IRoleMenuDao;
import com.rafotech.GM.IDao.IUserDao;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;
@Service  
@Transactional  
public class myShiro extends AuthorizingRealm {

	
	
	@Autowired IUserDao userDao;
	@Autowired IRoleMenuDao IRoleMenuDao;
	
	 /** 
     * 权限认证 
     */ 
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
	    //获取登录时输入的用户名  
        String loginName=(String) principalCollection.fromRealm(getName()).iterator().next();  
        //到数据库查是否有此对象  
        UserBean user =  userDao.getUserBeanByName(loginName);
        if(user!=null){  
            //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）  
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();  
            //用户的角色集合  
            Set set = new HashSet<String>();
            boolean isAdmin = false;
            if(user.getRoleList()!=null&&user.getRoleList().size()>0){
            	for(Role r : user.getRoleList()){
            		if(r.getRoleName().equals("admin")){
            			isAdmin = true;
            		}
            		set.add(r.getRoleName());
            		}          	           	
            }
            info.setRoles(set);
            
            //用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要  
            List<Role> roleList=user.getRoleList(); 
           for (Role role : roleList) {    	        
   	        Integer[] roleId = {role.getId()};   
   	        //获取角色所对应的菜单权限
   	        Collection<RoleMenuBean> list = IRoleMenuDao.getRoleMenuBeanByRoleId(roleId);
   	        Collection<String> permissionList = new HashSet<String>();
   	        if(isAdmin){
   	        	permissionList.add("isAdmin");
   	        }else{
   	        	for(RoleMenuBean p  : list){
   	        		
   	        		String url = p.getMenu().getMenuUrl();
   	        		if(url != null && !"".equals(url)){
   	        			String menuUrl = url.split("/")[0];
   	   	        		
   	   	        		if(p.gettQuery() != null && p.gettQuery() == 1){
   	   	        			permissionList.add(menuUrl+"?query");
   	   	        		}
   	   	        		if(p.gettAdd() != null && p.gettAdd() == 1){
   	   	        			permissionList.add(menuUrl+"?add");
   	   	        		}
   	   	        		if(p.gettDelete() != null && p.gettDelete() == 1){
   	   	        			permissionList.add(menuUrl+"?delete");
   	   	        		}
   	   	        		if(p.gettUpdate() != null && p.gettUpdate() == 1){
   	   	        			permissionList.add(menuUrl+"?update");
   	   	        		}   
   	        		}
   	        			        	 	        		
   	        	}
   	        }
                info.addStringPermissions(permissionList) ;
           }  
            return info;  
        }else{
        	return null;
        }  

	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException {
		 //UsernamePasswordToken对象用来存放提交的登录信息  
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;  
//        查出是否有此用户  
        UserBean user=userDao.getUserBeanByName(token.getUsername());  
        if(user!=null){  
            //若存在，将此用户存放到登录认证info中  
            return new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), getName());  
        } 
		return null;
	}

}
