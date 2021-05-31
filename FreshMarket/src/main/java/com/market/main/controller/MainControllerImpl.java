package com.market.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.market.main.service.MainServiceImpl;

// 이 클래스는 회원관련 컨트롤러 클래스이다
@Controller
public class MainControllerImpl extends MultiActionController
//		implements
//			MainController
{

	//	@Autowired
	//	private MainDTO mainDTO;

	//field
	@Autowired
	private MainServiceImpl mainServiceImpl;

	public void setMainServiceImpl(MainServiceImpl mainServiceImpl)
	{
		System.out.println("setMainServiceImpl() 진입");
		this.mainServiceImpl = mainServiceImpl;
	}

	//메인화면 보여주기
	@RequestMapping(value = "/main.do", method =
	{RequestMethod.POST, RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		/* 참고 controller의 요청함수의 return type이 String이면
		 * viewResolver에서 설정한 뷰의 prefix와 suffix를 제외한
		 * 나머지 부분을 String으로 제시하면 된다
		 * =>기존의 jsp방식과 동일 */
		//1.parameter받기
		//2.비즈니스로직수행<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
		//3.Model
		//4.View
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		//String viewName=(String)request.getAttribute("viewName");
		String viewName = "main/main";
		mav.setViewName(viewName);

		/* session = request.getSession();
		 * session.setAttribute("side_menu", "user"); */
		/* Map<String, List<GoodsDTO>> goodsMap = goodsService.listGoods();
		 * mav.addObject("goodsMap", goodsMap); */
		return mav;
	}

}
