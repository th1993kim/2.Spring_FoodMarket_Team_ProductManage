package com.market.product.dto;

public class ProductListPageDTO {
	private int total;
	private int currentPage;
	private int startPage;
	private int totalPage;
	private int endPage;
	public ProductListPageDTO() {}
	public ProductListPageDTO(int total, int currentPage,int seeCount) {
		this.total = total;
		this.currentPage = currentPage;
		if(total==0) {
			this.totalPage=0;
			this.startPage=0;
			this.endPage=0;
		}else {
			this.totalPage=total/seeCount;
			if(total%seeCount>0) {
				this.totalPage++;
			}
			
			int mod = (this.currentPage%10);
			this.startPage=(this.currentPage/10)*10+1;
			if(mod==0) {
				this.startPage=this.startPage-10;
			}
			this.endPage=this.startPage+9;
			if(this.totalPage<this.endPage) {
				this.endPage=this.totalPage;
			}
		}
	}


	
	
	
	@Override
	public String toString() {
		return "ProductListPageDTO [total=" + total + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", totalPage=" + totalPage + ", endPage=" + endPage +  "]";
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
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
