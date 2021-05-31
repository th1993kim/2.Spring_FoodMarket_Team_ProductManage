<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>메인</title>
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="shortcut icon" href="/favicon.ico">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/fonts/fontawesome-free-5.15.3-web/css/all.css">
<!--===============================================================================================-->
	<%-- 	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css"> --%>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/css/util.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/css/main.css">
<!--===============================================================================================-->


<style>
#main_font_style {
	text-align: center;
 	margin-top: 230px; 
	font-size: 90px;
}

h1 span:nth-child(1) {
	color: #4285f4;
}

h1 span:nth-child(2) {
	color: #ea4335;
}

h1 span:nth-child(3) {
	color: #fbbc05;
}

h1 span:nth-child(4) {
	color: #4285f4;
}

h1 span:nth-child(5) {
	color: #34a853;
}

h1 span:nth-child(6) {
	color: #ea4335;
}

.search-bar {
	width: 600px;
	height: 70px;
	font-size: 20px;
}

.searchbar-search-icon {
	position: absolute;
	margin-top: 20px;
	z-index: 10;
	margin-left: 20px;
}

.searchbar-keyboard-icon {
	position: absolute;
	margin-left: 550px;
	margin-top: 20px;
	z-index: 10;
}

input[type="text"], input[type="password"] {
	height: auto; /* 높이 초기화 */ 
	line-height: normal; /* line-height 초기화 */ 
	padding: .8em 3em; /* 여백 설정 */ 
}

</style>
</head>
<body>
	<hr>
	<h1 id='main_font_style'>
		<span>프</span><span>레</span><span>시</span><span>마</span><span>켓</span><span>!</span>
	</h1>
	<form action="${contextPath}/userProduct/searchProduct.do" method="GET">
		<input type="hidden" name="page" value="1"> 
		<input type="hidden" name="perPageNum" value="20">
		<div class="mx-auto mt-5 search-bar input-group mb-3">
			<div class="searchbar-search-icon"><i class="fas fa-search"></i></div>
			<input name="searchWord" type="text" class="form-control rounded-pill search-bar" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="searchbar-keyboard-icon"><i class="fas fa-keyboard"></i></div>
			<div class="input-group-append"></div>
		</div>
	</form>
	<hr>


	<%-- 로그인 after  화면  ------------------------------ --%>
<%-- 	<c:if test="${!empty memberDTO}">
	*세션에 담긴 로그인한 유저member_id = ${memberDTO.member_id}<br />
	*세션에 담긴 로그인한 유저이메일 = ${memberDTO.email}<br />
	
	${memberDTO.name}님 접속중 
	</c:if> --%>




<!--===============================================================================================-->	
	<script src="${contextPath}/resources/main/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/bootstrap/js/popper.js"></script>
	<script src="${contextPath}/resources/main/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/js/main.js"></script>

</body>
</html>










