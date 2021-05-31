<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.button-option .btn{
  display:block;
  margin-bottom: 10px;
  margin-left: 20px;
  }   
.button-option{border-left: 2px solid grey;}

.pagination .page-item{margin:10px;}

.maincontainer{
  box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  width: 95%;
  max-width: 1050px;
  margin:80px auto;
  border-radius: 1rem;
  padding: 4vh 5vh;
  border-bottom-left-radius: 1rem;
  border-top-left-radius: 1rem;
}

.arrival-date{
  color:green;
}

.button2:hover{
  background-color: rgb(59, 110, 206);
  color:white;
}

.ordered-product:hover{
  box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);

}
.see-order-details a{
 text-decoration: none;
 color:black;
}

.see-order-details a:hover{
 text-decoration: underline;
 font-weight: 900;
}

.page-link{
  text-decoration: none;
  color:black
}
.page-link:hover{
  font-size: 30px;
}
.jumbotron{
	margin:50px auto;
}
#detailTable{
	display:none;
	width:70%;
	font-size:20px;
	margin-left:100px;
	margin-top:70px;
}
#detailTable td{
	padding-left:40px;
	vertical-align:middle;
}
#detailTable input{
	border:none;
	width:100%;
}
#detailTable tfoot{
	text-align:right;
}
.form-control[readonly]{
	background:transparent;
}
.classic-tabs{
	margin-top:20px;
}
</style>
</head>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<body>

	<h2>${memberDTO.name}님 환영합니다!</h2>
	<div class="classic-tabs">
		<ul class="nav tabs-primary nav-justified nav-tabs" id="advancedTab" role="tablist">
			<li class="nav-item"><a class="nav-link active show" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">주문 조회</a></li>
			<li class="nav-item"><a class="nav-link" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">내 정보</a></li>
			<!-- <li class="nav-item"><a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false"> 내 글조회</a></li> -->
		</ul>
		<div class="tab-content" id="advancedTabContent">

<!-- 주문목록 -->
			<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
				<div class="container maincontainer">	<%-- <div class="container 	mt-2 mb-3 maincontainer"> --%>
				    <div class="row no-gutters">
				      <div class="col-12">
				        <div class="w-50 mb-4">
				          <h3>주문목록</h3>
				        </div>
				        <div class="w-50 mb-2 input-group mb-3">
<!-- 				          <input type="search" class="form-control rounded mr-3" placeholder="검색하기" aria-label="Search"
				            aria-describedby="search-addon" />
				            <button type="button" class="btn btn-dark">
				              <i class="fas fa-search"></i>
				            </button> -->
				        </div>
<!-- 				        <div class="w-50 mb-4">
				          <div class="btn-group">
				            <button type="button" class="btn btn-success">최근 6개월</button>
				            <button type="button" class="btn btn-success">2021</button>
				            <button type="button" class="btn btn-success">2020</button>
				            <button type="button" class="btn btn-success">2019</button>
				            <button type="button" class="btn btn-success">2018</button>
				            <button type="button" class="btn btn-success">2017</button>
				            <button type="button" class="btn btn-success">2016</button>
				          </div>
				        </div> -->
				            <!-- Classic tabs -->
				            <div class="card border rounded px-4 py-4">
				             <!--ordered product-->
			                  <c:forEach items="${orderedList}" var="orderedList">
				                <div class="ordered-product">
				                  <div class="card-header">
				                    <div class="row justify-content-between mb-3">
				                        <div class="col-auto">
				                            <h6 class="color-1 mb-0 change-color">주문 날짜 : <c:set var="order_date"><fmt:formatDate value="${orderedList.order_date}" pattern="yyyy-MM-dd (E)"/></c:set><strong><c:out value="${order_date}"/></strong></h6>
				                        </div>
				                        <div class="col-auto see-order-details"><a href="${contextPath}/mypage/orderDetailList.do?order_id=${orderedList.order_id}">주문 상세보기</a></div>
				                    </div>
				                    <div class="row">
				                        <div class="col">
				                            <div class="card card-2">
				                                <div class="card-body">
				                                  <div class="row my-auto flex-column flex-md-row">
				                                    <div class="col-4 arrival-date"> 
				                                      <b>배송예정</b>
				                                      <i class="far fa-check-circle"></i>
				                                    </div>
				                                  </div>
				                                  <div class="media">
				                                    <div class="sq align-self-center "></div>
				                                    <div class="media-body my-auto">
				                                        <div class="row my-auto flex-column flex-md-row">
				                                            <div class="col-auto my-auto">받는 사람 : <strong>${orderedList.receiver_name}</strong></div>
				                                            <div class="col-auto my-auto">총상품 금액 : <span>&#x20A9; </span> <strong class="price-value" id="orders_product_price"><fmt:formatNumber value="${orderedList.orders_product_price}" type="number" var="orders_product_price" />${orders_product_price}원</strong></div>
				                                            <div class="col-auto my-auto">배송비 : <span>&#x20A9; </span> <strong class="price-value" id="delivery_price"><fmt:formatNumber value="${orderedList.delivery_price}" type="number" var="delivery_fee" />${delivery_fee}원</strong></div>
				                                            <div class="col-auto my-auto">결제금액 : <span>&#x20A9; </span> <strong class="price-value" id="order_all_sum"><fmt:formatNumber value="${orderedList.order_all_sum}" type="number" var="order_all_sum" />${order_all_sum}원</strong></div>
				                                            <div class="col my-auto d-flex justify-content-end">
				                                               <div class="button-option">
				                                                <button type="button" class="btn btn-outline-primary btn-sm button2">배송 조회</button>
				                                                <button type="button" class="btn btn-outline-primary btn-sm button2">반품 신청</button>
<%-- 				                                                <button type="button" class="btn btn-outline-secondary btn-sm button2 insertReview" data-target="#insertReviewModal" data-toggle="modal" value="${orderedList.order_id}">리뷰 작성</button> --%>
				                                              </div>
				                                            </div>
				                                          </div>
				                                     </div>
				                                  </div>
				                            	</div>
					                        </div>
					                      </div>
					                    </div>    
					              </div>
				                </div>
				              </c:forEach>
				              <!--ordered product end-->
<!-- 					            <div class="pagination justify-content-center mt-4 pagination-lg">
					              <nav aria-label="Page navigation example">
					                  <ul class="pagination">
					                    <li class="page-item disabled">
					                      <a class="page-link" href="#" tabindex="-1">&lt;이전</a>
					                    </li>
					                    <li class="page-item">
					                      <a class="page-link" href="#">다음&gt;</a>
					                    </li>
					                  </ul>
					                </nav>
					            </div> -->   
					            <div class="card-header">
					              <h4 class="text-danger"><i class="fas fa-exclamation-triangle"></i>취소/반품/ 신청전 확인해주세요!</h4>
					              <p>취소<br>
					                - 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,<br>
					               	 취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)<br>
					                - 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지않습니다.<br>
					                <br>
					                            반품<br>
					                - 상품 수령 후 7일 이내 신청하여 주세요.<br>
					                - 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.<br>
					                - 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다. </p>
		            			</div>
	            			</div>
	            		</div>
	            	</div>
	            </div>
			</div>
	
		
<!-- 회원 정보 -->
			<div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
					<div class="jumbotron" style="max-width:600px; padding-top: 20px; ">
							<div class="content">
								<header>
									<strong><h4 style="font-weight:bold;">비밀번호를 확인해주세요.</h4></strong>
								</header>
							</div>
							<div class="form-group">
									<span class="joinFrmText">암호:</span><input type="password" class="form-control" placeholder="비밀번호" id="pwdChk" name="pwdChk" maxlength="20">
							</div>
							<input type="button" id="pwdCheck" class="btn btn-primary form-control" value="확인">
					</div>
				
				
					<div id="detail">
						<table class="table" id="detailTable" >
						  <thead>
						    <tr>
						      <th scope="col" colspan="2">회원정보 수정</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<tr>
						      <td scope="row" width="25%" >Email</td>
						      <td>
						      	<input type="text" id="email" class="form-control" value="" readonly/>
						      	<input type="hidden" id="member_id" value="" />
						      </td>
						    </tr>
						    <tr>
						      <td scope="row">Name</td>
						      <td><input type="text" id="name" class="form-control" value="" readonly/></td>
						    </tr>
						    <tr>
						      <td scope="row">Password</td>
						      <td><input type="password" id="password" class="form-control" value=""/></td>
						    </tr>
						    <tr>
						      <td scope="row">Password Check</td>
						      <td><input type="password" id="passwordChk" class="form-control" value=""/></td>
						    </tr>
						    <tr>
						      <td scope="row">Phone</td>
						      <td><input type="text" id="phone" class="form-control" value=""/></td>
						    </tr>
						    <tr>
						      <td scope="row">Address</td>
						      <td><input type="text" id="address" class="form-control" value=""/></td>
						    </tr>
						  </tbody>
						  <tfoot>
						  	<tr>
						      <th scope="col" colspan="2">
						      	<button type="button" id="modify" class="btn btn-primary">수정</button>
						      	<button type="button" id="secede" class="btn btn-danger">탈퇴</button>
							  </th>
						    </tr>
						  </tfoot>
						</table>
					</div>
			</div>

<%-- 글 조회?

			<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
				<div> 여기에 내 글 조회 </div>
			</div>
			
 --%>
		</div>		
	</div>		
	
	
	
	
<%--  리뷰작성 모달창   --%>

<%--  모달 창 --%>
<%-- The Modal --%>
		
		<div class="modal fade" id="insertReviewModal" tabindex="-1" role="document" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
					<div class="modal-header">
						<div class="container">
						  <h2>리뷰 글 작성</h2>
						
						  <form action="${contextPath}/review/insert.do" class="needs-validation" method="post" novalidate>
						    <div class="form-group">
						      <label for="reviewName">리뷰 내용:</label>
		<!-- <input type="hidden" value="" name="product_id" id="getProduct_id"/> 
			  리뷰 상품 아이디 설정 가능한 text	나중에 히든 타입으로 교체 	-->	
								<input type="text" value="" name="product_id" id="getProduct_id"/>	
								  <textarea class="form-control" rows="5" id="writeReview"name="content" placeholder="리뷰 입력" required></textarea>
								  <div class="valid-feedback">Valid.</div>
								  <div class="invalid-feedback">내용을 입력하세요.</div>
								</div>
						
							<div class="form-group">
							  <label for="reviewName">상품평:</label>
							  <select class="form-control" id="review_star" name="review_star">
							    <option value="1">★☆☆☆☆</option>
							    <option value="2">★★☆☆☆</option>
							    <option value="3">★★★☆☆</option>
							    <option value="4">★★★★☆</option>
							    <option value="5">★★★★★</option>
							  </select>
							  <div class="valid-feedback">Valid.</div>
							  <div class="invalid-feedback">
							    별점을 입력하세요.<br/>
							  </div>
							<!--      <div class="form-group">
							      <label for="pwd">이미지 첨부:</label>
							      <input type="file" class="form-control-file border is-invalid" name="review_image" required>
							     </div> -->
							</div>
							  <!-- Modal footer -->
							    <div class="modal-footer">
							      <input type="submit" class="btn btn-danger"/>
							      <input type="reset" class="btn btn-danger" />
							      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							    </div>
						    
						  </form>
						</div>
					</div>
				</div>			
			</div>
		</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	//비밀번호 체크
	$(document).on('click','#pwdCheck',function(){
			var pwd = $("#pwdChk").val();
			
			$.ajax({
				url:"${contextPath}/mypage/pwdCheck.do",
				type:"post",
				datatype:"json",
				data:{"password":pwd},
				success:function(json){
					
					if(json["result"]=="fail"){
						alert('비밀번호를 다시 확인해주세요.')
					}else if(json["result"]=="success"){
						
						$("#email").val(json["email"]);
						$("#name").val(json["name"]);
						$("#password").val(json["password"]);
						$("#phone").val(json["phone"]);
						$("#address").val(json["address"]);
						$("#member_id").val(json["member_id"]);
						$("#detailTable").show();
						$(".jumbotron").hide();
						
					}
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	}); //비밀번호 체크  
	
	//수정 - 비밀번호 확인 체크
	$(document).on('click','#modify',function(){
		
		var id = $("#member_id").val();
		var pwd = $("#password").val();
		var pwdChk = $("#passwordChk").val();
		var phone = $("#phone").val();
		var address = $("#address").val();
		
		if(pwd != pwdChk){
			alert('비밀번호가 맞지 않습니다. 다시 확인해주세요.');
		}else{
				
			$.ajax({
				url:"${contextPath}/mypage/memberModify.do",
				type:"post",
				datatype:"json",
				data:{"password":pwd,
					  "member_id":id,
					  "phone":phone,
					  "address":address},
				success:function(json){
					
					if(json["result"]=="fail"){
						alert('정보 수정에 실패했습니다. 다시 시도해주세요.')
						
					}else if(json["result"]=="success"){
						
						alert('수정되었습니다.')
						$(".jumbotron").show();
						$("#pwdChk").val("");
						$("#detailTable").hide();
					}
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	});//수정
	
	
	//회원탈퇴
	$(document).on('click','#secede',function(){
		
		var id = $("#member_id").val();
		var result = confirm("정말 탈퇴하시겠습니까?");
		if(result == true){
			$.ajax({
				url:"${contextPath}/mypage/memberQuit.do",
				type:"post",
				data:{"member_id":id},
				datatype : "text",
				success:function(data){

					if(data=="success"){
						
						alert('탈퇴되었습니다.')
						location.href="${contextPath}/main.do"
						
					}else if(data=="fail" ){
						
						alert('탈퇴에 실패했습니다. 다시 시도해주세요.')
					}
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		
		}
	});//회원탈퇴
	
	
	//리뷰작성 폼에 상품 아이디값 넣기
	$(document).on('click','.insertReview',function(e){
		
		var product_id = e.target.value;
		$("#getProduct_id").val(product_id);
		
	});
	
	
	
	
	
});
</script>

	<!--===============================================================================================-->
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</body>
</html>




