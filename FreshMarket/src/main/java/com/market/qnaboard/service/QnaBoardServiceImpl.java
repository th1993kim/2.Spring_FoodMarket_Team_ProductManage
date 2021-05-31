package com.market.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.market.qnaboard.dao.QnaBoardDAOImpl;
import com.market.qnaboard.dto.PagingDTO;
import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;


//QnaControllerImpl<->QnaServiceImpl<->QnaDAOImpl<->myBatis<->db
@Service("qnaService")
public class QnaBoardServiceImpl {
	
	@Autowired
	private QnaBoardDAOImpl qnaDAO;

	//전체 페이지 수 조회
	//@Override
	public int getQnaPage(int product_id) throws DataAccessException {
		int total = qnaDAO.getCount(product_id);
		return total;
	}
	
	//특정범위(paging) 문의 글 조회
		//@Override
		public List<QnaBoardDTO> getQnaBoard(PagingDTO pageDTO) throws DataAccessException {
			List<QnaBoardDTO> qnaList = qnaDAO.getQnaBoard(pageDTO);
			return qnaList;
		}
	
	//문의 답글 조회
	//@Override
	public List<QnaBoardCommentDTO> getQnaCommentBoard() throws DataAccessException {
		List<QnaBoardCommentDTO> qnaCommentList = qnaDAO.getQnaCommentBoard();
		return qnaCommentList;
	}

	//문의 글 작성
	//@Override
	public int writeQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException {
		int result = qnaDAO.writeQnaBoard(qnaDto);
		return result;
	}

	//문의 글 수정폼 보여주기
	//@Override
	public QnaBoardDTO modifyForm(String qa_id) throws DataAccessException {
		QnaBoardDTO qna = qnaDAO.modifyForm(qa_id);
		return qna;
	}

	//문의 글 수정하기
	//@Override
	public int modifyQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException {
		int result = qnaDAO.modifyQnaBoard(qnaDto);
		return result;
	}

	//문의 글 삭제
	//@Override
	public int deleteQnaBoard(String qa_id) throws DataAccessException {
		int result = qnaDAO.deleteQnaBoard(qa_id);
		return result;
	}

	//답글 작성
	//@Override
	public int writeCommentBoard(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		int result = qnaDAO.writeCommentBoard(qnaCommentDto);
		return result;
	}
	
	//답글 삭제
	//@Override
	public int deleteCommentBoard(String qa_comment_id) throws DataAccessException {
		int result = qnaDAO.deleteCommentBoard(qa_comment_id);
		return result;
	}
	
	//답글 수정하기
	//@Override
	public int modifyCommentBoard(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		int result = qnaDAO.modifyCommentBoard(qnaCommentDto);
		return result;
	}
	
	//수정된 답글 가져오기 ajax
	//@Override
	public QnaBoardCommentDTO getCommentOne(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		QnaBoardCommentDTO result = qnaDAO.getCommentOne(qnaCommentDto);
		return result;
	}
	
	
	
	
	
}



