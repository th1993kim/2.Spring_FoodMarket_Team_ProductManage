package com.market.sales.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.market.sales.dao.SalesDAOImpl;
import com.market.sales.dto.SalesDTO;

@Service("salesService")
public class SalesServiceImpl {
	
	@Autowired
	private SalesDAOImpl salesDAO;

	//일일 매출 - 현재달
	//@Override
	public List<SalesDTO> daily() throws DataAccessException {
		List<SalesDTO> daily = salesDAO.daily();
		return daily;
	}
	
	//일일매출 - 기간별 조회 
	//@Override
	public List<SalesDTO> dailyPeriod(Map period) throws DataAccessException {
		List<SalesDTO> dailyPeriod = salesDAO.dailyPeriod(period);
		return dailyPeriod;
	}
	
	//월별매출 - 최근 3개월 조회 
	//@Override
	public List<SalesDTO> monthly() throws DataAccessException {
		List<SalesDTO> monthly = salesDAO.monthly();
		return monthly;
	}
	
	//월별매출 - 기간별 조회 
	//@Override
	public List<SalesDTO> monthlyPeriod(Map period) throws DataAccessException {
		List<SalesDTO> monthlyPeriod = salesDAO.monthlyPeriod(period);
		return monthlyPeriod;
	}
	
	
	
}



