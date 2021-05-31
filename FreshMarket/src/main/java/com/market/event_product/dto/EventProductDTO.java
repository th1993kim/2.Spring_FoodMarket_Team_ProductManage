package com.market.event_product.dto;

import org.springframework.stereotype.Component;

@Component
public class EventProductDTO {

	private int event_product_id;
	private int product_id;
	private String event_product_name;
	private int product_fixed_price;
	private double event_product_sale;
	private int is_plus;
	private int event_product_price;
	public String event_product_img_path;
	public String event_product_img_name;
	public String event_product_detail_path;
	public String event_product_detail_name;
	private int is_locked;
	public EventProductDTO() {}
	public EventProductDTO(int event_product_id, int product_id, String event_product_name, int product_fixed_price,
			double event_product_sale, int is_plus, int event_product_price, String event_product_img_path,
			String event_product_img_name, String event_product_detail_path, String event_product_detail_name,
			int is_locked) {
		super();
		this.event_product_id = event_product_id;
		this.product_id = product_id;
		this.event_product_name = event_product_name;
		this.product_fixed_price = product_fixed_price;
		this.event_product_sale = event_product_sale;
		this.is_plus = is_plus;
		this.event_product_price = event_product_price;
		this.event_product_img_path = event_product_img_path;
		this.event_product_img_name = event_product_img_name;
		this.event_product_detail_path = event_product_detail_path;
		this.event_product_detail_name = event_product_detail_name;
		this.is_locked = is_locked;
	}
	public int getEvent_product_id() {
		return event_product_id;
	}
	public void setEvent_product_id(int event_product_id) {
		this.event_product_id = event_product_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getEvent_product_name() {
		return event_product_name;
	}
	public void setEvent_product_name(String event_product_name) {
		this.event_product_name = event_product_name;
	}
	public int getProduct_fixed_price() {
		return product_fixed_price;
	}
	public void setProduct_fixed_price(int product_fixed_price) {
		this.product_fixed_price = product_fixed_price;
	}
	public double getEvent_product_sale() {
		return event_product_sale;
	}
	public void setEvent_product_sale(double event_product_sale) {
		this.event_product_sale = event_product_sale;
	}
	public int getIs_plus() {
		return is_plus;
	}
	public void setIs_plus(int is_plus) {
		this.is_plus = is_plus;
	}
	public int getEvent_product_price() {
		return event_product_price;
	}
	public void setEvent_product_price(int event_product_price) {
		this.event_product_price = event_product_price;
	}
	public String getEvent_product_img_path() {
		return event_product_img_path;
	}
	public void setEvent_product_img_path(String event_product_img_path) {
		this.event_product_img_path = event_product_img_path;
	}
	public String getEvent_product_img_name() {
		return event_product_img_name;
	}
	public void setEvent_product_img_name(String event_product_img_name) {
		this.event_product_img_name = event_product_img_name;
	}
	public String getEvent_product_detail_path() {
		return event_product_detail_path;
	}
	public void setEvent_product_detail_path(String event_product_detail_path) {
		this.event_product_detail_path = event_product_detail_path;
	}
	public String getEvent_product_detail_name() {
		return event_product_detail_name;
	}
	public void setEvent_product_detail_name(String event_product_detail_name) {
		this.event_product_detail_name = event_product_detail_name;
	}
	public int getIs_locked() {
		return is_locked;
	}
	public void setIs_locked(int is_locked) {
		this.is_locked = is_locked;
	}
	@Override
	public String toString() {
		return "EventProductDTO [event_product_id=" + event_product_id + ", product_id=" + product_id
				+ ", event_product_name=" + event_product_name + ", product_fixed_price=" + product_fixed_price
				+ ", event_product_sale=" + event_product_sale + ", is_plus=" + is_plus + ", event_product_price="
				+ event_product_price + ", event_product_img_path=" + event_product_img_path
				+ ", event_product_img_name=" + event_product_img_name + ", event_product_detail_path="
				+ event_product_detail_path + ", event_product_detail_name=" + event_product_detail_name
				+ ", is_locked=" + is_locked + "]";
	}
}
