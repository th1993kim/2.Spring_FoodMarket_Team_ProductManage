package com.market.qnaboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.qnaboard.dto.PagingDTO;
import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;
import com.market.qnaboard.service.QnaBoardServiceImpl;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Controller("qnaController")
public class QnaBoardControllerImpl {

	// field
	@Autowired
	private QnaBoardServiceImpl qnaService;

	@Autowired
	private QnaBoardDTO qnaDTO;

	@Autowired
	private QnaBoardCommentDTO qnaCommentDTO;

	// 확인방법 http://localhost/market/qna/qnaList.do
	// 특정범위(paging) 문의 글 조회& 답글 조회
	// @Override
	@RequestMapping(value = "/qna/qnaList.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView getQnaBoard(PagingDTO pageDTO, @RequestParam(value="currentPage", required=false)String strCurrentPage, 
									@RequestParam("product_id") int product_id,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qnaCount = qnaService.getQnaPage(product_id);
		
		int currentPage = 1;
		if(strCurrentPage!=null) {
			currentPage = Integer.parseInt(strCurrentPage);
		}
		
		pageDTO = new PagingDTO(qnaCount, currentPage);
		pageDTO.setProduct_id(product_id);
		List<QnaBoardDTO> qnaList = qnaService.getQnaBoard(pageDTO);
		List<QnaBoardCommentDTO> qnaCommentList = qnaService.getQnaCommentBoard();
		System.out.println(pageDTO);
		ModelAndView mv = new ModelAndView("qna/qnaList");
		
		for(QnaBoardDTO qnaBoardDTO :qnaList) {
			System.out.println("qnaBoardDTO"+qnaBoardDTO);
		}
		
		for(QnaBoardCommentDTO qnaBoardCommentDTO :qnaCommentList) {
			System.out.println("qnaBoardDTOComment"+qnaBoardCommentDTO);
		}
		
		
		mv.addObject("paging", pageDTO);	//페이지
		mv.addObject("qnaList", qnaList);	//문의 글
		mv.addObject("qnaCommentList", qnaCommentList);	//문의 답글

		// 4.View
		return mv;
	}

	// 문의 글 작성
	// 확인방법 http://localhost/market/qna/writeQna.do
	// @Override
	@RequestMapping(value="/qna/writeQna.do", method = RequestMethod.POST)
	public @ResponseBody JSONObject writeQnaBoard(QnaBoardDTO qnaDto, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		int result = qnaService.writeQnaBoard(qnaDto);
		System.out.println("result : " + result);	//확인용
		
		JSONObject json = new JSONObject(); 
		json.put("result", result);
		return json;
		
	}

	// 문의 글 수정폼 보여주기
	// 확인방법 http://localhost/market/qna/modifyForm.do
	// @Override
	@RequestMapping(value="/qna/modifyForm.do", method = RequestMethod.POST)
	public @ResponseBody JSONObject modifyQnaForm(@RequestParam("qa_id") String qa_id, HttpServletRequest request,
											HttpServletResponse response) throws Exception {
		QnaBoardDTO qna = qnaService.modifyForm(qa_id);	//작성했던 글 가져오기

		JSONObject json = new JSONObject(); 
		  try{ 
			  json.put("content", qna.getContent()); 
			  json.put("email", qna.getEmail());
			  json.put("qa_id", qna.getQa_id());
			  json.put("is_locked", qna.getIs_locked());
			  System.out.println(json);		//확인용
		  }catch(JSONException e){
			  e.printStackTrace(); 
		  }
		return json;
	}

	// 문의 글 수정하기
	// 확인방법 http://localhost/market/qna/modifyQna.do
	// @Override
	@RequestMapping(value="/qna/modifyQna.do", method = RequestMethod.POST)
	public void modifyQnaBoard(QnaBoardDTO qnaDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = qnaService.modifyQnaBoard(qnaDto);
		System.out.println("문의글 수정 결과? "+result); //확인용

	}

	// 문의 글 삭제
	// @Override
	@RequestMapping("/qna/deleteQna.do")
	public ModelAndView deleteQnaBoard(@RequestParam("qa_id") String qa_id,@RequestParam(value="currentPage", required=false)String currentPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = qnaService.deleteQnaBoard(qa_id);
		/*
		 * ModelAndView mv = new
		 * ModelAndView("redirect:/qna/qnaList.do?currentPage="+currentPage);
		 */
		return null;
	}

	/*
	 * // 답글 작성 폼 보여주기 // 확인방법 http://localhost/market/qna/writeCommentForm.do
	 * // @Override
	 * 
	 * @RequestMapping("/qna/writeCommentForm.do") public ModelAndView
	 * writeCommentForm(@RequestParam("qa_id") String qa_id, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception {
	 * 
	 * QnaBoardDTO qna = qnaService.modifyForm(qa_id);
	 * 
	 * ModelAndView mv = new ModelAndView("qna/wirteCommentForm");
	 * mv.addObject("qna", qna);// 답글할 문의 글 return mv; }
	 */

	
	//답글 작성하기 //확인방법 http://localhost/market/qna/writeComment.do 
	//@Override
	@RequestMapping(value="/qna/writeComment.do", method = RequestMethod.POST)
	public void writeCommentBoard(QnaBoardCommentDTO qnaCommentDto,HttpServletRequest request, HttpServletResponse response) throws Exception {
  
		int i = qnaService.writeCommentBoard(qnaCommentDto);
		
  }
	

	// 문의 글 수정폼 보여주기
	// 확인방법 http://localhost/market/qna/modifyCommentForm.do
	// @Override
	/*
	 * @RequestMapping("/qna/modifyCommentForm.do") public ModelAndView
	 * modifyCommentForm(@RequestParam("qa_comment_id") String qa_comment_id,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * 
	 * QnaBoardCommentDTO qnaComment = qnaService.modifyCommentForm(qa_comment_id);
	 * 
	 * ModelAndView mv = new ModelAndView("qna/modifyCommentForm");
	 * mv.addObject("qnaComment", qnaComment);// 작성한 글 return mv; }
	 */

	
	// 답글 삭제
	// 확인방법 http://localhost/market/qna/deleteComment.do
	// @Override
	@RequestMapping("/qna/deleteComment.do")
	public ModelAndView deleteCommentBoard(@RequestParam("qa_comment_id") String qa_comment_id,@RequestParam(value="currentPage", required=false)String currentPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int result = qnaService.deleteCommentBoard(qa_comment_id);

		/*
		 * ModelAndView mv = new
		 * ModelAndView("redirect:/qna/qnaList.do?currentPage="+currentPage); return mv;
		 */
		return null;
	}
		
	// 답글 수정하기
	// 확인방법 http://localhost/market/qna/modifyComment.do
	// @Override
	@RequestMapping(value="/qna/modifyComment.do", method = RequestMethod.POST)
	public @ResponseBody JSONObject modifyCommentBoard(QnaBoardCommentDTO qnaCommentDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = qnaService.modifyCommentBoard(qnaCommentDto);
		System.out.println("답글 수정 컨트롤러 확인! 수정되었나?"+result);	//확인용

		QnaBoardCommentDTO qnaComment = qnaService.getCommentOne(qnaCommentDto);
		
		System.out.println("수정코멘트 확인"+qnaComment);
		
		  JSONObject json = new JSONObject(); 
		  try{ 
			  json.put("cmtContent", qnaComment.getContent());
			  json.put("qa_comment_id", qnaComment.getQa_comment_id()); 
			  System.out.println(json.get("cmtContent"));
			  System.out.println(json.get("qa_comment_id")); 
		  }catch(JSONException e){
			  e.printStackTrace(); 
		  }
		  
		 return json;
	}

}
