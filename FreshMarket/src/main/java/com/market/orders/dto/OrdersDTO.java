package com.market.orders.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OrdersDTO
{
	int order_id;
	int member_id;
	String orderer_name;
	String orderer_phone;
	String receiver_name;
	String receiver_address;
	String receiver_phone;
	int orders_product_price;
	int delivery_price;
	int order_all_sum;
	Date order_date;
	String request;

	public OrdersDTO()
	{
	}

	public OrdersDTO(int order_id, int member_id, String orderer_name,
			String orderer_phone, String receiver_name, String receiver_address,
			String receiver_phone, int orders_product_price, int delivery_price,
			int order_all_sum, Date order_date, String request)
	{
		this.order_id = order_id;
		this.member_id = member_id;
		this.orderer_name = orderer_name;
		this.orderer_phone = orderer_phone;
		this.receiver_name = receiver_name;
		this.receiver_address = receiver_address;
		this.receiver_phone = receiver_phone;
		this.orders_product_price = orders_product_price;
		this.delivery_price = delivery_price;
		this.order_all_sum = order_all_sum;
		this.order_date = order_date;
		this.request = request;
	}

	public int getOrder_id()
	{
		return order_id;
	}

	public void setOrder_id(int order_id)
	{
		this.order_id = order_id;
	}

	public int getMember_id()
	{
		return member_id;
	}

	public void setMember_id(int member_id)
	{
		this.member_id = member_id;
	}

	public String getOrderer_name()
	{
		return orderer_name;
	}

	public void setOrderer_name(String orderer_name)
	{
		this.orderer_name = orderer_name;
	}

	public String getOrderer_phone()
	{
		return orderer_phone;
	}

	public void setOrderer_phone(String orderer_phone)
	{
		this.orderer_phone = orderer_phone;
	}

	public String getReceiver_name()
	{
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name)
	{
		this.receiver_name = receiver_name;
	}

	public String getReceiver_address()
	{
		return receiver_address;
	}

	public void setReceiver_address(String receiver_address)
	{
		this.receiver_address = receiver_address;
	}

	public String getReceiver_phone()
	{
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone)
	{
		this.receiver_phone = receiver_phone;
	}

	public int getOrders_product_price()
	{
		return orders_product_price;
	}

	public void setOrders_product_price(int orders_product_price)
	{
		this.orders_product_price = orders_product_price;
	}

	public int getDelivery_price()
	{
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price)
	{
		this.delivery_price = delivery_price;
	}

	public int getOrder_all_sum()
	{
		return order_all_sum;
	}

	public void setOrder_all_sum(int order_all_sum)
	{
		this.order_all_sum = order_all_sum;
	}

	public Date getOrder_date()
	{
		return order_date;
	}

	public void setOrder_date(Date order_date)
	{
		this.order_date = order_date;
	}

	public String getRequest()
	{
		return request;
	}

	public void setRequest(String request)
	{
		this.request = request;
	}

	@Override
	public String toString()
	{
		return "OrdersDTO [order_id=" + order_id + ", member_id=" + member_id
				+ ", orderer_name=" + orderer_name + ", orderer_phone="
				+ orderer_phone + ", receiver_name=" + receiver_name
				+ ", receiver_address=" + receiver_address + ", receiver_phone="
				+ receiver_phone + ", orders_product_price="
				+ orders_product_price + ", delivery_price=" + delivery_price
				+ ", order_all_sum=" + order_all_sum + ", order_date="
				+ order_date + ", request=" + request + "]";
	}
}
