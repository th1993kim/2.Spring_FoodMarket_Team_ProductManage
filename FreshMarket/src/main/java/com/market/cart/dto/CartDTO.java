package com.market.cart.dto;

import org.springframework.stereotype.Component;

@Component
public class CartDTO
{
	int cart_id;
	int member_id;
	int product_id;
	int event_product_id;
	String product_name;
	int cart_product_price;
	int cart_product_amount;
	String product_img_path;
	String product_img_name;

	public CartDTO()
	{

	}

	public CartDTO(int cart_id, int member_id, int product_id,
			int event_product_id, String product_name, int cart_product_price,
			int cart_product_amount, String product_img_path,
			String product_img_name)
	{
		this.cart_id = cart_id;
		this.member_id = member_id;
		this.product_id = product_id;
		this.event_product_id = event_product_id;
		this.product_name = product_name;
		this.cart_product_price = cart_product_price;
		this.cart_product_amount = cart_product_amount;
		this.product_img_path = product_img_path;
		this.product_img_name = product_img_name;
	}

	public int getCart_id()
	{
		return cart_id;
	}

	public void setCart_id(int cart_id)
	{
		this.cart_id = cart_id;
	}

	public int getMember_id()
	{
		return member_id;
	}

	public void setMember_id(int member_id)
	{
		this.member_id = member_id;
	}

	public int getProduct_id()
	{
		return product_id;
	}

	public void setProduct_id(int product_id)
	{
		this.product_id = product_id;
	}

	public int getEvent_product_id()
	{
		return event_product_id;
	}

	public void setEvent_product_id(int event_product_id)
	{
		this.event_product_id = event_product_id;
	}

	public String getProduct_name()
	{
		return product_name;
	}

	public void setProduct_name(String product_name)
	{
		this.product_name = product_name;
	}

	public int getCart_product_price()
	{
		return cart_product_price;
	}

	public void setCart_product_price(int cart_product_price)
	{
		this.cart_product_price = cart_product_price;
	}

	public int getCart_product_amount()
	{
		return cart_product_amount;
	}

	public void setCart_product_amount(int cart_product_amount)
	{
		this.cart_product_amount = cart_product_amount;
	}

	public String getProduct_img_path()
	{
		return product_img_path;
	}

	public void setProduct_img_path(String product_img_path)
	{
		this.product_img_path = product_img_path;
	}

	public String getProduct_img_name()
	{
		return product_img_name;
	}

	public void setProduct_img_name(String product_img_name)
	{
		this.product_img_name = product_img_name;
	}

	@Override
	public String toString()
	{
		return "CartDTO [cart_id=" + cart_id + ", member_id=" + member_id
				+ ", product_id=" + product_id + ", event_product_id="
				+ event_product_id + ", product_name=" + product_name
				+ ", cart_product_price=" + cart_product_price
				+ ", cart_product_amount=" + cart_product_amount
				+ ", product_img_path=" + product_img_path
				+ ", product_img_name=" + product_img_name + "]";
	}
}
