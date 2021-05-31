package com.market.review.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import com.market.review.dao.ReviewDAO;
import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	
	public ReviewServiceImpl()
	{
		System.out.println("ReviewServiceImpl()생성자호출");
	}

	//전체 페이지 수 조회
	//@Override
	public int getReviewTotalPage(int product_id) throws DataAccessException {
		int total = reviewDAO.getCount(product_id);
		return total;
	}
	
	
	public List<ReviewDTO> reviewList(ReviewPagingDTO reviewPagingDTO) throws Exception {
		System.out.println("서비스"+reviewPagingDTO);
		List<ReviewDTO> reviewList = reviewDAO.selectReviewList(reviewPagingDTO);
		System.out.println("ReviewService 전송후  reviewMap="+reviewPagingDTO);
		
		return reviewList;
	
	}

	
	public ReviewDTO updateForm(String review_id)throws Exception{
		System.out.println("ReviewService updateForm진입 review_id="+review_id);

		ReviewDTO review =  reviewDAO.updateForm(review_id);
		return review;
	
	}
	
	
	public void reviewInsert(ReviewDTO reviewDTO)throws Exception{
		System.out.println("ReviewService reviewInsert진입 reviewDTO="+reviewDTO);

		reviewDAO.insertReview(reviewDTO);
	
	}
	
	public void reviewUpdate(ReviewDTO reviewDTO)throws Exception{
		System.out.println("ReviewService reviewUpdate진입 reviewDTO="+reviewDTO);

		reviewDAO.updateReview(reviewDTO);
	}
	
	public void reviewDelete(int review_id)throws Exception{
		System.out.println("ReviewService reviewDelete진입 reviewDTO="+review_id);

		reviewDAO.deleteReview(review_id);
	}

}
