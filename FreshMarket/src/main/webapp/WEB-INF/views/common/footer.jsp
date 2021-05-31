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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.footer {
  position: relative;
  left: 0;
  bottom: 0;
  width: 100%;
  height:auto;
  background-color:white;
  color: black;
  text-align: center;
  font-family: Arial, Helvetica, Sans-serif;
}

.footer .footer-first-line{
    width: 100%;
    height:auto;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
}

.footer .footer-first-line a{
  text-decoration: none;
  color:black;
  left: 0;
  margin-right:30px;
  margin-left: 30px;
}

.footer .footer-first-line a:hover{
    text-decoration: underline;
}

.footer-first-line hr, .footer-second-line hr{
    border: 3px solid whitesmoke;
}
.footer .footer-second-line{
    width: 100%;
    height: auto;
    margin: 30px auto 10px;
    font-size: 12px;
    color: black;
    line-height: 32px;
    font-family: Arial, Helvetica, sans-serif;

}
.footer .footer-second-line .company-information1{
    width: 260px;          
    display: inline-block;
    vertical-align: top;
    margin-left:50px;
}

.footer .footer-second-line .company-information1 a,.footer .footer-second-line .company-information3 a{
   color: black;
}

.footer .footer-second-line .company-information2 a{
    color: black;
    text-decoration: none;
}   
.footer .footer-second-line .company-information2{
    width: 300px;
    display: inline-block;
    vertical-align: top;   
    margin-left:10px;
}
.footer .footer-second-line .company-information2 em{
    font-size:30px;
}
.footer .footer-second-line .company-information3{
    width: 270px;
    display: inline-block;
    vertical-align: top; 
    margin-top: -10px;
}
.footer .footer-second-line .company-information4{
	width: 200px;
    display: inline-block;
    vertical-align: top; 
    margin-left:80px;
}
.footer .footer-third-line{
    width: 100%;
    margin: 0 auto 50px;
    height: 100px;
    font-size: 12px;
    color: black;
    line-height: 150%;
    display:inline-block;
}
.footer .footer-third-line .copyright{
    width: 700px;
    float:left;
    text-align: justify;
    vertical-align: top; 
    margin-top: -10px;
    margin-left: 200px;
    
}

.footer .footer-third-line .copyright p{
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    text-align: justify;
}

.footer .footer-third-line .social-network{
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    width: 500px;
    float:left;
    margin-top: -10px;
    margin-left: 20px;

} 

.footer .footer-third-line .social-network .fa {
padding: 10px;
font-size: 30px;
text-decoration: none;
margin: 5px 2px;
}

.footer .footer-third-line .social-network .fa:hover {
opacity: 0.7;
}

.footer .footer-third-line .social-network .fa-facebook{
background: #3B5998;
color: white;
border-radius: 100%;
width:47px;
}

.footer .footer-third-line .social-network .fa-twitter{
background: #55ACEE;
color: white;
border-radius: 100%;
width:47px;
}

.footer .footer-third-line .social-network .fa-instagram{
background: #125688;
color: white;
border-radius: 100%;
width:47px;
}

/*@media only screen and (min-width: 1280px) {
.footer {
width: 1200px;
margin: 0 auto;
}
}*/

/*@media only screen and (max-width: 1139px) {
.social-network {
    width: 1000px;
    display: block;
}
.social h1 {
    margin: 0px;
}
}*/
@media only screen and (max-width: 950px) {
.footer .col {
    width: 33%;
}
.footer .col h1 {
    font-size: 14px;
}
.footer .col ul li {
    font-size: 13px;
}
}
@media only screen and (max-width: 500px) {
    .footer .col {
    width: 50%;
    }
    .footer .col h1 {
    font-size: 14px;
    }
    .footer .col ul li {
    font-size: 13px;
    }
}
@media only screen and (max-width: 340px) {
.footer .col {
    width: 100%;
}
</style>
</head>
<body>
    <div class="footerContainer">
        <div class="footer">
            <div class="footer-first-line">
                <p class="footer-links">
                    <a href="#">회사소개</a>
                    |
                    <a href="#">인재체용</a>
                    |
                    <a href="#">임점 제휴문의</a>
                    |
                    <a href="#">공지 사항</a>
                    |
                    <a href="#">고객의 소리</a>
                    |
                    <a href="#">이용약관</a>
                    |
                    <a href="#">개인정보 처리방침</a>
                    |
                    <a href="#">고객만족센터</a>
                    |
                    <a href="#">광고안내</a>
                </p>
            </div>
            <div class="footer-second-line">
            	<div class="company-information4">
                    <div id="logo">
						<img id="logoImg" alt="freshmarket" src="${contextPath}/resources/img/freshLogo.png">
						<img id="fresh" alt="freshmarket" src="${contextPath}/resources/img/fresh.png">
					</div>
                </div>
                <div class="company-information1">
                    <address>
			                         ㈜프레시마켓 | 대표이사 : 김신홍 <br>
			                         서울 구로구 구로중앙로34길 <br>
			                        사업자 등록번호 : 000-00-00000 <br>
			                        서울특별시 통신판매업신고번호 : 제 777호<br>
                       <a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767" target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
                    </address>
                </div>
                <div class="company-information2">
                    <a href="https://csmessenger.coupang.com/cs-center/chat/main" class="call-center" title="365 고객센터">
                        <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br>
                        <em>1577-7011</em><br>
                        	서울 구로구 구로중앙로34길<br>
                        <span class="contact-fax">email : privacy@google.co.kr</span>
                    </a>
                </div>
                <div class="company-information3">
                    <p class="safe-service">
                        <strong>우리은행 채무지급보증 안내</strong><br>
                        <span>
                        당사는 고객님이 현금 결제한 금액에 대해<br>우리은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고 있습니다.<br>
                        </span>
                        <a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
                    </p>
                </div>
            </div>
            <div class=footer-third-line>
                <div class="copyright">
                    <p class="info" style="padding-top:9px">사이버몰 내 판매되는 상품 중에는 프레시마켓에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.
                        <br> 마켓플레이스(오픈마켓) 상품의 경우 프레시마켓은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 
                        <br> 프레시마켓은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에   대하여 책임을 지지 않습니다. 
                        <br> 프레시마켓은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@google.co.kr)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁  처리절차에 의거 분쟁이 처리됩니다.<br> COPYRIGHT(C) 프레시마켓 FRESH MARKET ALL RIGHTS RESERVED.
                    </p>
                </div>
                <div class="social-network">
                    <h2>Follow us!</h2>
                    <a href="https://www.facebook.com/Coupang.korea" target="_blank" class="fa fa-facebook" title="쿠팡 페이스북"></a>
                    <a href="https://news.coupang.com/" target="_blank" class="fa fa-twitter" title="쿠팡 twitter"></a>
                    <a href="https://www.instagram.com/coupang" target="_blank" class="fa fa-instagram" title="쿠팡 인스타그램"></a>
                
                </div>
            </div>
        </div>
    </div>
</body>
</html>
