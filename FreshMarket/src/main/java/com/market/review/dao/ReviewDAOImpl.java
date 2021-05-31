package com.market.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.review.dto.ReviewDTO;
import com.market.review.dto.ReviewPagingDTO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;

	public ReviewDAOImpl()
	{
		System.out.println("ReviewDAOImpl()생성자호출");
	}
	
	//전체글갯수 조회
	public int getCount(int product_id) throws DataAccessException {
		int reviewPage = sqlSession.selectOne("review.review_page",product_id);
		return reviewPage;
	}

	@Override
	public List<ReviewDTO> selectReviewList(ReviewPagingDTO reviewPagingDTO) throws DataAccessException {
		List<ReviewDTO> reviewList = sqlSession.selectList("review.review_list",reviewPagingDTO);
		System.out.println("selectReviewList reviewList= "+reviewList);
	   return reviewList;	
	}



	@Override
	public void insertReview(ReviewDTO reviewDTO) throws DataAccessException {
		System.out.println("insertReview 들어옴 ReviewDTO="+reviewDTO);
		sqlSession.insert("review.review_insert",reviewDTO);
	}
	
	public ReviewDTO updateForm(String review_id)throws DataAccessException {
		System.out.println("ReviewService updateForm진입 review_id="+review_id);
		ReviewDTO review = sqlSession.selectOne("review.reviewOneSelect",review_id);
		return review;
	}	
	
	@Override
	public void updateReview(ReviewDTO reviewDTO) throws DataAccessException {
		System.out.println("updateReview 들어옴 reviewUpdateMap="+reviewDTO);
		sqlSession.update("review.review_update",reviewDTO);
		System.out.println("dao다녀옴="+reviewDTO);
	}
	
	@Override
	public void deleteReview(int review_id) throws DataAccessException {
		System.out.println("deleteReview 들어옴 reviewDTO="+review_id);
		sqlSession.update("review.review_Delete",review_id);
	}

}
