<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta charset="UTF-8">
<title>review List</title>
</head>
<body>
	<%--  <form action="/review/insert.do" method="post"> --%>
	<%-- Button to Open the Modal --%>
<div id="reviewTable" style="text-color:black;">
 	<c:forEach var="reviewList" items="${reviewList}">
								<%-- 	forEach 밖에서도 인식할 수 있도록 변수에 값을 할당 --%>
								<c:set var="review_name" value="${reviewList.name}" />
								<table style="width:1066px;font-size:1.2em;">
									<tr>
										<td  style="width: 20%; heigth: 20%">
											<div class="card"  style="border:none;display:inline-block;">
												<span class="card-text" style="font-weight: bold;font-size:1.3em;">${reviewList.name}</span><br/>
											<c:choose>
												<c:when test="${reviewList.review_star == 1}">
													<div>
														<i class="fas fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
														<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
													</div>
												</c:when>
												<c:when test="${reviewList.review_star == 2}">
												<div>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													</div>
												</c:when>
												<c:when test="${reviewList.review_star == 3}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
												<c:when test="${reviewList.review_star == 4}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
												<c:when test="${reviewList.review_star == 5}">
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
													<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
												</c:when>
											</c:choose>
											<%-- 	<img src="${contextPath}/image/${reviewList.review_image}"
														class="reviewImage" alt="review_Image"> --%>
												<div class="card-text">${reviewList.created_at}</div>			
											</div>
										</td>
								
										<td style="width: 65%; heigth: 20%;">
											<div class="card-text">${reviewList.content}</div>
										</td>
											<td  style="width: 15%; heigth: 20%;" id="btnUpDel">
												<c:if test="${not empty memberDTO}" >
													<%-- 	<span class="card-text">${reviewList.view_count}</span><br/> --%>
														<button type="button" class="btn btn-primary modifyBtnUp" data-toggle="modal" value="${reviewList.review_id}"  style="cursor:pointer;display:inline-block;">수정</button>
														<button type="button" class="btn btn-primary modifyBtnDel" data-toggle="modal"  value="${reviewList.review_id}" style="cursor:pointer;display:inline-block;">삭제</button>
												</c:if>
											</td>
									</tr>
								</table>
							<hr/>
							</c:forEach>
							<div>
						  		<div style="display: block; text-align: center;font-size:1.3em;">		
									<c:if test="${reviewPage.startPage>5}">
										<a onclick="javascript:rvPrevPaging('${reviewPage.startPage-5}');">&lt;&lt;</a>
									</c:if>
									<c:forEach begin="${reviewPage.startPage}" end="${reviewPage.endPage}" var="reviewP">
										<c:choose>
											<c:when test="${reviewP == reviewPage.currentPage }">
												<b>${reviewP}</b>
												<input type="hidden" id="getCurrentPage" value="${reviewP}"/>
											</c:when>
											<c:when test="${reviewP != reviewPage.currentPage }">
												<a onclick="javascript:rvPaging('${reviewP}');">${reviewP}</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${reviewPage.endPage < reviewPage.totalPages}">
										<a onclick="javascript:rvNextPaging('${reviewPage.startPage+5}');">&gt;</a>
										<a onclick="javascript:rvTotalPage('${reviewPage.totalPages}');">&gt;&gt;</a>
									</c:if>
								</div>
							</div>
						</div>
				<!-- Classic tabs -->

			

	<%-- <button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#insertReviewModal">Open modal</button>
	 모달 창
	The Modal

<div class="modal fade" id="insertReviewModal" tabindex="-1" role="document" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<div class="container">
  <h2>리뷰 글 작성</h2>

  <form action="${contextPath}/review/insert.do" class="needs-validation" novalidate>
    <div class="form-group">
      <label for="reviewName">리뷰 내용:</label>
      
      <input type="text" name="order_product_detail_id" value="${order_product_detail_id }"> 
   <input type="text" name="member_id"  value="${review_member_id}"> 
       
      <textarea class="form-control" rows="5" id="writeReview"name="content" placeholder="리뷰 입력" required></textarea>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">내용을 입력하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="reviewName">상품평:</label>
      <select class="form-control" id="review_star" name="review_star">
        <option value="1">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="2">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="3">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="4">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="5">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
      </select>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">
        별점을 입력하세요.<br/>
      </div>

    </div>
    
    <input type="hidden"  name="member_id" value="${review_member_id}"/>
    <input type="hidden" name="email" value="${review_email}"/>
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

update 파트-----------------------------------------------------------------
	 모달 창
	The Modal

<div class="modal fade" id="updateReviewModal" tabindex="-1" role="document" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<div class="container">
  <h2>리뷰 글 수정</h2>

  <form action="${contextPath}/review/update.do" class="needs-validation" novalidate>
    <div class="form-group">
      <label for="reviewName">리뷰 내용:</label>
      제품상세번호(order_product_detail_id):<input type="text" name="order_product_detail_id" value="${order_product_detail_id}">
      <br/>	
     <input type="text" name="order_product_detail_id" value="${review_order_product_detail_id }">
    
     리뷰글의id(review_id):<input type="text" id="review_id222"/>
     <br/>
    리뷰글작성자의 이메일:<input type="text" id="email" name="email" value="${email}"/>
   <br/>
      <textarea class="form-control" rows="5" id="updateReview" name="content"  placeholder="리뷰 입력" required></textarea>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">내용을 입력하세요.</div>
    </div>
    	<input type="text" id="review_star1"/>
    <div class="form-group">
      <label for="reviewName">상품평:</label>
      <select class="form-control" id="modifyReview_star" name="review_star">
        <option value="1">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="2">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="3">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="4">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i id="star${k}" class="far fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
		</option>
        <option value="5">
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.2rem;"></i>
			<i class="fas fa-star"style="color:#FFE650;font-size:1.3rem;"></i>
		</option>
      </select>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">
        별점을 입력하세요.<br/>
      </div>
      <input type="hidden" id = "modifyReviewId" name="review_id" />
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
</div> --%>


<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script>


//문의 글 수정폼 보여주기
</script>
<script>
$(document).on('click','.modifyBtnUp',function(e){
	
   var reviewId = e.target.value;
 	alert(reviewId);
   $.ajax({
      url:"${contextPath}/review/updateForm.do",
      type:"post",
      data:{"review_id":reviewId},
      datatype:"json",
      success:function(json){
         $("#updateReview").val(json["content"]);
         $("#modifyReviewId").val(json["review_id"]);
         $("#review_star1").val(json["review_star"]);
         if(json["review_star"]==1){
        	 $("#modifyReview_star option:eq(0)").prop("selected",true);
         }else if(json["review_star"]==2){
        	 $("#modifyReview_star option:eq(1)").prop("selected",true);
         }else if(json["review_star"]==3){
        	 $("#modifyReview_star option:eq(2)").prop("selected",true);
         }else if(json["review_star"]==4){
        	 $("#modifyReview_star option:eq(3)").prop("selected",true);
         }else if(json["review_star"]==5){
        	 $("#modifyReview_star option:eq(4)").prop("selected",true);
         }
         $("#update").modal("show");
      },
      error:function(request, error){
         alert('err');
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   });
   
});

$(document).on('click','.modifyBtnDel',function(e){
	
	   var reviewId = e.target.value;
	 	alert(reviewId);
	   $.ajax({
	      url:"${contextPath}/review/delete.do",
	      type:"post",
	      data:{"review_id":reviewId},
	      success:function(){
	         alert('삭제되었습니다');
	         window.location.reload(true);
	      },
	      error:function(request, error){
	         alert('err');
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	   });
	   
	}); 

</script>

</body>
</html>
