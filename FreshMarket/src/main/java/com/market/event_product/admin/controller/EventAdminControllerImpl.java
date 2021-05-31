package com.market.event_product.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.event_product.admin.service.EventProductManageServiceImpl;
import com.market.event_product.dto.EventProductDTO;
import com.market.event_product.dto.EventProductJoinDTO;
import com.market.member.dto.MemberDTO;
import com.market.product.admin.service.CategoryServiceImpl;
import com.market.product.admin.service.ProductManageServiceImpl;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Controller("category")
public class EventAdminControllerImpl
{

	/* private static final String IMG_PATH="c:\\image"; */

	@Autowired
	private EventProductManageServiceImpl eventProductManageServiceImpl;

	@Autowired
	private ProductManageServiceImpl productManageServiceImpl;

	@Autowired
	private CategoryServiceImpl categoryService;

	@RequestMapping(value = "/eventProduct/updateEventProduct.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity updateEventProduct(
			@ModelAttribute EventProductDTO eventProductDTO,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		String contextPath = request.getContextPath();

		int member_id = 0;
		if ((MemberDTO)session.getAttribute("memberDTO") != null)
		{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
			member_id = memberDTO.getMember_id();

			int result = eventProductManageServiceImpl
					.updateEventProduct(eventProductDTO);

			ResponseEntity rse = null;
			String message = "";
			HttpHeaders headers = new HttpHeaders();

			if (result > 0)
			{
				message = "<script>";
				message += " alert('상품변경을 완료 했습니다.');";
				message += " location.href='" + request.getContextPath()
						+ "/eventProduct/eventProductList.do';";
				message += "</script>";
			}
			else
			{
				message = "<script>";
				message += " alert('상품변경을 실패 했습니다.');";
				message += " location.href='" + request.getContextPath()
						+ "/eventProduct/eventProductList.do';";
				message += "</script>";
			}

			headers.add("Content-Type", "text/html; charset=utf-8");
			rse = new ResponseEntity(message, headers, HttpStatus.OK);
			return rse;
		}
		else
		{
			System.out.println("로그인 정보가 없습니다.");
			response.sendRedirect(contextPath + "/member/loginForm.do");
		}

		return null;
	}

	@RequestMapping("/eventProduct/eventProductModify.do")
	public ModelAndView eventModifyForm(ModelAndView mav,
			@ModelAttribute EventProductJoinDTO eventProductJoinDTO,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		eventProductJoinDTO = eventProductManageServiceImpl
				.getEventProductJoinDTO(eventProductJoinDTO);

		mav.addObject("eventProductJoinDTO", eventProductJoinDTO);
		mav.setViewName("eventProduct/eventProductModify");
		return mav;
	}

	@RequestMapping("/eventProduct/eventProductManage.do")
	public String eventForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		List<MainCategoryDTO> mainCategoryDTO = new ArrayList<MainCategoryDTO>();
		mainCategoryDTO = categoryService.getMainCategory();
		request.setAttribute("mainCategory", mainCategoryDTO);

		return "eventProduct/eventProductManage";
	}

	@RequestMapping(value = "/eventProduct/eventProductList.do", method =
	{RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventProductList(ModelAndView mav,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception
	{
		MemberDTO memberDTO = null;

		memberDTO = (MemberDTO)session.getAttribute("memberDTO");
		List<EventProductJoinDTO> eventProductList = eventProductManageServiceImpl
				.eventProductList();

		mav.addObject("memberDTO", memberDTO);
		mav.addObject("eventProductList", eventProductList);
		mav.setViewName("eventProduct/eventProductList");
		return mav;
	}

	@RequestMapping(value = "/eventProduct/eventProductCreate.do", method = RequestMethod.POST)
	public ResponseEntity eventProductCreate(HttpServletRequest request,
			@RequestParam(value = "product_id", required = false) int product_id,
			@RequestParam(value = "event_product_name", required = false) String event_product_name,
			@RequestParam(value = "product_fixed_price", required = false) int product_fixed_price,
			@RequestParam(value = "event_product_sale", required = false) Double event_product_sale,
			@RequestParam(value = "is_plus", required = false) int is_plus,
			@RequestParam(value = "event_product_price", required = false) int event_product_price,
			@RequestParam(value = "is_locked", required = false) int is_locked)
			throws Exception
	{

		EventProductDTO eventProductDTO = new EventProductDTO();

		eventProductDTO.setProduct_id(product_id);
		//		ProductDTO productDTO = productManageServiceImpl.productSelecst(Integer.toString(product_id));
		eventProductDTO.setEvent_product_name(event_product_name);
		eventProductDTO.setProduct_fixed_price(product_fixed_price);
		eventProductDTO.setEvent_product_sale(event_product_sale);
		eventProductDTO.setIs_plus(is_plus);
		eventProductDTO.setEvent_product_price(event_product_price);
		eventProductDTO.setIs_locked(is_locked);

		int result = eventProductManageServiceImpl
				.eventProductCreate(eventProductDTO);

		/* mtfRequest.setCharacterEncoding("utf-8");//인코딩 설정 */ /*- ajax로 보낼 경우
																@RequestParam(value="arr[]" String[] arr)
																requsest.getParameterValues
																- get 또는 post로 보낼 경우
																@RequestParam(value="arr" String[] arr)
																! 주의 해야 한다.
																*/

		/* String event_product_detail_path = "\\productDetail\\"; String
		 * event_product_img_path = "\\productPreview\\"; String
		 * event_product_list_img_path="\\productList\\"+pprt.getMiddle_id()+"\\";
		 * String realDetailPath = IMG_PATH+event_product_detail_path; String
		 * realImgPath = IMG_PATH+event_product_img_path; String realListImgPath =
		 * IMG_PATH+event_product_list_img_path; */

		//삭제할 파일명 DB데이터 정리
		/* String event_product_detail_name =
		 * (String)productImages.get("event_product_detail_name"); String
		 * event_product_img_name = (String)productImages.get("event_product_img_name");
		 * String event_product_list_img_name =
		 * (String)productImages.get("event_product_list_img_name"); */

		/* MultipartFile imgmf = mtfRequest.getFile("event_product_img"); //상품이미지 파일 */

		//기존 이미지 삭제 
		/* if(!imgmf.isEmpty()) {
		 * 
		 * //기존 파일명이 DB에 존재하는경우 파일 삭제 진행
		 * if(!event_product_img_name.eq)uals("")&&event_product_img_name!=null) { String
		 * savedFile = realImgPath+event_product_img_name; File imgFile = new
		 * File(savedFile); //기존 이미지파일
		 * 
		 * String savedListFile = realListImgPath+event_product_list_img_name; File
		 * imgListFile = new File(savedListFile); //기존 이미지리스트파일
		 * 
		 * imgFile.delete(); imgListFile.delete(); }
		 * 
		 * String originFileName = imgmf.getOriginalFilename(); //원본파일명 받아오기 long
		 * fileSize = imgmf.getSize(); //파일사이즈
		 * 
		 * String imgSavingName = System.currentTimeMillis()+originFileName; String
		 * reSaveFile = realImgPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리 String
		 * reSaveListFile = realListImgPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
		 * //해당 경로와 이름으로 저장된다. try { File reImgFile = new File(reSaveFile); File
		 * reImgListFile = new File(reSaveListFile); imgmf.transferTo(reImgFile); //파일생성
		 * FileCopyUtils.copy(reImgFile,reImgListFile); event_product_img_name =
		 * imgSavingName; event_product_list_img_name = imgSavingName;
		 * }catch(IllegalStateException e) { e.printStackTrace(); }catch(IOException e)
		 * { e.printStackTrace(); }
		 * 
		 * }
		 * 
		 * //디테일 이미지 삭제 String[] detailNames = event_product_detail_name.split(",");
		 * if(deleteDetailIndex!=null) {
		 * System.out.println("삭제번호"+deleteDetailIndex[0]); for(int i=0;
		 * i<deleteDetailIndex.length;i++) { if(deleteDetailIndex[i]<detailNames.length)
		 * { int dd=deleteDetailIndex[i]; File deleteDetailFile = new
		 * File(realDetailPath+detailNames[dd]); if(deleteDetailFile.delete()) {
		 * detailNames[dd]=""; //삭제할 파일명 공백으로 처리 } } } }
		 * 
		 * List<MultipartFile> mfList = mtfRequest.getFiles("event_product_detailImg");
		 * 
		 * 
		 * //상세 이미지 파일 생성 (물리적) int j=0; String addProduct_detail_name="";
		 * 
		 * for(int i=0;i<mfList.size();i++) { MultipartFile mf = mfList.get(i);
		 * if(!mf.isEmpty()) { String originFileName = mf.getOriginalFilename(); //원본파일명
		 * 받아오기 System.out.println("originFileName"+originFileName); long fileSize =
		 * mf.getSize(); //파일사이즈
		 * 
		 * String imgSavingName = System.currentTimeMillis()+originFileName;
		 * System.out.println("imgSavingName : "+imgSavingName);
		 * System.out.println(i+"번째 생성"); String saveFile =
		 * realDetailPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리 //해당 경로와 이름으로
		 * 저장된다. try { mf.transferTo(new File(saveFile)); //파일생성
		 * while(j<changeDetailIndex.length) {
		 * if(changeDetailIndex[j]<detailNames.length) { int cd = changeDetailIndex[j];
		 * System.out.println(cd +" : "+detailNames.length); File changeDetailFile = new
		 * File(realDetailPath+detailNames[cd]);
		 * System.out.println(changeDetailFile.delete()); detailNames[cd]=imgSavingName;
		 * //파일명 바꾸기
		 * 
		 * }else { if(i==(mfList.size()-1)) { addProduct_detail_name += imgSavingName;
		 * }else { addProduct_detail_name += imgSavingName+","; } } j++; break; }
		 * 
		 * 
		 * }catch(IllegalStateException e) { e.printStackTrace(); }catch(IOException e)
		 * { e.printStackTrace(); } } }
		 * System.out.println("중간 addProduct_detail_name"+addProduct_detail_name);
		 * event_product_detail_name=""; for(int i =0;i<detailNames.length;i++) {
		 * if(!(detailNames[i].isEmpty()||"".equals(detailNames[i]))) { //해당 배열의 문자열이
		 * 공백이 아닌경우만 if(i==detailNames.length-1) {
		 * event_product_detail_name+=detailNames[i]; }else {
		 * event_product_detail_name+=detailNames[i]+","; } } }
		 * System.out.println("중간 product_detial_name"+event_product_detail_name);
		 * if(!(addProduct_detail_name.isEmpty()||"".equals(addProduct_detail_name))) {
		 * event_product_detail_name += ","+addProduct_detail_name; }
		 * 
		 * 
		 * System.out.println(event_product_detail_name);
		 * 
		 * eprt.setEvent_product_detail_path(event_product_detail_path);
		 * eprt.setEvent_product_detail_name(event_product_detail_name);
		 * eprt.setEvent_product_img_name(event_product_img_name);
		 * eprt.setEvent_product_img_path(event_product_img_path); */

		ResponseEntity rse = null;
		String message = "";
		HttpHeaders headers = new HttpHeaders();

		if (result > 0)
		{
			message = "<script>";
			message += " alert('상품등록을 완료 했습니다.');";
			message += " location.href='" + request.getContextPath()
					+ "/eventProduct/eventProductManage.do';";
			message += "</script>";
		}
		else
		{
			message = "<script>";
			message += " alert('상품등록을 실패 했습니다.');";
			message += " location.href='" + request.getContextPath()
					+ "/eventProduct/eventProductManage.do';";
			message += "</script>";
		}

		headers.add("Content-Type", "text/html; charset=utf-8");
		rse = new ResponseEntity(message, headers, HttpStatus.OK);
		return rse;
	}

	//중분류카테고리 보이기  
	@RequestMapping("/eventProduct/middleCategory")
	public @ResponseBody JSONArray middleCategory(
			@RequestParam(value = "mainId", required = false) int mainId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		System.out.println("maind id= " + request.getParameter("mainId"));
		List<MiddleCategoryDTO> middle = new ArrayList<MiddleCategoryDTO>();
		JSONArray jArray = new JSONArray(); //json 배열
		middle = categoryService.getMiddleCategory(mainId);
		try
		{
			for (int i = 0; i < middle.size(); i++)
			{
				JSONObject jObject = new JSONObject();
				jObject.put("middle_id", middle.get(i).getMiddle_id());
				jObject.put("middle_name2", middle.get(i).getMiddle_name());
				jArray.add(jObject);
			}
		}
		catch (JSONException e)
		{
			e.printStackTrace();
		}
		System.out.println(jArray.toString());
		return jArray;

	}
	//상품 카테고리 보이기  
	@RequestMapping("/eventProduct/eventProductCategory")
	public @ResponseBody JSONArray productCategory(
			@RequestParam(value = "middleId", required = false) int middleId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{

		System.out.println("maind id= " + request.getParameter("middleId"));
		List<ProductDTO> Product = new ArrayList<ProductDTO>();
		JSONArray jArray = new JSONArray(); //json 배열
		Product = categoryService.getProductCategory(middleId);
		try
		{
			for (int i = 0; i < Product.size(); i++)
			{
				JSONObject jObject = new JSONObject();
				jObject.put("product_id", Product.get(i).getProduct_id());
				jObject.put("product_name", Product.get(i).getProduct_name());
				jArray.add(jObject);
			}
		}
		catch (JSONException e)
		{
			e.printStackTrace();
		}
		System.out.println(jArray.toString());
		return jArray;
	}

	/* @RequestMapping(value = "/eventProduct/eventProductRegist.do", method = RequestMethod.POST)
	 * public ModelAndView eventProductRegist(ProductDTO prt,
	 * MultipartHttpServletRequest mtfRequest) throws Exception
	 * {
	 * mtfRequest.setCharacterEncoding("utf-8");
	 * 
	 * prt.setProduct_price(prt.getProduct_fixed_price()); */

	/* MultipartFile imgmf = mtfRequest.getFile("eventProduct_img");
	 * List<MultipartFile> mfList2 = mtfRequest.getFiles("eventProduct_detailImg"); */
	/* String event_product_img_path=""; String event_product_img_name=""; String
	 * event_product_detail_path=""; String event_product_detail_name=""; String
	 * event_product_list_img_path=""; String event_product_list_img_name=""; */

	/* int autoEventProductId = 0;
	 * autoEventProductId = eventProductManageServiceImpl.autoEventProductId(); //현재 autoIncresed값 받아오기 */ /* event_product_img_path = "\\eproductPreview\\"; //DB경로
																											 * event_product_list_img_path="\\eventProductList\\"+prt.getMiddle_id()+"\\";
																											 * String realImgPath = IMG_PATH+event_product_img_path; String realListImgPath
																											 * = IMG_PATH+event_product_list_img_path; */
	//디렉토리 만드는 과정 
	/* File imgDir = new File(realImgPath);
	 * 
	 * if(!imgDir.exists()) {
	 * 
	 * try{imgDir.mkdirs(); //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더 생성O
	 * System.out.println("imgDir폴더생성"); }catch(Exception e) { e.getStackTrace(); }
	 * } File imgListDir = new File(realListImgPath); if(!imgListDir.exists()) {
	 * try{imgListDir.mkdirs(); //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더
	 * 생성O System.out.println("imgDir폴더생성"); }catch(Exception e) {
	 * e.getStackTrace(); } } */
	// 실제 파일 저장과정
	/* if(!imgmf.isEmpty()) { String originFileName = imgmf.getOriginalFilename();
	 * //원본파일명 받아오기 long fileSize = imgmf.getSize(); //파일사이즈
	 * 
	 * String imgSavingName = System.currentTimeMillis()+originFileName; String
	 * saveFile = realImgPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리 String
	 * saveListFile = realListImgPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
	 * //해당 경로와 이름으로 저장된다. try { File imgFile = new File(saveFile); //product_img 파일
	 * File imgListFile = new File(saveListFile); imgmf.transferTo(imgFile); //파일생성
	 * FileCopyUtils.copy(imgFile,imgListFile); // 파일 복제 (스프링프레임웍에서 작동)
	 * event_product_img_name = imgSavingName; event_product_list_img_name =
	 * imgSavingName; }catch(IllegalStateException e) { e.printStackTrace();
	 * }catch(IOException e) { e.printStackTrace(); } } */
	/* event_product_detail_path = "\\eproductDetail\\"; String realDetailPath =
	 * IMG_PATH+event_product_detail_path; File detailDir = new
	 * File(realDetailPath); if(!detailDir.exists()) { try{detailDir.mkdirs();
	 * //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더 생성O
	 * System.out.println("detailDir폴더생성"); }catch(Exception e) { e.getStackTrace();
	 * } } */

	/* for(int i=0;i<mfList2.size();i++) { MultipartFile mf = mfList2.get(i); String
	 * originFileName = mf.getOriginalFilename(); //원본파일명 받아오기 long fileSize =
	 * mf.getSize(); //파일사이즈 String imgSavingName =
	 * System.currentTimeMillis()+originFileName; String saveFile =
	 * realDetailPath+imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리 //해당 경로와 이름으로
	 * 저장된다. try { mf.transferTo(new File(saveFile)); //파일생성 if(i==mfList2.size()-1)
	 * { event_product_detail_name += imgSavingName; //마지막은 쉼표 x이름 누적시키기 }else {
	 * event_product_detail_name += imgSavingName+","; }
	 * }catch(IllegalStateException e) { e.printStackTrace(); }catch(IOException e)
	 * { e.printStackTrace(); } } */
	/* prt.setEvent_product_img_path(event_product_img_path);
	 * prt.setEvent_product_img_name(event_product_img_name);
	 * prt.setEvent_product_detail_path(event_product_detail_path);
	 * prt.setEvent_product_detail_name(event_product_detail_name);
	 * prt.setEvent_product_list_img_path(event_product_list_img_path);
	 * prt.setEvent_product_list_img_name(event_product_list_img_name);
	 * eventProductManageServiceImpl.eventProductRegist(eprt); */
	/* ModelAndView mv = new ModelAndView();
	 * mv.setViewName("redirect:/eventProduct/eventProductManage.do");
	 * return mv;
	 * 
	 * } */

	/* @RequestMapping(value = "/eventProduct/eventProductSelect.do", method = RequestMethod.GET)
	 * public @ResponseBody JSONObject productSelect(
	 * 
	 * @RequestParam(value = "product_id") String product_id,
	 * HttpServletRequest request, HttpServletResponse Response)
	 * throws Exception
	 * {
	 * 
	 * ProductDTO prt = productManageServiceImpl.productSelecst(product_id);
	 * System.out.println(prt);
	 * JSONObject json = new JSONObject();
	 * try
	 * {
	 * json.put("product_id", prt.getProduct_id());
	 * json.put("main_id", prt.getMain_id());
	 * json.put("middle_id", prt.getMiddle_id());
	 * json.put("product_name", prt.getProduct_name());
	 * json.put("product_fixed_price", prt.getProduct_fixed_price());
	 * json.put("product_price", prt.getProduct_price());
	 * json.put("product_img_path", prt.getProduct_img_path());
	 * json.put("product_img_name", prt.getProduct_img_name());
	 * json.put("product_detail_path", prt.getProduct_detail_path());
	 * json.put("product_detail_name", prt.getProduct_detail_name());
	 * json.put("product_list_img_path", prt.getProduct_list_img_path());
	 * json.put("product_list_img_name", prt.getProduct_list_img_name());
	 * json.put("is_locked", prt.getIs_locked());
	 * System.out.println(json);
	 * }
	 * catch (Exception e)
	 * {
	 * e.printStackTrace();
	 * }
	 * return json;
	 * } */
}
