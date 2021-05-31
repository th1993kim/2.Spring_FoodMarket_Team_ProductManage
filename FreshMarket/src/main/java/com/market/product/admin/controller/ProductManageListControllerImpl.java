package com.market.product.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.product.admin.service.CategoryServiceImpl;
import com.market.product.admin.service.ProductListManageServiceImpl;
import com.market.product.admin.service.ProductManageServiceImpl;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;
import com.market.product.dto.ProductListPageDTO;
import com.market.product.dto.SearchCommandDTO;
@Controller("productListControllerImpl")
public class ProductManageListControllerImpl {
	
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private ProductManageServiceImpl productManageServiceImpl;
	
	@Autowired
	private ProductListManageServiceImpl productListManageServiceImpl;
	
	//상품목록  보여주기
		@RequestMapping(value="/manage/productList.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String productList(@ModelAttribute SearchCommandDTO search,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			//메인화면 카테고리 select에 넣어주기
			List<MainCategoryDTO> mainCategory = new ArrayList<MainCategoryDTO>();
			int startNum=0;
			int currentPage =1;
			int seeCount=20;
			//SearchCommandDTO search = new SearchCommandDTO();
			currentPage=search.getCurrentPage();
			seeCount=search.getSeeCount();
			if(currentPage!=0) {
				startNum = (currentPage-1)*seeCount;
			}else {
				startNum=0;
			}
			
			mainCategory = categoryService.getMainCategory();
			search.setStartNum(startNum);
			//페이징 처리 
			ProductListPageDTO productListPageDTO =  productListManageServiceImpl.getProductListPage(search);
			//글목록 가져오기
			List<ProductDTO> productList = new ArrayList<ProductDTO>();
			productList = productListManageServiceImpl.getProductList(search);
			
			//중분류 카테고리 가져오기 (검색 후 분류 보여주기 위해)
			if(search.getMain_id()!=0) { //메인카테고리 선택 후에만 가져와야된다.
				List<MiddleCategoryDTO> middleCategory = categoryService.getMiddleCategory(search.getMain_id());
				request.setAttribute("middleCategory", middleCategory);
			}
			request.setAttribute("productListPage", productListPageDTO);
			request.setAttribute("productList", productList);
			request.setAttribute("search",search);
			request.setAttribute("mainCategory", mainCategory);
			
			
			return "/manage/productList"; 
		}
		
		@RequestMapping(value="/manage/productStockChange.do", method= {RequestMethod.GET,RequestMethod.POST})
		public ResponseEntity productStockChange(@RequestParam(value="searchWord") String searchWord,
				@RequestParam(value="product_id",required =false) int[] product_idArr,
				@RequestParam(value="product_stock",required =false) int[] product_stockArr,
					HttpServletRequest request, HttpServletResponse response) {
			int result=0;
			if(product_idArr!=null) {
				result = productListManageServiceImpl.productStockChange(product_idArr,product_stockArr);
			}
			ResponseEntity rse =null;
			String message ="";
			HttpHeaders headers = new HttpHeaders();
			if(result>0) {
				message="<script>";
				message+=" alert('재고를 변경 하였습니다');";
				message+=" location.href='"+request.getContextPath()+"/manage/productList.do"+searchWord+"';";
				message+=" </script>";		
			}else {
				message="<script>";
				message+=" alert('재고 변경을 실패하였습니다.');";
				message+=" location.href='"+request.getContextPath()+"/manage/productList.do"+searchWord+"';";
				message+=" </script>";		
			}
				
			headers.add("Content-Type", "text/html; charset=utf-8");
			rse = new ResponseEntity(message, headers, HttpStatus.OK);
			return rse;
		}
		@RequestMapping(value="/manage/productSaleChange.do", method= {RequestMethod.GET,RequestMethod.POST})
		public ResponseEntity productSaleChange(@RequestParam(value="searchWord") String searchWord,
				@RequestParam(value="checked_id" ,required =false) int[] checked_idArr,
				@RequestParam(value="sale") int sale,
				HttpServletRequest request, HttpServletResponse response) {
			int result=0;
			if(checked_idArr!=null) {
				result = productListManageServiceImpl.productSaleChange(checked_idArr,sale);
			}
			ResponseEntity rse = null;
			String message ="";
			HttpHeaders headers = new HttpHeaders();
			if(result>0) {
				message="<script>";
				message+=" alert('변경이 완료되었습니다.');";
				message+=" location.href='"+request.getContextPath()+"/manage/productList.do"+searchWord+"';";
				message+="</script>";
			}else {
				message="<script>";
				message+=" alert('변경에 실패하였습니다.');";
				message+=" location.href='"+request.getContextPath()+"/manage/productList.do"+searchWord+"';";
				message+="</script>";
			}
			headers.add("Content-Type", "text/html; charset=utf-8");
			rse = new ResponseEntity(message,headers,HttpStatus.OK);
			return rse;
		}
		
}
