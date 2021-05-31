package com.market.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.notice.dto.NoticeDTO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	public NoticeDAOImpl() {
		System.out.println("공지DAO호출");
	}
	
	
	
	//공지사항 목록
	@Override
	public List<NoticeDTO> getNoticeList() throws DataAccessException{
		System.out.println("공지사항 리스트");
		List<NoticeDTO> noticeList =sqlSession.selectList("notice.getNoticeList");
		return noticeList;
	}


	//공지사항 글쓰기
	@Override
	public int writeNotice(NoticeDTO noticeDTO){
		int result = sqlSession.insert("notice.writeNotice",noticeDTO);
		System.out.println("공지글쓰기 실행"+result);
		return result;
	}


	//공지 디테일
	@Override
	public NoticeDTO getNoticeDetail(int notice_id) throws DataAccessException {
		NoticeDTO noticeDTO= (NoticeDTO)sqlSession.selectOne("notice.noticeDetail",notice_id);
		return noticeDTO;
	}


	//공지삭제
	@Override
	public int deleteNotice(String notice_id) throws DataAccessException {
		int result = sqlSession.update("notice.deleteNotice",notice_id);
		return result;
	}



	@Override
	public void noticeCountPlus(int notice_id) throws DataAccessException {
		sqlSession.update("notice.noticeCountPlus",notice_id);
		
	}

	
}
