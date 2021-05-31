<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>상품목록</title>
<link rel="stylesheet" href="" />
<link rel="stylesheet" href="" />
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
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="shortcut icon" href="/favicon.ico">
<!-- <script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script> -->

<style>

#product-list-paging {
  display: none;
}

/* 검색분류 우측 정렬 */
#productHowSee{
	width:88%; 
	text-align:right;
	display:block;
	
}
#productHowSee select{
	margin:0 5px;  
}

/* 가격 검색시 박스 컬러 */
.priceRangeColor{
	display:inline-block;
	padding:5px;
	border:1px solid gray;
	border-radius: 5px;
}
</style>
</head>
<body>
	<h1>
		<c:if test="${search.main_id!=0&&search.middle_id==10}">
			<c:forEach items="${mainCategory}" var="main" >
	  			<c:if test="${main.main_id==search.main_id}">
	  				${main.main_name}
	  			</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${search.middle_id!=10}">
  		<c:forEach items="${middleCategory}" var="middle">
			<c:if test="${middle.middle_id==search.middle_id}">
				${middle.middle_name}
           	</c:if>
         </c:forEach>
        </c:if>
	</h1>
	<ul id="productList" class="baby-product-list">
		<li>
			<div id="productHowSee" class="form-inline">
				<select id="orderBy" name="orderBy" class="list_selectBox form-control">
					<option value="totalAsc">
						판매량 오름차순
					</option>
					<option value="totalDes" selected>
						판매량 내림차순
					</option>
					<option value="priceAsc">
						판매가 오름차순
					</option>
					<option value="priceDes">
						판매가 내림차순
					</option>
				</select>
				<select id="perPageNum" name="perPageNum" class="list_selectBox form-control">
					<option value="20" selected>
						20개씩 보기
					</option>
					<option value="50">
						50개씩 보기
					</option>
					<option value="100">
						100개씩 보기
					</option>
				</select>
			</div>
			<div id="productRangeConFirm" class="productRangeConFirm">
				<c:if test="${search.price_min>=0}">
					<div class="priceRangeColor">
						<c:if test="${search.price_max==99999999}">
							가격 <fmt:formatNumber maxFractionDigits="3" value="${search.price_min}" /> 원 이상 <button id ="rangeRemover" name="rangeRemover" class="btn btn-danger">제거</button>
						</c:if>
						<c:if test="${search.price_max!=99999999}">
							가격 <fmt:formatNumber maxFractionDigits="3" value="${search.price_min}"/> 원  ~ <fmt:formatNumber maxFractionDigits="3" value="${search.price_max}"/> 원 <button id ="rangeRemover" name="rangeRemover" class="btn btn-danger"">제거</button>
						</c:if>
					</div>
				</c:if>
			</div>
		</li>
		<c:forEach var="item" items="${searchUserProductList}">

			<li class="baby-product renew-badge" id="5239725974" data-vendor-item-id="74688550671" data-is-rocket="true" data-product-id="5239725974"><a class="baby-product-link" href="${contextPath}/userProduct/detailUserProduct.do?product_id=${item.product_id}" data-item-id="7397445109" data-product-id="5239725974" data-vendor-item-id="74688550671" data-is-rocket="true" data-is-ccid-eligible="false" data-sns-discount-rate="-1" data-wow-only-instant-discount-rate="-1" style="height: 442px">
					<dlv class="baby-product-wrap" data-use-data="N" style="height: 420px">
						<dt class="image">
							<img src="${item.product_list_img_path}${item.middle_id}/${item.product_list_img_name}" onerror='this.src="//t1a.coupangcdn.com/thumbnails/remote/600x600/image/coupang/common/no_img_1000_1000.png"' width="100%" alt="" data-load-time="739.754999987781" data-load-time-start="515.0999999896158" data-load-time-end="556.3100000144914" />
						</dt>
						<dd class="descriptions">
							<div class="badges"></div>
							<div class="name">${item.product_name}</div>

							<div class="price-area">
								<div class="price-wrap">
									<div class="price">
										<span class="price-info"> <span class="instant-discount-text"></span> <span class="divider">|</span> <span class="discount-percentage"></span> <del class="base-price"></del>
										</span> <em class="sale discount isInstantDiscount"> <strong class="price-value"><fmt:formatNumber value="${item.product_fixed_price}" type="number" var="product_fixed_price" />${product_fixed_price}</strong>원 <span class="badge rocket"> <img src="" height="16" alt="" />
										</span>
										</em>
									</div>
									<!-- Free Shipping Badge -->

									<div class="delivery">
										<span class="arrival-info emphasis"> <em style="color: #00891a"> </em> <em style="color: #00891a"> </em>
										</span>
									</div>
								</div>
							</div>

							<div class="other-info">
								<div class="rating-star">
									<span class="star"><em class="rating" style="width: 70%">평균평점 : 3.5</em></span> <span class="rating-total-count">(268)</span>
								</div>
							</div>

							<div class="benefit-badges">
								<div class="reward-cash-badge">
<!-- 									<div class="reward-cash-badge__inr">
										<img src="" alt="" class="reward-cash-ico" /> <span class="reward-cash-txt"></span>
									</div> -->
								</div>
							</div>
						</dd>
					</dl>
			</a></li>
		</c:forEach>
	</ul>

	<div style="display:none;" id="product-list-paging" class="product-list-paging dynamicPLP" data-raw="{&quot;currentPageIndex&quot;:1 }" data-total="17" style="display: block;">
		<div class="page-warpper">

			<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			<c:if test="${pageMaker.startPage >= 1}">
				<a class="icon prev-page" href="javascript:list('1','${pageMaker.criteria.perPageNum}', '${search.searchWord}','${search.orderBy}','${search.main_id}','${search.middle_id}','${search.price_min}','${search.price_max}','${search.priceRange}')"><span>[처음]</span></a>
			</c:if>

			<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageMaker.prev}">
				<a class="icon prev-page" href="javascript:list('${pageMaker.startPage - 1}','${pageMaker.criteria.perPageNum}', '${search.searchWord}','${search.orderBy}','${search.main_id}','${search.middle_id}','${search.price_min}','${search.price_max}','${search.priceRange}')"><span>[이전]</span></a>
			</c:if>

			<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<%-- <a href="${path}/userProduct/listProduct.do?page=${idx}">${idx}</a> --%>
				<!-- 현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${idx == pageMaker.criteria.page}">
						<span <c:out value="${pageMaker.criteria.page == idx ? 'class=selected' : ''}"/> style="color: red">${idx}</span>&nbsp;
						</c:when>
					<c:otherwise>
						<a href="javascript:list('${idx}','${pageMaker.criteria.perPageNum}','${search.searchWord}','${search.orderBy}','${search.main_id}','${search.middle_id}','${search.price_min}','${search.price_max}','${search.priceRange}')">${idx}</a>&nbsp;
						</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a class="icon next-page" href="javascript:list('${pageMaker.endPage + 1}','${pageMaker.criteria.perPageNum}','${search.searchWord}','${search.orderBy}','${search.main_id}','${search.middle_id}','${search.price_min}','${search.price_max}','${search.priceRange}')"><span>[다음]</span></a>
			</c:if>
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${pageMaker.criteria.page < pageMaker.totalCount/pageMaker.criteria.perPageNum - 1}">
				<a class="icon next-page" href="javascript:list(${pageMaker.totalCount%pageMaker.criteria.perPageNum == 0 ? (pageMaker.totalCount/pageMaker.criteria.perPageNum) : (pageMaker.totalCount - pageMaker.totalCount%pageMaker.criteria.perPageNum)/pageMaker.criteria.perPageNum+1},'${pageMaker.criteria.perPageNum}','${search.searchWord}','${search.orderBy}','${search.main_id}','${search.middle_id}','${search.price_min}','${search.price_max}','${search.priceRange}')"><span>[끝]</span></a>
			</c:if>
		</div>
	</div>


	<script type="text/javascript" src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/jquery/bootstrap.min.js"></script>

<script>
$('a[class!="selected"]').on('click', function(event) {
	$('div[class="page-warpper"] a[class="selected"]').removeAttr("class");
	console.log(event);
	$(event.target).attr("class", "selected");
	});
$(function(){
	/* 정렬 선택시 페이지 리로드 */	
	$('#orderBy').change(function(){
		location.href="${contextPath}/userProduct/searchProduct.do?page=${search.page}&perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy="+$('#orderBy').val()+"&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}";
	});
	/* 갯수 선택시 페이지 리로드 */
	$('#perPageNum').change(function(){
		location.href="${contextPath}/userProduct/searchProduct.do?page=${search.page}&perPageNum="+$('#perPageNum').val()+"&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=${search.price_min}&price_max=${search.price_max}&priceRange=${search.priceRange}";
	}); 
	/* 가격 범위 제거시  */
	$('#rangeRemover').click(function(){
		location.href="${contextPath}/userProduct/searchProduct.do?page=${search.page}&perPageNum=${search.perPageNum}&searchWord=${search.searchWord}&main_id=${search.main_id}&middle_id=${search.middle_id}&orderBy=${search.orderBy}&price_min=-1&price_max=-1&priceRange=false";
	});
	/* 검색 옵션 유지 */
	$('#orderBy').val('${search.orderBy}');
	$('#perPageNum').val('${search.perPageNum}');
}); 
</script>
<script>
	function list(page, perPageNum, searchWord,orderBy,main_id,middle_id,price_min,price_max,priceRange){
		location.href="${contextPath}/userProduct/searchProduct.do?page="+page+"&perPageNum="+perPageNum+"&searchWord="+searchWord+"&orderBy="+orderBy+"&main_id="+main_id+"&middle_id="+middle_id+"&price_min="+price_min+"&price_max="+price_max+"&priceRange="+priceRange;
	}
</script>
<script>
var pageList = document.getElementById("product-list-paging");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
	  pageList.style.display = "block";
  } else {
	  pageList.style.display = "none";
  }
}

</script>
</body>
</html>









