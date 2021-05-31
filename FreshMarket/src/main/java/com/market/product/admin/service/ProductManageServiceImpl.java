package com.market.product.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.product.admin.dao.ProductManageDAOImpl;
import com.market.product.dto.ProductDTO;

@Service("productManageServiceImpl")
public class ProductManageServiceImpl {
	
	@Autowired
	private ProductManageDAOImpl productManageDAOImpl;
	
	public void productRegist(ProductDTO prt) throws Exception{
		productManageDAOImpl.productRegist(prt);
	}

	public int autoProductId() {
		return productManageDAOImpl.autoProductId();
	}

	public ProductDTO productSelecst(String product_id) throws Exception {
		return productManageDAOImpl.productSelect(product_id);
	}

	public Map getProductImages(int product_id) {
		return productManageDAOImpl.getProductImages(product_id);
	}

	public int changeProduct(ProductDTO prt) {
		return productManageDAOImpl.changeProduct(prt);
	}
	
	
	
}
