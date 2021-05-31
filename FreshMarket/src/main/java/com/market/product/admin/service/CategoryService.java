package com.market.product.admin.service;

import java.util.List;

import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;

//상품 관련 서비스 클래스

public interface CategoryService {

	public List<MiddleCategoryDTO> getMiddleCategory(int mainId) throws Exception;

	public List<MainCategoryDTO> getMainCategory() throws Exception;

	public int insertMainCategory(String mainCategoryInsert) throws Exception;


	
	
}
