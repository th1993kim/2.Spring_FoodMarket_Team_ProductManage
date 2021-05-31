package com.market.event_product.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.market.event_product.dto.EventProductDTO;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;

@Component
public class EventCategoryDAOImpl{

	@Autowired
	private SqlSession sqlSession;
	
	public List<MiddleCategoryDTO> getMiddleCategory(int mainId) throws Exception {
		List<MiddleCategoryDTO> middleCategory = sqlSession.selectList("categorys.middleCategory",mainId);

		return middleCategory;
	}

	public List<MainCategoryDTO> getMainCategory() throws Exception {

		List<MainCategoryDTO> mainCategory = sqlSession.selectList("categorys.mainCategory");
		return mainCategory;
	}

	public int insertMainCategory(String mainCategoryInsert) throws Exception {
		
		sqlSession.insert("categorys.mainCategoryPlus",mainCategoryInsert);
		
		int currval = (Integer)sqlSession.selectOne("mainCategoryPlusSelect");
		
		return currval;
	}

	public int insertMiddleCategory(String middleCategoryInsert,String mainCategory) {
		Map<String,Object> middleCategoryInsertMap = new HashMap<String,Object>();
		middleCategoryInsertMap.put("middleCategoryInsert",middleCategoryInsert);
		middleCategoryInsertMap.put("mainCategory",mainCategory);
		sqlSession.insert("categorys.middleCategoryPlus",middleCategoryInsertMap);
		int currval = (Integer)sqlSession.selectOne("middleCategoryPlusSelect");
		return currval;
	}
	public List<EventProductDTO> getEventProductCategory(int middleId) throws Exception {
		List<EventProductDTO> eventProductCategory = sqlSession.selectList("categorys.productCategory",middleId);
		return eventProductCategory;
	}

}
