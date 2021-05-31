package com.market.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.member.dto.MemberDTO;
import com.market.member.service.MemberServiceImpl;
import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;

import net.sf.json.JSONObject;

// 이 클래스는 회원관련 컨트롤러 클래스이다
@Controller
public class MemberControllerImpl extends MultiActionController
{

	@Autowired
	private MemberDTO memberDTO;

	//field
	@Autowired
	private MemberServiceImpl memberServiceImpl;

	public void setMemberServiceImpl(MemberServiceImpl memberServiceImpl)
	{
		System.out.println("setMemberServiceImpl() 진입");
		this.memberServiceImpl = memberServiceImpl;
	}

	//관리자============================================================
	//확인방법   http://localhost/컨텍스트패스/member/memberList.do
	//회원목록조회
	@RequestMapping(value = "/member/memberList.do", method =
	{RequestMethod.POST, RequestMethod.GET})
	public ModelAndView getMemberList(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		System.out.println("MemberControllerImpl의 getMemberList()진입");
		//컨트롤러가 하는 일
		//1.parameter받기
		//2.비즈니스로직수행<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
		// 다양한 type의  data의 개수가 여러개   => collection, DTO이용

		MemberDTO member = (MemberDTO)session.getAttribute("memberDTO");
		String member_role = member.getMember_role();
		ModelAndView mv = new ModelAndView("member/memberList");

		if (member_role.equals("admin"))
		{

			//회원목록조회
			List<MemberDTO> memberList = memberServiceImpl.getMemberList();

			//회원수조회
			//int count = memberService.getMemberCount();

			//3.Model
			//mv.addObject("키값", value)
			//mv.addObject(String타입 attributeName, Object타입 attributeValue)
			mv.addObject("memberList", memberList);//회원목록
			//mv.addObject("memberCount", count);//회원수

		}
		else
		{
			session.removeAttribute("memberDTO");
			session.removeAttribute("isLogin");
			String contextPath = request.getContextPath();
			contextPath += "/member/loginForm.do";
			mv.addObject("message", "관리자로 로그인해주세요");
			mv.addObject("path", contextPath);

		}
		//4.View
		//기존의 뷰리졸버로 처리했던 방식
		//mv.setViewName("member/memberList");
		//tiles를 이용하면서
		//ModelAndView mv = new ModelAndView("/member/memberList");로 변경하였음
		//ModelAndView생성자의   String타입의 값은 반드시 tiles_member.xml의
		// <definition name="/member/memberList">의 name과 일치해야 한다
		return mv;
	}

	//회원가입폼 보여주기
	//@RequestMapping("요청url")
	@RequestMapping("/member/joinForm.do")
	public String joinForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		//		<beans:property name="prefix" value="/WEB-INF/views/" />
		//		<beans:property name="suffix" value=".jsp" />
		//		/WEB-INF/views/member/joinForm.jsp
		return "member/joinForm";
	}

	//회원가입처리
	/* @ModelAttribute : Annotation that binds a method parameter or method return value to a named model attribute, exposed to a web view.
	 * Supported for RequestMapping annotated handler classes.
	 * Can be used to expose command objects to a web view, using specific attribute names, through annotating corresponding parameters of a RequestMapping annotated handler method).
	 * 
	 * 여기에서의 @ModelAttribute("info") MemberDTO memberDTO는
	 * 
	 * @ModelAttribute를 이용해 전달되는 매개변수의 값을
	 * 이름(parameter명)이 같은 속성(MemberDTO의 field명)에
	 * 자동으로 설정(->MemberDTO.setter()이용)한다.
	 * ==> 전달된 매개변수에 대해 MemberDTO클래스 객체를 생성한다
	 * ->이어서 매개변수이름과 같은 속성에 매개변수값을 설정한 후
	 * ->info라는 이름으로 바인딩한다
	 * ==> 예) <input type="text" name="id" id="id">에 user가 hongid를 입력하면
	 * 전달된 매개변수 이름이 (name="id") id가 된다
	 * 값이 hongid일 경우,
	 * 
	 * @ModelAttribute로 MemberDTO를 지정하면
	 * 전달시
	 * MemberDTO의 속성(private String id;)에 전달된 값 hongid를 자동으로 설정한다 */

	@RequestMapping("/member/joinMember.do")
	public ModelAndView joinMember(@ModelAttribute("info") MemberDTO memberDTO,
			//MemberDTO memberDTO,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		/* @ModelAttribute("키명") 사용하지 않고 하던 방식
		 * 1.parameter받기
		 * String id = request.getParameter("id");//아이디
		 * String pwd = request.getParameter("pwd");//비번
		 * String name = request.getParameter("name");//이름
		 * String email = request.getParameter("email");//이메일
		 * 
		 * user가 입력한 내용으로 MemberDTO생성
		 * MemberDTO memberDTO = new MemberDTO();
		 * memberDTO.setId(id);
		 * memberDTO.setPwd(pwd);
		 * memberDTO.setName(name);
		 * memberDTO.setEmail(email);
		 * ModelAndView mv = new ModelAndView();
		 * mv.addObject("info", memberDTO);
		 * mv.setViewName("member/imsiView"); //${info.get메서드()}
		 * return mv; */
		//System.out.println("info="+memberDTO.toString());

		//2.비즈니스로직 -> Service ->DAO -> Mybatis->DB
		int result = memberServiceImpl.joinMember(memberDTO);
		System.out.println("컨트롤러에서 비즈니스로직결과 result =" + result);

		//3.Model
		//4.View => 목록보기페이지로 넘어갈 예정=>회원목록보기 요청
		ModelAndView mv = new ModelAndView("redirect:/main.do");
		//System.out.println("컨트롤러요청함수의 매개변수 memberDTO="+memberDTO);
		//mv.setViewName("member/imsiView");  
		//imsiView에서는 모델의 값을 브라우저에 출력시  ${info.get메서드()} 사용가능
		//imsiView에서는 모델의 값을 브라우저에 출력시 ${memberDTO.get메서드()} 사용가능
		return mv;
	}

	//요청 url  http://localhost/컨텍스트패스/member/loginForm.do
	//로그인 폼 보여주기
	@RequestMapping("/member/loginForm.do")
	public String loginForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		String result = request.getParameter("loginResult");
		System.out.println("로그인실패시 리다이렉트로 받은 파라미터result=" + result);
		//기존방식에서는 /member폴더/loginForm.jsp문서를 뜻하는 것이였지만
		//tiles를 이용하면
		//tiles_member.xml에서 정의한 
		//<definition name="member/loginForm">에서의
		//name속성값인   "member/loginForm"을 뜻하게 된다
		return "member/loginForm";
	}

	//요청 url    컨텍스트패스//member/login.do
	//회원가입처리
	/* 요청함수의 매개변수에서 @RequestParam("mid") String id
	 * 기존의 방식 String id = request.getParameter("mid");
	 * 
	 * 
	 * String id = request.getParameter("mid");
	 * String pwd = request.getParameter("mpwd");
	 * Map<String,Obejct> map = new HashMap<String,Obejct>();
	 * map.put("keyid",id);
	 * map.put("keypwd",pwd);
	 * 
	 * 마이바티스에서는 #{keyid} #{keypwd} */
	@RequestMapping("/member/login.do")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map<String, Object> memberInfo,
			RedirectAttributes rdAttr) throws Exception
	{
		//1.파라미터받기
		/* 여기에서는 요청함수매개변수 @RequestParam Map<String,Obejct> memberInfo받았다
		 * loginForm.jsp의 name속성의 값이 Map의 key가 된다
		 * <input type="text" name="id" required="required"/>
		 * <input type="password" name="pwd" required="required"/>
		 * 마이바티스에서는 #{id} #{pwd} */

		//2.비즈니스로직수행
		MemberDTO memberDTO = memberServiceImpl.login(memberInfo);

		/* 3.Model
		 * -> 기존jsp에서는 request기본객체.setAttribute(키명,value);
		 * -> 기존jsp에서는 session객체.setAttribute(키명,value);
		 * -> Spring에서 request기본객체 및 session객체사용가능
		 * ModelAndView의 참조변수명.addObject(키명,value)
		 * 요청함수의 매개변수 Model model 이용하면
		 * model.addAttribute(키명,value); */
		ModelAndView mv = new ModelAndView();

		//로그인 성공시 세션에 로그인한 user정보+sendRedirect이용 회원목록페이지로 이동
		if (memberDTO != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("memberDTO", memberDTO);//DTO 자체를 세션에 저장
			session.setAttribute("isLogin", true);
			mv.setViewName(
					"redirect:/userProduct/searchProduct.do?page=1&perPageNum=20&searchWord=");
		}
		else
		{//로그인 실패시 sendRedirect이용 로그인폼페이지로 이동
			//요청함수의  RedirectAttributes은 리다이렉트시 가져가는 parameter
			//여기에서는  "loginResult"라는 키명으로 
			//String타입의 loginFail 값이  사용되었다
			rdAttr.addAttribute("loginResult", "loginFail");
			mv.setViewName("redirect:/member/loginForm.do");
		}

		//4.View-> tiles이용시에는 주의
		return mv;
	}

	//로그아웃
	@RequestMapping("/member/logout.do")
	public ModelAndView logOut(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception
	{
		//로그인을 성공하면 session에 로그인유저의 정보가 담겨있다
		//따라서 세션의 정보를 제거한다   세션객체.invalidate()
		//     세션의 특정 정보를 제거 세션객체.removeAttribute(세션키명)
		/* 여기에서는
		 * session.setAttribute("MID",memberDTO.getId());//DTO에서 특정field만 세션에 저장
		 * session.setAttribute("MDTO",memberDTO);//DTO 자체를 세션에 저장
		 * session.setAttribute("isLogin",true); */
		HttpSession session = request.getSession();
		session.removeAttribute("memberDTO");
		session.removeAttribute("isLogin");

		//리다이렉트방식으로 이동
		mv.setViewName(
				"redirect:/userProduct/searchProduct.do?page=1&perPageNum=20&searchWord=");
		return mv;
	}

	@RequestMapping("/member/checkDuplication.do")
	public void checkDuplication(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String email = null;
		if (request.getParameter("email") != null)
		{
			email = request.getParameter("email");

			boolean isDuplicateByEmail = memberServiceImpl
					.checkDuplicateByEmail(email);

			PrintWriter out = response.getWriter();
			out.print(isDuplicateByEmail);
		}
	}

	//마이페이지 보여주기
	@RequestMapping("/mypage/myPageMain.do")
	public ModelAndView myPageForm(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelAndView mv)
			throws Exception
	{
		if ((MemberDTO)session.getAttribute("memberDTO") == null)
		{
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}
		else
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			int member_id = memberDTO.getMember_id();

			List<OrdersDTO> orderedList = memberServiceImpl
					.selectOrders(member_id);
			mv.addObject("orderedList", orderedList);
		}
		mv.setViewName("mypage/myPage");    // view(jsp)의 이름 저장
		return mv;
	}

	//상품상세목록 보여주기
	@RequestMapping("/mypage/orderDetailList.do")
	public ModelAndView orderDetailList(ModelAndView mav,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, OrderProductDetailDTO orderProductDetailDTO)
			throws Exception
	{
		if ((MemberDTO)session.getAttribute("memberDTO") == null)
		{
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}
		else
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			int member_id = memberDTO.getMember_id();
			orderProductDetailDTO.setMember_id(member_id);
			List<OrderProductDetailDTO> orderDetailList = memberServiceImpl
					.getOrderDetailList(orderProductDetailDTO.getOrder_id());
			mav.addObject("orderDetailList", orderDetailList);
		}
		mav.setViewName("mypage/orderDetailList");    // view(jsp)의 이름 저장
		return mav;
	}

	//마이페이지 비밀번호 확인
	@RequestMapping(value = "/mypage/pwdCheck.do", method = RequestMethod.POST)
	public @ResponseBody JSONObject pwdCheck(
			@RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception
	{

		memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		int member_id = memberDTO.getMember_id();

		Map<String, Object> check = new HashMap<String, Object>();
		check.put("member_id", member_id);
		check.put("password", password);

		int result = memberServiceImpl.pwdCheck(check);
		boolean pwdChk = result == 1 ? true : false;

		MemberDTO memberDetail = memberServiceImpl.getMemberDetail(member_id);
		JSONObject detail = new JSONObject();

		if (memberDetail.getPassword().equals(password) && pwdChk)
		{

			detail.put("result", "success");
			detail.put("email", memberDetail.getEmail());
			detail.put("member_id", memberDetail.getMember_id());
			detail.put("password", memberDetail.getPassword());
			detail.put("name", memberDetail.getName());
			detail.put("phone", memberDetail.getPhone());
			detail.put("address", memberDetail.getAddress());

		}
		else
		{
			detail.put("result", "fail");
		}

		return detail;

	}

	//수정하기
	@RequestMapping(value = "/mypage/memberModify.do", method = RequestMethod.POST)
	public @ResponseBody JSONObject memberModify(MemberDTO memberDTO,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{

		int result = memberServiceImpl.updateMember(memberDTO);
		JSONObject detail = new JSONObject();

		if (result == 1)
		{
			int member_id = memberDTO.getMember_id();
			MemberDTO memberDetail = memberServiceImpl
					.getMemberDetail(member_id);

			detail.put("result", "success");
			detail.put("email", memberDetail.getEmail());
			detail.put("member_id", memberDetail.getMember_id());
			detail.put("password", memberDetail.getPassword());
			detail.put("name", memberDetail.getName());
			detail.put("phone", memberDetail.getPhone());
			detail.put("address", memberDetail.getAddress());

		}
		else
		{
			detail.put("result", "fail");
		}
		return detail;
	}

	//탈퇴
	@RequestMapping(value = "/mypage/memberQuit.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberQuit(@RequestParam("member_id") int member_id,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv, HttpSession session) throws Exception
	{

		int result = memberServiceImpl.deleteMember(member_id);
		String msg = "";

		if (result == 1)
		{
			session.removeAttribute("memberDTO");
			session.removeAttribute("isLogin");

			msg = "success";

		}
		else
		{
			msg = "fail";
		}

		return msg;
	}

	//관리자============================================================
	//회원 상태 변경
	@RequestMapping(value = "/member/memberstatus.do", method =
	{RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String memberStatusChange(MemberDTO memberDTO,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception
	{
		MemberDTO member = (MemberDTO)session.getAttribute("memberDTO");
		String member_role = member.getMember_role();
		String member_status = "";

		if (member_role.equals("admin"))
		{

			int result = memberServiceImpl.updateMemberStatus(memberDTO);

			if (result == 1)
			{

				MemberDTO memberDetail = memberServiceImpl
						.getMemberDetail(memberDTO.getMember_id());
				member_status = memberDetail.getMember_status();

			}
			else
			{
				member_status = "상태 변경 실패, 다시 시도해주세요";
			}

		}
		else
		{
			member_status = "fail";
		}

		return member_status;
	}

}
