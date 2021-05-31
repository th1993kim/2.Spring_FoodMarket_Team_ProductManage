package com.market.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.sales.dto.SalesDTO;
import com.market.sales.service.SalesServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Controller("salesController")
public class SalesControllerImpl {

	// field
	@Autowired
	private SalesServiceImpl salesService;

	@Autowired
	private SalesDTO salesDTO;

	// 확인방법 http://localhost/market/sales/salesList.do
	// 일별 매출내역 
	// @Override
	@RequestMapping(value = "/sales/salesList.do")
	public ModelAndView getDaily(HttpServletRequest request,HttpServletResponse response) throws Exception {

		List<SalesDTO> daily = salesService.daily();
		
		//합계 구하기
		Map<String, Object> dailyMap = new HashMap<String, Object>();
		int day_ordering_count = 0;		//일일주문건수
		int day_selling_count = 0;		//일일판매수량
		int day_selling_amount = 0;		//일일판매금액
		int day_discount_amount = 0;	 //일일할인금액
		int day_payment_total = 0;		//결제합계
		int day_refund_total = 0;		//환불합계
		int day_net_sales = 0;			//순매출
		
		for(int i=0; i<daily.size();i++) {
			day_ordering_count += daily.get(i).getDay_ordering_count();
			day_selling_count += daily.get(i).getDay_selling_count();
			day_selling_amount += daily.get(i).getDay_selling_amount();
			day_discount_amount += daily.get(i).getDay_discount_amount();
			day_payment_total += daily.get(i).getDay_payment_total();
			day_refund_total += daily.get(i).getDay_refund_total();
			day_net_sales += daily.get(i).getDay_net_sales();
		}
		
		dailyMap.put("day_ordering_count", day_ordering_count);
		dailyMap.put("day_selling_count", day_selling_count);
		dailyMap.put("day_selling_amount", day_selling_amount);
		dailyMap.put("day_discount_amount", day_discount_amount);
		dailyMap.put("day_payment_total", day_payment_total);
		dailyMap.put("day_refund_total", day_refund_total);
		dailyMap.put("day_net_sales", day_net_sales);
		
		List<SalesDTO> monthly = salesService.monthly();
		//합계 구하기
		Map<String, Object> monthlyMap = new HashMap<String, Object>();
		int month_ordering_count = 0;		//일일주문건수
		int month_selling_count = 0;		//일일판매수량
		int month_selling_amount = 0;		//일일판매금액
		int month_discount_amount = 0;	 //일일할인금액
		int month_payment_total = 0;		//결제합계
		int month_refund_total = 0;		//환불합계
		int month_net_sales = 0;			//순매출
		
		for(int i=0; i<monthly.size();i++) {
			month_ordering_count += monthly.get(i).getDay_ordering_count();
			month_selling_count += monthly.get(i).getDay_selling_count();
			month_selling_amount += monthly.get(i).getDay_selling_amount();
			month_discount_amount += monthly.get(i).getDay_discount_amount();
			month_payment_total += monthly.get(i).getDay_payment_total();
			month_refund_total += monthly.get(i).getDay_refund_total();
			month_net_sales += monthly.get(i).getDay_net_sales();
		}
		
		monthlyMap.put("day_ordering_count", month_ordering_count);
		monthlyMap.put("day_selling_count", month_selling_count);
		monthlyMap.put("day_selling_amount", month_selling_amount);
		monthlyMap.put("day_discount_amount", month_discount_amount);
		monthlyMap.put("day_payment_total", month_payment_total);
		monthlyMap.put("day_refund_total", month_refund_total);
		monthlyMap.put("day_net_sales", month_net_sales);
		
		
		ModelAndView mv = new ModelAndView("sales/salesChart");
		mv.addObject("monthly", monthly); //월별 매출
		mv.addObject("dailyMap", dailyMap);
		mv.addObject("daily", daily); //일별 매출
		mv.addObject("monthlyMap", monthlyMap); //일별 매출

		// 4.View
		return mv;
	}
	
	//일일 특정기간 조회 
	@RequestMapping(value = "/sales/select.do", method = RequestMethod.POST)
	public  @ResponseBody JSONArray dailySelect(@RequestParam(value="startDay")String startDay,@RequestParam(value="endDay")String endDay,
										HttpServletRequest request,HttpServletResponse response) throws Exception {

		//@ResponseBody JSONArray
		
		Map<String,Object> period = new HashMap<String,Object>();
		period.put("startDay", startDay);
		period.put("endDay", endDay);
		
		List<SalesDTO> dailyPeriod = salesService.dailyPeriod(period);
		System.out.println("잘 가져오는지!"+dailyPeriod); 	//확인용
		
		  JSONArray jArray = new JSONArray();
		  
		  try {
		  
			  JSONObject json = new JSONObject();//배열 내에 들어갈 json
			  
			  for (int i = 0; i < dailyPeriod.size(); i++){
				  json.put("days",dailyPeriod.get(i).getDays());
				  json.put("day_ordering_count", dailyPeriod.get(i).getDay_ordering_count());
				  json.put("day_selling_count", dailyPeriod.get(i).getDay_selling_count());
				  json.put("day_selling_amount", dailyPeriod.get(i).getDay_selling_amount());
				  json.put("day_discount_amount", dailyPeriod.get(i).getDay_discount_amount());
				  json.put("day_payment_total", dailyPeriod.get(i).getDay_payment_total());
				  json.put("day_refund_total", dailyPeriod.get(i).getDay_refund_total());
				  json.put("day_net_sales", dailyPeriod.get(i).getDay_net_sales());
				  
				  jArray.add(i,json); 
			  }
			  
			  System.out.println(jArray.toString());	//확인용
		  
		  } catch (JSONException e) { e.printStackTrace(); }
		 

		// 4.View
		return jArray;
	}
	//월별 특정기간 조회 
		@RequestMapping(value = "/sales/monthlySelect.do", method = RequestMethod.POST)
		public  @ResponseBody JSONArray monthlySelect(@RequestParam(value="startDay")String startDay,@RequestParam(value="endDay")String endDay,
											HttpServletRequest request,HttpServletResponse response) throws Exception {

			//@ResponseBody JSONArray
			Map<String,Object> period = new HashMap<String,Object>();
			period.put("startDay", startDay);
			period.put("endDay", endDay);
			
			//System.out.println("잘 가져오는지!"+startDay+endDay); 	//확인용
			
			List<SalesDTO> monthlyPeriod = salesService.monthlyPeriod(period);
			
			JSONArray jArray = new JSONArray();
			  
			  try {
			  
				  JSONObject json = new JSONObject();//배열 내에 들어갈 json
				  
				  for (int i = 0; i < monthlyPeriod.size(); i++){
					  json.put("month",monthlyPeriod.get(i).getMonthly());
					  json.put("day_ordering_count", monthlyPeriod.get(i).getDay_ordering_count());
					  json.put("day_selling_count", monthlyPeriod.get(i).getDay_selling_count());
					  json.put("day_selling_amount", monthlyPeriod.get(i).getDay_selling_amount());
					  json.put("day_discount_amount", monthlyPeriod.get(i).getDay_discount_amount());
					  json.put("day_payment_total", monthlyPeriod.get(i).getDay_payment_total());
					  json.put("day_refund_total", monthlyPeriod.get(i).getDay_refund_total());
					  json.put("day_net_sales", monthlyPeriod.get(i).getDay_net_sales());
					  
					  jArray.add(i,json); 
				  }
				  
				  System.out.println(jArray.toString());	//확인용
				  
			  } catch (JSONException e) { e.printStackTrace(); }

			// 4.View
			return jArray;
		}
			

}
