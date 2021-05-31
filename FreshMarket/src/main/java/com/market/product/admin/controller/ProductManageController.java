package com.market.product.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface ProductManageController {
	
	public String productManage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody JSONObject mainCategoryInsert(@RequestParam(value="mainCategoryInsert",required=false)String mainCategoryInsert,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody JSONArray middleCategory(@RequestParam(value="mainId",required=false)int mainId,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
	