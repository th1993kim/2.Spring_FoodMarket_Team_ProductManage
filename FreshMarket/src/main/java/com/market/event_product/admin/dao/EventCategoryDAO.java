package com.market.event_product.admin.dao;

import java.util.List;

import com.market.event_product.dto.EventProductDTO;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;

public interface EventCategoryDAO {
	
	public List<MiddleCategoryDTO> getMiddleCategory2(int mainId) throws Exception;
	public List<MainCategoryDTO> getMainCategory2() throws Exception; 
	
	public int insertMainCategory2(String mainCategoryInsert) throws Exception;

	public int insertMiddleCategory2(String middleCategory2Insert, String mainCategory2);

	
	public List<EventProductDTO> getEventProductCategory(int middleId2) throws Exception;
}
