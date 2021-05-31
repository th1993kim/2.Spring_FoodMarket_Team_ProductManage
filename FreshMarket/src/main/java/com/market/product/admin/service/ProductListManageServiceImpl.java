package com.market.product.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.product.admin.dao.ProductListManageDAOImpl;
import com.market.product.dto.ProductDTO;
import com.market.product.dto.ProductListPageDTO;
import com.market.product.dto.SearchCommandDTO;

@Service("productListManageServiceImpl")
public class ProductListManageServiceImpl {
	
	@Autowired
	private ProductListManageDAOImpl productListManageDAOImpl;
	
	//페이징 처리 서비스
	public ProductListPageDTO getProductListPage(SearchCommandDTO search) {
		return productListManageDAOImpl.getProductListPage(search);
	}
	
	//상품목록 조회
	public List<ProductDTO> getProductList(SearchCommandDTO search) {
		return productListManageDAOImpl.getProductList(search);
	}

	public int productStockChange(int[] product_idArr, int[] product_stockArr) {
		return productListManageDAOImpl.updateStock(product_idArr,product_stockArr);
		
	}

	public int productSaleChange(int[] checked_idArr, int sale) {
		return productListManageDAOImpl.updateSale(checked_idArr,sale);
	}
	

}
