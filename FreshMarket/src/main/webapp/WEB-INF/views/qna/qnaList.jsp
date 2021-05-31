<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의</title>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>
<style>	
.form, .modifyForm{
	display:none;
}
#qna td{
	border-bottom:1px solid #c2c2d6; 
}
.title{
	display:inline-block;
	padding:5px;
}
.writeCmt, .modifyForm{
	padding-right:30px;
	padding-left:10px;
	margin:20px 20px 10px;
}
.box{
	position:relative;
	margin-bottom:20px;
	margin-top:10px;
	padding:15px 15px 0;
}
.btnWrite, .btnModify{
	position:absolute;
	right:7px;
	bottom:0;
}
.email{
	position:absolute;
	top:0px;
	right:5px;
	font-size:0.8rem;
}
.content{
	position:relative;
	display:inline-block;
	padding:5px;
	width:90%;
	padding-left:30px;
	font-size:1rem;
}
.comment{
	font-size:1rem;
	width:85%;
	margin-left:70px;
	margin-top:5px;
	padding-bottom:20px;
	position:relative;
	display:inline-block;
}
.btnBox{
	display:block;
	position:absolute;
	right:10px;
	bottom:-10px;
}
a{
	cursor:pointer;
}
.answer, .q{
	display:inline-block;
	position:absolute;
}
#qna tr:nth-child(2){
	border-bottom:2px solid black;
}
.notice{
	padding:10px;
}
</style>
</head>
<body>
    <div id="bodyWrap">
    	<c:set var="page" value="${paging.currentPage}"/>
		<input type="hidden" value="${memberDTO.email}" id="getEmail"/>
		<input type="hidden" value="${detailUserProductMap.userProductDTO.product_id}" id="getProduct_id"/>
		<table id="qna" class="qna" width="95%">
					<tr>
						<td style="border-bottom:none;text-align:right;">
							<button type="button" class="btn btn-primary islogin">문의 하기</button> <!--  data-toggle="modal" data-target="#writeModal" -->
						</td>
					</tr>
					<tr>
						<td>
							<div class="notice">
					            <ul id="noticeList">
					                <li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다.</li>
					                <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
					                <li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를 이용해주세요.</li>
					                <li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
					                <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
					            </ul>
					        </div>
						</td>
					</tr>
			   <c:choose>
				  <c:when test="${empty qnaList}">
				  	<tr>
						<td style="border-bottom:none; background:#f0f0f5;">
						  <div class="box">현재 등록된 문의가 없습니다.</div>
						</td>
					</tr>
				  </c:when>
				  <c:otherwise>
				  	  <c:forEach var="qnaList" items="${qnaList}">
					  	  <c:if test="${qnaList.is_locked==0}">
					  	 	<tr>
								<td>
						 		  <div class="box">
									<div class="q"><strong>Q.&nbsp;</strong></div>
									<div class="content">${qnaList.content}</div>
						 		  	<div  class="email">${qnaList.email}님&nbsp; ${qnaList.created_at}</div>
								 	<div  class="btnBox">
								  <c:if test="${memberDTO.member_role=='admin'}">
								 		<button type="button" class="cmt btn btn-outline-primary btn-sm">답글작성</button>
								  </c:if>
								  <c:if test="${qnaList.member_id==memberDTO.member_id}"> 
				 						<button type="button" class="modifyFormBtn btn btn-outline-primary btn-sm" value="${qnaList.qa_id}">수정</button>
										<a onclick="javascript:deleteQna('${qnaList.qa_id}','${page}');" class="qlink btn btn-outline-primary btn-sm">삭제</a>
								  </c:if>
									</div>
								  </div>
								</td>
							</tr>
					  	  </c:if>
					  	  <c:if test="${qnaList.is_locked==1}">  
						  	  <c:choose>
						  	    <c:when test="${qnaList.member_id==memberDTO.member_id || memberDTO.member_role=='admin'}">
						  	    	<tr>
										<td>
										  <div class="box">
											<div class="q"><strong>Q.&nbsp;</strong></div>
											<div class="content">${qnaList.content}</div>
										  	<div  class="email">${qnaList.email}님&nbsp; ${qnaList.created_at}</div>
										 	<div  class="btnBox">
										  <c:if test="${memberDTO.member_role=='admin'}">
									 		<button type="button" class="cmt btn btn-outline-primary btn-sm">답글작성</button>
										  </c:if>
									 	  <c:if test="${qnaList.member_id==memberDTO.member_id}">
					 						<button type="button" class="modifyFormBtn btn btn-outline-primary btn-sm" value="${qnaList.qa_id}">수정</button>
											<a onclick="javascript:deleteQna('${qnaList.qa_id}','${page}');" class="qlink btn btn-outline-primary btn-sm">삭제</a>
										  </c:if> 
										    </div>
										  </div>
										</td>
									</tr>
						  	    </c:when>
						  	    <c:otherwise>
						  	    	<tr>
										<td>
										  <div class="box">
										 	<div class="title"><strong>Q.&nbsp;비밀 문의 글 입니다</strong></div>
										  </div>
										</td>
									</tr>
						  	    </c:otherwise>
						  	  </c:choose>
					      </c:if>
							<tr class="form">
						    	<td style="background:#f0f0f5; width:1066px;">
							    	<div class="box">
							    	  <div class="writeCmt">
							    	  	<textarea class="cmtcontent form-control" rows="7" name="content"></textarea>
							    	  	<input type="button" value="작성" class="btnWrite btn btn-outline-primary btn-sm"/>
							    	  	 <input type="hidden" value="${qnaList.qa_id}" class="qa_id">
							    	  	 <input type="hidden" value="${qnaList.member_id}" class="member_id">
							    	  </div>
							    	</div>
						    	</td>
							</tr>
					    <c:forEach var="qnaCommentList" items="${qnaCommentList}"> 			
						  <c:if test="${qnaList.qa_id==qnaCommentList.qa_id}">
							<c:if test="${qnaList.is_locked==0}">
						  	 	<tr>
									<td style="background:#f0f0f5;">
										<div class="box">
											<div class="answer"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;</strong></div>
											<div class="comment">${qnaCommentList.content}</div>
										  <c:if test="${memberDTO.member_role=='admin'}">
											<span class="btnBox">
											   <input type="button" value="수정" class="modifyCmt btn btn-outline-primary btn-sm">
											   <a onclick="javascript:deleteComment('${qnaCommentList.qa_comment_id}','${page}');" class="qlink btn btn-outline-primary btn-sm">삭제</a>
											</span>
										  </c:if>
								    	    <div class="modifyForm">
									    	  	<textarea class="modifyCmtContent form-control" rows="7" name="modifyCmtContent">${qnaCommentList.content}</textarea>
									    	  	<input type="hidden" value="${qnaCommentList.qa_comment_id}" class="qa_comment_id">
									    	  	<input type="button" value="수정" class="btnModify btn btn-outline-primary btn-sm"/>
								    	    </div>
								    	</div>
									</td>
								</tr>
						  	</c:if>
						  	<c:if test="${qnaList.is_locked==1}">
						  	  <c:choose>
						  	    <c:when test="${qnaList.member_id==memberDTO.member_id || memberDTO.member_role=='admin'}">
						  	    	<tr>
										<td style="background:#f0f0f5;">
											<div class="box">
												<div class="answer"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;</strong></div>
												<div class="comment">${qnaCommentList.content}</div>
												  <c:if test="${memberDTO.member_role=='admin'}">
													<span class="btnBox">
													   <input type="button" value="수정" class="modifyCmt btn btn-outline-primary btn-sm">
													   <a onclick="javascript:deleteComment('${qnaCommentList.qa_comment_id}','${page}');" class="qlink btn btn-outline-primary btn-sm">삭제</a>
													</span>
												  </c:if>
									    	    <div class="modifyForm">
										    	  	<textarea class="modifyCmtContent form-control" rows="7" name="modifyCmtContent">${qnaCommentList.content}</textarea>
										    	  	<input type="hidden" value="${qnaCommentList.qa_comment_id}" class="qa_comment_id">
										    	  	<input type="button" value="수정" class="btnModify btn btn-outline-primary btn-sm"/>
									    	    </div>
									    	</div>
										</td>
									</tr>
						  	    </c:when>
						  	    <c:otherwise>
						  	    	<tr>
										<td colspan="2"  style="background:#f0f0f5;">
										  <div class="box">
										 	<span class="title"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ A.&nbsp;비밀 답글입니다.</strong></span>
										  </div>
										</td>
									</tr>
						  	    </c:otherwise>
						  	  </c:choose>
					    	</c:if>			
				    	  </c:if>	
				  	  	</c:forEach>
			      	  </c:forEach>
				  <tfoot>
					  <tr>
					  	<td style="border-bottom:none;">
					  		<div style="display: block; text-align: center;">		
								<c:if test="${paging.startPage>3}">
									<a onclick="javascript:prevPaging('${paging.startPage-3}');">&lt;&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
									<c:choose>
										<c:when test="${p == paging.currentPage }">
											<b>${p}</b>
											<input type="hidden" id="currentPage" value="${p}"/>
										</c:when>
										<c:when test="${p != paging.currentPage }">
											<a onclick="javascript:paging('${p}');">${p}</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage < paging.totalPages}">
									<a onclick="javascript:nextPaging('${paging.startPage+3}');">&gt;</a>
									<a onclick="javascript:totalPage('${paging.totalPages}');">&gt;&gt;</a>
								</c:if>
							</div>
					  	</td>
					  </tr>
				  </tfoot>
			  </c:otherwise>
		   </c:choose>
		</table>
	</div>
<!-- 문의하기 모달 모달창 -->
	<div class="modal fade" id="writeModal">
	    <div class="modal-dialog modal-lg modal-dialog-centered">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">상품문의 하기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	           <form id="writeForm">	
					<table class="table" width="85%">
						<tr>
							<th style="width:15%">상품명</th>
							<td><input type="text" class="form-control" id="product_name" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" rows="7" id="content"></textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" id="email" class="form-control" value="${memberDTO.email}" readonly="readonly"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" id="is_locked" value="0"/>
								<label for="is_locked">비공개</label>
								<input type="hidden" id="member_id" value="${memberDTO.member_id}"/>
							</td>
						</tr>
					</table>
			   </form>
	        </div>
	        <div class="modal-footer">
		        <button type="button" class="btn btn-default btn-sm reset">다시쓰기</button>
		        <button type="button" class="btn btn-primary btn-sm" id="writeBtn">작성하기</button>
		        <button type="button" class="btn btn-default btn-sm reset" data-dismiss="modal">취소</button>
		    </div>
	      </div>
	    </div>
	</div>	

<!-- 문의 수정하기 창 -->
	<div class="modal fade" id="modifyModal">
	    <div class="modal-dialog modal-lg modal-dialog-centered">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">상품문의 수정하기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body">
	           <form id="modifyForm">	
					<table class="table" width="85%">
						<tr>
							<th style="width:15%">상품명</th>
							<td><input type="text" class="form-control" id="modifyProduct_name"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" rows="5" id="modifyContent"></textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" id="modifyEmail" class="form-control" readonly="readonly"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="hidden" id="modifyQa_id" value=""/>
								<input type="checkbox" id="modifyIs_locked" value="0">
								<label for="modifyIs_locked">비공개</label>
							</td>
						</tr>
					</table>
			   </form>
	        </div>
	        <div class="modal-footer">
		       <!--  <input type="reset" class="btn btn-default" value="다시쓰기"/> -->
		        <button type="button" class="btn btn-primary" id="modifyBtn">수정하기</button>
		        <button type="button" class="btn btn-default reset" data-dismiss="modal">취소</button>
		    </div>
	      </div>
	    </div>
	</div>
<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>

</body>
</html>
