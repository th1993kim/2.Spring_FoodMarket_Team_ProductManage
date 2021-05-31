package com.market.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.member.dao.MemberDAOImpl;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class MainServiceImpl
{

	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private MemberDAOImpl memberDAOImpl;
	public void setMemberDAOImpl(MemberDAOImpl memberDAOImpl)
	{
		this.memberDAOImpl = memberDAOImpl;
		System.out.println("MemberDAO0=" + this.memberDAOImpl);
	}

	public MainServiceImpl()
	{
		System.out.println("MainServiceImpl()생성자호출");
	}

}
