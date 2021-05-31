package com.market.product.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.product.dto.ProductDTO;
import com.market.product.dto.ProductListPageDTO;
import com.market.product.dto.SearchCommandDTO;

@Repository("productListManageDAOImpl")
public class ProductListManageDAOImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	//페이징 DTO 가져오기
	public ProductListPageDTO getProductListPage(SearchCommandDTO search) {
		int total = (Integer)sqlSession.selectOne("productListManage.selectCount", search);
		System.out.println("total"+total);
		ProductListPageDTO productListPageDTO = new ProductListPageDTO(total, search.getCurrentPage(), search.getSeeCount());
		System.out.println("page"+productListPageDTO.getEndPage());
		return productListPageDTO;
	}

	public List<ProductDTO> getProductList(SearchCommandDTO search) {
		return sqlSession.selectList("productListManage.getProductList", search);
	}

	public int updateStock(int[] product_idArr, int[] product_stockArr) {
		int result =0;
		for(int i=0;i<product_idArr.length;i++) {
			Map updateInfo = new HashMap();
			int product_id=product_idArr[i];
			int product_stock=product_stockArr[i];
			updateInfo.put("product_id", product_id);
			updateInfo.put("product_stock", product_stock);
			result += sqlSession.update("productListManage.updateStock",updateInfo);
		}
		return result;
	}

	public int updateSale(int[] checked_idArr, int sale) {
		int result =0;
		Map updateSaleInfo = new HashMap();
		updateSaleInfo.put("sale",sale);
		for (int checked_id : checked_idArr) {
			if(updateSaleInfo.get("checked_id")==null) {
				updateSaleInfo.put("checked_id",checked_id);
			}else {
				updateSaleInfo.replace("checked_id", checked_id);
			}
			result += sqlSession.update("productListManage.updateSale", updateSaleInfo);
		}
		
		return result;
	}

}
