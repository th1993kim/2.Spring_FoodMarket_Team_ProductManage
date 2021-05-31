package com.market.product.dto;

import org.springframework.stereotype.Component;

@Component("searchCommandDTO")
public class SearchCommandDTO
{
	private int currentPage; //현재페이지
	private int main_id; //메인카테고리
	private int middle_id; //중간카테고리
	private int is_locked; //판매중,중단
	private String typeSearch; //검색 종류
	private String searchText; //검색어
	private String orderBy; //정렬기준
	private int seeCount; // 보는 갯수
	private int startNum; // 시작번호 (currentPage에 의해서 계산됨)

	public SearchCommandDTO()
	{
		typeSearch = "product_name";
		orderBy = "nameAsc";
		searchText = "";
		seeCount = 20;
		currentPage = 1;
		is_locked = 2;
	}

	public SearchCommandDTO(int currentPage, int main_id, int middle_id,
			int is_locked, String typeSearch, String searchText, String orderBy,
			int seeCount, int startNum)
	{
		super();
		this.currentPage = currentPage;
		this.main_id = main_id;
		this.middle_id = middle_id;
		this.is_locked = is_locked;
		this.typeSearch = typeSearch;
		this.searchText = searchText;
		this.orderBy = orderBy;
		this.seeCount = seeCount;
		this.startNum = startNum;
	}

	@Override
	public String toString()
	{
		return "SearchCommandDTO [currentPage=" + currentPage + ", main_id="
				+ main_id + ", middle_id=" + middle_id + ", is_locked="
				+ is_locked + ", typeSearch=" + typeSearch + ", searchText="
				+ searchText + ", orderBy=" + orderBy + ", seeCount=" + seeCount
				+ ", startNum=" + startNum + "]";
	}

	public int getCurrentPage()
	{
		return currentPage;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public int getMain_id()
	{
		return main_id;
	}

	public void setMain_id(int main_id)
	{
		this.main_id = main_id;
	}

	public int getMiddle_id()
	{
		return middle_id;
	}

	public void setMiddle_id(int middle_id)
	{
		this.middle_id = middle_id;
	}

	public int getIs_locked()
	{
		return is_locked;
	}

	public void setIs_locked(int is_locked)
	{
		this.is_locked = is_locked;
	}

	public String getTypeSearch()
	{
		return typeSearch;
	}

	public void setTypeSearch(String typeSearch)
	{
		this.typeSearch = typeSearch;
	}

	public String getSearchText()
	{
		return searchText;
	}

	public void setSearchText(String searchText)
	{
		this.searchText = searchText;
	}

	public String getOrderBy()
	{
		return orderBy;
	}

	public void setOrderBy(String orderBy)
	{
		this.orderBy = orderBy;
	}

	public int getSeeCount()
	{
		return seeCount;
	}

	public void setSeeCount(int seeCount)
	{
		this.seeCount = seeCount;
	}

	public int getStartNum()
	{
		return startNum;
	}

	public void setStartNum(int startNum)
	{
		this.startNum = startNum;
	}

}
