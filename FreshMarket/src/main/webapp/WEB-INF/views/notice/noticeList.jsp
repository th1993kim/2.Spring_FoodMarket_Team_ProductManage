<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 리스트</title>
<%-- <link rel="stylesheet" type="text/css" href="${contextPath}/resources/no/semantic.min.css"> --%>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>
<style type="text/css">
        /* body {	
            background-color: #DADADA;
        } 

       body.grid {
            height: 400%;
        }

        .image {
            margin-top: -100px;
        }

        .column {
            max-width: 900px;
        }*/
.column{
	width:85%;
}
.column > table{
	text-align:center;
	
}
.column > h2{
	text-align:center;
	color:#00b5ad;
	font-weight:bold;
	
}
.divMargin{
	margin:100px auto; 	
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){

	$(".delBtn").click(function(){
		alert('삭제');
	});

});
	
</script>
</head>
<body>
<div class="ui middle aligned center aligned grid divMargin">
        <div class="column">
            <h2 class="ui teal image header">
                	공지게시판
            </h2><br/><br/>  
	
			<table class="table" width="100%">
				<thead>
					<tr>
			
					<th>작성자 이메일</th>
					<th>제 목</th>
					<th>등록날짜</th>
					<th>조회수</th>
				
					</tr>
					
					</thead>
					<tbody>
						<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
						<c:forEach  var="notice"  items="${noticeList}">
							<!-- 삭제를 위한 폼 -->
						<form name="delForm" id="delForm" method="get" 
						      action="${contextPath}/notice/deleteNotice.do">
			
							<input type="hidden" name="noticeId" value="${notice.notice_id}"/>
						
						<tr>
							<td>${notice.email}</td>
							<td><a href="${contextPath}/notice/noticeDetail.do?notice_id=${notice.notice_id}">${notice.title}</a></td>
							<td>${notice.created_at}</td>
							<td><c:out value ="${notice.view_count}"/></td>
							<td>
							<c:if test="${isLogin==true and memberDTO.member_role == 'admin'}">  
								<input type="submit" class="delBtn" value="삭제"/>		
							</c:if>
						</tr>	
						</form>	
					
						
						</c:forEach>
								<tr>
							<td colspan="8" style="text-align:right;padding-right:20px;">
							<c:if test="${isLogin==true and memberDTO.member_role == 'admin'}">  
								<a href="${contextPath}/notice/writeForm.do">공지글작성</a>	
							</c:if>
							</td>
								</tr>
			
					</tbody>
			</table>
		</div>
</div>
</body>
</html>
