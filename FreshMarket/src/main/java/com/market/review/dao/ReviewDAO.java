package com.market.review.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;

public interface ReviewDAO {

	public List<ReviewDTO> selectReviewList(ReviewPagingDTO reviewPagingDTO) throws DataAccessException;


	public void insertReview(ReviewDTO reviewDTO) throws DataAccessException;

	//리뷰 수정폼 보여기주기
	public ReviewDTO updateForm(String review_id)throws DataAccessException;
	
	public void updateReview(ReviewDTO reviewDTO) throws DataAccessException;

	public void deleteReview(int review_id) throws DataAccessException;


	public int getCount(int product_id);

}
