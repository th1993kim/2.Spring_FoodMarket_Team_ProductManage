package com.market.product.user.dto;

import org.springframework.stereotype.Component;

@Component("searchProductCommandDTO")
public class SearchProductCommandDTO
{
	private int page;
	private int main_id;
	private int middle_id;
	private int price_min;
	private int price_max;
	private String searchWord;
	private String orderBy;
	private int perPageNum;
	private int startNum;
	private boolean priceRange;
	private int is_locked;
	public SearchProductCommandDTO()
	{
		middle_id = 10;
		orderBy = "priceAsc";
		searchWord = "";
		perPageNum = 20;
		page = 1;
		price_min = -1;
		price_max = -1;
		priceRange = false;
		is_locked = 2;

	}
	public SearchProductCommandDTO(int page, int main_id, int middle_id,
			int price_min, int price_max, String searchWord, String orderBy,
			int perPageNum, int startNum, boolean priceRangeint, int is_locked)
	{
		this.page = page;
		this.main_id = main_id;
		this.middle_id = middle_id;
		this.price_min = price_min;
		this.price_max = price_max;
		this.searchWord = searchWord;
		this.orderBy = orderBy;
		this.perPageNum = perPageNum;
		this.startNum = startNum;
		this.priceRange = priceRange;
		this.is_locked = is_locked;
	}
	@Override
	public String toString()
	{
		return "SearchProductCommandDTO [page=" + page + ", main_id=" + main_id
				+ ", middle_id=" + middle_id + ", price_min=" + price_min
				+ ", price_max=" + price_max + ", searchWord=" + searchWord
				+ ", orderBy=" + orderBy + ", perPageNum=" + perPageNum
				+ ", startNum=" + startNum + ", priceRange=" + priceRange
				+ ", is_locked=" + is_locked + "]";
	}
	public int getPage()
	{
		return page;
	}
	public void setPage(int page)
	{
		this.page = page;
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
	public int getPrice_min()
	{
		return price_min;
	}
	public void setPrice_min(int price_min)
	{
		this.price_min = price_min;
	}
	public int getPrice_max()
	{
		return price_max;
	}
	public void setPrice_max(int price_max)
	{
		this.price_max = price_max;
	}
	public String getSearchWord()
	{
		return searchWord;
	}
	public void setSearchWord(String searchWord)
	{
		this.searchWord = searchWord;
	}
	public String getOrderBy()
	{
		return orderBy;
	}
	public void setOrderBy(String orderBy)
	{
		this.orderBy = orderBy;
	}
	public int getPerPageNum()
	{
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum)
	{
		this.perPageNum = perPageNum;
	}
	public int getStartNum()
	{
		return startNum;
	}
	public void setStartNum(int startNum)
	{
		this.startNum = startNum;
	}
	public boolean isPriceRange()
	{
		return priceRange;
	}
	public void setPriceRange(boolean priceRange)
	{
		this.priceRange = priceRange;
	}

	public int getIs_locked()
	{
		return is_locked;
	}

	public void setIs_locked(int is_locked)
	{
		this.is_locked = is_locked;
	}
}
