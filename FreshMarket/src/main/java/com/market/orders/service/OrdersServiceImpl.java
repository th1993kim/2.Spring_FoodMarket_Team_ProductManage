package com.market.orders.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.orders.dao.OrdersDAOImpl;
import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class OrdersServiceImpl
{
	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private OrdersDAOImpl ordersDAOImpl;
	public void setOrdersDAOImpl(OrdersDAOImpl ordersDAOImpl)
	{
		this.ordersDAOImpl = ordersDAOImpl;
		System.out.println("OrdersDAOImpl=" + this.ordersDAOImpl);
	}

	public OrdersServiceImpl()
	{
		System.out.println("UserProductDAOImpl()생성자호출");
	}

	public void insertOrders(OrdersDTO ordersDTO)
	{
		ordersDAOImpl.insertOrders(ordersDTO);
	}

	public void insertOrderProductDetail(
			OrderProductDetailDTO orderProductDetailDTO)
	{
		ordersDAOImpl.insertOrderProductDetail(orderProductDetailDTO);
	}

	public void emptyCart(int member_id)
	{
		ordersDAOImpl.emptyCart(member_id);
	}

	public OrdersDTO getLastOrdersDTO(int order_id)
	{
		return ordersDAOImpl.getLastOrdersDTO(order_id);
	}

	/* public int getOrder_id(int member_id)
	 * {
	 * return ordersDAOImpl.getOrder_id(int member_id);
	 * } */

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
