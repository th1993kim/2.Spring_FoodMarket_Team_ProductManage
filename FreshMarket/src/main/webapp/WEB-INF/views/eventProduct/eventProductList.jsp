<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<style>
#scrollTop_btn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}




/* article {
} */
/* div {
    display: block;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video, input {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    color: #333;
    font-family: 'NanumBarunGothic', sans-serif;
    font-size: 15px;
    line-height: 1.6;
    vertical-align: baseline;
}
ol, ul, li {
    list-style: none;
}
 */
#list_plan {
    width: 1100px;
    margin: 0 auto;
}
#list_plan .special_prd_tit {
    text-align: left;
    font-size: 0;
}
#list_plan .special_prd_tit>a {
    display: inline-block;
    width: 25%;
    text-align: left;
    color: #333;
    font-size: 15px;
    vertical-align: middle;
    height: 47%;
    line-height: 47px;
    border: 1px solid #ccc;
    border-left: 0;
    padding-left: 18px;
    cursor: pointer;
    font-weight: normal;
}
img {
    vertical-align: top;
}
#list_plan .bnr {
    text-align: center;
}
img {
    width : 100%;
}
#list_plan .list .space {
    position: absolute;
    top: -60px;
}
.list .toggle_list {
    padding-top: 0;
}

#list_plan .prd_special {
/*     padding-top: 30px; */
}
.prd_special {
    display: table;
    width: 100%;
    margin: 0 auto;
/*     font-size: 0; */
   /*  text-align: left !important; */
}
#list_plan .prd_special > li {
    width: auto;
    margin-right: 35px;
    margin-bottom: 35px;
}
.prd_special > li {
    display: inline-block;
    width: 33.33%;
    text-align: center;
    vertical-align: top;
}
.prd_special .box {
    position: relative;
    width: 310px;
    /* height: 470px; */
    margin: 0 auto;
    cursor: pointer;
}
#list_plan .prd_special > li:nth-child(3n) {
    margin-right: 0;
}
.box .info .icon img {
    width: auto;
    height: 21px;
    margin-right: 5px;
    margin-bottom: 5px;
}
.prd_special .box .info {
    margin: 0 auto;
    text-align: left;
    padding-top: 15px;
}
.prd_special .box .info p.price strong.prc {
    color: #333;
    font-family: 'Roboto';
    font-size: 20px;
    text-align: left;
    line-height: 23px;
    font-weight: bold;
}
.prd_special .box .info p.price strong.prc2{
    color: #333;
    font-family: 'Roboto';
    font-size: 15px;
    text-align: left;
    line-height: 23px;
    font-weight: bold;
}
.prd_special .delivery img {
    vertical-align: middle;
}
.prd_special .box .info p.price strong.prc em {
    font-size: 12px;
    color: #333;
    font-style: normal;
    vertical-align: middle;
}


#list_plan {
text-align : center;
display : inline-block;
margin:0 auto;
}
#box1{
    margin: 20px 0px 0px 15px;
    width: 1300px;
    background: #febe;
    text-align : center;
display : inline-block;
	margin:0 auto;
}

#in {
width: 100%;
text-align : center;
display : inline-block;
	margin:0 auto;
}
 


</style>
</head>
<body>

<div id="in" >
<div id="box1">
<div id="list_plan">
	<div class="special_prd_tit special_tit_cont2">
		<a class="specialTitle" href="#list_sel1">과일 이벤트</a>
		<a class="specialTitle" href="#list_sel2">견과류 이벤트</a>
		<a class="specialTitle" href="#list_sel3">채소 이벤트</a>
		<a class="specialTitle" href="#list_sel4">곡류 이벤트</a>
		<a class="specialTitle" href="#list_sel6">수산물 이벤트</a>
		<a class="specialTitle" href="#list_sel8">커피 이벤트</a>
		<a class="specialTitle" href="#list_sel9">과자 이벤트</a>
		<a class="specialTitle" href="#list_sel10">라면 이벤트</a>
		<a class="specialTitle" href="#list_sel11">조미료 이벤트</a>
		<a class="specialTitle" href="#list_sel13">유제품 이벤트</a>
		<a class="specialTitle" href="#list_sel14">간편식 이벤트</a>
		<a class="specialTitle" href="#list_sel15">분유 이벤트</a>
	</div>

<div class="list">
	<a name="list_sel1"></a>
	<div class="space" name="list_sel1"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1001.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">

	<c:forEach var="item" items="${eventProductList}">
		<c:if test="${item.main_id == 1001}">
		<li>
			<div class="box">
				<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
				<div class="img">
					<div class="prdimg">
						<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
					</div>
				</div>
				<div class="info">
					<p class="name">${item.event_product_name}</p>
					<p class="price">
						<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
						<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
						<span class="delivery">
						</span>
					</p>
					<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
				</div> 
				<div>
				</div>
				</a>
				<c:if test="${memberDTO.member_role == 'admin'}">				
						<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
				</c:if>
			</div>
		</li>
		</c:if>
	</c:forEach>
	</ul>
	</div>
</div>
	
<div class="list">
	<a name="list_sel2"></a>
	<div class="space" name="list_sel2"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1002.jpg" border="0"></div>
	<div class="toggle_list">
		<ul class="prd_special">
			<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1002}">
					<li>
						<div class="box">
							<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}"><a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
							
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>

<div class="list">
	<a name="list_sel3"></a>
	<div class="space" name="list_sel3"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1003.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">

	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1003}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>



<div class="list">
	<a name="list_sel4"></a>
	<div class="space" name="list_sel4"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1004.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">

	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1004}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>



<div class="list">
	<a name="list_sel6"></a>
	<div class="space" name="list_sel6"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1006.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1006}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>



<div class="list">
	<a name="list_sel8"></a>
	<div class="space" name="list_sel8"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1008.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1008}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>



<div class="list">
	<a name="list_sel9"></a>
	<div class="space" name="list_sel9"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1009.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1009}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>



<div class="list">
	<a name="list_sel10"></a>
	<div class="space" name="list_sel11"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1010.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">

	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1010}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>


<div class="list">
	<a name="list_sel11"></a>
	<div class="space" name="list_sel11"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1011.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1011}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>


<div class="list">
	<a name="list_sel3"></a>
	<div class="space" name="list_sel3"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1013.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1013}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>


<div class="list">
	<a name="list_sel14"></a>
	<div class="space" name="list_sel14"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1014.jpg" border="0"></div>
	<div class="toggle_list">
	<ul class="prd_special">
	<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1014}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
								<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div>
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="list">
	<a name="list_sel15"></a>
	<div class="space" name="list_sel15"></div>
	<div class="bnr"><img src="${contextPath}/resources/img/1015.jpg" border="0"></div>
	<div class="toggle_list">
		<ul class="prd_special">
			<c:forEach var="item" items="${eventProductList}">
				<c:if test="${item.main_id == 1015}">
					<li>
						<div class="box">
						<a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${item.event_product_id}">
							<div class="img">
								<div class="prdimg">
									<img src="${item.product_img_path}${item.product_img_name}" width="310" height="310" loading="lazy">
								</div>
							</div>
							<div class="info">
								<p class="name">${item.event_product_name}</p>
								<p class="price">
									<strong class="prc price-value"><fmt:formatNumber value="${item.event_product_price}" type="number" var="event_product_price" />${event_product_price}</strong>원<br>
									<strong class="prc2 price-value"><fmt:formatNumber value="${item.event_product_sale*100}" type="number" var="event_product_price" />${event_product_price}%</strong> <span style="font-size:11px">할인</span>
									<span class="delivery">
									</span>
								</p>
							<div class="icon"><c:if test="${item.is_plus == 1}"><img src="${contextPath}/resources/img/plus.png"></c:if></div>
							</div> 
							</a>
							<c:if test="${memberDTO.member_role == 'admin'}">				
									<button class="btn btn-primary btn-sm" onclick="javascript:window.location='${contextPath}/eventProduct/eventProductModify.do?event_product_id=' + ${item.event_product_id};">수정/삭제</button>
							</c:if>
						</div>
					</li>
				</c:if>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
</div>
</div>


<button class="btn btn-primary" onclick="topFunction()" id="scrollTop_btn" title="Go to top">Top</button>




<script>
var mybutton = document.getElementById("scrollTop_btn");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
</body>
</html>





