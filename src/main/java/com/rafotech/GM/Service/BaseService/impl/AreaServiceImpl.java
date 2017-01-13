package com.rafotech.GM.Service.BaseService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rafotech.GM.DB.Model.Area;
import com.rafotech.GM.IDao.IAreaDao;
import com.rafotech.GM.Service.BaseService.AreaService;
@Service
public class AreaServiceImpl implements AreaService {

	@Autowired IAreaDao areaDao;
	
	
	public List<Area> findArea(Area area) {
	
		return areaDao.findArea(area);
	}
	/**
	 * 模糊查询
	 */
	public List<Area> getArea(Area area) {
		
		return areaDao.findAreaByLike(area);
	}

	@Override
	public int addArea(Area area) {
		// TODO Auto-generated method stub
		return areaDao.insertSelective(area);
	}
	@Override
	public int deleteAreaById(int id) {
		// TODO Auto-generated method stub
		return areaDao.deleteByPrimaryKey(id);
	}

}
