package com.market.notice.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("noticeDTO")
public class NoticeDTO {

	
			private int notice_id; //공지사항 식별번호
			private int member_id; //회원식별 번호
			private String email; //이메일
			private	Date created_at; //등록시간
			private int view_count; //조회수
			private String title; //제목
			private String content; //내용
			private int is_deleted; //삭제여부
			
			public NoticeDTO() {}
			
			
			public int getNotice_id() {
				return notice_id;
			}
			
			public void setNotice_id(int notice_id) {
				this.notice_id = notice_id;
			}
			
			public int getMember_id() {
				return member_id;
			}
			
			public void setMember_id(int member_id) {
				this.member_id = member_id;
			}
			
			public String getEmail() {
				return email;
			}
			
			public void setEmail(String email) {
				this.email = email;
			}
			
			public Date getCreated_at() {
				return created_at;
			}
			
			public void setCreated_at(Date created_at) {
				this.created_at = created_at;
			}
			
			public int getView_count() {
				return view_count;
			}
			
			public void setView_count(int view_count) {
				this.view_count = view_count;
			}
			
			public String getTitle() {
				return title;
			}
			
			public void setTitle(String title) {
				this.title = title;
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


			@Override
			public String toString() {
				return "NoticeDTO [notice_id=" + notice_id + ", member_id=" + member_id + ", email=" + email
						+ ", created_at=" + created_at + ", view_count=" + view_count + ", title=" + title
						+ ", content=" + content + ", is_deleted=" + is_deleted + "]";
			}
			
			
			
			
			
}
			
			
