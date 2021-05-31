package com.market.event_product.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.event_product.admin.dao.EventProductManageDAOImpl;
import com.market.event_product.dto.EventProductDTO;
import com.market.event_product.dto.EventProductJoinDTO;

@Service
public class EventProductManageServiceImpl
{

	@Autowired
	public EventProductManageDAOImpl eventProductManageDAOImpl;

	/* public void eventProductRegist(EventProductDTO eprt)
	 * {
	 * eventProductManageDAOImpl.productRegist(eprt);
	 * 
	 * }
	 * 
	 * public int autoEventProductId()
	 * {
	 * return eventProductManageDAOImpl.autoEventProductId();
	 * }
	 * 
	 * public EventProductDTO eventProductSelecst(String event_product_id)
	 * throws Exception
	 * {
	 * return eventProductManageDAOImpl.eventProductSelect(event_product_id);
	 * }
	 * 
	 * public Map getEventProductImages(int event_product_id)
	 * {
	 * return eventProductManageDAOImpl
	 * .getEventProductImages(event_product_id);
	 * }
	 * 
	 * public int changeEventProduct(EventProductDTO eprt)
	 * {
	 * return eventProductManageDAOImpl.changeEventProduct(eprt);
	 * } */

	public int eventProductCreate(EventProductDTO eventProductDTO)
	{
		return eventProductManageDAOImpl.eventProductCreate(eventProductDTO);
	}

	public List<EventProductJoinDTO> eventProductList()
	{
		List<EventProductJoinDTO> eventProductList = eventProductManageDAOImpl
				.eventProductList();
		return eventProductList;
	}

	public int updateEventProduct(EventProductDTO eventProductDTO)
	{
		return eventProductManageDAOImpl.updateEventProduct(eventProductDTO);
	}

	public EventProductJoinDTO getEventProductJoinDTO(
			EventProductJoinDTO eventProductJoinDTO)
	{
		return eventProductManageDAOImpl
				.getEventProductJoinDTO(eventProductJoinDTO);
	}
}
