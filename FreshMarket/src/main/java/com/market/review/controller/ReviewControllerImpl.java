package com.market.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.member.dto.MemberDTO;
import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;
import com.market.review.service.ReviewService;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

//review컨트롤러
@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController{

	@Autowired
	private ReviewService reviewService;

	//
	@Override
	@RequestMapping(value="/review/reviewList.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView reviewList( 
									@RequestParam(value ="product_id") int product_id,
									@RequestParam(value ="currentPage")int currentPage,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int total = reviewService.getReviewTotalPage(product_id);
		
		  ReviewPagingDTO reviewPagingDTO = new ReviewPagingDTO(total, currentPage);
		  reviewPagingDTO.setProduct_id(product_id); 
		  List<ReviewDTO> reviewList = reviewService.reviewList(reviewPagingDTO);
		  
		ModelAndView mv = new ModelAndView();
		  
		System.out.println("reviewList컨트롤러 나감 reviewList ="+reviewList);

		System.out.println("reviewPagingDTO ="+reviewPagingDTO);
		mv.addObject("reviewPage", reviewPagingDTO);	//페이지
		mv.addObject("reviewList", reviewList);	//문의 글

		mv.setViewName("review/reviewList");
		return mv;	
	}
	//reviewList  END
	
	
	
	//reviewInsert 컨트롤러  
	@Override
	@RequestMapping(value = "/review/insert.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView reviewInsert(ReviewDTO reviewDTO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{

			String contextPath = request.getContextPath();
			HttpSession session = request.getSession();
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
			
			reviewDTO.setMember_id(memberDTO.getMember_id());
			reviewDTO.setName(memberDTO.getName());
			System.out.println("reviewInsert 컨트롤러 진입  reviewInsert = "+reviewDTO.toString());	
			
			reviewService.reviewInsert(reviewDTO);
					
			//response.sendRedirect(contextPath + "/userProduct/detailUserProduct.do?product_id="+reviewDTO.getProduct_id());
			ModelAndView mv = new ModelAndView("redirect:/userProduct/detailUserProduct.do?product_id="+reviewDTO.getProduct_id());
			
			return mv;
	}
	
	@RequestMapping(value="/review/updateForm.do", method = RequestMethod.POST)
	   public @ResponseBody JSONObject modifyUpdateReviewForm(@RequestParam("review_id") String review_id,
																						   							HttpServletRequest request,
																				                                 HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러 들어옴");
		ReviewDTO review = reviewService.updateForm(review_id);
		
		  JSONObject json = new JSONObject(); 
	        try{ 
		           json.put("content", review.getContent()); 
		           json.put("product_id", review.getProduct_id()); 
		           json.put("name", review.getName());
		           json.put("review_id", review.getReview_id());
		           json.put("review_star", review.getReview_star());
		           
		           System.out.println("컨트롤러 제이슨"+json);      //확인용
		           
	        }catch(JSONException e){
	           e.printStackTrace(); 
	        }
	      return json;
	  
	}
	
	@RequestMapping(value="/review/deleteForm.do", method = RequestMethod.POST)
	   public @ResponseBody JSONObject modifyDeleteReviewForm(@RequestParam("review_id") String review_id,
																						   							HttpServletRequest request,
																				                                 HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러 들어옴");
		ReviewDTO review = reviewService.updateForm(review_id);
		
		  JSONObject json = new JSONObject(); 
	        try{ 
		           json.put("is_deleted", review.getIs_deleted()); 
		           json.put("review_id", review.getReview_id());
		           
		           System.out.println("컨트롤러 제이슨"+json);      //확인용
		           
	        }catch(JSONException e){
	           e.printStackTrace(); 
	        }
	      return json;
	  
	}
		
		
	//UPDATE
	@Override
	@RequestMapping(value="/review/update.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public void reviewUpdate(
			ReviewDTO reviewDTO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
			System.out.println("reviewUpdate 컨트롤러 진입  reviewUpdate = "+reviewDTO);	
			
			reviewService.reviewUpdate(reviewDTO);
	}
	
	//DELETE
	@Override
	@RequestMapping(value="/review/delete.do" ,method ={RequestMethod.POST, RequestMethod.GET})
	public void reviewDelete(@RequestParam("review_id") int review_id,
										HttpServletRequest request, HttpServletResponse response) throws Exception{
		
			System.out.println("delete컨트롤러 "+review_id);
			reviewService.reviewDelete(review_id);
	}
}
