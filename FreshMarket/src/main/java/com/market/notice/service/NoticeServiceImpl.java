package com.market.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.market.notice.dao.NoticeDAO;
import com.market.notice.dto.NoticeDTO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public NoticeServiceImpl() {
		System.out.println("공지서비스 호출");
	}
	
	
	
	//공지사항목록
	@Override
	public List<NoticeDTO> getNoticeList() throws DataAccessException{
		System.out.println("공지서비스리스트진입");
	List<NoticeDTO> noticeList = noticeDAO.getNoticeList();
	return noticeList;
	}
	
	//공지사항 글쓰기
	@Override
	public int writeNotice(NoticeDTO noticeDTO)throws DataAccessException{
		int result = noticeDAO.writeNotice(noticeDTO);
		return result;
	}


	//공지사항 조회
	@Override
	public NoticeDTO getNoticeDetail(int notice_id)throws DataAccessException {
		NoticeDTO noticeDTO = noticeDAO.getNoticeDetail(notice_id);
		return noticeDTO;
	}


	//공지사항 삭제
	@Override
	public int deleteNotice(String notice_id) throws DataAccessException {
		int result = noticeDAO.deleteNotice(notice_id);
		
		return result;
	}



	@Override
	public void noticeCountPlus(int notice_id) throws DataAccessException {
		noticeDAO.noticeCountPlus(notice_id);
		
	}







	
}
