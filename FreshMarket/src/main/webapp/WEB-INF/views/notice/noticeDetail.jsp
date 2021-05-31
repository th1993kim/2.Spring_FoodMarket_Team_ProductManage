<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<style>
.divMargin{
	margin:100px auto; 	
}

</style>
</head>
<body>
<div class="container col-md-6 divMargin">
    <div class="card">
        <div class="card-body">
             <h4 class="card-title mb-3">${noticeDTO.title}</h4>
            <h6 class="card-subtitle text-muted mb-4">
                <i class="far fa-user"></i> ${noticeDTO.email}
                ·
                <i class="far fa-clock"></i> ${noticeDTO.created_at}
                ·
            </h6>
            <p class="card-text">${noticeDTO.content}</p>
        </div>
        <div class="card-body">
            <a href='<c:url value='/notice/noticeList.do'/>' class="btn btn-info" role="button">목록으로</a>
        </div>
    </div>
</div>



	<%-- 삭제를 위한 폼 
	<form name="delForm" id="delForm" method="POST" 
	      action="${contextPath}/member/deleteMember.do">
		<input type="hidden" name="memberId" value="${memberDTO.id}"/>
	</form>	
	--%>

</body>
</html>










