package com.market.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.market.member.dao.MemberDAOImpl;
import com.market.member.dto.MemberDTO;
import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class MemberServiceImpl /* implements MemberService */
{

	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private MemberDAOImpl memberDAOImpl;
	public void setMemberDAOImpl(MemberDAOImpl memberDAOImpl)
	{
		this.memberDAOImpl = memberDAOImpl;
		System.out.println("MemberDAO0=" + this.memberDAOImpl);
	}

	public MemberServiceImpl()
	{
		System.out.println("MemberServiceImpl()생성자호출");
	}

	//회원가입처리
	//	@Override
	public int joinMember(MemberDTO memberDTO) throws DataAccessException
	{
		int result = memberDAOImpl.joinMember(memberDTO);
		System.out.println(
				"MemberServiceImpl의 joinMember()실행후의 result =" + result);
		return result;
	}

	//회원목록조회
	//	@Override
	public List<MemberDTO> getMemberList() throws DataAccessException
	{
		System.out.println("MemberServiceImpl의 getMemberList()진입");
		List<MemberDTO> memberList = memberDAOImpl.getMemberList();
		return memberList;
	}

	//회원상세조회
	//	@Override
	public MemberDTO getMemberDetail(int id) throws DataAccessException
	{
		System.out.println("MemberServiceImpl의 getMemberDetail()진입");
		MemberDTO memberDetail = memberDAOImpl.getMemberDetail(id);
		return memberDetail;
	}

	//회원수정처리
	//	@Override
	public int updateMember(MemberDTO memberDTO) throws DataAccessException
	{
		int result = memberDAOImpl.updateMember(memberDTO);
		System.out.println(
				"MemberServiceImpl의 updateMember()실행후의 result =" + result);
		return result;
	}

	//회원비밀번호 확인
	//	@Override
	public int pwdCheck(Map<String, Object> check) throws DataAccessException
	{
		int result = memberDAOImpl.pwdCheck(check);
		System.out.println("pwdCheck서비스()실행후 result =" + result);//확인용

		return result;
	}

	//회원삭제처리
	//	@Override
	public int deleteMember(int member_id) throws DataAccessException
	{
		int result = memberDAOImpl.deleteMember(member_id);
		System.out.println(
				"MemberServiceImpl의 deleteMember()실행후의 result =" + result);
		return result;
	}

	//회원가입 이메일 중복체크 검사
	//	@Override
	public boolean checkDuplicateByEmail(String email)
			throws DataAccessException
	{
		boolean result = memberDAOImpl.checkDuplicateByEmail(email);
		System.out.println(
				"MemberServiceImpl의 checkDuplicateByEmail()실행후의 result ="
						+ result);
		return result;
	}

	//로그인처리
	public MemberDTO login(Map<String, Object> memberInfo)
			throws DataAccessException
	{
		MemberDTO memberDTO = memberDAOImpl.login(memberInfo);
		return memberDTO;
	}

	//마이페이지 주문내역
	public List<OrdersDTO> selectOrders(int member_id)
			throws DataAccessException
	{
		List<OrdersDTO> orders = memberDAOImpl.selectOrders(member_id);

		return orders;
	}

	//관리자 - 회원 상태 변경
	public int updateMemberStatus(MemberDTO memberDTO)
			throws DataAccessException
	{
		int result = memberDAOImpl.updateMemberStatus(memberDTO);

		return result;
	}

	public List<OrderProductDetailDTO> getOrderDetailList(int order_id)
	{
		return memberDAOImpl.getOrderDetailList(order_id);
	}
}
