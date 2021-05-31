package com.market.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.member.dto.MemberDTO;
import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;

// MemberDAO에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Repository
public class MemberDAOImpl /* implements MemberDAO */
{
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public MemberDAOImpl()
	{
		System.out.println("MemberDAOImpl()생성자호출");
	}

	//회원가입처리
	//	@Override
	public int joinMember(MemberDTO memberDTO)
	{
		//sqlSession.insert("mapper의 namespace.실행쿼리문id")
		//sqlSession.insert("mapper의 namespace.실행쿼리문id",Object 파라미터)
		int result = sqlSession.insert("member.joinMember", memberDTO);
		//insert가 된 record수를 return받는다
		//여기에서 실행된 insert문이 성공되면 1개의 record가 insert되므로
		//1을 리턴받는다
		//만약 0을 리턴받으면  insert fail을 의미한다
		System.out.println("joinMember()실행후 result =" + result);//확인용

		return result;
	}

	//회원목록조회
	//	@Override
	public List<MemberDTO> getMemberList() throws DataAccessException
	{
		System.out.println("MemberDAOImpl의 getMemberList()진입");

		//selectList("mapper의 namespace.실행쿼리문id")
		List<MemberDTO> memberList = sqlSession
				.selectList("member.getMemberList");
		return memberList;
	}

	//회원상세조회
	//	@Override
	public MemberDTO getMemberDetail(int id) throws DataAccessException
	{
		System.out.println("MemberDAOImpl의 getMemberDetail()진입");

		//selectList("mapper의 namespace.실행쿼리문id")
		MemberDTO memberDetail = (MemberDTO)sqlSession
				.selectOne("member.getMemberDetail", id);
		return memberDetail;
	}

	//회원비밀번호 확인
	//	@Override
	public int pwdCheck(Map<String, Object> check) throws DataAccessException
	{
		int result = sqlSession.selectOne("member.pwdCheck", check);
		System.out.println("pwdCheck()실행후 result =" + result);//확인용

		return result;
	}

	//회원수정처리
	//	@Override
	public int updateMember(MemberDTO memberDTO) throws DataAccessException
	{
		int result = sqlSession.update("member.updateMember", memberDTO);
		System.out.println("updateMember()실행후 result =" + result);//확인용

		return result;
	}

	//회원삭제처리
	//	@Override
	public int deleteMember(int member_id) throws DataAccessException
	{
		int result = sqlSession.update("member.deleteMember", member_id);
		System.out.println("deleteMember()실행후 result =" + result);//확인용

		return result;
	}

	//회원가입 이메일 중복체크 검사
	//	@Override
	public boolean checkDuplicateByEmail(String email)
			throws DataAccessException
	{
		boolean result = Integer.parseInt(
				(sqlSession.selectOne("member.checkDuplicateByEmail", email)
						.toString())) > 0 ? true : false;
		System.out.println("checkDuplicateByEmail()실행후 result =" + result);//확인용

		return result;
	}

	//로그인처리
	public MemberDTO login(Map<String, Object> memberInfo)
			throws DataAccessException
	{
		System.out
				.println("dao memberInfo.getemail=" + memberInfo.get("email"));
		System.out.println(
				"dao memberInfo.getpassword=" + memberInfo.get("password"));
		MemberDTO memberDTO = (MemberDTO)sqlSession.selectOne("member.login",
				memberInfo);
		return memberDTO;
	}

	//마이페이지 주문내역
	public List<OrdersDTO> selectOrders(int member_id)
			throws DataAccessException
	{
		List<OrdersDTO> orders = sqlSession.selectList("member.selectOrders",
				member_id);

		return orders;
	}

	//마이페이지 주문상세 내역
	public List<OrderProductDetailDTO> getOrderDetailList(int order_id)
	{
		return sqlSession.selectList("member.getOrderDetailList", order_id);
	}

	//관리자 - 회원 상태 변경
	public int updateMemberStatus(MemberDTO memberDTO)
			throws DataAccessException
	{
		int result = sqlSession.update("member.updateMemberStatus", memberDTO);

		return result;
	}
}
