package com.market.sales.dto;

import org.springframework.stereotype.Component;

@Component("salesDTO")
public class SalesDTO {
	//field
	private int day_sales_id; 			//일일매출관리식별번호
	private	String days;				//매출일
	private	int order_product_detail_id;//주문상품식별번호
	private	int order_id;				//주문식별번호
	private	int day_ordering_count;		//주문건수
	private	int day_selling_count;		//판매수량
	private	int day_selling_amount;		//판매금액
	private	int day_discount_amount;	//할인금액
	private	int day_payment_total;		//결제합계
	private	int day_refund_total;		//환불합계
	private	int day_net_sales;			//결제합계 순매출액
	private String monthly;				//월별 조회
	
	
	
	//constructor
	public SalesDTO() {}
	public SalesDTO(int day_sales_id, String days, int order_product_detail_id, int order_id, int day_ordering_count,
			int day_selling_count, int day_selling_amount, int day_discount_amount, int day_payment_total,
			int day_refund_total, int day_net_sales, String monthly) {
		this.day_sales_id = day_sales_id;
		this.days = days;
		this.order_product_detail_id = order_product_detail_id;
		this.order_id = order_id;
		this.day_ordering_count = day_ordering_count;
		this.day_selling_count = day_selling_count;
		this.day_selling_amount = day_selling_amount;
		this.day_discount_amount = day_discount_amount;
		this.day_payment_total = day_payment_total;
		this.day_refund_total = day_refund_total;
		this.day_net_sales = day_net_sales;
		this.monthly = monthly;
	}
	
	public int getDay_sales_id() {
		return day_sales_id;
	}
	public void setDay_sales_id(int day_sales_id) {
		this.day_sales_id = day_sales_id;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days.substring(0,10);
	}
	public int getOrder_product_detail_id() {
		return order_product_detail_id;
	}
	public void setOrder_product_detail_id(int order_product_detail_id) {
		this.order_product_detail_id = order_product_detail_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getDay_ordering_count() {
		return day_ordering_count;
	}
	public void setDay_ordering_count(int day_ordering_count) {
		this.day_ordering_count = day_ordering_count;
	}
	public int getDay_selling_count() {
		return day_selling_count;
	}
	public void setDay_selling_count(int day_selling_count) {
		this.day_selling_count = day_selling_count;
	}
	public int getDay_selling_amount() {
		return day_selling_amount;
	}
	public void setDay_selling_amount(int day_selling_amount) {
		this.day_selling_amount = day_selling_amount;
	}
	public int getDay_discount_amount() {
		return day_discount_amount;
	}
	public void setDay_discount_amount(int day_discount_amount) {
		this.day_discount_amount = day_discount_amount;
	}
	public int getDay_payment_total() {
		return day_payment_total;
	}
	public void setDay_payment_total(int day_payment_total) {
		this.day_payment_total = day_payment_total;
	}
	public int getDay_refund_total() {
		return day_refund_total;
	}
	public void setDay_refund_total(int day_refund_total) {
		this.day_refund_total = day_refund_total;
	}
	public int getDay_net_sales() {
		return day_net_sales;
	}
	public void setDay_net_sales(int day_net_sales) {
		this.day_net_sales = day_net_sales;
	}
	public String getMonthly() {
		return monthly;
	}
	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}
	@Override
	public String toString() {
		return "SalesDTO [day_sales_id=" + day_sales_id + ", days=" + days + ", order_product_detail_id="
				+ order_product_detail_id + ", order_id=" + order_id + ", day_ordering_count=" + day_ordering_count
				+ ", day_selling_count=" + day_selling_count + ", day_selling_amount=" + day_selling_amount
				+ ", day_discount_amount=" + day_discount_amount + ", day_payment_total=" + day_payment_total
				+ ", day_refund_total=" + day_refund_total + ", day_net_sales=" + day_net_sales + ", monthly=" + monthly
				+ "]";
	}
	
}