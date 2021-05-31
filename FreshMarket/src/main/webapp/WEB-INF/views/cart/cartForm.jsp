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
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/product/" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/compressed-orderForm_pc.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/sdp2.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/productReview.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/pdpcollection.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/carousel.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/ddp.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/pcPlpBanners.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/todaysection.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/common.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/product/side.css" />
 --%>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="shortcut icon" href="/favicon.ico">
<!-- <script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script> -->


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");

.classic-tabs {
	background-color: #fff;
}

body {
	min-height: 100vh;
	vertical-align: middle;
	background-color: #eee;
	font-family: sans-serif;
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
	/* display: block;
	float: left;
	margin-right: 6px;
	cursor: pointer */
}

img {
	/* display: block; */
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

/* .buttons .btn {
	height: 46px
} */
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
	background-color: #ff7676;
	border-color: #ff7676
}

.buttons .buy:focus, .buy:active {
	color: #fff;
	background-color: #ff7676;
	border-color: #ff7676;
	box-shadow: none
}

.buttons .buy:hover {
	color: #fff;
	background-color: #e86464;
	border-color: #e86464
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
/* 
.card-body {
	padding: 0.3rem 0.3rem 0.2rem
}


body {
    background: #ddd;
    min-height: 100vh;
    vertical-align: middle;
    display: flex;
    font-family: sans-serif;
    font-size: 0.8rem;
    font-weight: bold
}
 */
.title {
	margin-bottom: 5vh
}

.card {
	margin: auto;
	max-width: 1150px;
	width: 90%;
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 1rem;
	border: transparent
}

@media ( max-width :767px) {
	.card {
		margin: 3vh auto
	}
}

.cart {
	background-color: #fff;
	padding: 4vh 5vh;
	border-bottom-left-radius: 1rem;
	border-top-left-radius: 1rem
}

@media ( max-width :767px) {
	.cart {
		padding: 4vh;
		border-bottom-left-radius: unset;
		border-top-right-radius: 1rem
	}
}

.summary {
	background-color: #ddd;
	border-top-right-radius: 1rem;
	border-bottom-right-radius: 1rem;
	padding: 4vh;
	color: rgb(65, 65, 65)
}

@media ( max-width :767px) {
	.summary {
		border-top-right-radius: unset;
		border-bottom-left-radius: 1rem
	}
}

.summary .col-2 {
	padding: 0
}

.summary .col-10 {
	padding: 0
}

.row {
	margin: 0
}

.title b {
	font-size: 1.5rem
}

.main {
	margin: 0;
	padding: 2vh 0;
	width: 100%
}

.col-2, .col {
	padding: 0 1vh
}

/* a {
	padding: 0 1vh
} */

.close {
	margin-left: auto;
	font-size: 0.7rem
}

img {
	width: 3.5rem
}

.back-to-shop {
	margin-top: 4.5rem
}

h5 {
	margin-top: 4vh
}

hr {
	margin-top: 1.25rem
}

/* form {
	padding: 2vh 0
} */

/* select {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1.5vh 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
} */
/* 
input {
	border: 1px solid rgba(0, 0, 0, 0.137);
	padding: 1vh;
	margin-bottom: 4vh;
	outline: none;
	width: 100%;
	background-color: rgb(247, 247, 247)
}
 */
input:focus::-webkit-input-placeholder {
	color: transparent
}

/*  .btn {
	background-color: #000;
	border-color: #000;
	color: white;
	width: 100%;
	font-size: 0.7rem;
	margin-top: 4vh;
	padding: 1vh;
	border-radius: 0
}
 */
/* .btn:focus {
	box-shadow: none;
	outline: none;
	box-shadow: none;
	color: white;
	-webkit-box-shadow: none;
	-webkit-user-select: none;
	transition: none
}
 */
/* .btn:hover {
	color: white
}

a {
	color: black
} */

a:hover {
	color: black;
	text-decoration: none
}

#code {
	background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
	background-repeat: no-repeat;
	background-position-x: 95%;
	background-position-y: center
}

.select-button:hover input ~ .custom-control-input {
	background-color: #ccc;
}

.btn-number {
	background-color: black;
	font-size: 5px;
}

.numberofitem {
	margin-top: 40px;
	font-size: 12px;
}

.cartbox1 {
	width: 80px;
	overflow: hidden;
	word-wrap: break-word;
	text-align: left;
}

.cartbox2 {
	width: 165px;
	overflow: hidden;
	word-wrap: break-word;

}

.cartbox3 {
	display: block;
	width: 120px;
	overflow: hidden;
	word-wrap: break-word;

}

.cartbox4 {
	display: block;
	width: 150px;
	overflow: hidden;
	word-wrap: break-word;

}

.cartbox5 {
	display: block;
	width: 120px;
	overflow: hidden;
	word-wrap: break-word;

}

.cartbox6 {
	display: block;
	width: 70px;
	overflow: hidden;
	word-wrap: break-word;
	text-align: right;
}
.cartWrap{
	margin: 70px auto;
	font-weight: bold;
	font-size: 0.8rem;
}

</style>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<!-- <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
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
</head>
<body class="animsition">
	<div class="card">
		<div class="row">
			<div class="col-md-9 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>장바구니</b>
							</h4>
						</div>
						<div class="col align-self-center text-right text-muted">
							상품종류수 <span id="sum_p_num1">${cartMap.cartCount}</span>
						</div>
					</div>
					<div class="row">
						<div class="col-">
							<!-- 							<form action="/action_page.php">
								<div class="custom-control custom-checkbox select-button ml-2">
									<input type="checkbox" class="custom-control-input" id="main" name="main" onclick="change(this)"> <label class="custom-control-label" for="main"></label> 전체
								</div>
							</form>
 -->
						</div>
					</div>
				</div>



				<div class="row border-top border-bottom">
					<div class="row main d-flex flex-row justify-content-between">
						<div class="col-auto">
							<!--
 							<form action="/action_page.php">
								<div class="custom-control custom-checkbox mb-3 select-button">
									<input type="checkbox" class="custom-control-input" id="sub" name="sub" onclick="change2()"> <label class="custom-control-label" for="sub"></label>
								</div>
							</form>								
 -->
							<input type="hidden" id="product_id${status.count}" name="product_id" value="${item.product_id}" />
						</div>
						<div class="col- cartbox1">
							<div class="row">이미지</div>
						</div>
						<div class="col- d-flex justify-content-center cartbox2">
							<div class="row">상품명</div>
						</div>
						<div class="col- pl-5 cartbox3">
							<div class="row">가격</div>
						</div>
						<div class="col- pl-5 cartbox4">
							<div class="row">수량</div>
						</div>
						<div class="col- d-flex justify-content-center cartbox5">
							<div class="row">합계</div>
						</div>
						<div class="col- cartbox6">
							<div class="row">삭제</div>
						</div>
					</div>
				</div>

				<c:forEach var="item" items="${cartMap.listCart}" varStatus="status">
					<div class="row border-top border-bottom">
						<div class="row main align-items-center">
							<div class="col-auto">
								<!--
 							<form action="/action_page.php">
								<div class="custom-control custom-checkbox mb-3 select-button">
									<input type="checkbox" class="custom-control-input" id="sub" name="sub" onclick="change2()"> <label class="custom-control-label" for="sub"></label>
								</div>
							</form>	
 -->
								<input type="hidden" id="product_id${status.count}" name="product_id" value="${item.product_id}" />
							</div>
							<div class="col- cartbox1">
								<a href="${contextPath}/userProduct/detailUserProduct.do?product_id=${item.product_id}"><img class="img-fluid" src="${item.product_img_path}${item.product_img_name}"></a>
							</div>
							<div class="col- cartbox2">
								<div class="row"><a href="${contextPath}/userProduct/detailUserProduct.do?product_id=${item.product_id}">${item.product_name}</a></div>
							</div>
							<div class="col- cartbox3 text-right">
								<fmt:formatNumber value="${item.cart_product_price}" type="number" var="product_price" />
								<span>&#x20A9;</span> <strong class="p_price price-value justify-content-center align-items-center" id="p_price${status.count}">${product_price}원</strong>
							</div>
							<div class="col- cartbox4">
								<div class="wrap-num-product flex-w m-l-auto m-r-0">
									<span class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m minus" onclick="javascript:basket.changePNum(${status.count});"> <i class="fs-16 zmdi zmdi-minus minus"></i>
									</span> <input class="num_product mtext-104 cl3 txt-center num-product" name="p_num${status.count}" type="text" id="p_num${status.count}" value="${item.cart_product_amount}" onchange="javascript:basket.changePNum2(${status.count});"> 
									<span class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m plus" onclick="javascript:basket.changePNum(${status.count});">
									<i class="fs-16 zmdi zmdi-plus plus"></i>
									</span>
								</div>
							</div>
							<div class="col- cartbox5 text-right">
								<fmt:formatNumber value="${item.cart_product_price*item.cart_product_amount}" type="number" var="cal_product_price" />
								<input type="hidden" name="cal_price${status.count}" class="last_price" value="${item.cart_product_price*item.cart_product_amount}" /> 
								<span>&#x20A9;</span> <strong class="cal_price_text price-value" id="cal_price${status.count}">${cal_product_price}원</strong>
							</div>
							<div class="col- cartbox6 text-right">
								<button class="btn btn-outline-danger p-del" id="del-btn" onclick="javascript:basket.delItem(${status.count});">삭제</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="col-md-3 summary">
				<div>
					<h5>
						<b>전체 합계</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div class="col" style="padding-left: 0;">상품수</div>
					<div class="col- text-right" id="sum_p_num2">${cartMap.totalProductCount}개</div>
				</div>
				<div class="row">
					<div class="col" style="padding-left: 0;">상품금액</div>
					<div class="col- text-right">
						<span>&#x20A9;</span> <strong class="price-value" id="sum_p_price"><fmt:formatNumber value="${cartMap.sumMoney}" type="number" var="sumMoney" />${sumMoney}</strong>원
					</div>
				</div>
				<div class="row">
					<div class="col" style="padding-left: 0;">배송비</div>
					<div class="col- text-right">
						<span>&#x20A9; </span> <strong class="price-value" id="fee_price"><fmt:formatNumber value="${cartMap.fee}" type="number" var="delivery_fee" />${delivery_fee}</strong>원
					</div>
				</div>
				<div class="row">
					<div class="col" style="font-size: 0.8rem; padding-left: 0; color: blue;">***3만원 이상 주문 시 배송비 무료</div>
				</div>
				<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col" style="padding-left: 0;">총주문금액</div>
					<div class="col- text-right">
						<span>&#x20A9;</span> <strong class="price-value" id="sum_all_price"><fmt:formatNumber value="${cartMap.allSum}" type="number" var="allSum" />${allSum}</strong>원
					</div>
				</div>
				<button class="btn btn-primary btn-block" id="js_order_form">구매하기</button>
			</div>
		</div>
	</div>



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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
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
	<script src="${contextPath}/resources/main/js/main.js"></script>
	<!--===============================================================================================-->
	<script>
let basket = 
{
     //재계산
    reCalc: function()
    {
        this.totalCount = 0;
        this.totalPrice = 0;
        document.querySelectorAll('.cal_price_text').forEach(function (priceItem) 
        {
        	var price = priceItem.innerText.replace("원","");
        	price = price.replaceAll(",", "");
        	this.totalPrice += parseInt(price);
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg

        document.querySelectorAll('.num_product').forEach(function (item) 
        {
            var count = parseInt(item.value);
            this.totalCount += count;
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
     //화면 업데이트
    updateUI: function ()
    {
        if(event.target.classList.contains('plus'))
        {
        	this.totalCount += 1;
        }
        else if(event.target.classList.contains('p-del'))
        {
        	
        }
        else if(event.target.classList.contains('minus'))
       	{
        	this.totalCount -= 1;
       	}
        else
       	{
       	
       	}

        document.querySelector('#sum_p_num2').innerText = this.totalCount.formatNumber();
        document.querySelector('#sum_p_price').innerText = this.totalPrice.formatNumber();
        
        var fee_price_value = 0;
        if(this.totalCount > 0)
       	{
            if(this.totalPrice < 30000)
            {
            	fee_price_value = fee_price_value + 2500;
            	this.totalPrice += fee_price_value;
            }
       	}
        
        document.querySelector('#fee_price').innerText = fee_price_value.formatNumber();
		
        document.querySelector('#sum_all_price').innerText = this.totalPrice.formatNumber();
        
        
    },
    //개별 수량 변경
    changePNum: function (pos)
    {
        var item = document.querySelector('input[name=p_num'+pos+']');
        console.log(item);
        
/*         var p_num = parseInt(item.getAttribute('value')); */
        var p_num = parseInt(item.value);
        
        if(event.target.classList.contains('minus') && parseInt(item.value) == 1)
        {
	        item.value = 2;
	        return false;
        }
        var origin_p_num = p_num;
        if(origin_p_num==0){origin_p_num = 1;}
        console.log(p_num);
		var newval = event.target.classList.contains('plus') ? parseInt(item.value)+1 : event.target.classList.contains('minus') ? parseInt(item.value)-1 : event.target.value;

		var priceItem = document.querySelector('input[name=cal_price'+pos+']'); 
        var price = priceItem.getAttribute('value');
 		
        var priceText = document.querySelector('#cal_price'+pos);

        priceItem.value= Math.floor(newval * price / origin_p_num);
		priceText.innerText = parseInt(priceItem.value).formatNumber()+"원";
        //AJAX 업데이트 전송

        var product_id_value = document.querySelector('input[id=product_id'+pos+']').value;
        //객체 생성부분
		var xhr;

        if(event.target.classList.contains('plus'))
        {
        	var process_status_value = "plus";
    		if (window.XMLHttpRequest)
    		{
    		    xhr = new XMLHttpRequest();
    		} 
    		else
    		{
    			xhr = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		 
    		//Ajax구현부분
    		xhr.onreadystatechange = function()
    		{
    		    if (xhr.readyState == 4 && xhr.status == 200)
    		    {
    		         //통신 성공시 구현부분
/*     		    	swal('success', 'ajax 성공.', 'success'); */
    		    }
    		}
    		
    		xhr.open('POST', '${contextPath}/cart/updateInCart.do');

    		// 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
    		xhr.setRequestHeader('Content-type', 'application/json');

    		const data = { "product_id": product_id_value, "process_status": process_status_value};

    		xhr.send(JSON.stringify(data));
   		}
        else if(event.target.classList.contains('minus') && parseInt(item.value) > 1)
        {
        	var process_status_value = "minus";
    		if (window.XMLHttpRequest) {
    		    xhr = new XMLHttpRequest();
    		} 
    		else {
    			xhr = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		 
    		//Ajax구현부분
    		xhr.onreadystatechange = function()
    		{
    		    if (xhr.readyState == 4 && xhr.status == 200)
    		    {
    		         //통신 성공시 구현부분
/*     		    	swal('success', 'ajax 성공.', 'success'); */
    		    }
    		}
    		
    		xhr.open('POST', '${contextPath}/cart/updateInCart.do');

    		// 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
    		xhr.setRequestHeader('Content-type', 'application/json');

    		const data = { "product_id": product_id_value, "process_status": process_status_value};

    		xhr.send(JSON.stringify(data));
   		}

        //전송 처리 결과가 성공이면    
		this.reCalc();
        this.updateUI();
    },
    changePNum2: function(pos)
    {
    	
        var item = document.querySelector('input[name=p_num'+pos+']');
 		var priceItem = document.querySelector('input[name=cal_price'+pos+']');
 		var p_priceItem = document.querySelector('#p_price'+pos);

  		var p_num2 = parseInt(item.getAttribute('value'));
		var newval2 = event.target.value;
        item.value = newval2;
        var p_price = p_priceItem.innerText;
    	p_price = p_price.replace("원","");
    	p_price = p_price.replaceAll(",", "");
        
 		var priceText2 = document.querySelector('#cal_price'+pos);
		priceItem.value= newval2 * p_price;
		priceText2.innerText = parseInt(priceItem.value).formatNumber()+"원";
        
        var product_id_value2 = document.querySelector('input[id=product_id'+pos+']').value;

		
    	var process_status_value2 = "input";
		if (window.XMLHttpRequest)
		{
		    xhr = new XMLHttpRequest();
		} 
		else
		{
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
		 
		//Ajax구현부분
		xhr.onreadystatechange = function()
		{
		    if (xhr.readyState == 4 && xhr.status == 200)
		    {
		         //통신 성공시 구현부분
     		    	swal('success', 'ajax 성공.', 'success');
		    }
		}
		
		xhr.open('POST', '${contextPath}/cart/updateInCart.do');

		// 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
		xhr.setRequestHeader('Content-type', 'application/json');

		const data = { "product_id": product_id_value2, "process_status": process_status_value2, "cart_product_amount": newval2};

		xhr.send(JSON.stringify(data));
		
		this.reCalc();
        this.updateUI();
    },
    
    delItem: function (pos)
    {
        
        var product_id_value = document.querySelector('input[id=product_id'+pos+']').value;
        //객체 생성부분
		var xhr;
        if(event.target.classList.contains('p-del'))
        {
        	var process_status_value = "p-del";
    		if (window.XMLHttpRequest) {
    		    xhr = new XMLHttpRequest();
    		} 
    		else
    		{
    			xhr = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		 
    		//Ajax구현부분
    		xhr.onreadystatechange = function()
    		{
    		    if (xhr.readyState == 4 && xhr.status == 200)
    		    {
    		         //통신 성공시 구현부분
/*      		    	swal('success', 'ajax 성공.', 'success'); */
    		    }
    		}
    		
    		xhr.open('POST', '${contextPath}/cart/updateInCart.do');

    		// 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
    		xhr.setRequestHeader('Content-type', 'application/json');

    		const data = { "product_id": product_id_value, "process_status": process_status_value};

    		xhr.send(JSON.stringify(data));
   		}
        

        event.target.parentElement.parentElement.parentElement.remove();
        var sum_p_num = document.querySelector('#sum_p_num1').innerText;
        document.querySelector('#sum_p_num1').innerText = parseInt(sum_p_num) - 1;
		this.reCalc();
        this.updateUI();
    }
}

Number.prototype.formatNumber = function()
{
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};
</script>
	<!--===============================================================================================-->
	<script src="${contextPath}/resources/main/vendor/sweetalert/sweetalert.min.js"></script>
	<!--===============================================================================================-->

	<script>
	$("#js_order_form").click(()=>
	{
		if(${isLogin} == false)
		{
			swal('Login', '로그인 후 이용 가능합니다.', 'error');
		}
		else
		{
			window.location='${contextPath}/orders/ordersForm.do';
		}
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

