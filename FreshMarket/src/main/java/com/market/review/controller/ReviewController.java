package com.market.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.review.dto.ReviewDTO;

import net.sf.json.JSONObject;

public interface ReviewController {

	
	//리뷰 추가
	public ModelAndView reviewInsert(ReviewDTO reviewDTO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	 //리뷰 수정폼 보여주기
	 public @ResponseBody JSONObject modifyUpdateReviewForm(@RequestParam("review_id") String review_id,
														HttpServletRequest request,
												  HttpServletResponse response) throws Exception;
	 //리뷰 삭제 데이터 전송
	 public @ResponseBody JSONObject modifyDeleteReviewForm(@RequestParam("review_id") String review_id,
														HttpServletRequest request,
												  HttpServletResponse response) throws Exception;
	 
	 
	 //리뷰 수정
	 public void reviewUpdate(		
			 @ModelAttribute("reviewDTO") ReviewDTO reviewDTO,
			 HttpServletRequest request, HttpServletResponse response) throws Exception;

	 //리뷰삭제
	 public void reviewDelete(@RequestParam("review_id") int review_id,
				HttpServletRequest request, HttpServletResponse response) throws Exception;

	 public ModelAndView reviewList(@RequestParam(value ="product_id") int product_id,
			@RequestParam(value ="currentPage")int currentPage,HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
