<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고 얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

/* html { font-size:10px; } */


*{
	box-sizing:border-box;
	margin:0;
	padding:0;
}
.product_container{
	margin:0 auto;
	width:1180px;
	background-color: #fff8e1;
}
input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

/* 이미지 첨부 라벨(버튼) */
.product_img_label{
	font-size:1.4rem;
	cursor:pointer;
	
}
/* 이미지상세보기 스크롤바쪽 */
#detailScrollbar {
	display:block;
	overflow-y:hidden;
	overflow-x:auto;
	height:240px;
	white-space:nowrap;
	width:1000px; 
	margin:0 auto;
	padding:20px 0;
}

#product_selectList select::-webkit-scrollbar{
	width:16px;
	height:16px;
}  
#product_selectList select::-webkit-scrollbar-thumb{
	background-color:#E6E6E6;
	border-radius: 7px;
} 

#product_selectList select{
/* 	font-size:1.8rem; */
	height:350px;
	border:2px inset #E6E6E6;
	margin: 10px;
	overflow-x:auto;
}
#product_selectList{
	display:block;
	width: 1180px;
/* 	height:500px; */
	text-align:center;
	flex-direction:row;
	justify-content:space-around;
	align-items:center;
	
}
#productCategory-container{
	display:block;
	margin: 30px 0 0 0;
}
#mainCategory-container,#middleCategory-container{
	margin: 30px 0 0 0;
	display:inline-block;
}
#mainCategory,#middleCategory{
	width:250px;
	height:200px;
}
#product_selectList h2{
	font-size:2.0rem;
	/* color: white; */
    font-size: 16px;
    font-weight: bold;
    line-height: 37px;
}
#productCategory, #productCategory2{
	width:540px;
	height:400px;
}
#product-container{
	height:433.5px;
}
input[name="productCategory"]{
	width:600px;
}
/*  분류 텍스트 상자  */
.divideTextBox{
	border :2px solid gray; 
	width:200px;
	height:25px; 
	margin : 0 10px 0 0;
	border-radius:5px;
	padding:0 5px;
	font-size:1.7rem;
}
/* focus되도 아웃라인 안보이기 */
.divideTextBox:focus ,#product_detail input[type="text"]:focus{
	outline:none;
}

/* 상품 상세 테이블  */
#product_detail table{
	overflow:auto;
	border-top:1px solid #444444;
	border-collapse:collapse;
}
/* 위아래 공간 주기 */
#product_detail td,th{
	padding:20px 0;
	border-bottom:1px solid #444444;
}

/* 상품 상세 테이블 밑 입력값 */
#product_detail input[type="text"]:not(.event_product_name) {
	width:140px;	
	height:24px;
	border:0px;
	border-radius:5px;
}
/* readonly값 */
#product_detail input[readonly="readonly"]{
	background-color:#f5f5f5;
}
/* 상품명 */
#product_name {
	width:1040px;
	height:24px;
	border:0px;
	border-radius:5px;
}

/* 분류 추가 버튼 */
.divideInsertButton{
	border:0px;
	background-color:#fff8e1;
	font-size:1.7rem;
	cursor:pointer; 
	color:#494949;
	font-weight:650; 
}

/* 업로드의 추가 삭제 버튼 css */
.imgNum{
	font-size:1.7rem;
	border:1px solid black;
	width:40px;
	height:25px;
	border-radius:5px;
	background-color:#ff8a65;
	cursor:pointer;
	margin:5px 0;
}

/* 카테고리 가져오기 버튼 */
#categorySelect{
/* 	font-size:1.7rem; */
	height:30px;
	border-radius:5px;
	background-color:#ff8a65;
	cursor:pointer;
}
/* submit 버튼 수정 */
#submitButton{
	text-align:center;
}

#submitButton input{
/*  	font-size:2.0rem; */
	height:40px;
	width:100px;
	border-radius:5px;
	background-color:#ff8a65;
	cursor:pointer;
	margin:50px 15px;
	border:0px;
}


#product_imgContainer div{
	display:inline-block;
}

#product_detailImgContainer div{
	display:inline-block;
}

/* 상품추가,변경 버튼 수정 */
#product_newChButton{
	text-align:center;
}
.product_ChButton{
	/* width:200px; */
	height:50px;
	margin:30px;
	background-color:	#ffab91;
	border:1px solid #c97b63;
	color:white;
	font-size:2.0rem;
	cursor:pointer;
}

.img_Upload_td {
	text-align:center;	
}

#event_product_name {
	width:100%;
}

#product_detail{
	margin:0 auto;
	width:1180px;
	background-color: #fff8e1;
}

.nameH1{
	color: black;
    font-size: 40px;
    font-weight: 530;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<script>

	 /* 입력시 숫자만 가능하게 */
function check(my){
    my.value = my.value.replace(/[^0-9][.]/g,"");
}

</script>   
<script>
/* event_product_price calculate */
$(function(){
	$(document).on('blur','#event_product_sale',function(){
		var eps = $('#event_product_sale').val();
		var pfp = $('#product_fixed_price').val();
		
		var epp = Math.floor((1 - eps) * pfp);
		$('#event_product_price').val(epp);	
	});
});
</script>

</head>
<body>
<h1 class="nameH1">이벤트 상품 수정/삭제</h1>
<div>
	<div id="product_detail">
		<form action="${contextPath}/eventProduct/updateEventProduct.do" method="post" id="eventProductModify">
			<input type="hidden" name="event_product_id" value="${eventProductJoinDTO.event_product_id}"/>
			<table width="1180px">
				<tr>
					<th><label for="event_product_name">이벤트 상품명</label></th>
					<td colspan ="8"><input type="text" id="event_product_name" name="event_product_name" placeholder="이벤트 상품명 입력" class="event_product_name" value="${eventProductJoinDTO.event_product_name}" required/></td>
				</tr>
				<tr>
					<th width="110px"><label for ="is_plus">추가 증정</label></th>
					<td width="140px"><input type="text" id="is_plus" name="is_plus" placeholder="추가증정 입력" value="${eventProductJoinDTO.is_plus}" onkeyup="check(this)"required/></td>
					<th width="110px"><label for ="event_product_sale">할인율</label>
					<td width="140px"><input type="text" id="event_product_sale" name="event_product_sale" placeholder="할인율 입력" value="${eventProductJoinDTO.event_product_sale}" required onblur="cal_event_product_price()" onkeyup="check(this)"/></td>
					<th width="110px"><label for="product_fixed_price">상품정가</label></th>
					<td width="140px"><input type="text" id="product_fixed_price" name="product_fixed_price" placeholder="정가 입력" value="${eventProductJoinDTO.product_fixed_price}" readonly/></td>
					<th width="110px"><label for="event_product_price">이벤트상품가격</label></th>
					<td width="140px"><input type="text" id="event_product_price" name="event_product_price" placeholder="이벤트 상품 가격" value="${eventProductJoinDTO.event_product_price}" readonly/></td>
					<td style="text-align:center">
						공개<input type="radio" name="is_locked" id="unlocked" value="0" checked="checked"/>
						비공개<input type="radio" name="is_locked" id="locked" value="1"/>
					</td>
				</tr>
			</table>
			<div id="submitButton">
				<input type="submit" value="상품 수정/삭제" id="productUpdate"/>
				<input type="reset" value="초기화" id="reset"/>
			</div>
		</form>
	</div>
</div>

<script>
window.onload = function() {
	var is_locked = ${eventProductJoinDTO.is_locked};
	if (is_locked == 0)
	{
		var unlocked = document.getElementById("unlocked");
		unlocked.checked = "checked"
	}
	else
	{
		var locked = document.getElementById("locked");
		locked.checked = "checked"
	}
};
</script>
</body>
</html>
