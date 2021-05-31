package com.market.qnaboard.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;

import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;


public interface QnaBoardDAO {

	//public 리턴타입  함수명(매개변수리스트) throws DataAccessException;
	
	//문의 글 조회
	public List<QnaBoardDTO> getQnaBoard() throws DataAccessException;
	
	//문의 답글 조회
	public List<QnaBoardCommentDTO> getQnaCommentBoard() throws DataAccessException;
	
	//문의 글 쓰기
	public int writeQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException;
	
	//문의 글 수정폼 보여주기	
	public QnaBoardDTO modifyForm(String qa_id) throws DataAccessException;

	//문의 글 수정하기
	public int modifyQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException;

	//문의 글 삭제
	public int deleteQnaBoard(String qa_id) throws DataAccessException;
	
	//답글 쓰기
	public int writeCommentBoard(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException;
}






