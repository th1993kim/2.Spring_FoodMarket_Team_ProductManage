package com.market.product.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;

@Component("categoryDAO")
public class CategoryDAOImpl {

	
	@Autowired
	private SqlSession sqlSession;
	
	//중분류 카테고리 호출
	public List<MiddleCategoryDTO> getMiddleCategory(int mainId) throws Exception {
		List<MiddleCategoryDTO> middleCategory=null;
		if(mainId!=10) {
			middleCategory = sqlSession.selectList("categorys.middleCategory",mainId);
		}else {
			middleCategory = sqlSession.selectList("categorys.middleCategory2");
		}
		return middleCategory;
	}
	
	//메인 카테고리 호출
	public List<MainCategoryDTO> getMainCategory() throws Exception {
		List<MainCategoryDTO> mainCategory = sqlSession.selectList("categorys.mainCategory");
		return mainCategory;
	}

	//상품 카테고리 호출
	public List<ProductDTO> getProductCategory(int middleId) throws Exception {
		List<ProductDTO> productCategory = sqlSession.selectList("categorys.productCategory",middleId);
		return productCategory;
	}
	
	
	public int insertMainCategory(String mainCategoryInsert) {
		sqlSession.insert("categorys.mainCategoryPlus",mainCategoryInsert);
		int currval = (Integer)sqlSession.selectOne("mainCategoryPlusSelect");
		return currval;
	}
	
	//중분류 추가
	public int insertMiddleCategory(String middleCategoryInsert,String mainCategory) {
		Map<String,Object> middleCategoryInsertMap = new HashMap<String,Object>();
		middleCategoryInsertMap.put("middleCategoryInsert",middleCategoryInsert);
		middleCategoryInsertMap.put("mainCategory",mainCategory);
		sqlSession.insert("categorys.middleCategoryPlus",middleCategoryInsertMap);
		int currval = (Integer)sqlSession.selectOne("middleCategoryPlusSelect");
		return currval;
	}

}
