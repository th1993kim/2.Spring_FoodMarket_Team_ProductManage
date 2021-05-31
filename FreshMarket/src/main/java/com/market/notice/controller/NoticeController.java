package com.market.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.notice.dto.NoticeDTO;

public interface NoticeController {

	//공지리스트
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//공지글폼 보여주기
	public String writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//공지글쓰기
	public ModelAndView writeNotice(
			@ModelAttribute("info") NoticeDTO noticeDTO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	//공지조회
	public ModelAndView getNoticeDetail(@RequestParam("notice_id")int notice_id,HttpServletRequest request, HttpServletResponse response, ModelAndView mv
			) throws Exception ;
	
	//공지삭제
	public ModelAndView deleteNotice(
			@RequestParam("notice_Id") String notice_id,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	

	
	
	
}
