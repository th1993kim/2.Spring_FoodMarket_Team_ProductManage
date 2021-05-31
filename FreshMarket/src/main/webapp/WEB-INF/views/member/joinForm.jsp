<%@ page language="java" 		  contentType="text/html; charset=utf-8"
				  pageEncoding="utf-8"  isELIgnored="false" %>
<%--  tiles를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--  contextPath를  변수명이 contextPath에 담는 jstl의 core부분 --%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<title>가입</title>
		<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>

</head>
<style>
#preview {
	width:100%;
	t
	
}

.inner{
	width: 750px;
}
</style>


<body>
				<div id="preview" class="d-flex justify-content-center">
								<div class="inner d-flex justify-content-center">
												<div class="container jus">
																<div class="jumbotron" style="padding-top: 20px; ">
																				<form class="joinFrm" action="${contextPath}/member/joinMember.do" method="post" onsubmit="return frmchk();">
																				<div class="contents">
																								<header>
																												<h2 class="joinFrmHeaderText"><strong style="text-align: center;">회원가입</strong></h2>
																								</header>
																								<hr>
																				</div>
																								<h3 style="text-align: center;"></h3>
																								<div class="form-group">
																												<span class="joinFrmText">이메일:</span><br /> <input type="text" class="form-control" id="email" name="email" value="${param.email}" maxlength="20" placeholder="이메일">
																												<input type="button" class="btn btn-primary" id="email_btn" name="email_btn" value="중복체크"><div class="check_font" id="email_check"></div><br>
																								</div>
																								<div class="form-group">
																												<span class="joinFrmText">암호:</span><br /> <input type="password" id="password" name="password" class="form-control" maxlength="20" placeholder="암호">
																								</div>
																								<div class="form-group">
																												<span class="joinFrmText">확인:</span><br /> <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" maxlength="20" placeholder="암호">
																								</div>
																								<div class="form-group">
																												<span class="joinFrmText">이름:</span><br /> <input type="text" id="name" name="name" value="${param.name}" class="form-control" maxlength="20" placeholder="이름">
																								</div>
																								<div class="form-group">
																												<span class="joinFrmText">휴대전화번호:</span><br /> <input type="text" id="phone" name="phone" value="${param.phone}" class="form-control" maxlength="20" placeholder="휴대전화번호">
																								</div>
																								<div class="form-group">
																												<span class="joinFrmText">상세주소:</span><br /> <input type="text" id="address" name="address" value="${param.address}" class="form-control" maxlength="20" placeholder="주소"> <input type="button" class="btn btn-primary" id="address_btn" onclick="execDaumPostcode()" value="주소 검색"><br>
																												<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
																												<br>
																								</div>
																								<input type="submit" id="reg_submit" class="btn btn-primary form-control" value="가입">
																				</form>
																</div>
												</div>
								</div>


<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=370d14e1be4a13c4fb51f4ef17903911&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>


<script>
// 이메일 유효성 검사(1 = 중복 / 0 != 중복)
	$("#email_btn").click(function() {
		// id = "email" / name = "email"
		var email = $('#email').val();
		$.ajax({
			url : '${contextPath}/member/checkDuplication.do?email='+ email,
			type : 'get',
			success : function(data) {
				console.log("true = 중복o / false = 중복x : "+ data);							
				
				if (data == "true") {
						// 1 : 아이디가 중복되는 문구
						
 						$("#email_check").text("사용중인 이메일입니다.");
						$("#email_check").css("color", "red"); 
						$("#reg_submit").attr("disabled", true);
					} else {
						$("#email_check").text("사용가능한 이메일입니다."); 
						$("#email_check").css("color", "green"); 
						$("#reg_submit").attr("disabled", false);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>


<script>
function frmchk(){
		if($("#email").val() == ""){
			alert("이메일를 입력해주세요");
			$("#email").focus();
			return false;
		}
		
		if($("#password").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#password").focus();
			return false;
		}
		
		if($("#confirmPassword").val() == ""){
			alert("비밀번호 확인을 입력해주세요");
			$("#confirmPassword").focus();
			return false;
		}

		if ($("#password").val() != $("#confirmPassword").val()) {
			alert('비밀번호가 일치하지 않습니다')
			$("#pw1").focus();
			return false;
    }
		
		if($("#name").val() == ""){
			alert("성명을 입력해주세요");
			$("#name").focus();
			return false;
		}
		
		if($("#name").val().length > 20){
			alert("성명은 20자까지 입니다.");
			$("#name").focus();
			return false;
		}
		
		if($("#phone").val() == ""){
			alert("휴대전화번호를 입력해주세요");
			$("#phone").focus();
			return false;
		}

		if($("#phone").val().length != 11){
			alert("휴대전화번호는 11자리입니다");
			$("#phone").focus();
			return false;
		}

		if($("#address").val() == ""){
			alert("주소를 입력해주세요");
			$("#address").focus();
			return false;
		}
}
</script>
</body>
</html>