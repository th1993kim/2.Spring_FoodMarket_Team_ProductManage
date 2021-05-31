package com.market.qnaboard.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;


public interface QnaBoardController {
	
	//접근제어자 리턴유형  함수명(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 글 조회
	public ModelAndView getQnaBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 작성 폼 보여주기
	public ModelAndView writeQnaForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 글 작성하기
	public ModelAndView writeQnaBoard(QnaBoardDTO qnaDto,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 글 수정폼 보여주기
	public ModelAndView modifyQnaForm(@RequestParam("qa_id") String qa_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 글 수정하기
	public ModelAndView modifyQnaBoard(QnaBoardDTO qnaDto ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//문의 글 삭제
	public ModelAndView deleteQnaBoard(@RequestParam("qa_id") String qa_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//답글 작성 폼 보여주기
	public ModelAndView writeCommentForm(@RequestParam("qa_id") String qa_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//답글 작성하기
	public ModelAndView writeCommentBoard(QnaBoardCommentDTO qnaCommentDto,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	     
}






