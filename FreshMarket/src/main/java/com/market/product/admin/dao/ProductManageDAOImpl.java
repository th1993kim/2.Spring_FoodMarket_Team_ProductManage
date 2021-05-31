package com.market.product.admin.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import com.market.product.dto.ProductDTO;

@Component("productManageDAOImpl")
public class ProductManageDAOImpl{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void productRegist(ProductDTO prt) {
		int i = sqlSession.insert("productManage.insertProduct",prt);
		System.out.println("상품 등록 여부 : " + i);
	}

	public int autoProductId() {
		int i = 0;
		i=(Integer)sqlSession.selectOne("productManage.autoProductId");
		System.out.println("i = "+i);
		return i;
	}

	public ProductDTO productSelect(String product_id) throws DataAccessException {
		return (ProductDTO)sqlSession.selectOne("productManage.selectProduct",product_id);
	}

	public Map getProductImages(int product_id) {
		return (Map)sqlSession.selectOne("productManage.getProductImagesName",product_id);
	}

	public int changeProduct(ProductDTO prt) {
		int result = 0;
		result = sqlSession.update("productManage.changeProduct",prt);
		return result;
	}

}
