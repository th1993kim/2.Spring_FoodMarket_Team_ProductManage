package com.market.qnaboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.market.qnaboard.dto.PagingDTO;
import com.market.qnaboard.dto.QnaBoardCommentDTO;
import com.market.qnaboard.dto.QnaBoardDTO;


@Repository("qnaDAO")
public class QnaBoardDAOImpl {

	@Autowired
	private SqlSession sqlSession;

	//전체글갯수 조회
	public int getCount(int product_id) throws DataAccessException {
		int qnaCount = sqlSession.selectOne("qna.qnaCount",product_id);
		return qnaCount;
	}
	
	//특정범위(paging) 문의 글 조회
	//@Override
	public List<QnaBoardDTO> getQnaBoard(PagingDTO pageDTO) throws DataAccessException {
		List<QnaBoardDTO> qnaList = sqlSession.selectList("qna.qnaList", pageDTO);
		return qnaList;
	}
	
	//문의 답글 조회
	//@Override
	public List<QnaBoardCommentDTO> getQnaCommentBoard() throws DataAccessException {
		List<QnaBoardCommentDTO> qnaCommentList = sqlSession.selectList("qna.qnaCommentList");
		return qnaCommentList;
	}
	
	//문의 글 작성
	//@Override
	public int writeQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException {
		int result = sqlSession.insert("qna.qnaWrite", qnaDto);
		System.out.println("여기는 dao qnaWrite 결과 = "+result);
		return result;
	}
	
	//문의 글 수정폼 보여주기
	//@Override
	public QnaBoardDTO modifyForm(String qa_id) throws DataAccessException {
		QnaBoardDTO qna = (QnaBoardDTO)sqlSession.selectOne("qna.modifyForm", qa_id);
		return qna;
	}
	
	//문의 글 수정하기
	//@Override
	public int modifyQnaBoard(QnaBoardDTO qnaDto) throws DataAccessException {
		int result = sqlSession.update("qna.qnaModify", qnaDto);
		System.out.println("qnaModify 결과 "+result);
		return result;
	}
	
	//문의 글 삭제
	//@Override
	public int deleteQnaBoard(String qa_id) throws DataAccessException {
		int result = sqlSession.update("qna.deleteQna", qa_id);
		return result;
	}

	//답글 작성
	//@Override
	public int writeCommentBoard(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		int result = sqlSession.insert("qna.qnaCommentWrite", qnaCommentDto);
		return result;
	}
	
	//답글 삭제
	//@Override
	public int deleteCommentBoard(String qa_comment_id) throws DataAccessException {
		int result = sqlSession.update("qna.deleteComment", qa_comment_id);
		return result;
	}
	
	//답글 수정하기
	//@Override
	public int modifyCommentBoard(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		int result = sqlSession.update("qna.modifyComment", qnaCommentDto);
		return result;
	}
	
	//수정된 답글 가져오기 ajax
	//@Override
	public QnaBoardCommentDTO getCommentOne(QnaBoardCommentDTO qnaCommentDto) throws DataAccessException {
		QnaBoardCommentDTO result = sqlSession.selectOne("qna.modifiedComment", qnaCommentDto);
		return result;
	}

}

