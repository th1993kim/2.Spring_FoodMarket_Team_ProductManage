<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>
#search_form{
	display:inline;
	max-width:100%;
	width:86%;
	height:40px;
	border:none;
}

#search_btn{
	display:inline;
	border:none;
	background:transparent;
	position:absolute;
	right:0;
	padding:5px;
	margin-top:1px;
	margin-right:13px;
}
#search_form:focus {
	outline:none;
}
a {
	text-decoration:none;
}
.search_btn_img{
	width:30px;
}
</style>


<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true,
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
</script>

<body>
	<div id="logo">
	<a href="${contextPath}/main.do">
		<img id="logoImg" alt="freshmarket" src="${contextPath}/resources/img/freshLogo.png">
		<%-- width="75" height="75" --%>
	</a>
	</div>
	<div id="head_link">
		<ul>
			   <li><a href="${contextPath}/eventProduct/eventProductList.do">이벤트</a></li>
		   <c:choose>
		     <c:when test="${isLogin==true and memberDTO.member_role == 'admin'}">
			   <li><a href="${contextPath}/eventProduct/eventProductManage.do">이벤트상품관리</a></li>
			   <li><a href="${contextPath}/manage/productList.do">상품목록</a></li>
			   <li><a href="${contextPath}/manage/productManage.do">상품관리</a></li>
			   <li><a href="${contextPath}/sales/salesList.do">매출관리</a></li>
			   <li><a href="${contextPath}/member/memberList.do">회원목록</a></li> 
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
		     <c:when test="${isLogin==true and memberDTO.member_role == 'user' }">
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="${contextPath}/member/joinForm.do">회원가입</a></li>
			 </c:otherwise>
			</c:choose>
				<li><a href="${contextPath}/notice/noticeList.do">공지사항</a></li>
		
		  <%--  로그인여부 및 관리자 계정인지를 살펴본다 	   
	      	<c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
		   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
		    </c:if>
		  --%>			  
		</ul>
	</div>
	<br>
	<%-- 검색부분 --------------------------------------------------------------------------------%>
	<div id="search" class="rounded-pill search-bar">
		<form action="${contextPath}/userProduct/searchProduct.do" method="GET">
		<input type="hidden" name="page" value="1"> <input type="hidden" name="perPageNum" value="20">
			<input name="searchWord" type="text" id="search_form" placeholder="" aria-label="Recipient's username" autocomplete="off" aria-describedby="button-addon2">
			<button type="submit" name="search" id="search_btn"	><img alt="검색" class="search_btn_img" src="${contextPath}/resources/img/image__search.png"/></button>
		</form>
	</div>
	<div id="myPage">
		<ul>
			<li><a href="${contextPath}/mypage/myPageMain.do"><img class="myPageLogo" src="${contextPath}/resources/img/user.png" /></a></li>
			<li><a href="${contextPath}/cart/listCart.do"><img class="myPageLogo" src="${contextPath}/resources/img/cart.png" /></a></li>
		</ul>
	</div>
	
	<div id="suggest">
	     <div id="suggestList"></div>
	</div>
	
	<div id="menu">
		<div>프레시 홈</div>
	</div>
</body>
</html>
