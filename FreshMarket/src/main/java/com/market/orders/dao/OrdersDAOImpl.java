package com.market.orders.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;

@Repository
public class OrdersDAOImpl
{
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public OrdersDAOImpl()
	{
		System.out.println("MemberDAOImpl()생성자호출");
	}

	public void insertOrders(OrdersDTO ordersDTO)
	{
		sqlSession.insert("orders.insertOrders", ordersDTO);
	}

	public void insertOrderProductDetail(
			OrderProductDetailDTO orderProductDetailDTO)
	{
		sqlSession.insert("orders.insertOrderProductDetail",
				orderProductDetailDTO);
	}

	public void emptyCart(int member_id)
	{
		int result = sqlSession.delete("orders.emptyCart", member_id);
		System.out.println("sqlSession.delete orders.emptyCart = " + result);
	}

	public OrdersDTO getLastOrdersDTO(int order_id)
	{
		return sqlSession.selectOne("orders.getLastOrdersDTO", order_id);
	}
}
