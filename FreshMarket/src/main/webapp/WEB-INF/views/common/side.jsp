<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
     @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");
.classic-tabs{
  background-color: #fff;
}
/* body {
    background-color: #eee;
    font-family: "Poppins", sans-serif
} */

.card {
    background-color: #fff;
    padding: 14px;
    border: none;

}

.demo {
    width: 100%
}

/* ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom: 0
} */

li {
    display: block;
    margin-right: 6px;
   
}
.card-body {
    padding: 0.3rem 0.3rem 0.2rem
}   

.filter-title {
	display:block;
    font-weight: bold;
}

.star-active {
    color: #FBC02D;
    margin-top: 10px;
    margin-bottom: 10px
}

.star-inactive {
    color: #CFD8DC;
    margin-top: 10px;
    margin-bottom: 10px
}
/* 
.filter1{
    font-size: 12px;
}
 */
.category-link{
    text-decoration: none;
    color: black;
    
}

.category-link:hover{
    text-decoration: none;
    color: black;
    font-weight: 900;
    font-size: 14px;
   
    
}

.stylebox:hover{
    color: black;
    font-weight: 900;
    font-size: 14px;
}

/*input[type=checkbox]:before {background-color: transparent;}
input[type=checkbox]:before {border-color:white;}*/

.checkboxprice{
	max-width:50px;
    width:40px;
    height:30px;
    font-size: 10px;  
}

.buttoncheck{
    font-size:12px;
    height:30px;
}
/* ====================================== */
.accordion {list-style-type:none;padding:0;margin:0;}
.accordion ul {padding:0;margin:0;width: 100%;}
.accordion li {cursor:pointer;list-style-type:none;padding:0;margin:0;width:100%;background:url(menu1depth.gif)}
.accordion li.active > a { background: url('minus.gif') no-repeat 10px 10px; }
.accordion li div {padding:0px;clear:both;float:left;width:100%;}
.accordion a {font-family:돋움;font-size:12px;letter-spacing:-1px;color:#000;padding:0 20px;display:block;cursor:pointer;background:url('plus.gif') no-repeat 10px 10px;height:26px;line-height:26px;}

.accordion li ul li {background: #ccc;font-size:12px;}
.accordion li ul li ul li a{background:#efefef url('dot.gif') no-repeat 20px 10px;padding-left:30px}
/* ====================================== */
/*------------ Color Palette ------------*/
/*
LIGHT ORANGE: #e4644b
DARK ORANGE: #d05942
DARK BROWN: #484141
Menu text: #f7f1e3
Submenu text: #ae9f9f
*/

/*------------ General Settings ------------*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);



/* ====================================== */

.side-width{
	
}

.card-width{
	width:200px;
	display:block;
 	overflow:hidden;
 	word-wrap:break-word;
 	text-align:left;
}

a {
	text-decoration:none;
}

/* 김태현 */
.categoryUL{
	position:relative;
}
.categoryUL a{
	color:black;
}
.categoryUL>a{
	font-size:1.2rem;
	font-weight:750;
}
.categoryUL>li>a:hover{
	text-decoration:none;
	font-weight:660;
}
.middle-category-show{
	border:0px;
	background-color:white;
	font-size:26px;
    position: absolute;
    right: -3px;
    top: -10px;
    color:gray;
}
/* 중분류 카테고리 처음에 숨기기 */
.middle-category-dpNone{
	display:none;
	color:black;
}
.mainCategoryA{
	color:black;
}
.mainCategoryA:hover{
	text-decoration:none;
	color:blue;
}
.seleted-category-color{
	color:#34a853 !important; 
}
.pricePadding{
	padding: 15px;
}
    </style>
    <title>Hello, world!</title>
    <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    <!------ Include the above in your HEAD tag ---------->
    
    <body>
      <div class="container mt-2 mb-3">
          <div class="row no-gutters side-width">
              <div class="col- pr-2">
                <div class="col- card-width">
                    <h6></h6>
                    <hr>	
                    <div class="categoryTab">
						<c:forEach items="${mainCategory}" var="main" >
							<ul class="categoryUL">
								<c:if test="${main.main_id==search.main_id}">
									<a class="mainCategoryA seleted-category-color" href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}&orderBy=${search.orderBy}&perPageNum=${search.perPageNum}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}">${main.main_name}</a>
								</c:if>
								<c:if test="${main.main_id!=search.main_id}">
									<a class="mainCategoryA" href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}&orderBy=${search.orderBy}&perPageNum=${search.perPageNum}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}">${main.main_name}</a>
								</c:if>
								<button class="middle-category-show"><c:if test="${main.main_id==search.main_id}">-</c:if><c:if test="${main.main_id!=search.main_id}">+</c:if></button>
						  		<c:forEach items="${middleCategory}" var="middle">
						  			<c:if test="${main.main_id==middle.main_id}">
						  				<c:if test="${middle.main_id==search.main_id}">
						  					<c:if test="${middle.middle_id==search.middle_id}">
		                            			<li class="middle-category-dpShow"><a href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}&middle_id=${middle.middle_id}&orderBy=${search.orderBy}&perPageNum=${search.perPageNum}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}" class="seleted-category-color">${middle.middle_name}</a></li>
		                            		</c:if>
						  					<c:if test="${middle.middle_id!=search.middle_id}">
		                            			<li class="middle-category-dpShow"><a href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}&middle_id=${middle.middle_id}&orderBy=${search.orderBy}&perPageNum=${search.perPageNum}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}" class="">${middle.middle_name}</a></li>
		                            		</c:if>
		                            	</c:if>
		                            	<c:if test="${middle.main_id!=search.main_id}"> 
		                            		<li class="middle-category-dpNone"><a href="${contextPath}/userProduct/searchProduct.do?main_id=${main.main_id}&middle_id=${middle.middle_id}&orderBy=${search.orderBy}&perPageNum=${search.perPageNum}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}" class="">${middle.middle_name}</a></li>
		                            	</c:if>
	                            	</c:if>
	                            </c:forEach>
							</ul>
						</c:forEach>
	                  </div>
                     <hr>
                      <!-- <div class="filter1 mt-2 mb-2 ml-2">
                        <ul> <span class="filter-title">총 중량</span>
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox9">1.5kg 이하</label>
                                </div>   
                            </li>
                            <li>
                                <div class="form-check form-check-inline stylebox ">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox10">1.5~3kg</label>
                                </div>   
                            </li>
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox12">3~5kg</label>
                                </div>   
                            </li> 
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox13">5~10kg</label>
                                </div>   
                            </li>
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox14">10kg 이상</label>
                                </div>   
                            </li>   
                          </ul>
                      </div>
                  <hr>
                      <div class="filter1 mt-2 mb-2 ml-2">
                        <ul> <span class="filter-title">개당중량</span>
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox17" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox17">500g 이하</label>
                                </div>   
                            </li>
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox18" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox18">500g ~ 1kg</label>
                                </div>   
                            </li> 
                            <li>
                                <div class="form-check form-check-inline stylebox">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox19" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox19">1kg 이상</label>
                                </div>   
                            </li>  
                          </ul>
                      </div>
                  <hr>
                      <div class="filter1 mt-2 mb-2 ml-2">
                        <ul> <span class="filter-title">별점</span>
                            <li>
                                <div> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-inactive mr-1"></span><span>4점 이상</span></div>
                            </li>   
                            <li>
                                <div> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive mr-1"></span><span>3점 이상</span></div>
                            </li>   
                            <li>
                                <div> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive mr-1"></span><span>2점 이상</span></div>
                            </li>   
                            <li>
                                <div> <span class="fa fa-star star-active"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive"></span> <span class="fa fa-star star-inactive mr-1"></span><span>1점 이상</span></div>
                            </li>           
                        </ul>
                    </div>
                    <hr> -->
                    
                    <div class="filter1 mt-2 mb-2 ml-2 pricePadding">
                        <ul><span class="filter-title">가격</span> 
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=-1&price_max=-1&priceRange=false" class="category-link active">가격 전체</a></li>
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=0&price_max=20000&priceRange=false" class="category-link">2만원 이하</a></li> 
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=20000&price_max=40000&priceRange=false" class="category-link">2만원~4만원</a></li> 
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=40000&price_max=60000&priceRange=false" class="category-link">4만원~6만원</a></li>
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=60000&price_max=80000&priceRange=false" class="category-link">6만원~8만원</a></li>
                            <li><a href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=80000&price_max=99999999&priceRange=false" class="category-link">8만원 이상</a></li>   
                            <li class="mt-4">

                                    <div class="row flex-row mb-2">

                                        <label for="colFormLabelSm" class="col-form-label col-cform-label-sm"></label>
                                        <input type="text" class="form-control form-control-sm checkboxprice" onkeyup="check(this);" name="price_min" id="price_min">

                                        <span class="separator">~</span> 

                                            <label for="colFormLabelSm" class="col-form-label col-cform-label-sm"></label>
                                            <input type="text" class="form-control form-control-sm checkboxprice" onkeyup="check(this);" name="price_max" id="price_max">

                                        <span class="currency ml-1">원</span>
                                        <button type="submit" id="priceSearch" class="btn btn-primary btn-sm mb-2 ml-2 buttoncheck">검색</button>
                                        <!-- 범위 검색을 하였는지 확인하기위한 hidden value -->
                                        <input type="hidden" id="priceRange" name="priceRange" value="${search.priceRange}" />
                                    </div>

                            </li>  
      					</div>
                      <hr>
                  </div>
              </div>
          </div>
      </div>
      <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
      <script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
      <script>
          $('#lightSlider').lightSlider({
              gallery: true,
              item: 1,
              loop: true,
              slideMargin: 0,
              thumbItem: 9
          });
      </script>
  <!--Section: Block Content-->  
 	<!--===============================================================================================-->
<%-- <script src="${contextPath}/resources/js/product/jquery-1.4.4.min.js" type="text/javascript" charset="utf-8"></script>
 <script src="${contextPath}/resources/js/product/jquery.accordionMenu.js" type="text/javascript" charset="utf-8"></script> --%>
 	<!--===============================================================================================-->
<!-- <script type="text/javascript">
$(document).ready(function () {
	$('ul').accordion();
}); -->
</script>
 	<!--===============================================================================================-->
<!--  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

 	<!--===============================================================================================-->
 
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<script>
	  /* 입력시 숫자만 가능하게 */
    function check(my){
    	my.value = my.value.replace(/[^0-9]/g,"");
    }
	  
	  
	$(function(){
		/* 카테고리 보이고 숨기기 */
          $('.middle-category-show').click(function(){
        	  var submenu=$(this).nextAll("li");
        	  if(submenu.is(":visible")){
        		submenu.slideUp(500);
        		/* 다시 +모양으로 */
        		$(this).html('+');
          	  }else{
        		/* +모양 변경 */
        		$(this).html('-');
          		submenu.slideDown(500);
          	  }
          });
		
       
          
		  $('#priceSearch').click(function(){
			  //if문은 유효성 검사
			  var price_min = $('#price_min').val();
			  var price_max = $('#price_max').val();
			  if(price_min==''||price_min==null||price_min<=0){
				  price_min=1;
			  }
			  var price_max = $('#price_max').val()
			  if(price_max==''||price_max==null||price_max<=0||price_max>99999999){
				  price_max=99999999;
			  }
			  if(price_min>price_max){
				  var imsi = price_max;
				  price_max=price_min;
				  price_min=imsi;
			  }
			  $('#priceRange').val(true);
			  location.href="${contextPath}/userProduct/searchProduct.do?perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min="+price_min+"&price_max="+price_max+"&priceRange=true";
		  });
		  
		  var priceRangeChk = $('#priceRange').val();
		  if(priceRangeChk=='true'){
	  		$('#price_min').val('${search.price_min}');
		  	$('#price_max').val('${search.price_max}');
		  }
			
	});
	</script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min integrity="sha384-DfXdz2htPH0lsSSs5.js"nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> -->
  </body>
</html>
