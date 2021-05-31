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
<title>주문상세목록</title>
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

		<div class="tab-content" id="advancedTabContent">

<!-- 주문목록 -->
			<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
				<div class="container maincontainer">	<%-- <div class="container 	mt-2 mb-3 maincontainer"> --%>
				    <div class="row no-gutters">
				      <div class="col-12">
				      	<div class="mt-4 mb-4 d-flex justify-content-between">
						<div style="display:inline;" class="ml-4 col- d-flex justify-content-start"><h3>주문상세내역</h3></div>
						<div style="display:inline;" class="mr-4 col- d-flex justify-content-end"><button class="btn btn-danger" onclick="javascript:location='${contextPath}/mypage/myPageMain.do'">주문목록으로</button></div>										
 						</div>
				            <!-- Classic tabs -->
				            <div class="card border rounded px-4 py-4">
				             <!--ordered product-->
			                  <c:forEach items="${orderDetailList}" var="orderDetailList">
				                <div class="ordered-product">
				                  <div class="card-header">
				                    <div class="row justify-content-between mb-3">
				                        <div class="col-auto">
				                            <h6 class="color-1 mb-0 change-color">주문상품</h6>
				                        </div>
										<c:choose>
										<c:when test="${orderDetailList.event_product_id != 0}">
				                        	<div class="col-auto see-order-details"><a href="${contextPath}/userProduct/detailUserEventProduct.do?event_product_id=${orderDetailList.event_product_id}">상품상세 가기</a></div>										
										</c:when>
										<c:when test="${orderDetailList.event_product_id == 0}">
				                        	<div class="col-auto see-order-details"><a href="${contextPath}/userProduct/detailUserProduct.do?product_id=${orderDetailList.product_id}">상품상세 가기</a></div>										
										</c:when>
										</c:choose>
				                    </div>
				                    <div class="row">
				                        <div class="col">
				                            <div class="card card-2">
				                                <div class="card-body">
				                                  <div class="row my-auto flex-column flex-md-row">
				                                  </div>
				                                  <div class="media">
				                                    <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="${orderDetailList.product_img_path}${orderDetailList.product_img_name}" width="135" height="135" /> </div>
				                                    <div class="media-body my-auto">
				                                        <div class="row my-auto flex-column flex-md-row">
				                                            <div class="col my-auto">
				                                                <h6 class="mb-0 arrival-date"><b>${orderDetailList.product_name}</b></h6>
				                                            </div>
				                                            <div class="col-auto my-auto"> 상품가격 : <span>&#x20A9; </span> <strong class="price-value" id="orders_product_price"><fmt:formatNumber value="${orderDetailList.order_product_price}" type="number" var="orders_product_price" />${orders_product_price}원</strong></div>
				                                            <div class="col-auto my-auto"> 상품수 : <strong>${orderDetailList.order_product_amount}개</strong> </div>
				                                            <div class="col my-auto d-flex justify-content-end">
				                                               <div class="button-option">
				                                                <button type="button" class="btn btn-outline-primary btn-bg button2 insertReview" data-target="#insertReviewModal" data-toggle="modal" value="${orderDetailList.product_id}">리뷰 작성</button>
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




