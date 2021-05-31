package com.market.product.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.market.product.admin.service.CategoryServiceImpl;
import com.market.product.admin.service.ProductManageServiceImpl;
import com.market.product.dto.MainCategoryDTO;
import com.market.product.dto.MiddleCategoryDTO;
import com.market.product.dto.ProductDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
@Controller("productManageControllerImpl")
public class ProductManageControllerImpl
{

	private static final String IMG_PATH = "c:\\image";
	private static final String DB_IMG_PATH = "/local_img";

	@Autowired
	private CategoryServiceImpl categoryService;

	@Autowired
	private ProductManageServiceImpl productManageServiceImpl;

	//상품관리  보여주기
	@RequestMapping("/manage/productManage.do")
	public String productManage(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{

		List<MainCategoryDTO> mainCategory = new ArrayList<MainCategoryDTO>();
		mainCategory = categoryService.getMainCategory();

		request.setAttribute("mainCategory", mainCategory);

		return "/manage/productManage";

	}

	//중분류카테고리 보이기  
	@RequestMapping("/manage/middleCategory")
	public @ResponseBody JSONArray middleCategory(
			@RequestParam(value = "mainId", required = false) int mainId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{

		List<MiddleCategoryDTO> middle = new ArrayList<MiddleCategoryDTO>();
		JSONArray jArray = new JSONArray(); //json 배열
		middle = categoryService.getMiddleCategory(mainId);
		try
		{
			for (int i = 0; i < middle.size(); i++)
			{
				JSONObject jObject = new JSONObject();
				jObject.put("middle_id", middle.get(i).getMiddle_id());
				jObject.put("middle_name", middle.get(i).getMiddle_name());
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

	//중분류카테고리 보이기  
	@RequestMapping("/manage/productCategory")
	public @ResponseBody JSONArray productCategory(
			@RequestParam(value = "middleId", required = false) int middleId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{

		System.out.println("maind id= " + request.getParameter("middleId"));
		List<ProductDTO> product = new ArrayList<ProductDTO>();
		JSONArray jArray = new JSONArray(); //json 배열
		product = categoryService.getProductCategory(middleId);
		try
		{
			for (int i = 0; i < product.size(); i++)
			{
				JSONObject jObject = new JSONObject();
				jObject.put("product_id", product.get(i).getProduct_id());
				jObject.put("product_name", product.get(i).getProduct_name());
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

	//대분류 카테고리 추가
	@RequestMapping("/manage/mainCategoryInsert")
	public @ResponseBody JSONObject insertMainCategory(
			@RequestParam(value = "mainCategoryInsert", required = false) String mainCategoryInsert,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		int currval = categoryService.insertMainCategory(mainCategoryInsert);
		JSONObject json = new JSONObject();
		try
		{
			json.put("main_id", currval);
		}
		catch (JSONException e)
		{
			e.printStackTrace();
		}
		return json;
	}

	//중분류 카테고리 추가
	@RequestMapping("/manage/middleCategoryInsert")
	public @ResponseBody JSONObject middleCategoryInsert(
			@RequestParam(value = "middleCategoryInsert", required = false) String middleCategoryInsert,
			@RequestParam(value = "mainCategory", required = false) String mainCategory,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{
		System.out.println(mainCategory);
		System.out.println(middleCategoryInsert);
		int currval = categoryService.insertMiddleCategory(middleCategoryInsert,
				mainCategory);
		JSONObject json = new JSONObject();
		try
		{
			json.put("middle_id", currval);
		}
		catch (JSONException e)
		{
			e.printStackTrace();
		}
		return json;
	}

	//상품등록하기
	@RequestMapping(value = "/manage/productRegist.do", method = RequestMethod.POST)
	public ModelAndView productRegist(ProductDTO prt,
			MultipartHttpServletRequest mtfRequest) throws Exception
	{
		mtfRequest.setCharacterEncoding("utf-8"); //인코딩설정
		prt.setProduct_price(prt.getProduct_fixed_price());

		prt.setProduct_total(0);
		System.out.println(prt);
		MultipartFile imgmf = mtfRequest.getFile("product_img"); //상품이미지 파일
		List<MultipartFile> mfList2 = mtfRequest.getFiles("product_detailImg");
		String product_img_path = "";
		String product_img_name = "";
		String product_detail_path = "";
		String product_detail_name = "";
		String product_list_img_path = "";
		String product_list_img_name = "";

		int autoProductId = 0;
		autoProductId = productManageServiceImpl.autoProductId(); //현재 autoIncresed값 받아오기
		product_img_path = DB_IMG_PATH + "/productPreview/"; //DB경로
		product_list_img_path = DB_IMG_PATH + "/productList/";
		String realImgPath = IMG_PATH + "\\productPreview\\";
		String realListImgPath = IMG_PATH + "\\productList\\"
				+ prt.getMiddle_id() + "\\";
		//디렉토리 만드는 과정 
		File imgDir = new File(realImgPath);
		if (!imgDir.exists())
		{

			try
			{
				imgDir.mkdirs(); //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더 생성O
				System.out.println("imgDir폴더생성");
			}
			catch (Exception e)
			{
				e.getStackTrace();
			}
		}

		File imgListDir = new File(realListImgPath);
		if (!imgListDir.exists())
		{
			try
			{
				imgListDir.mkdirs(); //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더 생성O
				System.out.println("imgDir폴더생성");
			}
			catch (Exception e)
			{
				e.getStackTrace();
			}
		}

		// 실제 파일 저장과정
		if (!imgmf.isEmpty())
		{
			String originFileName = imgmf.getOriginalFilename(); //원본파일명 받아오기
			long fileSize = imgmf.getSize(); //파일사이즈

			String imgSavingName = System.currentTimeMillis() + originFileName;
			String saveFile = realImgPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
			String saveListFile = realListImgPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
			//해당 경로와 이름으로 저장된다.
			try
			{
				File imgFile = new File(saveFile); //product_img 파일
				File imgListFile = new File(saveListFile);
				imgmf.transferTo(imgFile); //파일생성
				FileCopyUtils.copy(imgFile, imgListFile); // 파일 복제  (스프링프레임웍에서 작동)
				product_img_name = imgSavingName;
				product_list_img_name = imgSavingName;
			}
			catch (IllegalStateException e)
			{
				e.printStackTrace();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}

		}

		product_detail_path = DB_IMG_PATH + "/productDetail/";
		String realDetailPath = IMG_PATH + "\\productDetail\\";
		File detailDir = new File(realDetailPath);
		if (!detailDir.exists())
		{
			try
			{
				detailDir.mkdirs(); //mkdir 상위 폴더 없을 경우 생성 X , mkdirs 상위폴더 없을 경우 상위폴더 생성O
				System.out.println("detailDir폴더생성");
			}
			catch (Exception e)
			{
				e.getStackTrace();
			}
		}

		for (int i = 0; i < mfList2.size(); i++)
		{
			MultipartFile mf = mfList2.get(i);
			String originFileName = mf.getOriginalFilename(); //원본파일명 받아오기
			if(!mf.isEmpty()) {
				long fileSize = mf.getSize(); //파일사이즈
				String imgSavingName = System.currentTimeMillis() + i+ originFileName;
				String saveFile = realDetailPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
				//해당 경로와 이름으로 저장된다.
				try
				{
					mf.transferTo(new File(saveFile)); //파일생성
					if (i == mfList2.size() - 1)
					{
						product_detail_name += imgSavingName;	//마지막은 쉼표 x이름 누적시키기
					}
					else
					{
						product_detail_name += imgSavingName + ",";
					}
				}
				catch (IllegalStateException e)
				{
					e.printStackTrace();
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}
		System.out.println("product_detail_name.substring(product_detail_name.length()-1).equals"+product_detail_name.substring(product_detail_name.length()-1));
		if(product_detail_name.substring(product_detail_name.length()-1).equals(",")) {
			product_detail_name=product_detail_name.substring(0,product_detail_name.length()-1);
		}
		prt.setProduct_img_path(product_img_path);
		prt.setProduct_img_name(product_img_name);
		prt.setProduct_detail_path(product_detail_path);
		prt.setProduct_detail_name(product_detail_name);
		prt.setProduct_list_img_path(product_list_img_path);
		prt.setProduct_list_img_name(product_list_img_name);
		productManageServiceImpl.productRegist(prt);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/manage/productManage.do");
		return mv;
	}

	@RequestMapping(value = "/manage/productSelect.do", method = RequestMethod.GET)
	public @ResponseBody JSONObject productSelect(
			@RequestParam(value = "product_id") String product_id,
			HttpServletRequest request, HttpServletResponse Response)
			throws Exception
	{

		ProductDTO prt = productManageServiceImpl.productSelecst(product_id);
		System.out.println(prt);
		JSONObject json = new JSONObject();
		try
		{
			json.put("product_id", prt.getProduct_id());
			json.put("main_id", prt.getMain_id());
			json.put("middle_id", prt.getMiddle_id());
			json.put("product_name", prt.getProduct_name());
			json.put("product_fixed_price", prt.getProduct_fixed_price());
			json.put("product_price", prt.getProduct_price());
			json.put("product_img_path", prt.getProduct_img_path());
			json.put("product_img_name", prt.getProduct_img_name());
			json.put("product_detail_path", prt.getProduct_detail_path());
			json.put("product_detail_name", prt.getProduct_detail_name());
			json.put("product_list_img_path", prt.getProduct_list_img_path());
			json.put("product_list_img_name", prt.getProduct_list_img_name());
			json.put("product_stock", prt.getProduct_stock());
			json.put("product_total", prt.getProduct_total());
			json.put("net_weight_per", prt.getNet_weight_per());
			json.put("net_weight_total", prt.getNet_weight_total());
			json.put("is_locked", prt.getIs_locked());
			System.out.println(json);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return json;
	}

	@RequestMapping(value = "/manage/productChange.do", method = RequestMethod.POST)
	public ResponseEntity productChange(ProductDTO prt,
			@RequestParam(value = "deleteDetailIndex", required = false) int[] deleteDetailIndex,
			@RequestParam(value = "changeDetailIndex", required = false) int[] changeDetailIndex,
			MultipartHttpServletRequest mtfRequest) throws Exception
	{
		mtfRequest.setCharacterEncoding("utf-8");//인코딩 설정
		/*- ajax로 보낼 경우
			@RequestParam(value="arr[]" String[] arr)
			requsest.getParameterValues
			- get 또는 post로 보낼 경우
				@RequestParam(value="arr" String[] arr)
				! 주의 해야 한다.
		 */

		int product_id = prt.getProduct_id();
		String product_img_path = DB_IMG_PATH + "/productPreview/"; //DB경로
		String product_list_img_path = DB_IMG_PATH + "/productList/";
		String product_detail_path = DB_IMG_PATH + "/productDetail/";
		String realImgPath = IMG_PATH + "\\productPreview\\";
		String realListImgPath = IMG_PATH + "\\productList\\"
				+ prt.getMiddle_id() + "\\";;
		String realDetailPath = IMG_PATH + "\\productDetail\\";

		//삭제할 파일명 DB데이터 정리
		Map productImages = productManageServiceImpl
				.getProductImages(product_id);
		String product_detail_name = (String)productImages
				.get("product_detail_name");
		String product_img_name = (String)productImages.get("product_img_name");
		String product_list_img_name = (String)productImages
				.get("product_list_img_name");

		MultipartFile imgmf = mtfRequest.getFile("product_img"); //상품이미지 파일

		//기존 이미지 삭제 
		if (!imgmf.isEmpty())
		{

			//기존 파일명이 DB에 존재하는경우 파일 삭제 진행
			if (!product_img_name.equals("") && product_img_name != null)
			{
				String savedFile = realImgPath + product_img_name;
				File imgFile = new File(savedFile); //기존 이미지파일

				String savedListFile = realListImgPath + product_list_img_name;
				File imgListFile = new File(savedListFile); //기존 이미지리스트파일

				imgFile.delete();
				imgListFile.delete();
			}

			String originFileName = imgmf.getOriginalFilename(); //원본파일명 받아오기
			long fileSize = imgmf.getSize(); //파일사이즈

			String imgSavingName = System.currentTimeMillis() + originFileName;
			String reSaveFile = realImgPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
			String reSaveListFile = realListImgPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
			//해당 경로와 이름으로 저장된다.
			try
			{
				File reImgFile = new File(reSaveFile);
				File reImgListFile = new File(reSaveListFile);
				imgmf.transferTo(reImgFile); //파일생성
				FileCopyUtils.copy(reImgFile, reImgListFile);
				product_img_name = imgSavingName;
				product_list_img_name = imgSavingName;
			}
			catch (IllegalStateException e)
			{
				e.printStackTrace();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}

		}

		//디테일 이미지 삭제
		String[] detailNames = product_detail_name.split(",");
		if (deleteDetailIndex != null)
		{
			System.out.println("삭제번호" + deleteDetailIndex[0]);
			for (int i = 0; i < deleteDetailIndex.length; i++)
			{
				if (deleteDetailIndex[i] < detailNames.length)
				{
					int dd = deleteDetailIndex[i];
					File deleteDetailFile = new File(
							realDetailPath + detailNames[dd]);
					if (deleteDetailFile.delete())
					{
						detailNames[dd] = ""; //삭제할 파일명 공백으로 처리
					}
				}
			}
		}

		List<MultipartFile> mfList = mtfRequest.getFiles("product_detailImg");

		//상세 이미지 파일 생성 (물리적)
		int j = 0;
		String addProduct_detail_name = "";

		for (int i = 0; i < mfList.size(); i++)
		{
			MultipartFile mf = mfList.get(i);
			String originFileName = mf.getOriginalFilename(); //원본파일명 받아오기
			if (!mf.isEmpty())
			{
				System.out.println("originFileName" + originFileName);
				long fileSize = mf.getSize(); //파일사이즈

				String imgSavingName = System.currentTimeMillis()
						+ i+originFileName;
				System.out.println("imgSavingName : " + imgSavingName);
				System.out.println(i + "번째 생성");
				String saveFile = realDetailPath + imgSavingName; //path뒤의 커런트마일즈는 중복 데이터없게 처리
				//해당 경로와 이름으로 저장된다.
				try
				{
					mf.transferTo(new File(saveFile)); //파일생성
					while (j < changeDetailIndex.length)
					{
						if (changeDetailIndex[j] < detailNames.length)
						{
							int cd = changeDetailIndex[j];
							System.out.println(cd + " : " + detailNames.length);
							File changeDetailFile = new File(
									realDetailPath + detailNames[cd]);
							System.out.println(changeDetailFile.delete());
							detailNames[cd] = imgSavingName; //파일명 바꾸기

						}
						else
						{
							if (i == (mfList.size() - 1))
							{
								addProduct_detail_name += imgSavingName;
							}
							else
							{
								addProduct_detail_name += imgSavingName + ",";
							}
						}
						j++;
						break;
					}

				}
				catch (IllegalStateException e)
				{
					e.printStackTrace();
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}
		}
		System.out
				.println("중간 addProduct_detail_name" + addProduct_detail_name);
		product_detail_name = "";
		for (int i = 0; i < detailNames.length; i++)
		{
			if (!(detailNames[i].isEmpty() || "".equals(detailNames[i])))
			{ //해당 배열의 문자열이 공백이 아닌경우만
				if (i == detailNames.length - 1)
				{
					product_detail_name += detailNames[i];
				}
				else
				{
					product_detail_name += detailNames[i] + ",";
				}
			}
		}
		System.out.println("중간 product_detial_name" + product_detail_name);
		if (!(addProduct_detail_name.isEmpty()
				|| "".equals(addProduct_detail_name)))
		{
			product_detail_name += "," + addProduct_detail_name;
		}

		if(product_detail_name.substring(product_detail_name.length()-1).equals(",")) {
			product_detail_name=product_detail_name.substring(0,product_detail_name.length()-1);
		}
		prt.setProduct_detail_path(product_detail_path);
		prt.setProduct_detail_name(product_detail_name);
		prt.setProduct_img_name(product_img_name);
		prt.setProduct_img_path(product_img_path);
		prt.setProduct_price(prt.getProduct_fixed_price());

		int result = productManageServiceImpl.changeProduct(prt);
		ResponseEntity rse = null;
		String message = "";
		HttpHeaders headers = new HttpHeaders();

		if (result > 0)
		{
			message = "<script>";
			message += " alert('상품변경을 완료 했습니다.');";
			message += " location.href='" + mtfRequest.getContextPath()
					+ "/manage/productManage.do';";
			message += "</script>";
		}
		else
		{
			message = "<script>";
			message += " alert('상품변경을 실패 했습니다.');";
			message += " location.href='" + mtfRequest.getContextPath()
					+ "/manage/productManage.do';";
			message += "</script>";
		}

		headers.add("Content-Type", "text/html; charset=utf-8");
		rse = new ResponseEntity(message, headers, HttpStatus.OK);
		return rse;
	}

}
