package com.market.product.user.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.common.paging.Criteria;
import com.market.common.paging.PageMaker;
import com.market.event_product.dto.EventProductJoinDTO;
import com.market.product.admin.service.CategoryServiceImpl;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.user.dto.SearchProductCommandDTO;
import com.market.product.user.dto.UserProductDTO;
import com.market.product.user.service.UserProductServiceImpl;
import com.market.qnaboard.dto.PagingDTO;
import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;
import com.market.qnaboard.service.QnaBoardServiceImpl;
import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;
import com.market.review.service.ReviewService;

@Controller
public class UserProductControllerImpl
{
	//	@Autowired
	//	private MainDTO mainDTO;
	private static final String LOCAL_DIR = "/local_img/";
	//카테고리 서비스
	@Autowired
	private CategoryServiceImpl categoryService;

	@Autowired
	private UserProductServiceImpl userProductServiceImpl;

	@Autowired
	private QnaBoardServiceImpl qnaService;	//qna서비스

	@Autowired
	private ReviewService reviewService;

	public void setProductServiceImpl(
			UserProductServiceImpl userProductServiceImpl)
	{
		System.out.println("setProductServiceImpl() 진입");
		this.userProductServiceImpl = userProductServiceImpl;
	}

	@RequestMapping(value = "/userProduct/detailUserEventProduct.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detailUserEventProduct(
			@RequestParam("event_product_id") int event_product_id,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		//1.파라미터받기 - 요청함수의 매개변수String goods_id에 의해 이미 받아진 상태
		//String goods_id= request.getParameter("goods_id");의 효과

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		//2.비즈니스로직수행 - 상품정보+상품이미지들
		Map detailUserEventProductMap = userProductServiceImpl
				.detailUserEventProduct(event_product_id);

		EventProductJoinDTO eventProductJoinDTO = (EventProductJoinDTO)detailUserEventProductMap
				.get("eventProductJoinDTO");

		String detailEventProductImage = eventProductJoinDTO
				.getProduct_detail_name();
		String[] detailEventProductImageArray = detailEventProductImage
				.split(",");
		List<String> detailEventProductImageList = new ArrayList<String>();
		Collections.addAll(detailEventProductImageList,
				detailEventProductImageArray);

		//3.Model
		mv.addObject("detailEventProductImageList",
				detailEventProductImageList);
		mv.addObject("detailUserEventProductMap", detailUserEventProductMap);

		//4.View
		mv.setViewName("userProduct/detailUserEventProduct");
		return mv;
	}

	@RequestMapping(value = "/userProduct/detailUserProduct.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detailUserProduct(
			@ModelAttribute SearchProductCommandDTO search,
			@RequestParam("product_id") int product_id,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		int currentPage = 1;
		int qnaCount = qnaService.getQnaPage(product_id);
		PagingDTO pageDTO = new PagingDTO(qnaCount, currentPage);	//qna페이징 처리

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		//2.비즈니스로직수행 - 상품정보+상품이미지들
		Map detailUserProductMap = userProductServiceImpl
				.detailUserProduct(product_id);
		pageDTO.setProduct_id(product_id);
		List<QnaBoardDTO> qnaList = qnaService.getQnaBoard(pageDTO);
		List<QnaBoardCommentDTO> qnaCommentList = qnaService
				.getQnaCommentBoard();

		System.out.println(qnaList);

		UserProductDTO userProductDTO = (UserProductDTO)detailUserProductMap
				.get("userProductDTO");

		String detailProductImage = userProductDTO.getProduct_detail_name();
		String[] detailProductImageArray = detailProductImage.split(",");
		List<String> detailProductImageList = new ArrayList<String>();
		Collections.addAll(detailProductImageList, detailProductImageArray);

		//3.Model
		mv.addObject("detailProductImageList", detailProductImageList);
		mv.addObject("detailUserProductMap", detailUserProductMap);
		mv.addObject("paging", pageDTO);	//qna페이지
		mv.addObject("qnaList", qnaList);	//문의 글
		mv.addObject("qnaCommentList", qnaCommentList);	//문의 답글

		mv.addObject("search", search);	//검색어

		/* ----- 김태현 카테고리 검색 처리 ----- */
		List<MainCategoryDTO> mainCategory = new ArrayList<MainCategoryDTO>();
		mainCategory = categoryService.getMainCategory();
		mv.addObject("mainCategory", mainCategory);
		//중분류 카테고리
		List<MiddleCategoryDTO> middleCategory = categoryService
				.getMiddleCategory(10);
		mv.addObject("middleCategory", middleCategory);

		mv.setViewName("userProduct/detailUserProduct");

		/*-------------------------------------준성 파트--------------------------------------------------*/
		/*-------------------------------------준성 page 파트--------------------------------------------------*/

		int total = reviewService.getReviewTotalPage(product_id);
		ReviewPagingDTO reviewPagingDTO = new ReviewPagingDTO(total,
				currentPage);
		reviewPagingDTO.setProduct_id(product_id);
		List<ReviewDTO> reviewList = reviewService.reviewList(reviewPagingDTO);

		//System.out.println("reviewList컨트롤러 나감 reviewList ="+reviewList);
		//System.out.println("reviewPage컨트롤러 나감 reviewPage ="+reviewPagingDTO);

		mv.addObject("reviewList", reviewList);
		mv.addObject("reviewPage", reviewPagingDTO);

		mv.setViewName("userProduct/detailUserProduct");
		return mv;
	}

	@RequestMapping(value = "/userProduct/searchProduct.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchUserProduct(
			@ModelAttribute SearchProductCommandDTO search,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		Criteria criteria = new Criteria();

		criteria.setPage(search.getPage());
		criteria.setPerPageNum(search.getPerPageNum());

		//검색 커맨드 객체를 활용한 검색
		search.setStartNum(criteria.getPageStart());

		int totalCount = userProductServiceImpl.countSearchProduct(search);

		//대분류 카테고리
		List<MainCategoryDTO> mainCategory = new ArrayList<MainCategoryDTO>();
		mainCategory = categoryService.getMainCategory();
		//중분류 카테고리
		List<MiddleCategoryDTO> middleCategory = categoryService
				.getMiddleCategory(10);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(totalCount);

		String viewName = "userProduct/listProduct";
		List<UserProductDTO> searchUserProductList = userProductServiceImpl
				.searchUserProduct(search);
		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("searchUserProductList", searchUserProductList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("search", search);
		mav.addObject("mainCategory", mainCategory);
		mav.addObject("middleCategory", middleCategory);
		return mav;
	}
}
