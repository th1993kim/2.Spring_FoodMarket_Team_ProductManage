<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%-- tiles를 사용하기위한 taglib
지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%-- jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.text.*" %>

	<%
      Calendar cal = Calendar.getInstance();

      int intNextDayOfWeek = cal.get(Calendar.DAY_OF_WEEK) + 1;

      String strNextDayOfWeek = "";
      switch(intNextDayOfWeek){
         case 1:
            strNextDayOfWeek = "일요일";
            break;
         case 2:
            strNextDayOfWeek = "월요일";
            break;
         case 3:
            strNextDayOfWeek = "화요일";
            break;
         case 4:
            strNextDayOfWeek = "수요일";
            break;
         case 5:
            strNextDayOfWeek = "목요일";
            break;
         case 6:
            strNextDayOfWeek = "금요일";
            break;
         case 7:
            strNextDayOfWeek = "토요일";
            break;
         }
	%>
<c:set var="nextDayOfWeek" value="<%=strNextDayOfWeek %>" />
<c:set var="month" value="<%= cal.get(Calendar.MONTH) + 1 %>" />
<c:set var="day" value="<%= cal.get(Calendar.DATE) %>" />













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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");

body {
	background-color: white;
	font-family: "Poppins", sans-serif
}

.main {
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	width: 90%;
	max-width: 950px;
	margin: auto;
	border-radius: 1rem;
	padding: 4vh 5vh;
	border-bottom-left-radius: 1rem;
	border-top-left-radius: 1rem
}

.main2 {
	box-shadow: 0 1px 5px 0 rgba(0, 0, 0, 0.19);
	width: 90%;
	max-width: 950px;
	margin: auto;
	border-radius: 1rem;
	padding: 4vh 5vh;
	border-bottom-left-radius: 1rem;
	border-top-left-radius: 1rem
}

.sub {
	padding: 5px;
}

hr {
	color: #d4d4d4
}

.btn-payment {
	width: 260px;
	height: 60px;
}

.bullet-text {
	font-size: 12px
}

.card-body {
	padding: 0.3rem 0.3rem 0.2rem
}

.titlebar {
	border: 1px solid black;
}

.title {
	font-weight: 900;
}

.payment {
	border: none;
}

.ordTitle .steps {
    float: right;
    padding-right: 5px;
    margin-top: 20px;
    line-height: 50px;
    font-size: 15px;
    color: #bbb;
    font-weight: bold;
}

.ordTitle .steps em {
    font-weight: bold;
    color: #346aff;
}

.top-menu-number{
  font-size: 25px;
  color:grey;
}

.top-menu{
  font-size: 20px;
  color:gray;
}

.special-sign{
  font-size: 20px;
  color:gray;
}

.top-menu-number-current{
  font-size: 25px;
  color:rgb(0, 132, 255);
  font-weight: bolder;
}

.top-menu-current{
  font-size: 20px;
  color:black;
  font-weight: bolder;
}

.aa{
	display:inline;
}
</style>
<title>주문결제</title>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->

<!-- 			cartMap.put("memberDTO", memberDTO);
			cartMap.put("listCart", listCart);                // 장바구니 정보를 map에 저장
			cartMap.put("cartCount", listCart.size());        // 장바구니 상품의 유무
			cartMap.put("totalProductCount", totalProductCount);
			cartMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			cartMap.put("fee", fee);                 // 배송금액
			cartMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("cartMap", cartMap);            // map 변수 저장 -->

<body>
	<div class="container mt-2 mb-3">
		<div class="card main">
			<div class="row no-gutters">
				<div class="col-md-12 pr-2 mt-4">
					<h2 class="titlemain">주문/결제</h2>
		              <div class="d-flex justify-content-end">
		                <ul class="top-menu-list">
		                  <li class="aa"><span class="top-menu-number">01</span><span class="top-menu"> 장바구니 </span><i class="fas fa-angle-right special-sign"></i></li>
		                  <li class="aa"><span class="top-menu-number-current">02</span><span class="top-menu-current"> 주문/결재 </span><i class="fas fa-angle-right special-sign"></i></li>
		                  <li class="aa"><span class="top-menu-number">03</span><span class="top-menu"> 주문완료 </span><i class="fas fa-angle-right special-sign-current"></i></li>
					  	</ul>
		              </div>
					<hr class="titlebar">
					<div class="subtitle mt-4">
						<h5 class="subtitle1">구매자 정보</h5>
					</div>
					<div class="card mb-5 mt-3 sub">
						<div class="row">
							<div class="col-sm-2 text-center mt-2 ">
								<span class="title">이름</span>
							</div>
							<div class="col-sm-4 mt-2" id="billName" value="${eventDirectOrderMap.memberDTO.name}">${eventDirectOrderMap.memberDTO.name}</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 text-center">
								<span class="title">이메일</span>
							</div>
							<div class="col-sm-4">${eventDirectOrderMap.memberDTO.email}</div>
						</div>
						<input type="hidden" id="billAddress" value="${eventDirectOrderMap.memberDTO.address}"/>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 text-center mb-2">
								<span class="title">휴대폰 번호</span>
							</div>
							<div class="col-sm-4 mb-2" id="billPhone" value=""></div>
						</div>
					</div>
					<div class="d-flex justify-content-between subtitle mt-4">
						<div class="float-left">
							<h5 class="subtitle1">받는 사람 정보</h5>
						</div>
						<div class="float-right form-check">
							<input class="form-check-input" type="checkbox" value="" id="sameAddressControl" unchecked>
							<label class="form-check-label" for="sameAddressControl">
								회원정보와 동일
							</label>
						</div>
					</div>
<form action="orders/ordersProcess" method="POST" >
					<div class="card mb-5 mt-3 sub">
						<!--<div class="row">
                    <div class="col-sm-12">
                      <h4>받는사람정보</h4>
                    </div>
                  </div>
                  <hr class="bar-main">-->
						<div class="row">
							<div class="col-sm-2 text-center mt-3">
								<span class="title">이름</span>
							</div>
							<div class="col-sm-4 mt-2 shippingInfo">
								<input type="text" id="receiver_name" name="receiver_name" class="form-control" placeholder="받는사람 이름" value="">
							</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 mt-2 text-center">
								<span class="title">배송주소</span>
							</div>
							<div class="col-sm-4 shippingInfo">
								<input type="text" id="receiver_address" name="receiver_address" class="form-control" placeholder="배송 주소" value="">
							</div>
							<div class="col-sm-2 shippingInfo">
								<button type="button" id="addressSearch_btn" class="btn btn-outline-secondary" onclick="execDaumPostcode()" >검색</button>
							</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 mt-2 text-center">
								<span class="title">휴대폰 번호</span>
							</div>
							<div class="col-sm-4 shippingInfo">
								<input type="text" id="receiver_phone" name="receiver_phone" class="form-control" placeholder="01000000000" value="">
							</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 mt-2 text-center">
								<span class="title">배송 요청사항</span>
							</div>
							<div class="col-sm-4 mb-3">
								<select id="requestSelect" name="requestSelect" class="form-control">
									<option selected="selected" value="1">문앞</option>
									<option value="2">직접 받고 부재시 문앞</option>
									<option value="3">경비실</option>
									<option value="4">택배함</option>
									<option value="5">직접입력</option>
								</select>
							</div>
							<div class="form-check" >
									<input type="text" class="form-control" id="request" name="request" value=""/>
							</div>
						</div>
					</div>
</form>
<!-- 			cartMap.put("memberDTO", memberDTO);
			cartMap.put("listCart", listCart);                // 장바구니 정보를 map에 저장
			cartMap.put("cartCount", listCart.size());        // 장바구니 상품의 유무
			cartMap.put("totalProductCount", totalProductCount);
			cartMap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
			cartMap.put("fee", fee);                 // 배송금액
			cartMap.put("allSum", sumMoney + fee);    // 주문 상품 전체 금액
			mav.addObject("cartMap", cartMap);            // map 변수 저장 -->




					<div class="subtitle mt-4">
						<h5 class="subtitle1">배송 상품</h5>
					</div>

					<div class="card mb-5 mt-3 pb-3  sub">

						<div class="row">
							<div class="col-sm-12 ml-3 mt-2">
								<span class="title">${nextDayOfWeek} ${month}/${day+1}일 도착 예정</span>
							</div>
						</div>
						<hr class="board">
						<div class="row main2 d-flex flex-row justify-content-between">
							<div class="col-sm-9 orderbox1">
								<span class="title">1.&nbsp;&nbsp;&nbsp;${eventDirectOrderMap.cartDTO.product_name}</span>
							</div>
							<div class="col-sm-2 align-self-center orderbox2">
								<div class="row">수량 ${eventDirectOrderMap.cartDTO.cart_product_amount}개</div>
							</div>
						</div>
					</div>
					<div class="subtitle mt-4">
						<h5 class="subtitle1">결제정보</h5>
					</div>
					<div class="card mb-5 mt-3 sub">
						<div class="row">
							<div class="col-sm-2 text-center mt-2">
								<span class="title">총상품가격</span>
							</div>
							<div class="col-sm-4 mt-2">
								<span>&#x20A9;</span> <strong class="price-value" id="sum_p_price"><fmt:formatNumber value="${eventDirectOrderMap.sumMoney}" type="number" var="sumMoney" />${sumMoney}</strong>원
							</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 text-center">
								<span class="title">배송비</span>
							</div>
							<div class="col-sm-4">
								<span>&#x20A9; </span> <strong class="price-value" id="fee_price"><fmt:formatNumber value="${eventDirectOrderMap.fee}" type="number" var="delivery_fee" />${delivery_fee}</strong>원
							</div>
						</div>
						<hr class="board">
						<div class="row">
							<div class="col-sm-2 text-center">
								<span class="title">총결제금액</span>
							</div>
							<div class="col-sm-4 mb-2">
								<span>&#x20A9;</span> <strong class="price-value" id="sum_all_price"><fmt:formatNumber value="${eventDirectOrderMap.allSum}" type="number" var="allSum" />${allSum}</strong>원
							</div>
						</div>
					</div>
					<div class="card mb-5 mt-5 payment">
						<div class="text-center mb-3">위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다. </div>
						<div class="row">
							<div class="col-sm-12 text-center">
								<button type="button" class="btn btn-primary btn-lg btn-payment" id="js_order_pay">결재하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Section: Block Content-->
	<!------ Include the above in your HEAD tag ---------->
<body>








	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!--===============================================================================================-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!--===============================================================================================-->
<!-- 백업 pay-order.txt -->
<script>
	$("#js_order_pay").click(()=>
	{
		if(${isLogin} == false)
		{
			swal('Login', '로그인 후 이용 가능합니다.', 'error');
		}
		else
		{
			var phone = "${cartMap.memberDTO.phone}";
			var phoneHypen = phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp56362602'); 
	        IMP.request_pay({
	            pg: 'inicis',
	            /* 
	                'kakao':카카오페이, 
	                html5_inicis':이니시스(웹표준결제)
	                    'nice':나이스페이
	                    'jtnet':제이티넷
	                    'uplus':LG유플러스
	                    'danal':다날
	                    'payco':페이코
	                    'syrup':시럽페이
	                    'paypal':페이팔
	                */
	            pay_method: 'card',
	            /* 
	                'samsung':삼성페이, 
	                'card':신용카드, 
	                'trans':실시간계좌이체,
	                'vbank':가상계좌,
	                'phone':휴대폰소액결제 
	            */
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name: '${eventDirectOrderMap.memberDTO.name}',
	            //결제창에서 보여질 이름
	            amount: ${eventDirectOrderMap.allSum}, 
	            //가격 
	            buyer_email: '${eventDirectOrderMap.memberDTO.email}',
	            buyer_name: '${eventDirectOrderMap.memberDTO.name}',
	            buyer_tel: phoneHypen,
	            buyer_addr: '${eventDirectOrderMap.memberDTO.address}',
	            buyer_postcode: '',
	            m_redirect_url: '${contextPath}/orders/directOrdersProcess.do'
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
	                alert(msg);
	                
	                var obj1 = document.getElementsByName('receiver_name')[0].value;
	                var obj2 = document.getElementsByName('receiver_address')[0].value;
	                var obj3 = document.getElementsByName('receiver_phone')[0].value;
	                var obj4 = document.getElementsByName('requestSelect')[0].value;
	                var obj5 = document.getElementsByName('request')[0].value;
	                
	                var form = document.createElement("form");
	                form.setAttribute("charset", "UTF-8");
	                form.setAttribute("method", "Post"); // Get 또는 Post 입력
	                form.setAttribute("action", "${contextPath}/orders/directOrdersProcess.do");

	                var hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "receiver_name");
	                hiddenField.setAttribute("value", obj1);
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "receiver_address");
	                hiddenField.setAttribute("value", obj2);
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "receiver_phone");
	                hiddenField.setAttribute("value", obj3);
	                form.appendChild(hiddenField);
                
	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "requestSelect");
	                hiddenField.setAttribute("value", obj4);
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "request");
	                hiddenField.setAttribute("value", obj5);
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "delivery_price");
	                hiddenField.setAttribute("value", ${eventDirectOrderMap.fee});
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "product_id");
	                hiddenField.setAttribute("value", ${eventDirectOrderMap.cartDTO.product_id});
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "event_product_id");
	                hiddenField.setAttribute("value", ${eventDirectOrderMap.cartDTO.event_product_id});
	                form.appendChild(hiddenField);

	                var obj6 = "${eventDirectOrderMap.cartDTO.product_name}";

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "product_name");
	                hiddenField.setAttribute("value", obj6);
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "cart_product_price");
	                hiddenField.setAttribute("value", ${eventDirectOrderMap.cartDTO.cart_product_price});
	                form.appendChild(hiddenField);

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "cart_product_amount");
	                hiddenField.setAttribute("value", ${eventDirectOrderMap.cartDTO.cart_product_amount});
	                form.appendChild(hiddenField);

	                var obj7 = "${eventDirectOrderMap.cartDTO.product_img_path}";

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "product_img_path");
	                hiddenField.setAttribute("value", obj7);
	                form.appendChild(hiddenField);

	                var obj8 = "${eventDirectOrderMap.cartDTO.product_img_name}";

	                hiddenField = document.createElement("input");
	                hiddenField.setAttribute("type", "hidden");
	                hiddenField.setAttribute("name", "product_img_name");
	                hiddenField.setAttribute("value", obj8);
	                form.appendChild(hiddenField);

	                document.body.appendChild(form);
	                form.submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                alert(msg);
	            }
	        });
		}
	});
</script>
<script>
$(function(){
       $('#sameAddressControl').click(function(){
         var same = this.checked;
         $('#receiver_name').val(same ? $('#billName').text():'');
         $('#receiver_address').val(same ? $('#billAddress').val():'');
         $('#receiver_phone').val(same ? $('#billPhone').val():'');

         if(same == true){
         		$('.shippingInfo input').filter('input:text')
   	  		.attr('readonly',true)
    	 		.css('opacity', 0.5);
     		   $('#addressSearch_btn').hide();
    		 }else{
    		   $('.shippingInfo input').filter('input:text').attr('readonly',false)
    	 		.css('opacity', 1);
     		   $('#addressSearch_btn').show();
    		 }
       });
     });
</script>

<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("receiver_address").value = addr;
        }
    }).open();
}
</script>


<script>
$(document).ready(function() {
  var phone = "${eventDirectOrderMap.memberDTO.phone}";
  var phoneHypen = phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  $("#billPhone").val(phoneHypen);
  $("#billPhone").text(phoneHypen);
 
});
</script>
<script>
$(function(){
$("#request").hide();
$("#requestSelect").change(function() {
		if($("#requestSelect").val() == "5") {
			$("#request").show();
		}  else {
			$("#request").hide();
		}
	})
});
</script>

	<!--===============================================================================================-->
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>

