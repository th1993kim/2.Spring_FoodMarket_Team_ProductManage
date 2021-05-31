package com.market.event_product.dto;

import org.springframework.stereotype.Component;

@Component
public class EventProductJoinDTO
{
	private int product_id;
	private int main_id;
	private String main_name;
	private int middle_id;
	private String middle_name;
	private String product_name;
	private int product_fixed_price;
	private int product_price;
	private String product_img_path;
	private String product_img_name;
	private String product_detail_path;
	private String product_detail_name;
	private String product_list_img_path;
	private String product_list_img_name;
	private int product_stock;
	private int product_total;
	private String net_weight_per;
	private String net_weight_total;
	private int event_product_id;
	private String event_product_name;
	private double event_product_sale;
	private int is_plus;
	private int event_product_price;
	public String event_product_img_path;
	public String event_product_img_name;
	public String event_product_detail_path;
	public String event_product_detail_name;
	private int is_locked;

	public EventProductJoinDTO()
	{
	}

	public EventProductJoinDTO(int product_id, int main_id, String main_name,
			int middle_id, String middle_name, String product_name,
			int product_fixed_price, int product_price, String product_img_path,
			String product_img_name, String product_detail_path,
			String product_detail_name, String product_list_img_path,
			String product_list_img_name, int product_stock, int product_total,
			String net_weight_per, String net_weight_total,
			int event_product_id, String event_product_name,
			double event_product_sale, int is_plus, int event_product_price,
			String event_product_img_path, String event_product_img_name,
			String event_product_detail_path, String event_product_detail_name,
			int is_locked)
	{
		this.product_id = product_id;
		this.main_id = main_id;
		this.main_name = main_name;
		this.middle_id = middle_id;
		this.middle_name = middle_name;
		this.product_name = product_name;
		this.product_fixed_price = product_fixed_price;
		this.product_price = product_price;
		this.product_img_path = product_img_path;
		this.product_img_name = product_img_name;
		this.product_detail_path = product_detail_path;
		this.product_detail_name = product_detail_name;
		this.product_list_img_path = product_list_img_path;
		this.product_list_img_name = product_list_img_name;
		this.product_stock = product_stock;
		this.product_total = product_total;
		this.net_weight_per = net_weight_per;
		this.net_weight_total = net_weight_total;
		this.event_product_id = event_product_id;
		this.event_product_name = event_product_name;
		this.event_product_sale = event_product_sale;
		this.is_plus = is_plus;
		this.event_product_price = event_product_price;
		this.event_product_img_path = event_product_img_path;
		this.event_product_img_name = event_product_img_name;
		this.event_product_detail_path = event_product_detail_path;
		this.event_product_detail_name = event_product_detail_name;
		this.is_locked = is_locked;
	}

	public int getProduct_id()
	{
		return product_id;
	}

	public void setProduct_id(int product_id)
	{
		this.product_id = product_id;
	}

	public int getMain_id()
	{
		return main_id;
	}

	public void setMain_id(int main_id)
	{
		this.main_id = main_id;
	}

	public String getMain_name()
	{
		return main_name;
	}

	public void setMain_name(String main_name)
	{
		this.main_name = main_name;
	}

	public int getMiddle_id()
	{
		return middle_id;
	}

	public void setMiddle_id(int middle_id)
	{
		this.middle_id = middle_id;
	}

	public String getMiddle_name()
	{
		return middle_name;
	}

	public void setMiddle_name(String middle_name)
	{
		this.middle_name = middle_name;
	}

	public String getProduct_name()
	{
		return product_name;
	}

	public void setProduct_name(String product_name)
	{
		this.product_name = product_name;
	}

	public int getProduct_fixed_price()
	{
		return product_fixed_price;
	}

	public void setProduct_fixed_price(int product_fixed_price)
	{
		this.product_fixed_price = product_fixed_price;
	}

	public int getProduct_price()
	{
		return product_price;
	}

	public void setProduct_price(int product_price)
	{
		this.product_price = product_price;
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

	public String getProduct_detail_path()
	{
		return product_detail_path;
	}

	public void setProduct_detail_path(String product_detail_path)
	{
		this.product_detail_path = product_detail_path;
	}

	public String getProduct_detail_name()
	{
		return product_detail_name;
	}

	public void setProduct_detail_name(String product_detail_name)
	{
		this.product_detail_name = product_detail_name;
	}

	public String getProduct_list_img_path()
	{
		return product_list_img_path;
	}

	public void setProduct_list_img_path(String product_list_img_path)
	{
		this.product_list_img_path = product_list_img_path;
	}

	public String getProduct_list_img_name()
	{
		return product_list_img_name;
	}

	public void setProduct_list_img_name(String product_list_img_name)
	{
		this.product_list_img_name = product_list_img_name;
	}

	public int getProduct_stock()
	{
		return product_stock;
	}

	public void setProduct_stock(int product_stock)
	{
		this.product_stock = product_stock;
	}

	public int getProduct_total()
	{
		return product_total;
	}

	public void setProduct_total(int product_total)
	{
		this.product_total = product_total;
	}

	public String getNet_weight_per()
	{
		return net_weight_per;
	}

	public void setNet_weight_per(String net_weight_per)
	{
		this.net_weight_per = net_weight_per;
	}

	public String getNet_weight_total()
	{
		return net_weight_total;
	}

	public void setNet_weight_total(String net_weight_total)
	{
		this.net_weight_total = net_weight_total;
	}

	public int getEvent_product_id()
	{
		return event_product_id;
	}

	public void setEvent_product_id(int event_product_id)
	{
		this.event_product_id = event_product_id;
	}

	public String getEvent_product_name()
	{
		return event_product_name;
	}

	public void setEvent_product_name(String event_product_name)
	{
		this.event_product_name = event_product_name;
	}

	public double getEvent_product_sale()
	{
		return event_product_sale;
	}

	public void setEvent_product_sale(double event_product_sale)
	{
		this.event_product_sale = event_product_sale;
	}

	public int getIs_plus()
	{
		return is_plus;
	}

	public void setIs_plus(int is_plus)
	{
		this.is_plus = is_plus;
	}

	public int getEvent_product_price()
	{
		return event_product_price;
	}

	public void setEvent_product_price(int event_product_price)
	{
		this.event_product_price = event_product_price;
	}

	public String getEvent_product_img_path()
	{
		return event_product_img_path;
	}

	public void setEvent_product_img_path(String event_product_img_path)
	{
		this.event_product_img_path = event_product_img_path;
	}

	public String getEvent_product_img_name()
	{
		return event_product_img_name;
	}

	public void setEvent_product_img_name(String event_product_img_name)
	{
		this.event_product_img_name = event_product_img_name;
	}

	public String getEvent_product_detail_path()
	{
		return event_product_detail_path;
	}

	public void setEvent_product_detail_path(String event_product_detail_path)
	{
		this.event_product_detail_path = event_product_detail_path;
	}

	public String getEvent_product_detail_name()
	{
		return event_product_detail_name;
	}

	public void setEvent_product_detail_name(String event_product_detail_name)
	{
		this.event_product_detail_name = event_product_detail_name;
	}

	public int getIs_locked()
	{
		return is_locked;
	}

	public void setIs_locked(int is_locked)
	{
		this.is_locked = is_locked;
	}

	@Override
	public String toString()
	{
		return "EventProductJoinDTO [product_id=" + product_id + ", main_id="
				+ main_id + ", main_name=" + main_name + ", middle_id="
				+ middle_id + ", middle_name=" + middle_name + ", product_name="
				+ product_name + ", product_fixed_price=" + product_fixed_price
				+ ", product_price=" + product_price + ", product_img_path="
				+ product_img_path + ", product_img_name=" + product_img_name
				+ ", product_detail_path=" + product_detail_path
				+ ", product_detail_name=" + product_detail_name
				+ ", product_list_img_path=" + product_list_img_path
				+ ", product_list_img_name=" + product_list_img_name
				+ ", product_stock=" + product_stock + ", product_total="
				+ product_total + ", net_weight_per=" + net_weight_per
				+ ", net_weight_total=" + net_weight_total
				+ ", event_product_id=" + event_product_id
				+ ", event_product_name=" + event_product_name
				+ ", event_product_sale=" + event_product_sale + ", is_plus="
				+ is_plus + ", event_product_price=" + event_product_price
				+ ", event_product_img_path=" + event_product_img_path
				+ ", event_product_img_name=" + event_product_img_name
				+ ", event_product_detail_path=" + event_product_detail_path
				+ ", event_product_detail_name=" + event_product_detail_name
				+ ", is_locked=" + is_locked + "]";
	}
}
