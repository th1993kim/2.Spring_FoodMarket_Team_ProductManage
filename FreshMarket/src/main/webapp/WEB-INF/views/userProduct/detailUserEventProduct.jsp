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
		<div class="row no-gutters">
			<!-- 			<div class="col-md-12 pr-6"> -->
			<div class="col-md-6 pr-2">
				<div class="card">
					<div class="demo">
						<ul id="lightSlider">
							<c:forEach var="item" items="${detailEventProductImageList}" varStatus="status">
								<li class="img-thumbnail" data-thumb="${detailUserEventProductMap.eventProductJoinDTO.product_detail_path}${item}"><img class="img-thumbnail" src="${detailUserEventProductMap.eventProductJoinDTO.product_detail_path}${item}" /></li>
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
						<span class="font-weight-bold js_name_detail">${detailUserEventProductMap.eventProductJoinDTO.event_product_name}</span>
						<h3 class="font-weight-bold text-primary font-weight-bolder">
							<span>&#x20A9;</span>
							<fmt:formatNumber value="${detailUserEventProductMap.eventProductJoinDTO.event_product_price}" type="number" var="product_price" />
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
						<li class="nav-item"><a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews (1)</a></li>
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
							<c:forEach var="item" items="${detailEventProductImageList}" varStatus="status">
								<img src="${detailUserEventProductMap.eventProductJoinDTO.product_detail_path}${item}" class="rounded mx-auto d-block" width="10%" alt="">
								<br>
							</c:forEach>
							<!-- 							<img src=".\img\Coupang_apple\info_product2.jpg" class="rounded mx-auto d-block" width="10%" alt=""> <br>
							<img src=".\img\Coupang_apple\info_product3.jpg" class="rounded mx-auto d-block" width="10%" alt=""> -->
						</div>
<%-- QnA TAB --%>
						<div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description-tab">

						</div>	

<%-- Review TAB --%>
						<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">

						</div>
					</div>
				</div>
				<!-- Classic tabs -->

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

	$(".js-addcart-detail").click(()=>{
		$.ajax({
			url: "${contextPath}/cart/eventAddCart.do",
			type : "GET",
			data :{
				event_product_id : ${detailUserEventProductMap.eventProductJoinDTO.event_product_id},
				product_id : ${detailUserEventProductMap.eventProductJoinDTO.product_id},
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
			window.location='${contextPath}/orders/eventDirectOrdersForm.do?event_product_id=' +${detailUserEventProductMap.eventProductJoinDTO.event_product_id} + '&cart_product_amount=' + cart_product_amount;
		}
	});

	</script>
	<!--===============================================================================================-->

	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/js/main.js"></script>
	<!--===============================================================================================-->

	<!--===============================================================================================-->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min integrity="sha384-DfXdz2htPH0lsSSs5.js"nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> -->
</body>
</html>