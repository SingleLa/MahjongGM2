package com.rafotech.GM.Service.BaseService;

import java.util.List;

import com.rafotech.GM.DB.Model.Area;

public interface AreaService {
	/**
	 * 模糊查询
	 * @param area
	 * @return
	 */
     public  List<Area>	getArea(Area area);
     /**
 	 * 添加
 	 * @param area
 	 * @return
 	 */
     public int addArea(Area area);
     /**
      * 准确查寻
      * @param area
      * @return
      */
     public List<Area> findArea(Area area);
     /**
      * 主键删除
      * @param id
      * @return
      */
     public int deleteAreaById(int id);
     
}
