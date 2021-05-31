package com.market.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.cart.dao.CartDAOImpl;
import com.market.cart.dto.CartDTO;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class CartServiceImpl
{

	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private com.market.cart.dao.CartDAOImpl cartDAOImpl;
	public void setCartDAOImpl(CartDAOImpl cartDAOImpl)
	{
		this.cartDAOImpl = cartDAOImpl;
		System.out.println("CartDAOImpl=" + this.cartDAOImpl);
	}

	public CartServiceImpl()
	{
		System.out.println("CartServiceImpl()생성자호출");
	}

	public int countCart(CartDTO cartDTO)
	{
		return cartDAOImpl.countCart(cartDTO);
	}

	public void insert(CartDTO cartDTO)
	{
		cartDAOImpl.insert(cartDTO);
	}

	public void updateCart(CartDTO cartDTO)
	{
		cartDAOImpl.updateCart(cartDTO);
	}

	public List<CartDTO> listCart(int member_id)
	{
		return cartDAOImpl.listCart(member_id);
	}

	public int sumMoney(int member_id)
	{
		return cartDAOImpl.sumMoney(member_id);
	}

	public void updatePlusOneAmount(int product_id, int member_id)
	{
		cartDAOImpl.updatePlusOneAmount(product_id, member_id);
	}

	public void updateMinusOneAmount(int product_id, int member_id)
	{
		cartDAOImpl.updateMinusOneAmount(product_id, member_id);
	}

	public void updateDelCartProduct(int product_id, int member_id)
	{
		cartDAOImpl.updateDelCartProduct(product_id, member_id);
	}

	public void updateInputAmountCartProduct(int product_id, int member_id,
			int cart_product_amount)
	{
		cartDAOImpl.updateInputAmountCartProduct(product_id, member_id,
				cart_product_amount);
	}

	/* public Map<String, List<UserProductDTO>> listProduct() throws Exception
	 * {
	 * Map<String, List<UserProductDTO>> productMap = new HashMap<String, List<UserProductDTO>>();
	 * List<UserProductDTO> productList = userProductDAOImpl
	 * .selectProductList("rating");
	 * 
	 * productMap.put("rating", productList);
	 * goodsList = goodsDAO.selectGoodsList("newbook");
	 * goodsMap.put("newbook", goodsList);
	 * 
	 * goodsList = goodsDAO.selectGoodsList("steadyseller");
	 * goodsMap.put("steadyseller", goodsList);
	 * return productMap;
	 * }
	 * 
	 * public List<UserProductDTO> searchUserProduct(String searchWord,
	 * Criteria criteria) throws Exception
	 * {
	 * List<UserProductDTO> productList = userProductDAOImpl
	 * .searchUserProduct(searchWord, criteria);
	 * return productList;
	 * }
	 * 
	 * public int countSearchProduct(String searchWord)
	 * {
	 * return userProductDAOImpl.countSearchProduct(searchWord);
	 * }
	 * 
	 * public Map detailUserProduct(String product_id)
	 * {
	 * Map detailUserProductMap = new HashMap();
	 * UserProductDTO userProductDTO = userProductDAOImpl
	 * .selectDetailUserProduct(product_id);
	 * detailUserProductMap.put("userProductDTO", userProductDTO);
	 * detailUserProductMap.put("qa", qa);
	 * detailUserProductMap.put("review", review);
	 * return detailUserProductMap;
	 * }
	 * 
	 * public List<UserProductDTO> listUserProduct(Criteria criteria)
	 * throws Exception
	 * {
	 * List<UserProductDTO> productList = userProductDAOImpl
	 * .listUserProduct(criteria);
	 * return productList;
	 * } */
}
