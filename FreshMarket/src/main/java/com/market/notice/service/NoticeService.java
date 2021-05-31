package com.market.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.market.notice.dto.NoticeDTO;

public interface NoticeService {
	
	//공지리스트
	public List<NoticeDTO> getNoticeList() throws DataAccessException;
	
	//공지사항 글쓰기
	public int writeNotice(NoticeDTO noticeDTO) throws DataAccessException;

	//공지 디테일
	public NoticeDTO getNoticeDetail(int notice_id) throws DataAccessException;
	
	//공지삭제
	public int deleteNotice(String notice_id) throws DataAccessException;

	public void noticeCountPlus(int notice_id)throws DataAccessException;


 }
