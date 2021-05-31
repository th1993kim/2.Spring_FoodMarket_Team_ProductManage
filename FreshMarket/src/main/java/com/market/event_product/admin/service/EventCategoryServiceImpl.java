package com.market.event_product.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.event_product.dto.EventProductDTO;
import com.market.product.admin.dao.CategoryDAOImpl;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;

@Service
public class EventCategoryServiceImpl{

	@Autowired
	public CategoryDAOImpl categoryDAO;
	
	//중분류 카테고리 조회
	public List<MiddleCategoryDTO> getMiddleCategory(int mainId) throws Exception {
		List<MiddleCategoryDTO> middleCategory = new ArrayList<MiddleCategoryDTO>();
		middleCategory = categoryDAO.getMiddleCategory(mainId);
		
		return middleCategory;
	}
	
	//대분류 카테고리 조회
	public List<MainCategoryDTO> getMainCategory() throws Exception {
		
		List<MainCategoryDTO> mainCategoryDTO = new ArrayList<MainCategoryDTO>();
		mainCategoryDTO = categoryDAO.getMainCategory();	
		return mainCategoryDTO; 
	}

	//대분류 추가
	public int insertMainCategory(String mainCategoryInsert) throws Exception {
		int currval = categoryDAO.insertMainCategory(mainCategoryInsert);
		return currval;
	}
	
	//중분류 추가
	public int insertMiddleCategory(String middleCategoryInsert ,String mainCategory) {
		int currval = categoryDAO.insertMiddleCategory(middleCategoryInsert,mainCategory);
		return currval;
	}

	//상품 카테고리 조회
	public List<ProductDTO> getProductCategory(int middleId) throws Exception{
		List<ProductDTO> productCategory = categoryDAO.getProductCategory(middleId);
		return productCategory;
	}
}
