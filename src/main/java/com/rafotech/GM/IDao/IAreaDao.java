package com.rafotech.GM.IDao;

import java.util.List;

import com.rafotech.GM.DB.Dao.AreaMapper;
import com.rafotech.GM.DB.Model.Area;

public interface IAreaDao extends AreaMapper{

	List<Area>  findArea(Area area);
	
	List<Area>  findAreaByLike(Area area);
}
