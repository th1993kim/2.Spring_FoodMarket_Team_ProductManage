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
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <style>
        #body {
           margin-top:10vh;
           margin-bottom:10vh;
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


        .top-line{
          border: 2px solid rgb(0, 132, 255);
        }
        .order-thank-you{
          color:rgb(41, 107, 228);
          font-weight:bolder;
        }
        .order-thank-you2{

          font-weight:bolder;
        }
        .total-order-fee{
            font-size: larger;
            color:rgb(247, 97, 97)
        }
        .coupon-discount{
            color:green
        }
        .order-date{
          color:black;
            font-weight: bolder;
        }
        .order-number{
            color:black;
            font-weight: bolder;
        }

        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        li{
            display:inline;
/*             margin:30px; */
        }

        .main {
             float:inline-block;
             }
            
        .ddd{
             max-width: 1200px;
             width: 100%;
             box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
             border-radius: 1rem;
             border: transparent;
             padding: 30px;

        }

        .table-client-order{
          background-color: rgb(243, 242, 242);
        }
      .table-title{
        font-size: 20px;
        font-weight: bold;
      }

      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");
    </style>
  </head>
  <body>
    <div id="body">
    <div class="container mt-2 mb-3 ddd">
      <div class="row no-gutters">
        <div class="col-md-12">
          <div class="container mb-4 mt-4 main">
            <div class= "row col-md-12">
              <div class="col-md-12 text-left">
                <h1 class="titlemain">주문완료</h1>

              <div class="d-flex justify-content-end">
                <ul class="top-menu-list">
                  <li class="aa"><span class="top-menu-number">01</span><span class="top-menu"> 장바구니 </span><i class="fas fa-angle-right special-sign"></i></li>
                  <li class="aa"><span class="top-menu-number">02</span><span class="top-menu"> 주문/결재 </span><i class="fas fa-angle-right special-sign"></i></li>
                  <li class="aa"><span class="top-menu-number-current">03</span><span class="top-menu-current"> 주문완료 </span><i class="fas fa-angle-right special-sign-current"></i></li>
			  	</ul>
              </div>
              </div>
              <hr/>
            </div>
            <hr class="top-line"/>
            <div class= "row text-center">
              <div class= "col-md-12 mt-4 mb-4">
                <h2 class="mt-4 mb-4">
                  <span class="order-thank-you">주문이 완료</span>
                  <span class="order-thank-you2">되었습니다. 감사합니다!</span>
                </h2>
                <fmt:formatDate var="order_date" value="${ordersDTO.order_date}" pattern="yyyy-MM-dd"/>
					<span class="order-date">주문일: ${order_date}</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="order-number">주문번호: ${ordersDTO.order_id}</span>
                <p class="mt-4">
                  <a
                    class="btn btn-primary btn-lg"
                    href="${contextPath}/userProduct/searchProduct.do?page=1&perPageNum=20&searchWord="
                    role="button"
                    >쇼핑 계속 하기
                  </a>
                </p>
              </div>
            </div>
            <hr />
            
         
          </div>
        </div>
      </div>
        <div class="row no-gutters ccc ml-3">
          <div class="col-sm-5 ml-4 mr-4">
            <h3 class="table-title">받는 사람 정보</h3>
            <table class="table  table-sm  table align-items-center border border-light mt-3 table-client-order ">
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">이름</p></th>
                <th class="col-8 border-top-0"><span class="entered-name mb-2">${ordersDTO.receiver_name}</span></th>
              </tr>
              <tr class="d-flex ">
                <th class="col-4 text-center border-top-0 border-dark  titletable"><p class="mb-2">휴대폰</p></th>
                <th class="col-8 border-top-0"><span class="entered-phone-number mb-2">010-1111-1111</span></th>
              </tr>
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">배송주소</p></th>
                <th class="col-8 border-top-0"><span class="entered-address mb-2">서울 종로구 사직로 161 경복궁</span></th>
              </tr>
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">배송 요청사항</p></th>
                <th class="col-8 border-top-0"><span class="entered-delivery-option mb-2">문 앞</span></th>
              </tr>
            </table>
          </div>
          <div class="col-sm-1 "></div>
          <div class="col-sm-5 ">
            <h3 class="table-title">결제 정보</h3>
            <table class="table table table align-items-center  mt-3 table-client-order  ">
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">주문금액</p></th>
                <th class="col-8 text-right border-top-0"><span class="product-fee mb-2"><span>&#x20A9;</span> <strong class="price-value" id="sum_p_price"><fmt:formatNumber value="${ordersDTO.orders_product_price}" type="number" var="sumMoney" />${sumMoney}</strong>원</th>
              </tr>
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">배송비</p></th>
                <th class="col-8 text-right border-top-0"><span class="delivery-fee mb-2"><span>&#x20A9;</span> <strong class="price-value" id="sum_p_price"><fmt:formatNumber value="${ordersDTO.delivery_price}" type="number" var="delivery_price" />${delivery_price}</strong>원</th>
              </tr>
              <tr class="d-flex ">
                <th class="col-4  text-center border-top-0 border-dark  titletable"><p class="mb-2">총 결재금액</p></th>
                <th class="col-8 text-right border-top-0"><span class="total-order-fee mb-2"><span>&#x20A9;</span> <strong class="price-value" id="sum_p_price"><fmt:formatNumber value="${ordersDTO.order_all_sum}" type="number" var="order_all_sum" />${order_all_sum}</strong>원</th>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js"></script>
    <!--Section: Block Content-->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min integrity="sha384-DfXdz2htPH0lsSSs5.js"nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> -->
  </body>
</html>

