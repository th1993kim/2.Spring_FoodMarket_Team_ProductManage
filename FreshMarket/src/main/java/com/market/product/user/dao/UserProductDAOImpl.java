package com.market.product.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.event_product.dto.EventProductJoinDTO;
import com.market.product.user.dto.SearchProductCommandDTO;
import com.market.product.user.dto.UserProductDTO;

// MemberDAO에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Repository
public class UserProductDAOImpl
{
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public UserProductDAOImpl()
	{
		System.out.println("MemberDAOImpl()생성자호출");
	}

	/* public List<UserProductDTO> selectUserProductList()
	 * throws DataAccessException
	 * {
	 * List<UserProductDTO> goodsList = (ArrayList)sqlSession
	 * .selectList("product.selectProductList", searchWord);
	 * return goodsList;
	 * 
	 * } */
	/* public List<String> selectKeywordSearch(String keyword)
	 * throws DataAccessException
	 * {
	 * List<String> list = (ArrayList)sqlSession
	 * .selectList("userProduct.selectKeywordSearch", keyword);
	 * return list;
	 * } */

	public List<UserProductDTO> searchUserProduct(
			SearchProductCommandDTO search) throws DataAccessException
	{
		List<UserProductDTO> userProductList = (ArrayList)sqlSession
				.selectList("userProduct.selectKeywordSearch", search);
		return userProductList;
	}

	public int countSearchProduct(SearchProductCommandDTO search)
	{
		return sqlSession.selectOne("userProduct.countSearchProduct", search);
	}

	public UserProductDTO selectDetailUserProduct(int product_id)
	{
		UserProductDTO userProductDTO = (UserProductDTO)sqlSession
				.selectOne("userProduct.selectDetailUserProduct", product_id);
		return userProductDTO;
	}

	public EventProductJoinDTO selectDetailUserEventProduct(
			int event_product_id)
	{
		EventProductJoinDTO eventProductJoinDTO = (EventProductJoinDTO)sqlSession
				.selectOne("userProduct.eventDetailProduct", event_product_id);
		return eventProductJoinDTO;
	}

	/* public List<UserProductDTO> listUserProduct(Criteria criteria)
	 * throws DataAccessException
	 * {
	 * Map<String, Object> listUserProductMap = new HashMap();
	 * listUserProductMap.put("criteria", criteria);
	 * 
	 * List<UserProductDTO> userProductList = (ArrayList)sqlSession.selectList(
	 * "userProduct.selectListUserProduct", listUserProductMap);
	 * return userProductList;
	 * } */
}
