package com.market.product.dto;

import org.springframework.stereotype.Component;

@Component("mainCategoryDTO")
public class MainCategoryDTO {
	private int main_id; //number
	private String main_name; //varchar
	
	public MainCategoryDTO() {}
	public MainCategoryDTO(int main_id, String main_name) {
		this.main_id = main_id;
		this.main_name = main_name;
	}
	
	
	public int getMain_id() {
		return main_id;
	}
	public void setMain_id(int main_id) {
		this.main_id = main_id;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	
	
	
	
	
	
}
