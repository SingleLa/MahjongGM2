package com.rafotech.GM.Service.BaseService.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.rafotech.GM.DB.Dao.MenuMapper;
import com.rafotech.GM.DB.Model.Menu;
import com.rafotech.GM.DB.Model.Role;
import com.rafotech.GM.IDao.IMenuDao;
import com.rafotech.GM.IDao.IRoleMenuDao;
import com.rafotech.GM.IDao.Bean.MenuBean;
import com.rafotech.GM.IDao.Bean.RoleBean;
import com.rafotech.GM.IDao.Bean.RoleMenuBean;
import com.rafotech.GM.IDao.Bean.UserBean;
import com.rafotech.GM.Service.BaseService.MenuService;
import com.sun.org.apache.regexp.internal.recompile;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired IRoleMenuDao roleMenuDao;
	@Autowired IMenuDao menuDao;
	@Autowired MenuMapper menuMapper;
	@Override
	public List<MenuBean> getMenueTreeByUser(UserBean user) {
		// TODO Auto-generated method stub
		List<Role> list = user.getRoleList();
		if(list.size() == 0){
			return null;
		}
		boolean isAdmin = false;
		for(Role r : list){
			if(r.getRoleName().equals("admin")){
				isAdmin = true;
				break;
			}
		}
		//如果是admin  获取全部菜单
		if(isAdmin){
			List<MenuBean> adminMenList = getAdminTree();
			return adminMenList;
		}
		//不是admin 获取相应的菜单
		Integer[] adminId = new Integer[list.size()];
		
		for (int i = 0; i < list.size(); i++) {
			adminId[i] = list.get(i).getId();
		}
		//用户所有角色 对应的menu  可能有重复 获取的都是 子菜单
		List<RoleMenuBean> roleMenuList = roleMenuDao.getRoleMenuBeanByRoleId(adminId);
		//获取父级菜单
		List<RoleMenuBean> getParent = getParent(roleMenuList);
		//得带菜单树
		List<MenuBean> menList = getRoleTree(getParent);
		
		
		return menList;
	}
	public List<RoleMenuBean> getParent(List<RoleMenuBean> roleMenuList){
		List<RoleMenuBean> list = new ArrayList<>();
		for(RoleMenuBean rmb : roleMenuList){
			list.add(rmb);
			int level = rmb.getMenu().getLevel();
			
			int parentId = rmb.getMenu().getParent();
			for(int i = level -1 ; i>0 ; i--){
				Menu parentMenu = menuDao.selectByPrimaryKey(parentId);
				if(parentMenu.getLevel() != 1){
					parentId = parentMenu.getParent();
				}
				RoleMenuBean parentRoleMenuBean = new RoleMenuBean(parentMenu);
				list.add(parentRoleMenuBean);
			}
			
			
		}
		
		return list;
	}
	
	public List<MenuBean> getRoleTree(List<RoleMenuBean> list){
		
		//获取不重复的menuList
   		List<MenuBean> mList = new ArrayList<>();
		for(RoleMenuBean RoleMenuBean : list){
			if(mList.size() == 0){
				mList.add(new MenuBean(RoleMenuBean.getMenu(), null));
			}else{
				boolean flag = true;
				for(int i = 0; i<mList.size();i++){
					
					if(mList.get(i).getId() == RoleMenuBean.getMenu().getId()){
						flag = false;
					}
					if(!flag){
						break;
					}
				}
				if(flag){
					mList.add(new MenuBean(RoleMenuBean.getMenu(), null));
				}
			}
			
		}
		List<MenuBean> TreeMenu = getChild(mList, 0);
		return TreeMenu;
//		List<MenuBean> menuBeanList = new ArrayList<>();
//		for(Menu m : mList){
//				if(menuBeanList.size() == 0){
//					Menu parent  = menuMapper.selectByPrimaryKey(m.getParent());
//					MenuBean mb = new MenuBean();
//					mb.setId(parent.getId());
//					mb.setLevel(parent.getLevel());
//					mb.setMenuName(parent.getMenuName());
//					mb.setMenuUrl(parent.getMenuUrl());
//					mb.setParent(parent.getParent());
//					mb.setState(parent.getState());
//					List<MenuBean> child = new ArrayList<>();
//					child.add(m);
//					mb.setMenuList(child);
//					menuBeanList.add(mb);
//				}else{
//					boolean flag = true;
//					for(int i = 0; i<menuBeanList.size(); i++){
//						
//						if(m.getParent() == menuBeanList.get(i).getId()){
//							flag = false;
//							List<Menu> child = menuBeanList.get(i).getMenuList();
//							child.add(m);
//							menuBeanList.get(i).setMenuList(child);
//							break;
//						}						
//					}
//					if(flag){
//						Menu parent  = menuMapper.selectByPrimaryKey(m.getParent());
//						MenuBean mb = new MenuBean();
//						mb.setId(parent.getId());
//						mb.setLevel(parent.getLevel());
//						mb.setMenuName(parent.getMenuName());
//						mb.setMenuUrl(parent.getMenuUrl());
//						mb.setParent(parent.getParent());
//						mb.setState(parent.getState());
//						List<Menu> child = new ArrayList<>();
//						child.add(m);
//						mb.setMenuList(child);
//						menuBeanList.add(mb);
//					}
//				}
//		}
//		return menuBeanList;
//		return null;
	}
	
	//获取admin 全部菜单
	public List<MenuBean> getAdminTree(){
		//获取admin 全部菜单
		List<MenuBean> allMenu = menuDao.getAllMenu();
		List<MenuBean> TreeMenu = getChild(allMenu, 0);
		
		return TreeMenu;
	}
	
	public List<MenuBean> getChild(List<MenuBean> list,int parentId){
		
		
		List<MenuBean> childList = new ArrayList<>();
		for(MenuBean m : list){
			int menuId = m.getId();
			int Pid = m.getParent();
			if(parentId == Pid){
				List<MenuBean> c_list = getChild(list,menuId);
				m.setMenuList(c_list);
				childList.add(m);
			}
		}
		
		return childList;
	}

	@Override
	public JSONArray getMenuJsON() {
		List<MenuBean> allMenu = menuDao.getAllMenu();
		JSONArray menuArray = JSONArray.fromObject(allMenu);
		JSONArray childArray = getChildJson(menuArray,0);
		return childArray;
	}
	   public JSONArray getChildJson(JSONArray menuList, int parentId) {  
	       JSONArray childMenu = new JSONArray();  
	       for (Object object : menuList) {  
	           JSONObject jsonMenu = JSONObject.fromObject(object);  
	           int menuId = jsonMenu.getInt("id");  
	           int pid = jsonMenu.getInt("parent");  
	           if (parentId == pid) {  
	               JSONArray c_node = getChildJson(menuList, menuId);  
	              // jsonMenu.put("childNode", c_node);
	               JSONObject child = new JSONObject();
	               child.put("text", jsonMenu.get("menuName"));
	               child.put("id", jsonMenu.get("id"));
	               child.put("menuName", jsonMenu.get("menuName"));
	               child.put("menuUrl", jsonMenu.get("menuUrl"));
	               child.put("menuState", jsonMenu.get("state"));
	               child.put("level", jsonMenu.get("level"));
	               child.put("parent", jsonMenu.get("parent"));
	               child.put("nodes", c_node);
	               childMenu.add(child);  
	           }  
	       }  
	       return childMenu;  
	   } 
}
