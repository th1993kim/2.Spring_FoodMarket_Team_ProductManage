<%@ page contentType="text/html; charset=utf-8"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<title>가입 완료</title>
</head>
<body>
${param.name}님, 회원 가입에 성공했습니다.

<a href="${contextPath}/main.do">main</a>


<br/>
</body>
</html>