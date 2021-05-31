package com.market.sales.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.sales.dto.SalesDTO;


@Repository("salesDAO")
public class SalesDAOImpl {

	@Autowired
	private SqlSession sqlSession;

	//일일 매출 - 현재달
	public List<SalesDTO> daily() throws DataAccessException {
		List<SalesDTO> daily = sqlSession.selectList("sales.daily");
		return daily;
	}

	//일일매출 - 기간별 조회 
	public List<SalesDTO> dailyPeriod(Map period) throws DataAccessException {
		List<SalesDTO> dailyPeriod = sqlSession.selectList("sales.dailyPeriod",period);
		System.out.println("dao다녀옴"+dailyPeriod);
		return dailyPeriod;
	}
	
	//월별매출 - 최근 3개월 조회 
	public List<SalesDTO> monthly() throws DataAccessException {
		List<SalesDTO> monthly = sqlSession.selectList("sales.monthly");
		System.out.println("dao다녀옴"+monthly);
		return monthly;
	}
	
	//월별매출 - 기간별 조회 
	public List<SalesDTO> monthlyPeriod(Map period) throws DataAccessException {
		List<SalesDTO> monthlyPeriod = sqlSession.selectList("sales.monthlyPeriod",period);
		System.out.println("dao다녀옴"+monthlyPeriod);
		return monthlyPeriod;
	}
	
	
}

