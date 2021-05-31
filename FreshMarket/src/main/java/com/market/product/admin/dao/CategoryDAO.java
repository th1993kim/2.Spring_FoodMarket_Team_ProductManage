package com.market.product.admin.dao;

import java.util.List;

import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;

public interface CategoryDAO {
	
	public List<MiddleCategoryDTO> getMiddleCategory(int mainId) throws Exception;
	
	public List<MainCategoryDTO> getMainCategory() throws Exception; 
	
	public int insertMainCategory(String mainCategoryInsert) throws Exception;

	public List<ProductDTO> getProductCategory(int middleId) throws Exception;
	
}
