package com.market.notice.controller;

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

import com.market.member.dto.MemberDTO;
import com.market.notice.dto.NoticeDTO;
import com.market.notice.service.NoticeService;

@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController{
	
@Autowired
private NoticeService noticeService;

@Autowired
private NoticeDTO noticeDTO;

//공지사항 리스트
	@Override
	@RequestMapping(value ="/notice/noticeList.do",method =RequestMethod.GET)
	public ModelAndView getNoticeList(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		
			
			
			List<NoticeDTO> noticeList = noticeService.getNoticeList();
					
			ModelAndView mv = new ModelAndView("/notice/noticeList");
			mv.addObject("noticeList", noticeList); //공지 리스트
			System.out.println("noticeList"+noticeList);
			
			return mv;
	}
	
	//공지사항 글쓰기폼 보여주깅
	@Override
	@RequestMapping("/notice/writeForm.do")
	public String writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "notice/writeForm";
	}
	
	//공지사항 글쓰기
	@Override
	@RequestMapping("/notice/writeNotice.do")
	public ModelAndView writeNotice(
	@ModelAttribute ("info")NoticeDTO noticeDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			HttpSession session = request.getSession();
			MemberDTO memberDTO =(MemberDTO)session.getAttribute("memberDTO");
			noticeDTO.setMember_id(memberDTO.getMember_id());
			noticeDTO.setEmail(memberDTO.getEmail());
		int result = noticeService.writeNotice(noticeDTO);
		System.out.println("컨트롤러 비즈니스 로직"+result);
		ModelAndView mv =new ModelAndView("redirect:/notice/noticeList.do");
		return mv;
	}
	
	//공지 상세보기
	
	@Override
	@RequestMapping("/notice/noticeDetail.do")
	public ModelAndView getNoticeDetail(@RequestParam("notice_id")int notice_id,HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv
	) throws Exception {	
		System.out.println("noticeDetail");
		NoticeDTO noticeDTO = noticeService.getNoticeDetail(notice_id);
		noticeService.noticeCountPlus(notice_id);
		mv.addObject("noticeDTO", noticeDTO);
		mv.setViewName("/notice/noticeDetail");
	
		return mv;
	}
	
	//공지삭제
	@Override
	@RequestMapping("/notice/deleteNotice.do")
	public ModelAndView deleteNotice(
			@RequestParam ("noticeId")String notice_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("컨트롤러요청매개변수"+notice_id);
		
		int result = noticeService.deleteNotice(notice_id);
		ModelAndView mv = new ModelAndView("redirect:/notice/noticeList.do");
		return mv;
	}

	
}
