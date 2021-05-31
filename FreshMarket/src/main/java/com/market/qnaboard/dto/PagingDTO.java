package com.market.qnaboard.dto;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("pagingDTO")
public class PagingDTO {
	private int total;			//전체 게시글 수
	private int currentPage;	//현재 페이지
	private int totalPages;		//전체 페이지수
	private int startPage;		//시작 페이지
	private int endPage;		//끝 페이지
	private int perPage = 3;	//보이는 게시글 수
	private int start;			//쿼리문에 사용 , 시작행번호
	private int end;			//쿼리문에 사용, 읽어올 행수
	private int product_id;
	
	public PagingDTO() {}
	public PagingDTO(int total, int currentPage) {
		this.total = total;
		this.currentPage = currentPage;
		
		if(total == 0) {	//게시글이 0이면
			this.totalPages = 0;	//전체페이지수
			this.startPage = 0;		//시작페이지
			this.endPage = 0;		//끝페이지
			
		}else {
			this.totalPages=total/perPage;
			if( total%perPage > 0 ) {
				totalPages++; 
			}
			
			int modVal = currentPage%3; 
			
			this.startPage = currentPage/3*3+1;		
			if(modVal==0) {
				this.startPage -= 3;  
			}
			
			this.endPage= startPage+2;		
			
			if(endPage>totalPages) {
				this.endPage= totalPages;
			}
			setStartEnd(currentPage,perPage);
		}
	}
	
	//method
	public void setStartEnd(int currentPage, int perPage) {
		setStart((currentPage-1)*perPage);
		setEnd(perPage);
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "PagingDTO [total=" + total + ", currentPage=" + currentPage + ", totalPages=" + totalPages
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", perPage=" + perPage + ", start=" + start
				+ ", end=" + end + ", product_id=" + product_id + "]";
	}

}
