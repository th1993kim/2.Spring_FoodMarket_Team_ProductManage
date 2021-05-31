package com.market.review.dto;

import org.springframework.stereotype.Component;

/*
 	`review_id`               				INT           				NOT NULL 	AUTO_INCREMENT PRIMARY KEY, 
	`product_id` 						INT           				NOT NULL, 
	`member_id`              			INT           				NOT NULL, 
	`email` 				  					VARCHAR(50)		NOT NULL,
	`created_at`              			DATETIME      		NOT NULL 	DEFAULT NOW(), 
	`view_count`              			INT           				NULL     			DEFAULT 0, 
	`content`                 				VARCHAR(2500)  NULL,     
	`review_star`             			INT           				NULL 				DEFAULT 3,     
	`review_image`            			VARCHAR(160)  	NULL,     
	`is_deleted`              				INT           				NOT NULL 	DEFAULT 0
 */

@Component
public class ReviewDTO {
	private int review_id;
	private int product_id;
	private int member_id;
	private String name;
	private String created_at;
	private int view_count;
	private String content;
	private int review_star;
	private String review_image;
	private int is_deleted;
	private int startpage;

	public ReviewDTO() {}

	public ReviewDTO(int review_id, int product_id, int member_id, String name, String created_at, int view_count,
			String content, int review_star, String review_image, int is_deleted, int startpage) {
		this.review_id = review_id;
		this.product_id = product_id;
		this.member_id = member_id;
		this.name = name;
		this.created_at = created_at;
		this.view_count = view_count;
		this.content = content;
		this.review_star = review_star;
		this.review_image = review_image;
		this.is_deleted = is_deleted;
		this.startpage = startpage;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at_before) {
		String created_at = created_at_before.substring(0,10);
		this.created_at = created_at;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getReview_image() {
		return review_image;
	}

	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}

	public int getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_id=" + review_id + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", name=" + name + ", created_at=" + created_at + ", view_count=" + view_count + ", content="
				+ content + ", review_star=" + review_star + ", review_image=" + review_image + ", is_deleted="
				+ is_deleted + ", startpage=" + startpage + "]";
	}
	

}
