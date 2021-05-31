<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<ul>
	<li><a href="#">회사소개</a></li>
	<li><a href="#">이용약관</a></li>
	<li><a href="#">개인정보취급방침</a></li>
	<li><a href="#">제휴/도서홍보</a></li>
	<li><a href="#">광고센터</a></li>
	<li><a href="#">고객만족센터</a></li>
	<li class="no_line"><a href="#">찾아오시는길</a></li>
</ul>
<div class="clear"></div>
<a href="#"><img width="147px"  height="147px" alt="freshmarket" src="${contextPath}/resources/img/Fresh_Market_logo.png" /></a>
<div style="padding-left:200px">
	 ㈜프레시마켓 <br>
	 대표이사: 000   <br>
	 주소 : 우편번호 08292 서울 구로구 구로중앙로34길 <br>  
	 사업자등록번호 : 000-00-00000 <br>
	 서울특별시 통신판매업신고번호 : 제 777호 ▶사업자정보확인   개인정보보호최고책임자 : 홍길동 privacy@google.co.kr <br>
	 대표전화 : 1544-1544 (발신자 부담전화)   팩스 : 0502-977-7777 (지역번호공통) <br>
	 COPYRIGHT(C) 프레시마켓 FRESH MARKET ALL RIGHTS RESERVED.
</div>