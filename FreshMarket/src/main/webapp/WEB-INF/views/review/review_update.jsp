<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<title>리뷰 글 쓰기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>리뷰 입력</h2>
	
	<!-- The Modal -->
  <div class="modal fade" id="updateReviewModal">
    <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 글 쓰기</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       	<form action="${contextPath}/review/update.do" class="was-validated" id="update_form" name="update_form">
			<div class="form-group">
				<label for="labelWriteReview">리뷰 내용:</label>
				  <textarea class="form-control" rows="5" id="updateReview" name="content" placeholder="리뷰 입력" required></textarea>
				<div class="invalid-feedback">내용을 입력하세요.</div>
			</div>
    
			<div class="form-group">
				<label for="labelStarReview">상품평:</label>
				<select class="form-control" id="updateStarReview" name="review_star" required>
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
                <div class="invalid-feedback">별점을 입력하세요.<br/>미 입력시 별3개가 입력됩니다.</div>
			  	<br>
			</div>
  	 	
			<div class="form-group">
				<label for="pwd">이미지 첨부:</label>
				<input type="file" class="form-control-file border" name="review_image" required>
				<div class="valid-feedback">이미지가 첨부되었습니다.</div>
				<div class="invalid-feedback">이미지가 미첨부되어 있습니다.</div>
			</div>

		</form>
		</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" type="submit"  class="btn btn-danger" data-dismiss="modal">입력</button>
          <button type="button" type="reset" class="btn btn-danger" data-dismiss="modal">reset</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>

</body>
</html>