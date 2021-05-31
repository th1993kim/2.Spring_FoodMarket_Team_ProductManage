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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>	
<link rel="shortcut icon" href="/favicon.ico">
<meta charset="UTF-8">
<title></title>
<style>



*{
	box-sizing:border-box;
	margin:0;
	padding:0;
}
.product_container{
	margin:0 auto;
	width:1180px;
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
	font-size:14px;
	cursor:pointer;
}
/* 이미지상세보기 스크롤바쪽 */
#detailScrollbar ::-webkit-scrollbar{
	width:16px;
	height:16px; 
}
#detailScrollbar ::-webkit-scrollbar-thumb{
	background-color:#E6E6E6;
	border-radius: 7px;
}
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
	font-size:18px;
	height:350px;
	border:2px inset #E6E6E6;
	margin: 10px;
	overflow-x:auto;
}
#product_selectList{
	display:block;
	width: 1180px;
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
	font-size:20px;
}
#productCategory, #productCategory2{
	width:540px !important;
	display:inline-block !important;
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
	font-size:17px;
}
/* focus되도 아웃라인 안보이기 */
.divideTextBox:focus ,#product_detail input[type="text"]:focus{
	outline:none;
}

/* 상품 상세 테이블  */
#product_detail table{
	overflow:auto;
}
/* 위아래 공간 주기 */
#product_detail td,th{
	padding:20px 0;
	text-align:center;
}

/* readonly값 */
#product_detail input[readonly="readonly"]{
	background-color:#f5f5f5;
}
/* 상품명 */
#product_name {
	width:1040px;
}

/* 분류 추가 버튼 */
.divideInsertButton{
	border:0px;
	background-color:#fff8e1;
	font-size:17px;
	cursor:pointer; 
	color:#494949;
	font-weight:650; 
}

/* 업로드의 추가 삭제 버튼 css */
.imgNum{
	cursor:pointer;
	margin:5px 0;
}

/* 카테고리 가져오기 버튼 */
#categorySelect{
	font-size:17px;
	height:35px;
	border-radius:5px;
	cursor:pointer;
	vertical-align: middle;
}

/* submit 버튼 수정 */
#submitButton{
	text-align:center;
}

#submitButton input{
 	font-size:20px;
	cursor:pointer;
	margin:50px 15px;
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
	margin:30px;
	font-size:20px;
	cursor:pointer;
}


/* 상품상세 숨기기 */
#product_detail{
	display:none;
	font-size:17px;
}
 
/* 상품이미지 미리보기 대형 */ 
.product_imgPreviewSrc{
	width:450px;
	height:450px;
	visibility:hidden;
	display:inline-block;
	margin:0 0 0 10px;
}
 
 /* 상품이미지  미리보기 선택 타일*/
.productImgSrc{
	width:200px;
	height:200px;
	margin: 5px;
}

#product_imgTiles{
	width:670px;
	height:450px;
	overflow:auto;
	display:inline-block;
	margin:0 auto 0 30px;
}
/* 이미지 상세보기 스크롤쪽 */
.productDetailImgSrc{
	width:200px;
	height:200px;
	margin:5px;
}
/* 이미지 상세보기 대형화면쪽 */
#product_imgDetailPreview{
	width:780px;
	visibility:hidden;
	margin :0 auto;
	display:block;
}

/* 업로드 아이콘 크기 */
.upload_icon{
	width:25px;
	height:25px;
}
/*  */
.img_Upload_td{
	text-align:center;	
}
/* 버튼 폰트크기 */
.fontUP{
	font-size:16px;
}
.verticalAlign th,td{
	vertical-align: middle;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	
	 var j=2; // 상품 디테일 전용 파라미터
	 
	//상품 카테고리 활성화(중분류 선택시)
	  $("#middleCategory").change(function(){
			$('#productCategory').empty();
			$('#productCategory2').empty();
			var middleOption;
			middleOption = $('#middleCategory option:selected').val();
			//console.log(middleOption);
			$.ajax({
				url:"${contextPath}/manage/productCategory",
				type:"get",
				datatype:"json",
				data:"middleId="+middleOption,
				success:function(json){
					/* $.each(json[0],function(key,value){
						console.log('key:' + key + ' / '+ 'value' + value);
					});  */
					//json 배열의 길이	
					var str = "";
					var jsonLength = Object.keys(json).length
					for(p=0;p<parseInt(jsonLength/2);p++){
						var keys = json[p]["product_id"];
						var values = json[p]["product_name"];
							str = str+"<option value='"+keys+"'>["+json[p]['product_id']+"]"+values+"</option>";
					}
					var str2="";
					for(p=parseInt(jsonLength/2);p<jsonLength;p++){
						var keys = json[p]["product_id"];
						var values = json[p]["product_name"];
							str2 = str2+"<option value='"+keys+"'>["+json[p]['product_id']+"] "+values+"</option>";
					}
					$('#productCategory').append(str);
					$('#productCategory2').append(str2);
					//console.log(str);
				},
				error:function(request, error){
					alert('err');
					//실패이유를 알려준다.
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	  });
	//중분류 카테고리 활성화 (대분류 선택시)
	 $("#mainCategory").change(function(){
		$('#middleCategory').empty();
		var mainOption;
		mainOption = $('#mainCategory option:selected').val();
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
				var str = "";
				var jsonLength = Object.keys(json).length
				for(m=0;m<jsonLength;m++){
					var keys = json[m]["middle_id"];
					var values = json[m]["middle_name"];
						str = str+"<option value='"+keys+"'>"+values+"</option>";
				}
				$('#middleCategory').append(str);
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
	 
	 //main카테고리 추가
	 $('#mainCategoryInsertButton').click(function(){
			var main;
			main= $('#mainCategoryInsert').val();
			//console.log("data",main);
			$.ajax({
				url:"${contextPath}/manage/mainCategoryInsert",
				type:"get",
				datatype:"json",
				data:"mainCategoryInsert="+main,
				success:function(json){
					var str = "<option value='"+json["main_id"]+"'>"+main+"</option>"
					//console.log(str);
					$('#mainCategory').append(str)
					alert("성공!");	
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
		 
	 });
	 
	 //중분류 카테고리 추가
	 $('#middleCategoryInsertButton').click(function(){
			var middle;
			var main;
			main=$('#mainCategory option:selected').val();
			middle= $('#middleCategoryInsert').val();
			var allData={"middleCategoryInsert":middle,"mainCategory":main};
			//console.log("data",middle);
			$.ajax({
				url:"${contextPath}/manage/middleCategoryInsert",
				type:"get",
				datatype:"json",
				data:allData,
				success:function(json){
					var str = "<option value='"+json["middle_id"]+"'>"+middle+"</option>"
					//console.log(str);
					$('#middleCategory').append(str)
					alert("성공!");	
				},
				error:function(request, error){
					alert('err');
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
		 
	 });
	 
	 //새상품 등록시 카테고리 값 받아오기
	 $("#product_newButton").click(function(){
		$('#product_detail').css('display','block');
		$('#productInsert').css('display','inline-block');
		$('#productChange').css('display','none');
		$('#detailScrollbar').empty(); 
		$('#product_name').val('');
		$('#net_weight_per').val('');
		$('#net_weight_total').val('');
		$('#product_fixed_price').val('');
		$('#product_stock').val('');
		$('#product_imgPreview').css('visibility','hidden');
		$('#product_imgDetailPreview').css('visibility','hidden');
		$('#product_detailImgContainer div').not($('#detailImg1')).remove();
		$("label[for=product_img1]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> 파일 명 ");
		$("label[for=product_detailImg1]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> &#9312; 번 파일");
		 var mainOption ="";
		 var middleOption ="";
		 var newText="New"
		 mainOption=$('#mainCategory option:selected').text();
		 middleOption = $('#middleCategory option:selected').text();
		 $('#product_id').val(0);
		 
		 $('#product_mainCategory').val(mainOption);
		 $('#product_middleCategory').val(middleOption);
		 $('#main_id').val($('#mainCategory option:selected').val())
		 $('#middle_id').val($('#middleCategory option:selected').val())
		 j=2;
	 }); 
	 
	 //카테고리 변경하기 
	 $("#categorySelect").click(function(){
		 
		 var mainOption ="";
		 var middleOption ="";
		 mainOption=$('#mainCategory option:selected').text();
		 middleOption = $('#middleCategory option:selected').text();
		 $('#product_mainCategory').val(mainOption);
		 $('#product_middleCategory').val(middleOption);
		 $('#main_id').val($('#mainCategory option:selected').val())
		 $('#middle_id').val($('#middleCategory option:selected').val())
		 j=2;
	 }); 
	 
	 
	//동적처리된 태그의 업로드시 이미지업로드의 파일명 보이기 , 이미지 미리보기
	 $(document).on("change","input[name=product_img]",function(file){
		 var id = $(this).attr('id');
		 var selectIdNum = id.substring(11,id.length);
		 var fileValue=$(this).val().split("\\");
		 var fileName=fileValue[fileValue.length-1];
		 $("label[for="+id+"]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> 파일명 : "+fileName);
		 var imgfile=file.target.files[0];
		 readURL(imgfile,selectIdNum);
		 
	 //업로드된 이미지업로드의 파일명 보이기 ,  파일 미리보기 업로드하기
	/*  $('input[name=product_img]').change(function(file){
		 var id = $(this).attr('id');
		 var fileValue=$(this).val().split("\\");
		 var fileName=fileValue[fileValue.length-1];
		 $("label[for="+id+"]").text("이미지업로드  파일명 : "+fileName);
			 
		 var imgfile=file.target.files[0];
		 readURL(imgfile);
	 }); */
	 });
	 
	 /*
	 	$(document).on("click","#btn",function(){  <<< 요로케 바꿔보자 ㅎㅎㅎ
		on태그 각각에 들어가는 parameter들은 
		첫번째 : click / change  등등의 이벤트
		두번째 : 이벤트 적용할 타겟 태그
		세번째 : 동작 함수
	 
	 */
	 
	 //이미지업로드 미리보기 전용 함수
	 function readURL(imgfile,selectIdNum){
		 if(imgfile.type.match('image.*')){
			 var reader = new FileReader();
			 /*파일의 URL 읽어온다. 다른방법으로는
			 	readAsText (텍스트만)
			 	readAsArrayBuffer 버퍼로 데이터 저장
			 	readAsBinaryString  이진데이터 반환
			 */
			 reader.readAsDataURL(imgfile); 
			 //onload ==> 데이터를 불러오기 성공햇을때 이벤트 실행
			 reader.onload = function(f){
				$('#product_imgPreview').prop('src',f.target.result);
				$('#product_imgPreview').css('visibility','visible');
			 }
		 }
	 }

	
	 //이미지 상세설명 업로드 추가하기
	 $('#imgDetailNumPlus').click(function(){
			var str="";
			str=str+"<div id='detailImg"+j+"'>";
			str=str+ "<label for='product_detailImg"+j+"' class='product_img_label' ><img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/>&#"+(9311+j)+"; 번 파일</label>"
			str=str+" <input type='file' id='product_detailImg"+j+"' name='product_detailImg'>"
			str=str+"<input type='button' name='imgDetailNumMinus' class='imgNum btn btn-danger fontUP' id='imgDetailNumMinus"+j+"' value='삭제' />"
			str=str+"</div>"
			
			 $('#product_detailImgContainer').append(str);
			
			j++;
	 });
	 
	 
	 //동적태그로 생성된  이미지상세설명 업로드의 파일명 보이기 ,이미지 미리보기
	 $(document).on("change","input[name=product_detailImg]",function(file){
		 var id = $(this).attr('id');
		 var selectIdNum = id.substring(17,id.length);
		 var fileValue=$(this).val().split("\\");
		 var fileName=fileValue[fileValue.length-1];
		 $("label[for="+id+"]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/>&#"+(9311+parseInt(selectIdNum))+"; 번 파일"+fileName);
		 
		 //기존 파일 수정시 파라미터 보내기
		 var changeDetailIndex;
		 changeDetailIndex = "<input type='hidden' name='changeDetailIndex' value='"+(selectIdNum-1)+"' id='changeDetailIndex"+selectIdNum+"' />";
		 $('#submitButton').append(changeDetailIndex);
		 
		 
		 var imgfile = file.target.files[0];
		 if (imgfile!=null){
		 readURL2(imgfile,selectIdNum);
		 }else{
			 var srcId= "#productDetailImgFile"+selectIdNum;
			 $(srcId).remove();
		 }
	 });
	 //이미지 상세보기 미리보기용 함수
	 
	 function readURL2(imgfile,selectIdNum){
		if(imgfile.type.match('image.*')){
			var reader = new FileReader();	//자바스크립 FileReader 내장객체 실행
			reader.readAsDataURL(imgfile);   // 파일URL로 읽어오기
			reader.onload=function(f){
				var checkId="#productDetailImgFile"+selectIdNum;
				if(!($(checkId).length>0)){				
					var str = "<img src='"+f.target.result+"' id='productDetailImgFile"+selectIdNum+"' name='productDetailImgFile' class='productDetailImgSrc'/>"
						
					
					//정렬 하기
					var imgIdNum = new Array();						
					$('img[name=productDetailImgFile]').each(function(index,item){
						imgIdNum.push(parseInt((($(this).attr('id')).substring(20,($(this).attr('id')).length))));
						//배열에다가 기존 아이디 값들 집어넣기
					});
						if(imgIdNum.length==0){//배열이 비어있으면 바로 div태그로 보낸다.
							$(str).appendTo('#detailScrollbar');	
						}else{
							imgIdNum.push(parseInt(selectIdNum));
							//배열에 현재 넣으려는 아이디 값 넣기
							imgIdNum.sort(function(a,b){
								return a - b;							
							});  //아이디 값들을 정렬 시킨다
							var indexNum = imgIdNum.indexOf(parseInt(selectIdNum));
							if(indexNum==0){ //index번호가 첫번째면 맨위로 보낸다
								$(str).prependTo('#detailScrollbar');
							}else{
								//현재 넣은 id값의 index번호를 가져오고
								var sendId ="#productDetailImgFile"+imgIdNum[indexNum-1];
								//현재 넣은 id값의 index번호보다 앞에있는 id값을 가져온다.
								$(str).insertAfter($(sendId));
								//그 id값 다음에 태그가 올수 있도록 한다.
							}
						}
				}else{
					$(checkId).attr('src',f.target.result);					
				}
			}
		}
	 }
	 
	 
	 //동적태그로 생성된 이미지 상세설명 -버튼 누를시 삭제
	 $(document).on("click","input[name=imgDetailNumMinus]",function(){
		var id= $(this).attr('id');
		var selectIdNum = id.substring(17,id.length);
		var divId="#detailImg"+selectIdNum;
		$(divId).remove();
		var imageId="#productDetailImgFile"+selectIdNum;
		$(imageId).remove();
		 
	 	var deleteDetailIndex = "<input type='hidden' name='deleteDetailIndex' value='"+(selectIdNum-1)+"' />"
		$('#submitButton').append(deleteDetailIndex);
	 	var changeDetailIndexParam = "#changeDetailIndex"+selectIdNum;
	 	$(changeDetailIndexParam).remove();
	 });
	
		
	
	//동적처리된 태그 상세설명 이미지 의 속성 바꾸기 (CSS)
	$(document).on("click","img[name=productDetailImgFile]",function(){
		var src = $(this).attr('src');
		$('#product_imgDetailPreview').prop('src',src);
		$('#product_imgDetailPreview').css('visibility','visible');
		$('img[name=productDetailImgFile]').css('border','none');
		$(this).css('border','5px solid red');
		
	});
	
	
	
	/* 상품 메뉴 리스트중 1개 선택시 반대쪽 안골라 지게 하기 */
	$('#productCategory').change(function(){
		$('#productCategory2 option:selected').prop('selected',false);			
	});
	$('#productCategory2').change(function(){
		$('#productCategory option:selected').prop('selected',false);			
	});
	
	
	/* 상품변경 클릭시 해당 상품 정보 받아오고, 변경하기 */
	$('#product_chButton').click(function(){
		$('#product_detail').css('display','block');
		$('#productInsert').css('display','none');
		$('#productChange').css('display','inline-block');
		var product_id;
		var pcvalue=$('#productCategory option:selected').val();
		var pcvalue2=$('#productCategory2 option:selected').val();
		$('#product_imgPreview').css('src',"");
		$('#detailScrollbar').empty();
		$('#product_detailImgContainer div').not($('#detailImg1')).remove();
		if(pcvalue!=null){
			product_id=pcvalue;
		}else if(pcvalue2!=null){
			product_id=pcvalue2;
		}else{
			alert("선택된 상품이 없습니다.");
			$('#product_detail').css('display','none');
		}
		//alert(product_id);
		$.ajax({
				url:"${contextPath}/manage/productSelect.do",
				type:"get",
				datatype:"json",
				data:"product_id="+product_id,
				success:function(json){
							$('#product_id').val(json["product_id"]); 
																														//mainCategory의 option의 value가 제이슨 값인 text를 가져온다.
							$('#product_mainCategory').val($("#mainCategory option[value='"+json["main_id"]+"']").text()); 
							$('#main_id').val(json["main_id"]); 
							$('#product_middleCategory').val($('#middleCategory option:selected').text()); 
							$('#middle_id').val(json["middle_id"]); 
							$('#product_name').val(json["product_name"]); 
							$('#product_fixed_price').val(json["product_fixed_price"]); 
							json["product_price"]; 
							json["product_img_path"];
						
							var product_img_name =json["product_img_name"].split(","); 
							product_img_name.forEach(function(value,index,array){
								
								var idNum=(index+1)
								var loardId = "product_img"+idNum;
								if(index==0)
								$("label[for="+loardId+"]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> 파일 명 "+value);
								$('#product_imgPreview').prop('src',json["product_img_path"]+value);
								$('#product_imgPreview').css('visibility','visible');
							});
							json["product_detail_path"]; 
							var product_detail_name =json["product_detail_name"].split(",");
							product_detail_name.forEach(function(value,index,array){
								var detailNum=(index+1);
								var loardDetail = "product_detailImg"+detailNum;
								if(index==0){
									$("label[for="+loardDetail+"]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/>&#"+9312+"; 번 파일"+value);
								}else{
									var detailStr="";
									detailStr=detailStr+"<div id='detailImg"+detailNum+"'>";
									detailStr=detailStr+ "<label for='product_detailImg"+detailNum+"' class='product_img_label' ><img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/>&#"+(9311+detailNum)+"; 번 파일"+value+"</label>"
									detailStr=detailStr+"<input type='file' id='product_detailImg"+detailNum+"' name='product_detailImg'>"
									detailStr=detailStr+"<input type='button' name='imgDetailNumMinus' class='imgNum btn btn-danger fontUP' id='imgDetailNumMinus"+detailNum+"' value='삭제' />"
									detailStr=detailStr+"</div>" 
									 $('#product_detailImgContainer').append(detailStr);
									j++; 
								}
								var detailStr = "<img src='"+json["product_detail_path"]+value+"' id='productDetailImgFile"+detailNum+"' name='productDetailImgFile' class='productImgSrc'/>"
								$(detailStr).appendTo('#detailScrollbar');
							});
							json["product_list_img_path"]; 
							json["product_list_img_name"]; 
							$('#product_stock').val(json["product_stock"]); 
							json["product_total"]; 
							$('#net_weight_per').val(json["net_weight_per"]); 
							$('#net_weight_total').val(json["net_weight_total"]); 
							//input name 이 is_locked이고 value가 제이슨 값인 선택자의 속성 변경
							//$("input[name='is_locked']:input[value='"+json['is_locked']+"']").prop('checked',true);
							$("input[name='is_locked'][value='"+json['is_locked']+"'").prop("checked",true);
							// 자바스크립트에서 콜론(:) 은 필터 셀렉터의 개념으로도 쓰인다
							// (선택요소):input 선택 요소 하위의 또 input 요소의 필터를 달 수 있다.
							},
				error:function(request,error){
					alert("code :"+request.status + "\n"+"message : "+request.responseText+"\n"+"error"+error);
				}
		});
		
		
	});
	
	
	/* 상품 변경 submit 버튼 클릭시 action 변경 */
	$(document).on('click','#productChange',function(){
			$('#productManageForm').attr('action','${contextPath}/manage/productChange.do');
	});
	
	/* 리셋버튼 클릭시 모든 div초기화 */
	$('#reset').click(function(){
			$('#detailScrollbar').empty(); 
			$('#product_imgPreview').css('visibility','hidden');
			$('#product_imgDetailPreview').css('visibility','hidden');
			$('#product_detailImgContainer div').not($('#detailImg1')).remove();
			$("label[for=product_img1]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> 파일 명 ");
			$("label[for=product_detailImg1]").html("<img src='${contextPath}/resources/image/icons8-upload-64.png' class='upload_icon'/> &#9312; 번 파일");
			j=2;
	});
	
	/* submit시에 카테고리 미선택시 알람 */
	$('#productInsert').click(function(){
		if($('#product_mainCategory').val()==""||!$('#product_mainCategory').val()){
			alert('대분류 카테고리를 선택해주세요');
			return false;
		}
		if($('#product_middleCategory').val()==""||!$('#product_middleCategory').val()){
			alert('중분류 카테고리를 선택해주세요');
			return false;
		}
	});
	
	
});

	 /* 입력시 숫자만 가능하게 */
function check(my){
    my.value = my.value.replace(/[^0-9]/g,"");
}
	 



</script>   
</head>
<body>
<div class="product_container">
<h1>상품 관리</h1>
	<div id="product_selectList">
		<div id="mainCategory-container">
			<h2>대분류</h2>
			<select id="mainCategory" name="mainCategory" size ="10" class="scrollBar form-control">
				<c:forEach  var="main" items="${mainCategory}"> 
					<option value="${main.main_id}">${main.main_name}</option>
				</c:forEach>
			</select>
			<br/>
			<input type="text" id="mainCategoryInsert" name="mainCategoryInsert" class="divideTextBox"><input type="button" id="mainCategoryInsertButton" value="추가" class="btn btn-success fontUP">
		</div>
		<div id="middleCategory-container">
			<h2>중분류</h2>
			<select id="middleCategory" name="middleCategory" size ="10" class="scrollBar form-control">
			</select>
			<br/>
			<input type="text" id="middleCategoryInsert" name="middleCategoryInsert" class="divideTextBox "><input type="button" id="middleCategoryInsertButton" value="추가" class="btn btn-success fontUP">
		</div>
		<div id="productCategory-container">
			<h2>상품목록</h2>
			<select id="productCategory" name="productCategory" size ="10" class="scrollBar form-control">
			</select>
			<select id="productCategory2" name="productCategory2" size ="10" class="scrollBar form-control">
			</select>
		</div>	
	</div>
	 
	 
	<div id="product_newChButton">
		<input type="button" id="product_newButton" value="새 상품등록" class="product_ChButton btn btn-primary" />
		<input type="button" id="product_chButton" value="상품 변경" class="product_ChButton btn btn-primary" />
	</div>
	<div id="product_detail">
		<form action="${contextPath}/manage/productRegist.do" method="post" enctype="multipart/form-data" id="productManageForm">
			<table width="1180px" class="table verticalAlign">
				<tr>
					<th ><label for="product_id">상품번호</label></th>
					<td ><input type="text" id="product_id" name="product_id" readonly="readonly"  class="form-control"/></td>
					<th ><label for="product_mainCategory">대분류</label></th>
					<td colspan="2"><input type="text" id="product_mainCategory" name="product_mainCategory" readonly="readonly" class="form-control" required/>
													<input type="hidden" id="main_id" name="main_id" />
					</td>
					<th ><label for="product_middleCategory">중분류</label></th>
					<td colspan="2"><input type="text" id="product_middleCategory" name="product_middleCategory" readonly="readonly" class="form-control"  required/>
													<input type="hidden" id="middle_id" name="middle_id" />
					</td>
					<td  style ="text-align:center"><input type="button" id="categorySelect" name="categorySelect" class="btn btn-info" value="카테고리 가져오기"/></td>
					
				</tr>
				<tr>
					<th><label for="product_name">상품명</label></th>
					<td colspan ="8"><input type="text" id="product_name" name="product_name" placeholder="상품명 입력" class="product_name form-control" required  /></td>
				</tr>
				<tr>
					<th width="110px"><label for ="net_weight_per">개당 내용량</label></th>
					<td width="140px"><input type="text" id="net_weight_per" name="net_weight_per" placeholder="용량 입력" required class="form-control"/></td>
					<th width="110px"><label for ="net_weight_total">총 내용량</label>
					<td width="140px"><input type="text" id="net_weight_total" name="net_weight_total" placeholder="총 용량 입력" required class="form-control"/></td>
					<th width="110px"><label for="product_fixed_price">상품정가</label></th>
					<td width="140px"><input type="text" id="product_fixed_price" name="product_fixed_price" placeholder="가격 입력" onkeyup="check(this)" required class="form-control" /></td>
					<th width="110px"><label for="product_stock">재고</label></th>
					<td width="140px"><input type="text" id="product_stock" name="product_stock" placeholder="재고 입력" onkeyup="check(this)" required class="form-control" /></td>
					<td style="text-align:center">
						공개<input type="radio" name="is_locked" value="0" checked="checked"/>
						비공개<input type="radio" name="is_locked" value="1"/>
					</td>
				</tr>
			
				<tr>
					<th  colspan="4" class="img_Upload_td">
							상품 이미지 업로드<br/><br/>
							상품 목록 에서 보여주는 상품 이미지 입니다.<br/><br/>
						<div id="productImg1">
								<label for="product_img1"  class="product_img_label"><img src="${contextPath}/resources/image/icons8-upload-64.png" class="upload_icon"/>  파일 </label>
								<input type="file" id="product_img1" name="product_img">
						</div>
					</th>
					<td  colspan="5" class="img_Upload_td">
						<img src="" id="product_imgPreview" class="product_imgPreviewSrc" /> 
					</td>
				</tr>
				
				<tr>
					<th colspan="4">상품 상세설명 업로드
						<br/><br/>
							상품 상세페이지 에서 보여주는 상품 설명 입니다.<br/><br/>
							(아래 이미지를 클릭하면 이미지를 크게 확인 하실 수 있습니다.)
					</th>
					<td  colspan="5" class="img_Upload_td">
						<div id="product_detailImgContainer">
							<div id="detailImg1">
								<label for="product_detailImg1" class="product_img_label"><img src="${contextPath}/resources/image/icons8-upload-64.png" class="upload_icon"/>&#9312; 번 파일</label>
								<input type="file" id="product_detailImg1" name="product_detailImg">
								<input type="button" class="imgNum btn btn-success fontUP" id="imgDetailNumPlus" value="추가" />
							</div>
						</div>
					</td>
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td colspan="9">
						<div id="detailScrollbar" class="scrollBar">
						</div>
					</td> 
				</tr>
				<tr>
					<td colspan="9">
						<img src="http://placehold.it/500x500" id="product_imgDetailPreview"/>
					</td>
				</tr>
			</table>
			<div id="submitButton">
				<input type="submit" value="상품 등록" id="productInsert" class="btn btn-primary"/>
				<input type="submit" value="상품 변경" id="productChange" class="btn btn-primary"/>
				<input type="reset" value="초기화" id="reset" class="btn btn-primary"/>
			</div>
		</form>
	</div>
</div>
</body>
</html>
