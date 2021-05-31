package com.market.orders.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.market.cart.dto.CartDTO;
import com.market.cart.service.CartServiceImpl;
import com.market.event_product.dto.EventProductJoinDTO;
import com.market.member.dto.MemberDTO;
import com.market.orders.dto.OrderProductDetailDTO;
import com.market.orders.dto.OrdersDTO;
import com.market.orders.service.OrdersServiceImpl;
import com.market.product.user.dto.UserProductDTO;
import com.market.product.user.service.UserProductServiceImpl;

@Controller
public class OrdersControllerImpl
{
	//	@Autowired
	//	private MainDTO mainDTO;
	private static final String LOCAL_DIR = "/local_img/";

	//field
	@Autowired
	private OrdersServiceImpl ordersServiceImpl;
	@Autowired
	private CartServiceImpl cartServiceImpl;
	@Autowired
	private UserProductServiceImpl userProductServiceImpl;

	public void setOrdersServiceImpl(OrdersServiceImpl ordersServiceImpl)
	{
		System.out.println("setOrdersServiceImpl() 진입");
		this.ordersServiceImpl = ordersServiceImpl;
	}

	@RequestMapping(value = "/orders/directOrdersProcess.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public void directOrdersProcess(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute OrdersDTO ordersDTO,
			@ModelAttribute CartDTO cartDTO, @RequestParam String requestSelect)
			throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		int order_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			Map<String, Object> orderSuccessMap = new HashMap<String, Object>();
			int sumMoney = cartDTO.getCart_product_price()
					* cartDTO.getCart_product_amount(); // 장바구니 전체 금액 호출

			ordersDTO.setReceiver_phone(
					ordersDTO.getReceiver_phone().replaceAll("-", ""));

			ordersDTO.setMember_id(member_id);
			ordersDTO.setOrderer_name(memberDTO.getName());
			ordersDTO.setOrderer_phone(memberDTO.getPhone());
			ordersDTO.setOrders_product_price(sumMoney);
			ordersDTO
					.setOrder_all_sum(sumMoney + ordersDTO.getDelivery_price());

			switch (Integer.parseInt(requestSelect))
			{
				case 1 :
					ordersDTO.setRequest("문앞");
					break;
				case 2 :
					ordersDTO.setRequest("직접 받고 부재시 문앞");
					break;
				case 3 :
					ordersDTO.setRequest("경비실");
					break;
				case 4 :
					ordersDTO.setRequest("택배함");
					break;
				case 5 :
					break;
				default :
					break;
			}

			ordersServiceImpl.insertOrders(ordersDTO);

			OrderProductDetailDTO orderProductDetailDTO = new OrderProductDetailDTO();

			orderProductDetailDTO.setOrder_id(ordersDTO.getOrder_id());
			orderProductDetailDTO.setMember_id(member_id);
			orderProductDetailDTO.setProduct_id(cartDTO.getProduct_id());
			orderProductDetailDTO
					.setEvent_product_id(cartDTO.getEvent_product_id());
			orderProductDetailDTO.setProduct_name(cartDTO.getProduct_name());
			orderProductDetailDTO
					.setOrder_product_amount(cartDTO.getCart_product_amount());
			orderProductDetailDTO
					.setOrder_product_price(cartDTO.getCart_product_price());
			orderProductDetailDTO
					.setProduct_img_path(cartDTO.getProduct_img_path());
			orderProductDetailDTO
					.setProduct_img_name(cartDTO.getProduct_img_name());

			ordersServiceImpl.insertOrderProductDetail(orderProductDetailDTO);

			order_id = ordersDTO.getOrder_id();
			//정보보안 주의
			response.sendRedirect(contextPath
					+ "/orders/ordersSuccess.do?order_id=" + order_id);
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}
	}

	@RequestMapping(value = "/orders/eventDirectOrdersForm.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventDirectOrder(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mav, @ModelAttribute CartDTO cartDTO) throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			Map<String, Object> eventDirectOrderMap = new HashMap<String, Object>();

			int event_product_id = cartDTO.getEvent_product_id();
			EventProductJoinDTO eventProductJoinDTO = (EventProductJoinDTO)userProductServiceImpl
					.detailUserEventProduct(event_product_id)
					.get("eventProductJoinDTO");
			cartDTO.setProduct_id(eventProductJoinDTO.getProduct_id());
			cartDTO.setProduct_name(eventProductJoinDTO.getProduct_name());
			cartDTO.setCart_product_price(
					eventProductJoinDTO.getEvent_product_price());
			cartDTO.setProduct_img_name(
					eventProductJoinDTO.getProduct_img_name());
			cartDTO.setProduct_img_path(
					eventProductJoinDTO.getProduct_img_path());

			int sumMoney = eventProductJoinDTO.getEvent_product_price()
					* cartDTO.getCart_product_amount(); // 장바구니 전체 금액 호출
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(3만원이상 => 무료, 미만 => 2500원)
			int fee = sumMoney >= 30000 ? 0 : 2500;

			eventDirectOrderMap.put("memberDTO", memberDTO);
			eventDirectOrderMap.put("cartDTO", cartDTO);                // 장바구니 정보를 map에 저장
			eventDirectOrderMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			eventDirectOrderMap.put("fee", fee);                 // 배송금액
			eventDirectOrderMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("eventDirectOrderMap", eventDirectOrderMap);            // map 변수 저장
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		mav.setViewName("orders/eventDirectOrdersForm");
		return mav;
	}

	@RequestMapping(value = "/orders/directOrdersForm.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView directOrder(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mav, @ModelAttribute CartDTO cartDTO) throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			Map<String, Object> directOrderMap = new HashMap<String, Object>();

			int product_id = cartDTO.getProduct_id();
			UserProductDTO userProductDTO = (UserProductDTO)userProductServiceImpl
					.detailUserProduct(product_id).get("userProductDTO");
			cartDTO.setProduct_name(userProductDTO.getProduct_name());
			cartDTO.setCart_product_price(userProductDTO.getProduct_price());
			cartDTO.setProduct_img_name(userProductDTO.getProduct_img_name());
			cartDTO.setProduct_img_path(userProductDTO.getProduct_img_path());

			int sumMoney = userProductDTO.getProduct_price()
					* cartDTO.getCart_product_amount(); // 장바구니 전체 금액 호출
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(3만원이상 => 무료, 미만 => 2500원)
			int fee = sumMoney >= 30000 ? 0 : 2500;

			directOrderMap.put("memberDTO", memberDTO);
			directOrderMap.put("cartDTO", cartDTO);                // 장바구니 정보를 map에 저장
			directOrderMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			directOrderMap.put("fee", fee);                 // 배송금액
			directOrderMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("directOrderMap", directOrderMap);            // map 변수 저장
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		mav.setViewName("orders/directOrdersForm");
		return mav;
	}

	@RequestMapping(value = "/orders/ordersSuccess.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView orderSuccess(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mav, @RequestParam int order_id) throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			OrdersDTO ordersDTO = new OrdersDTO();
			ordersDTO = ordersServiceImpl.getLastOrdersDTO(order_id);
			mav.addObject("ordersDTO", ordersDTO);
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		mav.setViewName("orders/ordersSuccess");
		return mav;
	}

	@RequestMapping(value = "/orders/ordersProcess.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public void ordersProcess(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute OrdersDTO ordersDTO,
			@RequestParam String requestSelect) throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		int order_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			Map<String, Object> orderSuccessMap = new HashMap<String, Object>();
			List<CartDTO> listCart = cartServiceImpl.listCart(member_id); // 장바구니 정보
			int sumMoney = cartServiceImpl.sumMoney(member_id); // 장바구니 전체 금액 호출
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(3만원이상 => 무료, 미만 => 2500원)
			int fee = sumMoney >= 30000 ? 0 : 2500;

			ordersDTO.setReceiver_phone(
					ordersDTO.getReceiver_phone().replaceAll("-", ""));

			ordersDTO.setMember_id(member_id);
			ordersDTO.setOrderer_name(memberDTO.getName());
			ordersDTO.setOrderer_phone(memberDTO.getPhone());
			ordersDTO.setOrders_product_price(sumMoney);
			ordersDTO.setDelivery_price(fee);
			ordersDTO.setOrder_all_sum(sumMoney + fee);

			switch (Integer.parseInt(requestSelect))
			{
				case 1 :
					ordersDTO.setRequest("문앞");
					break;
				case 2 :
					ordersDTO.setRequest("직접 받고 부재시 문앞");
					break;
				case 3 :
					ordersDTO.setRequest("경비실");
					break;
				case 4 :
					ordersDTO.setRequest("택배함");
					break;
				case 5 :
					break;
				default :
					break;
			}

			ordersServiceImpl.insertOrders(ordersDTO);

			OrderProductDetailDTO orderProductDetailDTO = new OrderProductDetailDTO();

			for (int i = 0; i < listCart.size(); i++)
			{
				orderProductDetailDTO.setOrder_id(ordersDTO.getOrder_id());
				orderProductDetailDTO.setMember_id(member_id);
				orderProductDetailDTO
						.setProduct_id(listCart.get(i).getProduct_id());
				orderProductDetailDTO.setEvent_product_id(
						listCart.get(i).getEvent_product_id());
				orderProductDetailDTO
						.setProduct_name(listCart.get(i).getProduct_name());
				orderProductDetailDTO.setOrder_product_amount(
						listCart.get(i).getCart_product_amount());
				orderProductDetailDTO.setOrder_product_price(
						listCart.get(i).getCart_product_price());
				orderProductDetailDTO.setProduct_img_path(
						listCart.get(i).getProduct_img_path());
				orderProductDetailDTO.setProduct_img_name(
						listCart.get(i).getProduct_img_name());

				ordersServiceImpl
						.insertOrderProductDetail(orderProductDetailDTO);
			}

			ordersServiceImpl.emptyCart(member_id);
			order_id = ordersDTO.getOrder_id();
			//정보보안 주의
			response.sendRedirect(contextPath
					+ "/orders/ordersSuccess.do?order_id=" + order_id);
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}
	}

	@RequestMapping(value = "/orders/ordersForm.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ordersForm(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mav) throws Exception
	{
		String contextPath = request.getContextPath();
		MemberDTO memberDTO = null;
		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			Map<String, Object> cartMap = new HashMap<String, Object>();
			List<CartDTO> listCart = cartServiceImpl.listCart(member_id); // 장바구니 정보 
			int sumMoney = cartServiceImpl.sumMoney(member_id); // 장바구니 전체 금액 호출
			int totalProductCount = 0;
			for (int i = 0; i < listCart.size(); i++)
			{
				totalProductCount = totalProductCount
						+ listCart.get(i).getCart_product_amount();
			}
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(3만원이상 => 무료, 미만 => 2500원)
			int fee = 0;
			if (totalProductCount != 0)
			{
				fee = sumMoney >= 30000 ? 0 : 2500;
			}

			cartMap.put("memberDTO", memberDTO);
			cartMap.put("listCart", listCart);                // 장바구니 정보를 map에 저장
			cartMap.put("cartCount", listCart.size());        // 장바구니 상품의 유무
			cartMap.put("totalProductCount", totalProductCount);
			cartMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			cartMap.put("fee", fee);                 // 배송금액
			cartMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("cartMap", cartMap);            // map 변수 저장
			//4.View
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		mav.setViewName("orders/ordersForm");
		return mav;
	}
}
