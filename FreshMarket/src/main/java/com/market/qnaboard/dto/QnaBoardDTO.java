package com.market.qnaboard.dto;

import org.springframework.stereotype.Component;

@Component("qnaDTO")
public class QnaBoardDTO {
	//field
	private int qa_id; 			//Q&A식별번호	
	private	int member_id;		//회원식별번호
	private int product_id;
	private	String email;		//email
	private	String created_at;	//등록일자
	private	String content;		//내용
	private	int is_deleted;			//삭제여부 삭제:1 or 정상:0 
	private	int is_locked;			//공개여부 비공개:1 or 공개:0
	
	//constructor
	public QnaBoardDTO() {}
	public QnaBoardDTO(int qa_id, int member_id, int product_id, String email, String created_at, String content,
			int is_deleted, int is_locked) {
		this.qa_id = qa_id;
		this.member_id = member_id;
		this.product_id = product_id;
		this.email = email;
		this.created_at = created_at;
		this.content = content;
		this.is_deleted = is_deleted;
		this.is_locked = is_locked;
	}
	
	//method
	public int getQa_id() {
		return qa_id;
	}
	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at.substring(0,10).replace("-", ".");
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getIs_locked() {
		return is_locked;
	}
	public void setIs_locked(int is_locked) {
		this.is_locked = is_locked;
	}
	@Override
	public String toString() {
		return "QnaBoardDTO [qa_id=" + qa_id + ", member_id=" + member_id + ", product_id=" + product_id + ", email="
				+ email + ", created_at=" + created_at + ", content=" + content + ", is_deleted=" + is_deleted
				+ ", is_locked=" + is_locked + "]";
	}

}