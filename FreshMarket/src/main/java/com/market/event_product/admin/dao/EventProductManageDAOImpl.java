package com.market.event_product.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.market.event_product.dto.EventProductDTO;
import com.market.event_product.dto.EventProductJoinDTO;

@Component
public class EventProductManageDAOImpl
{

	@Autowired
	private SqlSession sqlSession;

	/* public void productRegist(EventProductDTO eprt)
	 * {
	 * int i = sqlSession.insert("eventProductManage.insertEventProduct",
	 * eprt);
	 * System.out.println("상품 등록 여부 : " + i);
	 * } */

	/* public int autoEventProductId()
	 * {
	 * int i = 0;
	 * System.out.println("i = " + i);
	 * i = (Integer)sqlSession
	 * .selectOne("eventProductManage.autoEventProductId");
	 * System.out.println("i = " + i);
	 * return i;
	 * } */

	/* public EventProductDTO eventProductSelect(String event_product_id)
	 * throws DataAccessException
	 * {
	 * return (EventProductDTO)sqlSession.selectOne(
	 * "eventProductManage.selectEventProduct", event_product_id);
	 * } */

	/* public Map getEventProductImages(int event_product_id)
	 * {
	 * return (Map)sqlSession.selectOne(
	 * "eventProductManage.getEventProductImagesName",
	 * event_product_id);
	 * } */

	/* public int changeEventProduct(EventProductDTO eprt)
	 * {
	 * int result = 0;
	 * result = sqlSession.update("eventProductManage.changeEventProduct",
	 * eprt);
	 * return result;
	 * } */
	public int eventProductCreate(EventProductDTO eventProductDTO)
	{
		int result = 0;
		result = sqlSession.insert("eventProductManage.eventProductCreate",
				eventProductDTO);
		System.out.println("이벤트 상품 등록 여부 : " + result);
		return result;
	}

	public List<EventProductJoinDTO> eventProductList()
	{
		List<EventProductJoinDTO> eventProductList = (ArrayList)sqlSession
				.selectList("eventProductManage.eventProductList");
		return eventProductList;
	}

	public int updateEventProduct(EventProductDTO eventProductDTO)
	{
		int result = 0;
		result = sqlSession.update("eventProductManage.updateEventProduct",
				eventProductDTO);
		return result;
	}

	public EventProductJoinDTO getEventProductJoinDTO(
			EventProductJoinDTO eventProductJoinDTO)
	{
		return sqlSession.selectOne("eventProductManage.getEventProductJoinDTO",
				eventProductJoinDTO);
	}
}
