package com.market.product.dto;

import org.springframework.stereotype.Component;

@Component("middleCategoryDTO")
public class MiddleCategoryDTO {
	private int main_id;
	private int middle_id;
	private String middle_name;
	
	public MiddleCategoryDTO() {
		main_id=0;
	}

	public MiddleCategoryDTO(int main_id, int middle_id, String middle_name) {
		super();
		this.main_id = main_id;
		this.middle_id = middle_id;
		this.middle_name = middle_name;
	}

	@Override
	public String toString() {
		return "MiddleCategoryDTO [main_id=" + main_id + ", middle_id=" + middle_id + ", middle_name=" + middle_name
				+ "]";
	}

	public int getMain_id() {
		return main_id;
	}

	public void setMain_id(int main_id) {
		this.main_id = main_id;
	}

	public int getMiddle_id() {
		return middle_id;
	}

	public void setMiddle_id(int middle_id) {
		this.middle_id = middle_id;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	
	
}
