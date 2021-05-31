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
<title>회원목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
</script>	
</head>
<body>
	<h2>회원 관리</h2>
	<table width="100%" class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>비번</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>회원권한</th>
				<th>회원상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%-- jstl의 foreach를 이용해서  회원수만큼 반복해서 출력할 예정 --%>
			<c:forEach  var="member"  items="${memberList}">
			<tr>
				<td>${member.member_id}</td>
				<td><%-- <a href="${contextPath}/member/memberDetail.do?memberNo=${member.mno}&id=${member.id}"> --%>${member.email}</a></td>
				<td>${member.password}</td>
				<td>${member.name}</td>
				<td>${member.phone}</td>
				<td>${member.address}</td>
				<td>${member.member_role}</td>
				<td>
					<input type="hidden" class="hiddenStatus" value=""/>
					<select class="status">
						<c:choose>
							<c:when test="${member.member_status == 'active'}">
								<option value="active" selected>active</option>
								<option value="inactive">inactive</option>
								<option value="deleted">deleted</option>
							</c:when>
							<c:when test="${member.member_status == 'inactive'}">
								<option value="active" >active</option>
								<option value="inactive" selected>inactive</option>
								<option value="deleted">deleted</option>
							</c:when>
							<c:when test="${member.member_status == 'deleted'}">
								<option value="active" >active</option>
								<option value="inactive">inactive</option>
								<option value="deleted" selected>deleted</option>
							</c:when>
						</c:choose>
					</select>
				</td>
				<td>
					<button type=button class="btn btn-light modify_btn" value="${member.member_id}">수정</button>
<%-- 				<td><button name="delete_btn" class="delete_btn" onClick="javascript:window.location='${contextPath}/member/deleteMember.do?memberId=${member.id}'" >삭제</button> --%>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
<script>
$(document).ready(function(){
	
	var msg = "${message}";
	var path ="${path}";
	if(msg!=null && msg!=""){
		alert(msg);
		location.href=path;
	}
	
	$(document).on('click','.modify_btn',function(){
		
		var i = $(".modify_btn").index(this);
		var member_id = $(".modify_btn").eq(i).val();
		var status = $(".status").eq(i).val();
		
		$.ajax({
			url:"${contextPath}/member/memberstatus.do",
			type:"post",
			data:{"member_id":member_id,
				  "member_status":status},
			datatype : "text",
			success:function(data){
				if(data == 'fail'){
					alert("관리자로 다시 로그인해주세요");
					location.href=path;
				}else{
					if(data == 'active'){
						alert('변경되었습니다.');
					}
					else if(data == 'inactive'){
						alert('변경되었습니다.');
					}
					else if(data == 'deleted'){
						alert('변경되었습니다.');
					}
					else{
						alert('변경에 실패하였습니다. 다시 시도해주세요.');
					}
				}
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});//아작스
		
	});//modify_btn.click
	
});//ready


</script>	
</body>
</html>










