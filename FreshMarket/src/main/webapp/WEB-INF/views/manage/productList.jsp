<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
	<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>메인</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>	
<link rel="shortcut icon" href="/favicon.ico">
<style>
*{
	box-sizing:border-box;
	margin:0;
	padding:0;
}
.text-white{
	color:white;
}
/* 테이블 css */
#productList_container th{text-align:center;
										vertical-align:middle;
										}
#productList_container td{text-align:left;
										vertical-align:middle;
										}
#productList th,td{	padding:6px;
							}
				/* 재고 css */			 
input[name="product_stock"] { 	  width:70px !important;
												text-align:right !important;
												height:25px;
												
	}
.contents-inline  select{ width:250px;
							display:inline-block;
}
.contents-inline  *{ 
							display:inline-block;
}
/* 메뉴 슬라이드 */
#salesChange{
						position:relative;
}										

.hide-menu{
	display:none;
	position:absolute;
	top:45px; 
	
}
.hide-menu div{
	width:94px;
	margin:1px 0;
}
#changeStock{	margin:0 10px;
}
/* 정렬 css */	
#productSee{vertical-align:middle;
					width:100%;}
#searchText{width:450px;}
			
.text-align-right{text-align:right !important;}

#paging{text-align:center;
				margin:50px 0;}
#buttons{margin:20px;
}	
#newButtons{text-align:right;
}
#button-table{
					margin:15px 0px;
}			

/*툴팁 팝업 레이어  */
.popupLayer {
    position: absolute;
    display: none;
    background-color: #ffffff;
    border: solid 2px #d0d0d0;
    width: 300px;
    height: 50px;
    padding: 10px;
}
/* 테이블 폭 100퍼센트 */

#productSee{
	display:inline-block;
}
.gradeOrder{
	margin:0 100px;
}
#productList_search_container,#productList{
	margin:20px;
}
.float-right{
	float:right;
}
}
.float-left{
	float:left;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

$(function(){
	
	//중분류 카테고리 활성화 (대분류 선택시)
	 $("#main_id").change(function(){
		$('#middle_id').empty();
		var mainOption;
		mainOption = $('#main_id option:selected').val();
		//console.log(mainOption);
		$.ajax({
			url:"${contextPath}/manage/middleCategory",
			type:"get",
			datatype:"json",
			data:"mainId="+mainOption,
			success:function(json){
				
				//json 객체 배열 출력
				/* $.each(json[0],function(key,value){
					console.log('key:' + key + ' / '+ 'value' + value);
				});  */
				//json 배열의 길이	
				var str = "<option value='0'> - 중분류 선택 - </option>";
				var jsonLength = Object.keys(json).length
				for(m=0;m<jsonLength;m++){
					var keys = json[m]["middle_id"];
					var values = json[m]["middle_name"];
						str = str+"<option value='"+keys+"'>"+values+"</option>";
				}
				$('#middle_id').append(str);
				//console.log(str);
			},
			error:function(request, error){
				alert('err');
				//실패이유를 알려준다.
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
		//middleOption = "<option value='"+${middle.id}+"'>"+${middle.name}+"</option>"
	}); 
	 
	//새 상품 등록 버튼시 상품 등록 창으로 이동
	$('#newSale').click(function(){
		$(location).attr('href','${contextPath}/manage/productManage.do');
	});
	
	//검색 옵션 유지
	$('#main_id').val('${search.main_id}');
	$('#middle_id').val('${search.middle_id}');
	$("input:radio[name='is_locked'][value='${search.is_locked}']").prop('checked',true);
	$('#typeSearch').val('${search.typeSearch}');
	$('#searchText').val('${search.searchText}');
	$('#orderBy').val('${search.orderBy}');
	$('#searchText').val('${search.searchText}');
	$('#seeCount').val('${search.seeCount}');
	
	/* 재고 더블클릭시 수정 가능하게 */
	$("input[name='product_stock']").dblclick(function(){
		$(this).prop('readonly',false);
		$(this).focus();
	});
	
/* 	$(document).on('focusout',"input[name='product_stock']",function(){
		$(this.prop)('readonly',true);
	}); */
	/* 재고 밖으로 포커스 아웃 하면 readonly로 바꾸고, value 가 null인경우 0으로 초기화 */
	$("input[name='product_stock']").blur(function(){
		if($(this).val()==null||$(this).val()==""){
			$(this).val(0);
		}
		$(this).prop('readonly',true);
	});
	
	$('#sale').click(function(){
		$('#sale2 input').remove();
		var lock = "<input type ='hidden' name='sale' value='0' />"
		$(this).append(lock);
		$('#productStockChange').attr('action','${contextPath}/manage/productSaleChange.do');
		$('#productStockChange').submit();
	});
	$('#sale2').click(function(){
		$('#sale input').remove();
		var lock = "<input type ='hidden' name='sale' value='1' />"
		$(this).append(lock);
		$('#productStockChange').attr('action','${contextPath}/manage/productSaleChange.do');
		$('#productStockChange').submit();
	});
	
	/* 모든 체크박스 선택 */
	$('#chkAll').click(function(){
		if($('#chkAll').prop('checked')==true){
			$('input[name="checked_id"]').prop('checked',true);
		}else{
			$('input[name="checked_id"]').prop('checked',false);
		}
	});
	
	/* 정렬 변경시 바로 검색 */
	$('#orderBy').change(function(){
		location.href="${contextPath}/manage/productList.do?main_id=${search.main_id}&middle_id=${search.middle_id}&is_locked=${search.is_locked}&typeSearch=${search.typeSearch}&searchText=${search.searchText}&orderBy="+$('#orderBy').val()+"&seeCount=${search.seeCount}&currentPage=${search.currentPage}";
	});
	
	
	/* 보이는 갯수 변경시 바로 검색 */
	$('#seeCount').change(function(){
		location.href="${contextPath}/manage/productList.do?main_id=${search.main_id}&middle_id=${search.middle_id}&is_locked=${search.is_locked}&typeSearch=${search.typeSearch}&searchText=${search.searchText}&orderBy=${search.orderBy}&seeCount="+$('#seeCount').val()+"&currentPage=${search.currentPage}"
	});
	
	
	/* 슬라이딩 메뉴 */
	$('#changeSale').click(function(){
		var submenu = $(this).next("div");
		if(submenu.is(":visible")){
			submenu.slideUp();
		}else{
			submenu.slideDown();
		}
	});
	
	/* 툴팁 팝업 */
	$('.toolTip').hover(function(e){
		/* var sWidth = window.innerWidth;
        var sHeight = window.innerHeight; */
        var oWidth = $('.popupLayer').width();
        var oHeight = $('.popupLayer').height();
		
		/* 레이어 위치 셋팅 */
		var divLeft = e.pageX + 10;
        var divTop = e.pageY + 80;
		//레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		/* if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
        if( divTop + oHeight > sHeight ) divTop -= oHeight; */
        divLeft -= oWidth;
        divTop -= oHeight;
	  	/* 레이어 위치를 바꾸었더니 상단 기준점 (0,0)밖으로 벗어난다면 상단기준점  0,0에 배치한다. */
	 /*  	if( divLeft < 0 ) divLeft = 0;
        if( divTop < 0 ) divTop = 0; */
		
	  	$('.popupLayer').css({
	  		"top":divTop,
	  		"left":divLeft,
	  		"position":"absolute"
	  	}).show();
	},function(){
		$('.popupLayer').css('display','none');
	  	
	});
	
});

/* 입력시 숫자만 가능하게 */
function check(my){
	my.value = my.value.replace(/[^0-9]/g,"");
}

</script>

		
		
</head>


<body>
<div id="productList_container">
<h1>상품 목록</h1>
	<div id="productList">
		<div id="productList_search_container">
			<form action="${contextPath}/manage/productList.do" method="get" id="productListForm">
				<table class="table-bordered table-hover table">
					<tbody >
						<tr>
							<th>
								상품분류
							</th>
							<td class="contents-inline">
								<select id="main_id" name="main_id" class="list_selectBox form-control" >
									<option value="0"> - 대분류 선택 - </option>
								<c:forEach  var="main" items="${mainCategory}"> 
									<option value="${main.main_id}">${main.main_name}</option>
								</c:forEach>
								</select>
								<select id="middle_id" name="middle_id" class="list_selectBox form-control">
									<option value="0"> - 중분류 선택 - </option>
									<c:if test="${middleCategory!=null}">
										<c:forEach items="${middleCategory}" var="middle">
											<option value="${middle.middle_id}">${middle.middle_name}</option>
										</c:forEach>
									</c:if>
								</select>
							</td>
							<th>
								판매 상태
							</th>
							<td>
								<input type="radio" id="is_locked1" name="is_locked" value="2" class="radioButton" checked/>전체
								<input type="radio" id="is_locked2" name="is_locked" value="0" class="radioButton" />판매 중 
								<input type="radio" id="is_locked3" name="is_locked" value="1" class="radioButton" />판매 중단
							</td>
						</tr>			
						<tr>
							<th>
								상품분류
							</th>
							<td colspan="3" class="contents-inline">
								<select id="typeSearch" name="typeSearch" class="list_selectBox form-control" >
									<option value="product_name">상품명</option>
									<option value="product_id">상품번호</option>
								</select>
								<input type="text" name="searchText" id="searchText" placeholder="검색할 내용을 입력하세요" class="form-control" />
								<input type="submit" name="search" id="search" value="검색"  class="btn btn-primary" >
							</td>
						</tr>			
					</tbody>
				</table>
			
			
				<div id="productSee" class="form-inline">
					<div class="float-left form-control-static">
						총 ${fn:length(productList)}개
					</div> 
					<div class="text-right gradeOrder">
						<select id="orderBy" name="orderBy" class="list_selectBox form-control">
							<option value="nameAsc">
								상품명 오름차순
							</option>
							<option value="nameDes">
								상품명 내림차순
							</option>
							<option value="priceAsc">
								판매가 오름차순
							</option>
							<option value="priceDes">
								판매가 내림차순
							</option>
						</select>
						<select id="seeCount" name="seeCount" class="list_selectBox form-control">
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
				</div>
				</form>
			</div>
			<div id="productList"> 
				<form action="${contextPath}/manage/productStockChange.do" method="get" id="productStockChange" class="form-inline">
					<table class="table-striped table-hover table">
						<tbody>
							<tr>
								<th>
									<input type="checkbox" id="chkAll" />
								</th>
								<th>
									상품분류
								</th>
								<th>
									상품명
								</th>
								<th>
									판매가
								</th>
								<th width="6%">
									판매상태
								</th>
								<th width="7%">
									누적판매량
								</th>
								<th>
									재고
								</th>
							</tr>
							<c:forEach items="${productList}" var="product" varStatus="proNum">
								<tr>
									<td>
										<input type="checkbox" name="checked_id" value="${product.product_id}" />
									</td>
									<td>
										${product.main_name},${product.middle_name} 
									</td>
									<td>
										${product.product_name}
									</td>
									<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.product_price}" />   
									</td>
									<td>
										<c:if test="${product.is_locked==0}">
											판매 중 
										</c:if>
										<c:if test="${product.is_locked!=0}">
											판매 중단
										</c:if>
									</td>
									<td class="text-align-right">
										${product.product_total}
									</td>
									<td>
										<input type="hidden" value="${product.product_id}" name="product_id" />
										<div class="popupLayer">더블클릭을 하면 수정 가능합니다.</div>
										<input type="text" value="${product.product_stock}" readonly="readonly" class="stockText form-control toolTip" name="product_stock" onkeyup="check(this);">
									</td>
								</tr>	
							</c:forEach>				
						 </tbody>
					</table>
					<table id="button-table" class="table">
						<tr>
							<td>
								<div id="changeButtons" class="form-group">
									<div	id="salesChange">
										<input type="button"  value="판매 변경" id="changeSale" class="btn btn-info	 text-white" />
										<div class="hide-menu">
											<div id="sale"  class="btn btn-info	 text-white">판매</div>
											<div id="sale2" class="btn btn-info	 text-white">판매중단</div>
										</div>
									</div>
									<div id="stocksChange">
										<%	String searchWord=""; 
												if(request.getQueryString()!=null){
													searchWord= "?" + request.getQueryString();
												}else{
													searchWord ="";
												}%>
										<input type="hidden" value="<%= searchWord %>" name="searchWord">
										<input type="submit" value="재고 변경" id="changeStock" class="btn btn-info text-white">
									</div>
								</div>
							</td>
							<td>
									<div id="newButtons" class="float-right">
										<input type="button" value="새상품 등록" id="newSale" class="btn btn-success" />
									</div>
							</td>
						</tr>
					</table>
				</form>	
			</div>
	</div>
	<div id="paging"> 
		<c:if test="${productListPage.startPage>10}">
			<a class="btn btn-link btn-lg active" href="${contextPath}/manage/productList.do?main_id=${search.main_id}&middle_id=${search.middle_id}&is_locked=${search.is_locked}&typeSearch=${search.typeSearch}&searchText=${search.searchText}&orderBy=${search.orderBy}&seeCount=${search.seeCount}&currentPage=${productListPage.startPage-1}">
			Previous</a>
		</c:if> 
		<c:if test="${productListPage !=null}">
			<c:forEach var="pageNum" begin="${productListPage.startPage}" end="${productListPage.endPage}">
				<c:if test="${productListPage.startPage>0}">
					<c:if test="${search.currentPage!=pageNum}">
						<a class="btn btn-link btn-lg active" href="${contextPath}/manage/productList.do?main_id=${search.main_id}&middle_id=${search.middle_id}&is_locked=${search.is_locked}&typeSearch=${search.typeSearch}&searchText=${search.searchText}&orderBy=${search.orderBy}&seeCount=${search.seeCount}&currentPage=${pageNum}">
							${pageNum}
						</a>
					</c:if>
					<c:if test="${search.currentPage==pageNum}">
							${pageNum}
					</c:if>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${productListPage.endPage<productListPage.totalPage}">
			<a class="btn btn-link btn-lg active" href="${contextPath}/manage/productList.do?main_id=${search.main_id}&middle_id=${search.middle_id}&is_locked=${search.is_locked}&typeSearch=${search.typeSearch}&searchText=${search.searchText}&orderBy=${search.orderBy}&seeCount=${search.seeCount}&currentPage=${productListPage.startPage+10}">
			Next</a>
		</c:if>
		<br/>
	</div>
</div>	


</body>
</html>










