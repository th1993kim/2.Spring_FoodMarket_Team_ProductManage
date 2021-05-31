package com.market.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.cart.dto.CartDTO;

// MemberDAO에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Repository
public class CartDAOImpl
{
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public CartDAOImpl()
	{
		System.out.println("CartDAOImpl()생성자호출");
	}

	public int countCart(CartDTO cartDTO)
	{
		return sqlSession.selectOne("cart.countCart", cartDTO);
	}

	public void insert(CartDTO cartDTO)
	{ 
		sqlSession.insert("cart.insertCart", cartDTO);
	}

	public List<CartDTO> listCart(int member_id)
	{
		return sqlSession.selectList("cart.listCart", member_id);
	}

	public int sumMoney(int member_id)
	{
		return sqlSession.selectOne("cart.sumMoney", member_id);
	}

	public void updatePlusOneAmount(int product_id, int member_id)
	{
		Map<String, Object> updatePlusOneAmountCartMap = new HashMap();
		updatePlusOneAmountCartMap.put("product_id", product_id);
		updatePlusOneAmountCartMap.put("member_id", member_id);

		int result = sqlSession.update("cart.updatePlusOneAmount",
				updatePlusOneAmountCartMap);

		System.out.println(
				"sqlSession.update cart.updatePlusOneAmount = " + result);
	}

	public void updateMinusOneAmount(int product_id, int member_id)
	{
		Map<String, Object> updateMinusOneAmountCartMap = new HashMap();
		updateMinusOneAmountCartMap.put("product_id", product_id);
		updateMinusOneAmountCartMap.put("member_id", member_id);

		int result = sqlSession.update("cart.updateMinusOneAmount",
				updateMinusOneAmountCartMap);

		System.out.println(
				"sqlSession.update cart.updateMinusOneAmount = " + result);
	}

	public void updateDelCartProduct(int product_id, int member_id)
	{
		Map<String, Object> updateDelCartProductMap = new HashMap();
		updateDelCartProductMap.put("product_id", product_id);
		updateDelCartProductMap.put("member_id", member_id);

		int result = sqlSession.delete("cart.updateDelCartProduct",
				updateDelCartProductMap);

		System.out.println(
				"sqlSession.delete cart.updateDelCartProduct = " + result);
	}

	public void updateCart(CartDTO cartDTO)
	{
		sqlSession.update("cart.updateCart", cartDTO);
	}

	public void updateInputAmountCartProduct(int product_id, int member_id,
			int cart_product_amount)
	{
		Map<String, Object> updateInputAmountCartProductMap = new HashMap();
		updateInputAmountCartProductMap.put("product_id", product_id);
		updateInputAmountCartProductMap.put("member_id", member_id);
		updateInputAmountCartProductMap.put("cart_product_amount",
				cart_product_amount);

		int result = sqlSession.update("cart.updateInputAmountCartProduct",
				updateInputAmountCartProductMap);

		System.out.println(
				"sqlSession.update cart.updateInputAmountCartProduct = "
						+ result);
	}

	/* public List<UserProductDTO> selectUserProductList()
	 * throws DataAccessException
	 * {
	 * List<UserProductDTO> goodsList = (ArrayList)sqlSession
	 * .selectList("product.selectProductList", searchWord);
	 * return goodsList;
	 * 
	 * }
	 * public List<String> selectKeywordSearch(String keyword)
	 * throws DataAccessException
	 * {
	 * List<String> list = (ArrayList)sqlSession
	 * .selectList("userProduct.selectKeywordSearch", keyword);
	 * return list;
	 * }
	 * 
	 * public List<UserProductDTO> searchUserProduct(String searchWord,
	 * Criteria criteria) throws DataAccessException
	 * {
	 * Map<String, Object> searchUserProductMap = new HashMap();
	 * searchUserProductMap.put("searchWord", searchWord);
	 * searchUserProductMap.put("criteria", criteria);
	 * 
	 * List<UserProductDTO> userProductList = (ArrayList)sqlSession.selectList(
	 * "userProduct.selectKeywordSearch", searchUserProductMap);
	 * return userProductList;
	 * }
	 * 
	 * public int countSearchProduct(String searchWord)
	 * {
	 * Map<String, Object> searchUserProductMap = new HashMap();
	 * searchUserProductMap.put("searchWord", searchWord);
	 * 
	 * return sqlSession.selectOne("userProduct.countSearchProduct",
	 * searchUserProductMap);
	 * }
	 * 
	 * public UserProductDTO selectDetailUserProduct(String product_id)
	 * {
	 * UserProductDTO userProductDTO = (UserProductDTO)sqlSession
	 * .selectOne("userProduct.selectDetailUserProduct", product_id);
	 * return userProductDTO;
	 * }
	 * 
	 * public List<UserProductDTO> listUserProduct(Criteria criteria)
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
