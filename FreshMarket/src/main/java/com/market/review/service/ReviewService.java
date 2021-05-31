package com.market.review.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;

public interface ReviewService {
	
	public List<ReviewDTO> reviewList(ReviewPagingDTO reviewPagingDTO) throws Exception;
	
	public int getReviewTotalPage(int product_id) throws DataAccessException ;
	
	public void reviewInsert(ReviewDTO reviewDTO)throws Exception;
	
	//리뷰 수정폼 보여주기
	public ReviewDTO updateForm(String review_id)throws Exception;
		
	public void reviewUpdate(ReviewDTO reviewDTO)throws Exception;
	
	public void reviewDelete(int review_id)throws Exception;

}
