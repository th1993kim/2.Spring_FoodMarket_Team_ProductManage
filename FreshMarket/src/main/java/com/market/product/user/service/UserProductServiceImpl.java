package com.market.product.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.event_product.dto.EventProductJoinDTO;
import com.market.product.user.dao.UserProductDAOImpl;
import com.market.product.user.dto.SearchProductCommandDTO;
import com.market.product.user.dto.UserProductDTO;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class UserProductServiceImpl
{
	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private com.market.product.user.dao.UserProductDAOImpl userProductDAOImpl;
	public void setProductDAOImpl(UserProductDAOImpl userProductDAOImpl)
	{
		this.userProductDAOImpl = userProductDAOImpl;
		System.out.println("UserProductDAOImpl=" + this.userProductDAOImpl);
	}

	public UserProductServiceImpl()
	{
		System.out.println("UserProductServiceImpl()생성자호출");
	}

	public List<UserProductDTO> searchUserProduct(
			SearchProductCommandDTO search) throws Exception
	{
		List<UserProductDTO> productList = userProductDAOImpl
				.searchUserProduct(search);
		return productList;
	}

	public int countSearchProduct(SearchProductCommandDTO search)
	{
		return userProductDAOImpl.countSearchProduct(search);
	}

	public Map detailUserProduct(int product_id)
	{
		Map detailUserProductMap = new HashMap();
		UserProductDTO userProductDTO = userProductDAOImpl
				.selectDetailUserProduct(product_id);
		detailUserProductMap.put("userProductDTO", userProductDTO);
		/* detailUserProductMap.put("qa", qa);
		 * detailUserProductMap.put("review", review); */
		return detailUserProductMap;
	}

	public Map detailUserEventProduct(int event_product_id)
	{
		Map detailUserEventProductMap = new HashMap();
		EventProductJoinDTO eventProductJoinDTO = userProductDAOImpl
				.selectDetailUserEventProduct(event_product_id);
		detailUserEventProductMap.put("eventProductJoinDTO",
				eventProductJoinDTO);
		/* detailUserProductMap.put("qa", qa);
		 * detailUserProductMap.put("review", review); */
		return detailUserEventProductMap;
	}

	/* public List<UserProductDTO> listUserProduct(Criteria criteria)
	 * throws Exception
	 * {
	 * List<UserProductDTO> productList = userProductDAOImpl
	 * .listUserProduct(criteria);
	 * return productList;
	 * } */
}
