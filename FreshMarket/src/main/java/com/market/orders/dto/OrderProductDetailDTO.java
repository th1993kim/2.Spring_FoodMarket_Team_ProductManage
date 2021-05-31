package com.market.orders.dto;

public class OrderProductDetailDTO
{
	int order_product_detail_id;
	int order_id;
	int member_id;
	int product_id;
	int event_product_id;
	String product_name;
	int order_product_amount;
	int order_product_price;
	String product_img_path;
	String product_img_name;

	public OrderProductDetailDTO()
	{
	}

	public OrderProductDetailDTO(int order_product_detail_id, int order_id,
			int member_id, int product_id, int event_product_id,
			String product_name, int order_product_amount,
			int order_product_price, String product_img_path,
			String product_img_name, String order_date)
	{
		this.order_product_detail_id = order_product_detail_id;
		this.order_id = order_id;
		this.member_id = member_id;
		this.product_id = product_id;
		this.event_product_id = event_product_id;
		this.product_name = product_name;
		this.order_product_amount = order_product_amount;
		this.order_product_price = order_product_price;
		this.product_img_path = product_img_path;
		this.product_img_name = product_img_name;
	}

	public int getOrder_product_detail_id()
	{
		return order_product_detail_id;
	}

	public void setOrder_product_detail_id(int order_product_detail_id)
	{
		this.order_product_detail_id = order_product_detail_id;
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

	public int getOrder_product_amount()
	{
		return order_product_amount;
	}

	public void setOrder_product_amount(int order_product_amount)
	{
		this.order_product_amount = order_product_amount;
	}

	public int getOrder_product_price()
	{
		return order_product_price;
	}

	public void setOrder_product_price(int order_product_price)
	{
		this.order_product_price = order_product_price;
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
		return "OrderProductDetailDTO [order_product_detail_id="
				+ order_product_detail_id + ", order_id=" + order_id
				+ ", member_id=" + member_id + ", product_id=" + product_id
				+ ", event_product_id=" + event_product_id + ", product_name="
				+ product_name + ", order_product_amount="
				+ order_product_amount + ", order_product_price="
				+ order_product_price + ", product_img_path=" + product_img_path
				+ ", product_img_name=" + product_img_name + "]";
	}
}
