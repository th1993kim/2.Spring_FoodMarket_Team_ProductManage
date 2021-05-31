<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%-- tiles를 사용하기위한 taglib
지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%-- jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- contextPath를 변수명이
contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${detailUserProductMap.userProductDTO.product_name}</title>
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="" />
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/product/sdp2.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/productReview.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/pdpcollection.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/carousel.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/ddp.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/pcPlpBanners.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/todaysection.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/common.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/side.css" /> --%>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="shortcut icon" href="/favicon.ico">
<!-- <script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script> -->

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/vendor/slick/slick-theme.css" />
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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/css/qna.css">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> -->
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");

.classic-tabs {
	background-color: #fff;
}

body {
	/* 	background-color: #eee; */
	font-family: "Poppins", sans-serif
}

.card {
	background-color: #fff;
	padding: 14px;
	border: none
}

.demo {
	width: 100%
}

ul {
	list-style: none outside none;
	padding-left: 0;
	margin-bottom: 0
}

li {
	display: block;
	margin-right: 6px;
	cursor: pointer
}

img {
	display: block;
	height: auto;
	width: 100%
}

.stars i {
	color: #f6d151
}

.stars span {
	font-size: 13px
}

hr {
	color: #d4d4d4
}

.badge {
	padding: 5px !important;
	padding-bottom: 6px !important
}

.badge i {
	font-size: 10px
}

.profile-image {
	width: 35px
}

.comment-ratings i {
	font-size: 13px
}

.username {
	font-size: 12px
}

.comment-profile {
	line-height: 17px
}

.date span {
	font-size: 12px
}

.p-ratings i {
	color: #f6d151;
	font-size: 12px
}

.btn-long {
	padding-left: 35px;
	padding-right: 35px
}

.buttons {
	margin-top: 15px
}

.buttons .btn {
	height: 46px
}

.buttons .cart {
	border-color: #ff7676;
	color: #ff7676
}

.buttons .cart:hover {
	background-color: #e86464 !important;
	color: #fff
}

.buttons .buy {
	color: #fff;
/* 	background-color: #ff7676;
	border-color: #ff7676 */
}

.buttons .buy:focus, .buy:active {
	color: #fff;
/* 	background-color: #ff7676;
	border-color: #ff7676; */
	box-shadow: none
}

.buttons .buy:hover {
	color: #fff;
/* 	background-color: #e86464;
	border-color: #e86464 */
}

.buttons .wishlist {
	background-color: #fff;
	border-color: #ff7676
}

.buttons .wishlist:hover {
	background-color: #e86464;
	border-color: #e86464;
	color: #fff
}

.buttons .wishlist:hover i {
	color: #fff
}

.buttons .wishlist i {
	color: #ff7676
}

.comment-ratings i {
	color: #f6d151
}

.followers {
	font-size: 9px;
	color: #d6d4d4
}

.store-image {
	width: 42px
}

.dot {
	height: 10px;
	width: 10px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	margin-right: 5px
}

.bullet-text {
	font-size: 12px
}

.my-color {
	margin-top: 10px;
	margin-bottom: 10px
}

label.radio {
	cursor: pointer
}

label.radio input {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	pointer-events: none
}

label.radio span {
	border: 2px solid #8f37aa;
	display: inline-block;
	color: #8f37aa;
	border-radius: 50%;
	width: 25px;
	height: 25px;
	text-transform: uppercase;
	transition: 0.5s all
}

label.radio .red {
	background-color: red;
	border-color: red
}

label.radio .blue {
	background-color: blue;
	border-color: blue
}

label.radio .green {
	background-color: green;
	border-color: green
}

label.radio .orange {
	background-color: orange;
	border-color: orange
}

label.radio input:checked+span {
	color: #fff;
	position: relative
}

label.radio input:checked+span::before {
	opacity: 1;
	content: '\2713';
	position: absolute;
	font-size: 13px;
	font-weight: bold;
	left: 4px
}

.card-body {
	padding: 0.3rem 0.3rem 0.2rem
}

.detail-orders {
	
}

.preview-image {
	width: 400px;
	border: 2px solid red;
}
</style>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<body>
<% 
	boolean isLogin = false;
	if(session.getAttribute("isLogin") != null)
	{
		if((Boolean)session.getAttribute("isLogin") == true)
		{
			isLogin = true;
		}
	}
%>
<c:set var="isLogin" value="<%=isLogin %>" />
	<link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
	<div class="container mt-2 mb-3">
		<div class="categoryLink">
			<a href="${contextPath}/main.do" >Home</a>
			<c:forEach items="${mainCategory}" var ="main">
				<c:if test="${detailUserProductMap.userProductDTO.main_id==main.main_id}">
					> <a href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}" >${main.main_name}</a>
				</c:if>
			</c:forEach>
			<c:forEach items="${middleCategory}" var ="middle">
				<c:if test="${detailUserProductMap.userProductDTO.middle_id==middle.middle_id}">
					> <a href="${contextPath}/userProduct/searchProduct.do?main_id=${middle.main_id}&middle_id=${middle.middle_id}" >${middle.middle_name}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="row no-gutters">
			<!-- 			<div class="col-md-12 pr-6"> -->
			<div class="col-md-6 pr-2">
				<div class="card">
					<div class="demo">
						<ul id="lightSlider">
							<c:forEach var="item" items="${detailProductImageList}" varStatus="status">
								<li class="img-thumbnail" data-thumb="${detailUserProductMap.userProductDTO.product_detail_path}${item}"><img class="img-thumbnail" src="${detailUserProductMap.userProductDTO.product_detail_path}${item}" /></li>
							</c:forEach>
							<%-- 								<li class="preview-image" data-thumb="${detailUserProductMap.userProductDTO.product_img_path}${detailUserProductMap.userProductDTO.product_img_name}"><img src="${detailUserProductMap.userProductDTO.product_img_path}${detailUserProductMap.userProductDTO.product_img_name}" /></li> --%>
						</ul>
					</div>
				</div>
				<!--                   <div class="card mt-2">
                      <h6>리뷰</h6>
                      <div class="d-flex flex-row">
                          <div class="stars"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1 font-weight-bold">4.6</span>
                      </div>
                      <hr>
                      <div class="badges"> <span class="badge bg-success ">All (230)</span> <span class="badge bg-danger "> <i class="fa fa-image"></i> 23 </span> <span class="badge bg-secondary "> <i class="fa fa-comments-o"></i> 23 </span> <span class="badge bg-warning"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <span class="ml-1">2,123</span> </span> </div>
                      <hr>
                      <div class="comment-section">
                          <div class="d-flex justify-content-between align-items-center">
                              <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/o5uMfKo.jpg" class="rounded-circle profile-image">
                                  <div class="d-flex flex-column ml-1 comment-profile">
                                      <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Lori Benneth</span>
                                  </div>
                              </div>
                              <div class="date"> <span class="text-muted">2 May</span> </div>
                          </div>
                          <hr>
                          <div class="d-flex justify-content-between align-items-center">
                              <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/tmdHXOY.jpg" class="rounded-circle profile-image">
                                  <div class="d-flex flex-column ml-1 comment-profile">
                                      <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Timona Simaung</span>
                                  </div>
                              </div>
                              <div class="date"> <span class="text-muted">12 May</span> </div>
                          </div>
                      </div>
                  </div> -->
			</div>
			<div class="col-md-6 detail-orders">
				<div class="card">
					<div class="d-flex flex-row align-items-center">
						<div class="p-ratings">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
						</div>
						<span class="ml-1">5.0</span>
					</div>
					<div class="about">
						<span class="font-weight-bold js_name_detail">${detailUserProductMap.userProductDTO.product_name}</span>
						<h3 class="font-weight-bold text-primary font-weight-bolder">
							<span>&#x20A9;</span>
							<fmt:formatNumber value="${detailUserProductMap.userProductDTO.product_price}" type="number" var="product_price" />
							${product_price}원
							</h4>
					</div>
					<h6>Quantity :</h6>
						<div class="wrap-num-product flex-w m-l-0 m-r-auto">
							<span class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m minus">
								<i class="fs-16 zmdi zmdi-minus minus"></i>
							</span>

							<input class="num_product mtext-104 cl3 txt-center num-product" name="p_num" type="text" id="cart_product_amount" value="1" >

							<span class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m plus" >
								<i class="fs-16 zmdi zmdi-plus plus"></i>
							</span>
						</div>
					<div class="buttons">
						<button class="btn btn-outline-warning btn-long cart js-addcart-detail">장바구니</button>
						<button class="btn btn-primary btn-long buy js_order_detail">구매하기</button>
					</div>
<%-- 					<form name="form1" method="get" action="${contextPath}/cart/addCart.do"></form> --%>
					<!-- 						<button class="btn btn-light wishlist">
							<i class="fa fa-heart"></i>
						</button> -->
					<hr>
					<div class="product-description">
						<div class="mt-2">
							<span class="font-weight-bold">Description</span>
							<div class="bullets">
								<div class="d-flex flex-row align-items-center">
									<i class="far fa-calendar-check"></i> <span class="ml-1">배송일 1~2일</span>
								</div>
								<%-- 							<c:if test="${detailUserProductMap.userProductDTO.net_weight_per != 0}">
								<div class="d-flex align-items-center">
									<span class="dot"></span> <span class="bullet-text">개당 내용량 : ${detailUserProductMap.userProductDTO.net_weight_per}</span>
								</div>
							</c:if> --%>
								<%-- 							<c:if test="${detailUserProductMap.userProductDTO.net_weight_total != 0}">
								<div class="d-flex align-items-center">
									<span class="dot"></span> <span class="bullet-text">총내용량 : ${detailUserProductMap.userProductDTO.net_weight_total}</span>
								</div>
							</c:if> --%>
							</div>
						</div>
						<!--                           <div class="mt-2"> <span class="font-weight-bold">Store</span> </div>
                          <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/N2fYgvD.png" class="rounded-circle store-image">
                              <div class="d-flex flex-column ml-1 comment-profile">
                                  <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Rare Boutique</span> <small class="followers">25K Followers</small>
                              </div>
                          </div> -->
					</div>
				</div>
			</div>
		</div>
		<div class="row no-gutters">
			<div class="col-md-12 mt-2">
				<!-- Classic tabs -->
				<div class="classic-tabs border rounded px-4 pt-1">
					<ul class="nav tabs-primary nav-justified" id="advancedTab" role="tablist">
						<li class="nav-item"><a class="nav-link active show" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">상품 상세</a></li>
						<li class="nav-item"><a class="nav-link" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="false">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviewTab" role="tab" aria-controls="description" aria-selected="false">Reviews</a></li>
					</ul>
					<div class="tab-content" id="advancedTabContent">
						<div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
							<h5>필수 표기정보</h5>
							<table class="table table-bordered mt-3">
								<tbody>
									<tr>
										<th class="table-active">품목 또는 명칭</th>
										<td>해당사항없음</td>
										<th class="table-active">포장단위별 내용물의<br> 용량(중량),수량,크기
										</th>
										<td>해당사항없음</td>
									</tr>
									<tr>
										<th class="table-active">제조연월일,유통기한</th>
										<td>해당사항없음<br>
										</td>
										<th class="table-active">관련법상 표시사항</th>
										<td>해당사항없음</td>
									</tr>
									<tr>
										<th class="table-active">수입식품 문구 여부</th>
										<td>해당사항없음</td>
										<th class="table-active">상품구성</th>
										<td>해당사항없음</td>
									</tr>
									<tr>
										<th class="table-active">보관방법,취급방법</th>
										<td>해당사항없음</td>
										<th class="table-active">소비자안전을 위한<br> 주의사항
										</th>
										<td>해당없음</td>
									</tr>
									<tr>
										<th class="table-active">소비자상담관련 전화번호</th>
										<td colspan="3">프레시마켓! 고객센터 1577-7011</td>
									</tr>
								</tbody>
							</table>
							<c:forEach var="item" items="${detailProductImageList}" varStatus="status">
								<img src="${detailUserProductMap.userProductDTO.product_detail_path}${item}" class="rounded mx-auto d-block" width="10%" alt="">
								<br>
							</c:forEach>
							<!-- 							<img src=".\img\Coupang_apple\info_product2.jpg" class="rounded mx-auto d-block" width="10%" alt=""> <br>
							<img src=".\img\Coupang_apple\info_product3.jpg" class="rounded mx-auto d-block" width="10%" alt=""> -->
						</div>
<%-- QnA TAB --%>
						<div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description-tab">
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
											                <li>구매한 상품의 취소/반품은 마이프레시마켓 구매내역에서 신청 가능합니다.</li>
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
							<%-- <h5>Product Description</h5>
							<p class="small text-muted text-uppercase mb-2">Shirts</p>
							<ul class="rating">
								<li><i class="fas fa-star fa-sm text-primary"></i></li>
								<li><i class="fas fa-star fa-sm text-primary"></i></li>
								<li><i class="fas fa-star fa-sm text-primary"></i></li>
								<li><i class="fas fa-star fa-sm text-primary"></i></li>
								<li><i class="far fa-star fa-sm text-primary"></i></li>
							</ul>
							<h6>12.99 $</h6>
							<p class="pt-1">Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, sapiente illo. Sit error voluptas repellat rerum quidem, soluta enim perferendis voluptates laboriosam. Distinctio, officia quis dolore quos sapiente tempore alias.</p> --%>
						</div>
<%-- Review TAB --%>
						<div class="tab-pane fade" id="reviewTab"  aria-labelledby="reviews-tab" style="text-color:black;">

							<c:forEach var="reviewList" items="${reviewList}">
								<%-- 	forEach 밖에서도 인식할 수 있도록 변수에 값을 할당 --%>
								<c:set var="review_name" value="${reviewList.name}" />
								<table style="width:1066px;font-size:1.2em;">
									<tr>
										<td  style="width: 20%; heigth: 20%">
											<div class="card"  style="border:none;display:inline-block;">
												<span class="card-text" style="font-weight: bold;font-size:1.3em;">${reviewList.name}</span><br/>
											<c:choose>
												<c:when test="${reviewList.review_star == 1}">
													<div>
														<i class="fas fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
													</div>
												</c:when>
												<c:when test="${reviewList.review_star == 2}">
												<div>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													</div>
												</c:when>
												<c:when test="${reviewList.review_star == 3}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
												<c:when test="${reviewList.review_star == 4}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
												<c:when test="${reviewList.review_star == 5}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
											</c:choose>
											<%-- 	<img src="${contextPath}/image/${reviewList.review_image}"
														class="reviewImage" alt="review_Image"> --%>
												<div class="card-text">${reviewList.created_at}</div>			
											</div>
										</td>
								
										<td style="width: 65%; heigth: 20%;">
											<div class="card-text">${reviewList.content}</div>
										</td>
											<td  style="width: 15%; heigth: 20%;" id="btnUpDel">
												<c:if test="${not empty memberDTO}" >
													<%-- 	<span class="card-text">${reviewList.view_count}</span><br/> --%>
														<button type="button" class="btn btn-primary modifyBtnUp" data-toggle="modal" value="${reviewList.review_id}"  style="cursor:pointer;display:inline-block;">수정</button>
														<button type="button" class="btn btn-primary modifyBtnDel" data-toggle="modal"  value="${reviewList.review_id}" style="cursor:pointer;display:inline-block;">삭제</button>
												</c:if>
											</td>
									</tr>
								</table>
							<hr/>
							</c:forEach>
							<div>
						  		<div style="display: block; text-align: center;font-size:1.3em;">		
									<c:if test="${reviewPage.startPage>5}">
										<a onclick="javascript:rvPrevPaging('${reviewPage.startPage-5}');">&lt;&lt;</a>
									</c:if>
									<c:forEach begin="${reviewPage.startPage}" end="${reviewPage.endPage}" var="reviewP">
										<c:choose>
											<c:when test="${reviewP == reviewPage.currentPage }">
												<b>${reviewP}</b>
												<input type="hidden" id="getCurrentPage" value="${reviewP}"/>
											</c:when>
											<c:when test="${reviewP != reviewPage.currentPage }">
												<a onclick="javascript:rvPaging('${reviewP}');">${reviewP}</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${reviewPage.endPage < reviewPage.totalPages}">
										<a onclick="javascript:rvNextPaging('${reviewPage.startPage+5}');">&gt;</a>
										<a onclick="javascript:rvTotalPage('${reviewPage.totalPages}');">&gt;&gt;</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Classic tabs -->

			</div>
		</div>
	</div>
	

<%-- update 파트----------------------------------------------------------------- --%>
	<%--  모달 창 --%>
	<%-- The Modal --%>

<div class="modal fade" id="update">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<div class="container">
		
		  <h2>리뷰 글 수정</h2>
		
		  <form class="needs-validation" novalidate>
			    <div class="form-group">
			      <label for="reviewName">리뷰 내용:</label>
			      <br/>	
			      <br/>
			  	  <br/>
			      <textarea class="form-control" rows="5" id="updateReview" name="content"  placeholder="리뷰 입력"  required></textarea>
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">내용을 입력하세요.</div>
			    </div>
			    <div class="form-group">
			      <label for="reviewName">상품평:</label>
			      <select class="form-control" id="modifyReview_star" name="review_star">
			         <option value="1">★☆☆☆☆</option>
			        <option value="2">★★☆☆☆</option>
			        <option value="3">★★★☆☆</option>
			        <option value="4">★★★★☆</option>
			        <option value="5">★★★★★</option>
			      </select>
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">
			        별점을 입력하세요.<br/>
			      </div>
			      <input type="hidden" id = "modifyReviewId" name="review_id" />
			
			    </div>
			   
			      <!-- Modal footer -->
			    <div class="modal-footer">
			      <input type="button" class="btn btn-danger" value="수정" id="reviewUpSub"/>
			      <input type="reset" class="btn btn-danger" />
			      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			    </div>
			
			  </form>
			  
				</div>
			</div>
		</div>
	</div>
</div>

	
	
	
	<!--Section: Block Content-->
	
	
	<!--===============================================================================================-->
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
	<script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
	<script>
		$('#lightSlider').lightSlider({
			gallery : true,
			item : 1,
			loop : true,
			auto : true,
			speed : 900,
			slideMargin : 0,
			thumbItem : 5,
			adaptiveHeight : true,
			vertical : true,
			verticalHeight : 450,
			pause : 2000,
			pager : true,
			currentPagerPosition : 'middle',
			slideEndAnimation : true
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.your-class').slick({
				autoplay : true

			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/bootstrap/js/popper.js"></script>
	<%-- 	<script src="${contextPath}/resources/main/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/slick/slick.min.js"></script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js_name_detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

	$(".js-addcart-detail").click(()=>{
		$.ajax({
			url: "${contextPath}/cart/addCart.do",
			type : "GET",
			data :{
				product_id : ${detailUserProductMap.userProductDTO.product_id},
				cart_product_amount : $("#cart_product_amount").val()
			},
			dataType : "text",
			success : function(){
				var nameProduct = $(".js-addcart-detail").parent().parent().parent().find('.js_name_detail').html();
				swal(nameProduct, "장바구니에 상품을 담았습니다.", "success");
			},
			error : function(){
				swal('Login', '로그인 후 이용 가능합니다.', 'error');
			
			}
		});
	});

	$(".js_order_detail").click(()=>{
		if(${isLogin} == false)
		{
			swal('Login', '로그인 후 이용 가능합니다.', 'error');
		}
		else
		{
			var cart_product_amount = $("#cart_product_amount").val();
			window.location='${contextPath}/orders/directOrdersForm.do?product_id=' +${detailUserProductMap.userProductDTO.product_id} + '&cart_product_amount=' + cart_product_amount;
		}
	});

	</script>
	<!--===============================================================================================-->

	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/js/main.js"></script>
	<!--===============================================================================================-->
	<script>
	 var product_id = $("#getProduct_id").val();
	 var email = $("#getEmail").val();
	
	//로그인 검사 & 문의 글 작성폼 보여주기
	$(document).on('click','.islogin',function(){
		
		var product_name = $(".js_name_detail").text();
		
	 	if(${isLogin}){
	 		$("#email").val(email);
	 		$("#product_name").val(product_name);
	 		$("#writeModal").modal("show");
	 	}else{
	 		alert('로그인 후 문의 글을 남겨주세요.');
	 		$("#writeModal").modal("hide");
	 	}
	});
	
	//문의 글창 다시쓰기 버튼
	$(document).on("click",".reset",function(){
		$("#content").val("");
		$("#is_locked").prop("checked", false);
		$("#modifyIs_locked").prop("checked", false);
 	});
	
	//비공개 설정여부
	$("#is_locked").click(function(){

		if($(this).is(":checked"))
			$(this).val(1);
		else
			$(this).val(0);
	});
	
	//수정창에서 비공개 설정여부	
	$("#modifyIs_locked").click(function(){

		if($(this).is(":checked"))
			$(this).val(1);
		else
			$(this).val(0);
	});

	//문의 글 작성	
	$(document).on('click','#writeBtn',function(){
			
			/* var product_id = $("#getProduct_id").val(); */
			var content = $("#content").val();
			var email = $("#email").val();
			var member_id = $("#member_id").val();
			var is_locked;
			if($("#is_locked").is(":checked")){
				is_locked = 1;
			}else{
				is_locked = 0;
			}
			
			$.ajax({
				url:"${contextPath}/qna/writeQna.do",
				type:"post",
				datatype:"text",
				data:{"content":content,
					  "email":email,
					  "is_locked":is_locked,
					  "member_id":member_id,
					  "product_id":product_id},
				success:function(json){
					
					alert('문의 글이 등록되었습니다.');
					$("#bodyWrap").load("${contextPath}/qna/qnaList.do?product_id="+product_id+" #qna");
					$("#content").val("");
					$("#email").val("");
					$("#is_locked").prop("checked", false);
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
					$("#writeModal").modal("hide");
	}); 
	
	//문의 글 수정폼 보여주기
	$(document).on('click','.modifyFormBtn',function(e){
		var dqa_id = e.target.value;
		var product_name = $(".js_name_detail").text();
		
		$.ajax({
			url:"${contextPath}/qna/modifyForm.do",
			type:"post",
			data:{"qa_id":dqa_id},
			datatype:"json",
			success:function(json){
				$("#modifyContent").val(json["content"]);
				$("#modifyEmail").val(json["email"]);
				$("#modifyQa_id").val(json["qa_id"]);
				$("#modifyProduct_name").val(product_name);
				
				if(json["is_locked"]==1){
					$("#modifyIs_locked").prop("checked", true);
				}else{
					$("#modifyIs_locked").prop("checked", false);
				}
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		 $("#modifyModal").modal('show');
	});
	
	//문의 글 수정하기
	$(document).on('click','#modifyBtn',function(){
		var page = $("#currentPage").val();	
		/* var product_id = $("#getProduct_id").val(); */
		
		var content = $("#modifyContent").val();
		var qa_id = $("#modifyQa_id").val();
		var is_locked;
		if($("#modifyIs_locked").is(":checked")){
			is_locked = 1;
		}else{
			is_locked = 0;
		}
		
		$.ajax({
			url:"${contextPath}/qna/modifyQna.do",
			type:"post",
			data:{"content":content,
				  "is_locked":is_locked,
				  "qa_id":qa_id},
			success:function(){
				alert("문의 글을 수정했습니다.")
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
				$("#content").val("");
				$("#email").val("");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
				$("#modifyModal").modal("hide");
		
	});
	
	
	//답글 작성
	var bbb=0;
	$(document).on('click','.cmt',function(){
			
		/* var product_id = $("#getProduct_id").val(); */
		bbb = $(".cmt").index(this);	
		for(j=0;j<$(".cmt").length;j++){
			$(".form").eq(j).css('display','none');
		}
			$(".form").eq(bbb).css('display','block');
		
	}); 
	
	$(document).on('click','.btnWrite',function(){
		var i = bbb;
		var page = $("#currentPage").val();
		var content = $(".cmtcontent").eq(i).val();
		var qa_id = $(".qa_id").eq(i).val();
		var member_id = $(".member_id").eq(i).val();
		
		$.ajax({
			url:"${contextPath}/qna/writeComment.do",
			type:"post",
			datatype:"json",
			data:{"content":content,
				  "qa_id":qa_id,
				  "member_id":member_id},
			success:function(json){
				
				alert("답변이 등록되었습니다.");		
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
				$(".writeResult").eq(i).css('display','block');
				$(".writeCmt").eq(i).css('display','none');
				
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
	});
	
	
	
	var aaa;
	//답글 수정
 	$(document).on('click','.modifyCmt',function(){
 		
 		/* var product_id = $("#getProduct_id").val(); */
		aaa = $(".modifyCmt").index(this);	
	
		for(j=0;j<$(".modifyCmt").length;j++){
			$(".modifyForm").eq(j).css('display','none');
			$(".modifyCmt").eq(j).css('visibility','visible');
		}
			$(".modifyForm").eq(aaa).css('display','block');
			$(".modifyCmt").eq(aaa).css('visibility','hidden');
			
	});
	
 	$(document).on('click','.btnModify',function(){

 		var i = aaa;
 		var page = $("#currentPage").val();
		var cmtContent = $(".modifyCmtContent").eq(i).val();
		var qa_comment_id = $(".qa_comment_id").eq(i).val();
		
		$.ajax({
			url:"${contextPath}/qna/modifyComment.do",
			type:"post",
			datatype:"json",
			data:{"content":cmtContent,
				  "qa_comment_id":qa_comment_id},
			success:function(json){
				
				alert("답변이 수정되었습니다.");	
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
				$(".modifyResult").eq(i).css('display','block');
				$(".modifyForm").eq(i).css('display','none');
				
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
	</script>
	<script>
	var product_id = $("#getProduct_id").val();
 	
	//페이징
	function paging(page){
		$.ajax({
			url:"${contextPath}/qna/qnaList.do",
			type:"post",
			data:{"currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	function nextPaging(page){
		$.ajax({
			url:"${contextPath}/qna/qnaList.do",
			type:"post",
			data:{"currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	function totalPage(page){
		$.ajax({
			url:"${contextPath}/qna/qnaList.do",
			type:"post",
			data:{"currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	function prevPaging(page){
		$.ajax({
			url:"${contextPath}/qna/qnaList.do",
			type:"post",
			data:{"currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};

	//문의글 삭제
	function deleteQna(qa_id,page){
		$.ajax({
			url:"${contextPath}/qna/deleteQna.do",
			type:"post",
			data:{"qa_id":qa_id,
				  "currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};

	//답글 삭제
	function deleteComment(qa_comment_id,page){
		 $.ajax({
			url:"${contextPath}/qna/deleteComment.do",
			type:"post",
			data:{"qa_comment_id":qa_comment_id,
				  "currentPage":page,
				  "product_id":product_id},
			success:function(){
				$("#bodyWrap").load("${contextPath}/qna/qnaList.do?currentPage="+page+"&product_id="+product_id+" #qna");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	</script>
	<!--===============================================================================================-->
	<!-- 준성님==========================================================================================-->
	<script>
	var product_id = $("#getProduct_id").val();
	//var currentPage = $("#getCurrentPage").val();

	function rvPaging(page){
		
			$.ajax({
				url:"${contextPath}/review/reviewList.do",
				type:"post",
				data:{"currentPage":page,
							"product_id":product_id},
				success:function(){
					$("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+page+"&product_id="+product_id+" #reviewTable");
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	};
	
	
	
	function rvNextPaging(page){
		$.ajax({
			url:"${contextPath}/review/reviewList.do",
			type:"post",
			data:{"currentPage":page,
						"product_id":product_id},
			success:function(){
				$("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+page+"&product_id="+product_id+" #reviewTable");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	function rvTotalPage(page){
		$.ajax({
			url:"${contextPath}/review/reviewList.do",
			type:"post",
			data:{"currentPage":page,
						"product_id":product_id},
			success:function(){
				$("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+page+"&product_id="+product_id+" #reviewTable");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	function rvPrevPaging(page){
		$.ajax({
			url:"${contextPath}/review/reviewList.do",
			type:"post",
			data:{"currentPage":page,
						"product_id":product_id},
			success:function(){
				$("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+page+"&product_id="+product_id+" #reviewTable");
			},
			error:function(request, error){
				alert('err');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	};

	</script>

<script>

	
$(document).on('click','.modifyBtnUp',function(e){

	var product_id = $("#getProduct_id").val();
	var currentPage = $("#getCurrentPage").val();
   var reviewId = e.target.value;
 	//alert(reviewId);
   $.ajax({
      url:"${contextPath}/review/updateForm.do",
      type:"post",
      data:{"review_id":reviewId},
      datatype:"json",
      success:function(json){
    	//  alert('?');
         $("#updateReview").val(json["content"]);
         $("#modifyReviewId").val(json["review_id"]);
         $("#review_star1").val(json["review_star"]);
         if(json["review_star"]==1){
        	 $("#modifyReview_star option:eq(0)").prop("selected",true);
         }else if(json["review_star"]==2){
        	 $("#modifyReview_star option:eq(1)").prop("selected",true);
         }else if(json["review_star"]==3){
        	 $("#modifyReview_star option:eq(2)").prop("selected",true);
         }else if(json["review_star"]==4){
        	 $("#modifyReview_star option:eq(3)").prop("selected",true);
         }else if(json["review_star"]==5){
        	 $("#modifyReview_star option:eq(4)").prop("selected",true);
         }
	
         $("#update").modal("show");
      },
      error:function(request, error){
         alert('err');
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   });
   
});


$(document).on('click','#reviewUpSub',function(){

	var product_id = $("#getProduct_id").val();
	var currentPage = $("#getCurrentPage").val();
	var modifyReviewId =$("#modifyReviewId").val();
	var updateReview =$("#updateReview").val();
	var modifyReview_star =$("#modifyReview_star").val();
	
	   $.ajax({
	      url:"${contextPath}/review/update.do",
	      type:"post",
	      data:{"review_id":modifyReviewId,"content":updateReview,"review_star":modifyReview_star},
	      success:function(){
	    	//  alert("성공");
	         $("#update").modal("hide");
	        // window.location.reload(true);
			$("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+currentPage+"&product_id="+product_id+" #reviewTable");

	      },
	      error:function(request, error){
	         alert('err');
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	   });
	   
	});

$(document).on('click','.modifyBtnDel',function(e){

	var product_id = $("#getProduct_id").val();
	var currentPage = $("#getCurrentPage").val();
	   var reviewId = e.target.value;
	 //	alert(reviewId);
	   $.ajax({
	      url:"${contextPath}/review/delete.do",
	      type:"post",
	      data:{"review_id":reviewId},
	      success:function(){
	         alert('삭제되었습니다');
	         //window.location.reload(true);
	         $("#reviewTab").load("${contextPath}/review/reviewList.do?currentPage="+currentPage+"&product_id="+product_id+" #reviewTable");
	      },
	      error:function(request, error){
	         alert('err');
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	   });
	   
}); 


</script>  
	
	
	
	
	

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min integrity="sha384-DfXdz2htPH0lsSSs5.js"nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> -->
</body>
</html>
