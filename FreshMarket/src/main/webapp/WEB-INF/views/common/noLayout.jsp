<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<%-- <link href="${contextPath}/resources/css/mainNoSide.css" rel="stylesheet" type="text/css" media="screen"> --%>
<%-- <link href="${contextPath}/resources/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen"> --%>
<%-- <link href="${contextPath}/resources/css/mobile.css" rel="stylesheet" type="text/css"> --%>
<%-- <script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script> --%>
<%-- <script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script> --%>
<%-- <script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script> --%>
<!-- <script>
	// 슬라이드 
	$(document).ready(function() {
		$('#ad_main_banner').bjqs({
			'width' : 775,
			'height' : 145,
			'showMarkers' : true,
			'showControls' : false,
			'centerMarkers' : false
		});
	});
/* 	// 스티키 		
	$(function() {
		$("#sticky").stickySidebar({
			timer : 100,
			easing : "easeInBounce"
		});
	}); */
</script> -->
<%--  tiels관련xml문서에서 정의한 
       <put-attribute name="title"	value="~~~~" />을 적용하는 부분  --%>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<div class="clear"></div>
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
		</div>
		 <%-- 스크롤바의 위치를 따라서 이동되는 부분 : 가장 최근에 본 상품내용이 보인다 --%>
<%-- 		 <tiles:insertAttribute name="quickMenu" /> --%>
    </div>  
</body>
</html>

