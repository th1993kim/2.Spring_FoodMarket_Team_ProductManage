package com.market.cart.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.market.cart.dto.CartDTO;
import com.market.cart.service.CartServiceImpl;
import com.market.event_product.dto.EventProductJoinDTO;
import com.market.member.dto.MemberDTO;
import com.market.product.user.dto.UserProductDTO;
import com.market.product.user.service.UserProductServiceImpl;

@Controller
public class CartControllerImpl
{
	//	@Autowired
	private static final String LOCAL_DIR = "/local_img/";

	//field
	@Autowired
	private CartServiceImpl cartServiceImpl;
	@Autowired
	private UserProductServiceImpl userProductServiceImpl;

	public void setProductServiceImpl(CartServiceImpl cartServiceImpl)
	{
		System.out.println("cartServiceImpl() 진입");
		this.cartServiceImpl = cartServiceImpl;
	}

	// 2. 장바구니 목록
	@RequestMapping(value = "/cart/listCart.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listCart(@ModelAttribute CartDTO cartDTO,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response, ModelAndView mav) throws IOException
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
			cartMap.put("listCart", listCart);                // 장바구니 정보를 map에 저장
			cartMap.put("cartCount", listCart.size());        // 장바구니 상품의 유무
			cartMap.put("totalProductCount", totalProductCount);
			cartMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			cartMap.put("fee", fee);                 // 배송금액
			cartMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("cartMap", cartMap);            // map 변수 저장
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		mav.setViewName("cart/cartForm");    // view(jsp)의 이름 저장
		return mav;
	}

	@RequestMapping(value = "/cart/updateInCart.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public void updateInCart(@RequestBody Map<String, Object> params,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();

		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			int product_id = 0;
			int cart_product_amount = 0;
			if (params.get("product_id") != null)
			{
				product_id = Integer
						.parseInt(params.get("product_id").toString());
			}
			if (params.get("cart_product_amount") != null)
			{
				cart_product_amount = Integer
						.parseInt(params.get("cart_product_amount").toString());
			}

			if (params.get("process_status").equals("plus"))
			{
				cartServiceImpl.updatePlusOneAmount(product_id, member_id);

				out.print("updatePlusOneAmount ok");
			}
			else if (params.get("process_status").equals("minus"))
			{
				cartServiceImpl.updateMinusOneAmount(product_id, member_id);

				out.print("updateMinusAmount ok");
			}
			else if (params.get("process_status").equals("input"))
			{
				cartServiceImpl.updateInputAmountCartProduct(product_id,
						member_id, cart_product_amount);

				out.print("updateInputAmount ok");
			}
			else if (params.get("process_status").equals("p-del"))
			{
				cartServiceImpl.updateDelCartProduct(product_id, member_id);

				out.print("updateDelCartProduct ok");
			}
			else
			{

			}
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}
	}

	@RequestMapping(value = "/cart/eventAddCart.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public void eventAddToCart(@ModelAttribute CartDTO cartDTO,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();

		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			cartDTO.setMember_id(memberDTO.getMember_id());

			int event_product_id = cartDTO.getEvent_product_id();
			Map detailUserEventProductMap = userProductServiceImpl
					.detailUserEventProduct(event_product_id);
			EventProductJoinDTO eventProductJoinDTO = (EventProductJoinDTO)detailUserEventProductMap
					.get("eventProductJoinDTO");
			cartDTO.setProduct_name(eventProductJoinDTO.getProduct_name());
			cartDTO.setCart_product_price(
					eventProductJoinDTO.getEvent_product_price());
			cartDTO.setProduct_img_name(
					eventProductJoinDTO.getProduct_img_name());
			cartDTO.setProduct_img_path(
					eventProductJoinDTO.getProduct_img_path());
			// 같은 상품 장바구니 개수 검사
			int count = cartServiceImpl.countCart(cartDTO);
			if (count == 0)
			{
				// 없으면
				cartServiceImpl.insert(cartDTO);
			}
			else
			{
				// 있으면
				cartServiceImpl.updateCart(cartDTO);
			}
			out.write("ok");
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			throw (new Exception("로그인 에러"));
		}
	}

	@RequestMapping(value = "/cart/addCart.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public void addToCart(@ModelAttribute CartDTO cartDTO, HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();

		/* System.out.println(cartDTO); */

		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			cartDTO.setMember_id(memberDTO.getMember_id());

			int product_id = cartDTO.getProduct_id();
			UserProductDTO userProductDTO = (UserProductDTO)userProductServiceImpl
					.detailUserProduct(product_id).get("userProductDTO");
			cartDTO.setProduct_name(userProductDTO.getProduct_name());
			cartDTO.setCart_product_price(userProductDTO.getProduct_price());
			cartDTO.setProduct_img_name(userProductDTO.getProduct_img_name());
			cartDTO.setProduct_img_path(userProductDTO.getProduct_img_path());
			// 같은 상품 장바구니 개수 검사
			int count = cartServiceImpl.countCart(cartDTO);
			if (count == 0)
			{
				// 없으면
				cartServiceImpl.insert(cartDTO);
			}
			else
			{
				// 있으면
				cartServiceImpl.updateCart(cartDTO);
			}
			out.write("ok");
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			throw (new Exception("로그인 에러"));
		}
	}

	@RequestMapping(value = "/cart/cartForm.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detailUserProduct(
			/* @RequestParam("product_id") String product_id, */
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		//1.파라미터받기 - 요청함수의 매개변수String goods_id에 의해 이미 받아진 상태
		//String goods_id= request.getParameter("goods_id");의 효과

		ModelAndView mv = new ModelAndView();
		//		HttpSession session = request.getSession();
		//
		//		Map detailUserProductMap = userProductServiceImpl
		//				.detailUserProduct(product_id);
		//
		//		UserProductDTO userProductDTO = (UserProductDTO)detailUserProductMap
		//				.get("userProductDTO");
		//
		//		String detailProductImage = userProductDTO.getProduct_detail_name();
		//		String[] detailProductImageArray = detailProductImage.split(",");
		//		List<String> detailProductImageList = new ArrayList<String>();
		//		Collections.addAll(detailProductImageList, detailProductImageArray);
		//
		//		//3.Model
		//		mv.addObject("detailProductImageList", detailProductImageList);
		//		mv.addObject("detailUserProductMap", detailUserProductMap);

		//4.View
		mv.setViewName("cart/cartForm");
		return mv;
	}

	//상품목록 보여주기

	//	@RequestMapping(value = "/product/listProduct.do", method =
	//	{RequestMethod.POST, RequestMethod.GET})
	//	public ModelAndView getUserProduct(HttpServletRequest request,
	//			HttpServletResponse response) throws Exception
	//	{
	//		// 참고 controller의 요청함수의 return type이 String이면
	//		// viewResolver에서 설정한 뷰의 prefix와 suffix를 제외한
	//		// 나머지 부분을 String으로 제시하면 된다
	//		// =>기존의 jsp방식과 동일
	//		//1.parameter받기
	//		//2.비즈니스로직수행<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
	//		//3.Model
	//		//4.View
	//
	//		HttpSession session;
	//		ModelAndView mav = new ModelAndView();
	//		//String viewName=(String)request.getAttribute("viewName");
	//		String viewName = "product/listProduct";
	//		mav.setViewName(viewName);
	//
	//		session = request.getSession();
	//		session.setAttribute("side_menu", "user");
	//		Map<String, List<UserProductDTO>> productMap = userProductServiceImpl
	//				.listProduct();
	//		mav.addObject("productMap", productMap);
	//		return mav;
	//
	//	}

	// @RequestMapping(value="/goods/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	// public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,
	// HttpServletRequest request, HttpServletResponse response) throws Exception{
	// response.setContentType("text/html;charset=utf-8");
	// response.setCharacterEncoding("utf-8");
	// //System.out.println(keyword);
	// if(keyword == null || keyword.equals(""))
	// return null ;
	//
	// keyword = keyword.toUpperCase();
	// List<String> keywordList =goodsService.keywordSearch(keyword);
	//
	// // ���� �ϼ��� JSONObject ����(��ü)
	// JSONObject jsonObject = new JSONObject();
	// jsonObject.put("keyword", keywordList);
	//
	// String jsonInfo = jsonObject.toString();
	// // System.out.println(jsonInfo);
	// return jsonInfo ;
	// }

	//	@RequestMapping(value = "/userProduct/searchProduct.do", method = RequestMethod.GET)
	//	public ModelAndView searchUserProduct(
	//
	//			@RequestParam(required = false) String page,
	//
	//			@RequestParam(required = false) String perPageNum,
	//
	//			@RequestParam(required = false) String searchWord,
	//			HttpServletRequest request, HttpServletResponse response)
	//			throws Exception
	//	{
	//		Criteria criteria = new Criteria();
	//
	//		if (page != null)
	//		{
	//			criteria.setPage(Integer.parseInt(page));
	//		}
	//		if (perPageNum != null)
	//		{
	//			criteria.setPerPageNum(Integer.parseInt(perPageNum));
	//		}
	//
	//		int totalCount = userProductServiceImpl.countSearchProduct(searchWord);
	//
	//		PageMaker pageMaker = new PageMaker();
	//		pageMaker.setCriteria(criteria);
	//		pageMaker.setTotalCount(totalCount);
	//
	//		String viewName = "userProduct/listProduct";
	//		List<UserProductDTO> searchUserProductList = userProductServiceImpl
	//				.searchUserProduct(searchWord, criteria);
	//		ModelAndView mav = new ModelAndView(viewName);
	//
	//		mav.addObject("searchUserProductList", searchUserProductList);
	//		mav.addObject("pageMaker", pageMaker);
	//		mav.addObject("searchWord", searchWord);
	//		return mav;
	//	}

	//	@RequestMapping(value = "/userProduct/listProduct.do", method = RequestMethod.GET)
	//	public ModelAndView listUserProduct(
	//
	//			@RequestParam(required = false) String page,
	//
	//			@RequestParam(required = false) String perPageNum,
	//			HttpServletRequest request, HttpServletResponse response)
	//			throws Exception
	//	{
	//		Criteria criteria = new Criteria();
	//
	//		if (page != null)
	//		{
	//			criteria.setPage(Integer.parseInt(page));
	//		}
	//		if (perPageNum != null)
	//		{
	//			criteria.setPerPageNum(Integer.parseInt(perPageNum));
	//		}
	//
	//		int totalCount = userProductServiceImpl.countProduct();
	//
	//		PageMaker pageMaker = new PageMaker();
	//		pageMaker.setCriteria(criteria);
	//		pageMaker.setTotalCount(totalCount);
	//
	//		String viewName = "userProduct/listProduct";
	//		List<UserProductDTO> userProductList = userProductServiceImpl
	//				.listUserProduct(criteria);
	//		ModelAndView mav = new ModelAndView(viewName);
	//
	//		mav.addObject("userProductList", userProductList);
	//		mav.addObject("pageMaker", pageMaker);
	//		return mav;
	//	}
}
