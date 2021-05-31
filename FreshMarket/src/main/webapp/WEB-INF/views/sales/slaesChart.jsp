<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<style>
.text{
	width:85px;
	border:none;
	text-align:center;
}
.tab-content table{
	text-align:center;
	vertical-align:middle;
}
.daySelect{
	text-align:center;
	margin:0px auto;
}
.daySelect th{
    padding:10px;
}
.daySelect td{
	padding-top:13px;
	padding-left:10px;
}
.daytable td{
	padding-left:90px;
}
#tabs-2{
	display:none;
}
.chartBox{
	position:relative;
	display:inline-block;
	margin-left:100px;
}
.row{
	width:400px;
}
.nameH1{
	color: black;
    font-size: 40px;
    font-weight: 530;
    border-bottom-color: white;
}

</style>
<link rel="stylesheet" href="${contextPath}/resources/external/bootstrap-4.6.0/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/external/datetimepicker/build/jquery.datetimepicker.min.css">
</head>
<body>
	<div class="mainContainer" id="tabs">
	<h1 class="nameH1">매출 내역</h1>
		 <ul class="nav nav-tabs">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" id="tab1">일일매출</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" id="tab2">월별매출</a>
		    </li>
		  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
	    <div id="tabs-1" class="daily"><br>
	      	<div class ="salesBox">
				<br/>
				<br/>
			 	<div class="chartBox">
					<div id="salesChart" style="width:1000px; height:400px;"></div>
				</div>
				<br/>
				<br/>
				<br/>
				<table width="60%" class="daySelect">
					<tr>
						<th width="10%">기간</th>
						<td width="80%" style="text-align:left;">
						<div class="form-row">
    						<div class="form-group col-md-5">
		        				<input type="text" id="startDay" name="startDate" class="startDate form-control" placeholder="날짜를 선택해주세요"/>
        					</div>
        					<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
        					<div class="form-group col-md-5">
	        					<jsp:useBean id="now" class="java.util.Date"/>
	        					<input type="hidden" id="today"  value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>"  />
        						<input type="text" id="endDay" name="endDate" class="endDate form-control" placeholder="날짜를 선택해주세요" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>"/>
        					</div>
       					</div>
						</td>		
						<th width="10%">
							<button type="button" id="select" class="btn btn-primary btn-sm">검색</button>
						</th>		
					</tr>
					<tr>
						<td colspan="3">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
							  <label class="btn btn-secondary active">
							    <input type="radio" class="options" id="option1" autocomplete="off"> 7일
							  </label>
							  <label class="btn btn-secondary">
							    <input type="radio" class="options" id="option2" autocomplete="off"> 15일
							  </label>
							  <label class="btn btn-secondary">
							    <input type="radio" class="options" id="option3" autocomplete="off"> 1개월
							  </label>
							  <label class="btn btn-secondary">
							    <input type="radio" class="options" id="option4" autocomplete="off"> 3개월
							  </label>
							</div>
						</td>
					</tr>
				</table> 
		
				<table width="100%" class="table-bordered table-hover">
					<caption style="caption-side:top;">일일 매출</caption>
					<thead>
						<tr>
							<th rowspan="2" width="18%">일자</th>
							<th colspan="4" width="43%">매출내역</th>
							<th rowspan="2" width="13%">결제합계</th>
							<th rowspan="2" width="13%">환불합계</th>
							<th rowspan="2" width="13%">순매출 </th>
						</tr>
						<tr>
							<th>주문건수</th>
							<th>총판매량</th>
							<th>판매금액</th>
							<th>할인금액</th>
						</tr>
					</thead>
					<tbody class="right" id="newDailyData">
					  <c:set var="total" value="0"/>
					  <c:forEach var="daily" items="${daily}">
						<tr>
							<td class="center">${daily.days}</td>
							<td><fmt:formatNumber>${daily.day_ordering_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_selling_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_selling_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_discount_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_payment_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_refund_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${daily.day_net_sales}</fmt:formatNumber></td>
						</tr>
					  <c:set var= "total" value="${total + daily.day_net_sales}"/>
					  </c:forEach>
					</tbody>
					<tfoot class="right" id="dailySum">
						<tr>
							<td class="center">합계</td>
							<td><fmt:formatNumber>${dailyMap.day_ordering_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${dailyMap.day_selling_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${dailyMap.day_selling_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${dailyMap.day_discount_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${dailyMap.day_payment_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${dailyMap.day_refund_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${total}</fmt:formatNumber></td>
						</tr>
					</tfoot>
				</table>
	  		</div>
    	</div>
    	
    	
	  <div id="tabs-2" class="monthly">
	  	<br/>
	  	<br/>
	  	<br/>
	      <div class ="salesBox">
			<div class="chartBox">
				<div id="monthlyChart" style="width:1000px; height:400px;"></div>
			</div>
			<br/>
			<br/>
			<br/>
				<table width="60%" class="daySelect daytable">
					<tr>
						<th width="10%">기간</th>
						<td width="80%" style="text-align:center;">
						 	<div class="form-row row">
    						<div class="form-group col-xs-2">
								<select id="startY" class="form-control" >
		        					<option value="2018">2018</option>
		        					<option value="2019">2019</option>
		        					<option value="2020">2020</option>
		        					<option value="2021" selected>2021</option>
		        				</select>
	        				</div>
	        				<div class="form-group col-xs-2">
		        				<select id="startM" class="form-control">
		        					<option value="01">01</option>
		        					<option value="02">02</option>
		        					<option value="03">03</option>
		        					<option value="04">04</option>
		        					<option value="05">05</option>
		        					<option value="06">06</option>
		        					<option value="07">07</option>
		        					<option value="08">08</option>
		        					<option value="09">09</option>
		        					<option value="10">10</option>
		        					<option value="11">11</option>
		        					<option value="12">12</option>
		        				</select>
	        				</div>
	        				<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
	        				<div class="form-group col-xs-2">
		        				<select id="endY" class="form-control">
		        					<option value="2018">2018</option>
		        					<option value="2019">2019</option>
		        					<option value="2020">2020</option>
		        					<option value="2021" selected>2021</option>
		        				</select>
	        				</div>
	        				<div class="form-group col-xs-2">
		        				<select id="endM" class="form-control">
		        					<option value="01">01</option>
		        					<option value="02">02</option>
		        					<option value="03">03</option>
		        					<option value="04">04</option>
		        					<option value="05">05</option>
		        					<option value="06">06</option>
		        					<option value="07">07</option>
		        					<option value="08">08</option>
		        					<option value="09">09</option>
		        					<option value="10">10</option>
		        					<option value="11">11</option>
		        					<option value="12">12</option>
		        				</select>
	        				</div>
	        				</div>
						</td>
						<th width="10%">
							<button type="button" id="monthSelect" class="btn btn-primary btn-sm">검색</button>
						</th>		
					</tr>
				</table> 
				<table width="100%" class="table-bordered table-hover">
					<caption style="caption-side:top;">월별 매출</caption>
					<thead>
						<tr>
							<th rowspan="2" width="18%">일자</th>
							<th colspan="4" width="43%">매출내역</th>
							<th rowspan="2" width="13%">결제합계</th>
							<th rowspan="2" width="13%">환불합계</th>
							<th rowspan="2" width="13%">순매출 </th>
						</tr>
						<tr>
							<th>주문건수</th>
							<th>총판매량</th>
							<th>판매금액</th>
							<th>할인금액</th>
						</tr>
					</thead>
					<tbody class="right" id="newMonthData">
					  <c:set var="total" value="0"/>
					  <c:forEach var="monthly" items="${monthly}">
						<tr>
							<td class="center">${monthly.monthly}</td>
							<td><fmt:formatNumber>${monthly.day_ordering_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_selling_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_selling_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_discount_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_payment_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_refund_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthly.day_net_sales}</fmt:formatNumber></td>
						</tr>
					  </c:forEach>
					</tbody>
					<tfoot class="right" id="monthlySum">
						<tr>
							<td class="center">합계</td>
							<td><fmt:formatNumber>${monthlyMap.day_ordering_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_selling_count}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_selling_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_discount_amount}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_payment_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_refund_total}</fmt:formatNumber></td>
							<td><fmt:formatNumber>${monthlyMap.day_net_sales}</fmt:formatNumber></td>
						</tr>
					</tfoot>
				</table>
		  </div>
	    </div>
		</div>
 	</div>
 

<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/resources/external/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${contextPath}/resources/external/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<script>
function DatetimepickerDefaults(opts) { 
	return $.extend({},{
		locale: 'ko',
		format: 'Y-m-d',
		timepicker:false,
	    scrollMonth : false}, opts);
	}
		
jQuery.datetimepicker.setLocale('kr');

$('#startDay').datetimepicker(DatetimepickerDefaults()); 
$('#endDay').datetimepicker(DatetimepickerDefaults());

</script>
<script>
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart1);

function drawChart1() {
	data1 = google.visualization.arrayToDataTable([
	    ['daily', 'total'],
		<c:forEach var="daily" items="${daily}">
	    ['${daily.days}', ${daily.day_net_sales}],
		</c:forEach>
	  ]);

  options1 = {
          chart: {
        	  title: '일별 매출',
              subtitle: '일별 매출 현황',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          colors: ['#6ea3f7'],
          width:'1000',
          height:'400'
        };

  chart1 = new google.charts.Bar(document.getElementById('salesChart'));
  chart1.draw(data1, google.charts.Bar.convertOptions(options1));
};

function drawChart2() {
	data2 = google.visualization.arrayToDataTable([
		['monthly', 'total'],
		<c:forEach var="monthly" items="${monthly}">
	    ['${monthly.monthly}', ${monthly.day_net_sales}],
		</c:forEach>
	  ]);

  options2 = {
          chart: {
        	  title: '월별 매출',
              subtitle: '월별 매출 현황',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          colors: ['#6ea3f7'],
          width:'1000',
          height:'400'
        };

  chart2 = new google.charts.Bar(document.getElementById('monthlyChart'));
  chart2.draw(data2, google.charts.Bar.convertOptions(options2));  
};

</script>
<script>
var data;
var chart;
var options;

//특정 날짜 설정
$(document).on('click','.options',function(){
	
	var end = new Date($("#endDay").val());
	var start;
	
	if($(".options").index(this)==0){
		start = getFormatDate(new Date(end.setDate(end.getDate()-7)));
		$("#startDay").val(start);
	}else if($(".options").index(this)==1){
		start = getFormatDate(new Date(end.setDate(end.getDate()-15)));
		$("#startDay").val(start);
	}else if($(".options").index(this)==2){
		start = getFormatDate(new Date(end.setMonth(end.getMonth()-1)));
		$("#startDay").val(start);
	}else if($(".options").index(this)==3){
		start = getFormatDate(new Date(end.setMonth(end.getMonth()-3)));
		$("#startDay").val(start);
	}

});

//일일 특정기간매출 검색
$(document).on('click','#select',function(){

	var startDay = $("#startDay").val();
	var endDay = $("#endDay").val();
	var date1 = new Date($("#startDay").val());
	var date2 = new Date($("#endDay").val());
	
	//유효성 검사
	if(!$("#startDay").val()) {
		alert("시작날짜를 선택하세요");  
		return false; 
	}
	
	if (date2 - date1 < 0){
	 alert("끝 날짜가 시작날짜보다 이전일수 없습니다"); 
	 return false;
	} 

	$.ajax({
		url:"${contextPath}/sales/select.do",
		type:"post",
		data:{ "startDay" :startDay,
			   "endDay"   :endDay},
		success:function(jArray){
			
			newDailyChart(jArray);
			 $("#newDailyData").empty();
			var tbody = "";
			 // 합계 계산
	       	  let sum1 = 0;
	       	  let sum2 = 0;
	       	  let sum3 = 0;
	       	  let sum4 = 0;
	       	  let sum5 = 0;
	       	  let sum6 = 0;
	       	  let sum7 = 0;
	        $.each(jArray, function(index, item){
	        	tbody += "<tr>" +
	                        "<td>" 			 		 			+ item.days 		 							+ 	"</td>" +
	                        "<td class='day_ordering_count'>" 	+ numberWithCommas(item.day_ordering_count)  	+ 	"</td>" +
	                        "<td class='day_selling_count'>"	+ numberWithCommas(item.day_selling_count)  	+ 	"</td>" +
	                        "<td class='day_selling_amount'>" 	+ numberWithCommas(item.day_selling_amount)  	+ 	"</td>" +         
                        	"<td class='day_discount_amount'>" 	+ numberWithCommas(item.day_discount_amount)	+ 	"</td>" + 
	                        "<td class='day_payment_total'>" 	+ numberWithCommas(item.day_payment_total)	 	+ 	"</td>" +
                        	"<td class='day_refund_total'>"		+ numberWithCommas(item.day_refund_total)		+ 	"</td>" + 
	                        "<td class='day_net_sales'>" 		+ numberWithCommas(item.day_net_sales)	 		+ 	"</td>" +
	                  "</tr>";
	                  
	                  
      	       	    sum1 += item.day_ordering_count;
      	       	    sum2 += item.day_selling_count;
      	       	    sum3 += item.day_selling_amount;
      	       	    sum4 += item.day_discount_amount;
      	       	    sum5 += item.day_payment_total;
      	       	    sum6 += item.day_refund_total;
      	       	    sum7 += item.day_net_sales;
	        });
	        $("#newDailyData").append(tbody);
			
	       	$("#dailySum").empty();
	       	var total = "";
	       		total += "<tr>" +
	                        "<td> 합계 "			 					+ 	"</td>" +
	                        "<td>"	 + numberWithCommas(sum1)  	 	+ 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum2) 	 	+ 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum3)	    + 	"</td>" +         
	                        "<td>" 	 + numberWithCommas(sum4) 	  	+ 	"</td>" + 
	                        "<td>" 	 + numberWithCommas(sum5)	 	+ 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum6)		+ 	"</td>" + 
	                        "<td>" 	 + numberWithCommas(sum7)	 	+ 	"</td>" +
	                  "</tr>";
	       		$("#dailySum").append(total);
			
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
});

//월별 특정기간매출 검색
$(document).on('click','#monthSelect',function(){

	var startY = $("#startY option:selected").val();
	var startM = $("#startM option:selected").val();
	var endY = $("#endY option:selected").val();
	var endM = $("#endM option:selected").val();

	var startDay = startY+"-"+startM;
	var endDay = endY+"-"+endM;
	var date1 = new Date(startDay);
	var date2 = new Date(endDay);
		
	if (date2 - date1 < 0){
		 alert("끝 날짜가 시작날짜보다 이전일수 없습니다"); 
		 return false;
		}
	
	endDay +="-31";
	$.ajax({
		url:"${contextPath}/sales/monthlySelect.do",
		type:"post",
		data:{ "startDay" :startDay,
			   "endDay"   :endDay},
		success:function(jArray){
			
			newMonthlyChart(jArray);
			 $("#newMonthData").empty();
			var tbody = "";
			// 합계 계산
	       	  let sum1 = 0;
	       	  let sum2 = 0;
	       	  let sum3 = 0;
	       	  let sum4 = 0;
	       	  let sum5 = 0;
	       	  let sum6 = 0;
	       	  let sum7 = 0;
	        $.each(jArray, function(index, item){
	        	
	        	tbody += "<tr>" +
	                        "<td>"	  			 		 		 + item.month					 		 		 + 	"</td>" +
	                        "<td class='month_ordering_count'>"	 + numberWithCommas(item.day_ordering_count)  	 + 	"</td>" +
	                        "<td class='month_selling_count'>"	 + numberWithCommas(item.day_selling_count)  	 + 	"</td>" +
	                        "<td class='month_selling_amount'>"	 + numberWithCommas(item.day_selling_amount)     + 	"</td>" +         
	                        "<td class='month_discount_amount'>" + numberWithCommas(item.day_discount_amount)	 + 	"</td>" + 
	                        "<td class='month_payment_total'>"	 + numberWithCommas(item.day_payment_total)	 	 + 	"</td>" +
	                        "<td class='month_refund_total'>"	 + numberWithCommas(item.day_refund_total)		 + 	"</td>" + 
	                        "<td class='month_net_sales'>" 		 + numberWithCommas(item.day_net_sales)	 	 	 + 	"</td>" +
	                  "</tr>";
	        	
				sum1 += item.day_ordering_count;
    	    	sum2 += item.day_selling_count;
    	    	sum3 += item.day_selling_amount;
    	    	sum4 += item.day_discount_amount;
    	    	sum5 += item.day_payment_total;
				sum6 += item.day_refund_total;
				sum7 += item.day_net_sales;
	        	
	        });
	        $("#newMonthData").append(tbody);
	       	  
	       	$("#monthlySum").empty();
	       	var total = "";
	       		total += "<tr>" +
	                        "<td> 합계 "			 				 + 	"</td>" +
	                        "<td>"	 + numberWithCommas(sum1)  	 + 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum2) 	 + 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum3)	 + 	"</td>" +         
	                        "<td>" 	 + numberWithCommas(sum4) 	 + 	"</td>" + 
	                        "<td>" 	 + numberWithCommas(sum5)	 + 	"</td>" +
	                        "<td>" 	 + numberWithCommas(sum6)	 + 	"</td>" + 
	                        "<td>" 	 + numberWithCommas(sum7)	 + 	"</td>" +
	                  "</tr>";
	       		$("#monthlySum").append(total);
			
		},
		error:function(request, error){
			alert('err');
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
});
</script>
<script>
function newDailyChart(jArray){
	for (var i = 0; i < jArray.length; i++) {
        console.log(jArray[i].days, jArray[i].day_net_sales);
    }
	data = new google.visualization.DataTable();
	data.addColumn('string', 'daily');
    data.addColumn('number', 'total');
    
	for (var i = 0; i < jArray.length; i++) {
        data.addRow([jArray[i].days, jArray[i].day_net_sales]);
    }
	options = {
	          chart: {
	        	  title: '일별 매출',
	              subtitle: '일별 매출 현황',
	          },
	          bars: 'vertical',
	          vAxis: {format: 'decimal'},
	          colors: ['#6ea3f7']
	        };
	chart = new google.charts.Bar(document.getElementById('salesChart'));
	chart.draw(data, google.charts.Bar.convertOptions(options));
	
}
function newMonthlyChart(jArray){
	for (var i = 0; i < jArray.length; i++) {
        console.log(jArray[i].days, jArray[i].day_net_sales);
    }
	data2 = new google.visualization.DataTable();
	data2.addColumn('string', 'monthly');
    data2.addColumn('number', 'total');
    
	for (var i = 0; i < jArray.length; i++) {
        data2.addRow([jArray[i].month, jArray[i].day_net_sales]);
    }
	options2 = {
	          chart: {
	        	  title: '월별 매출',
	              subtitle: '월별 매출 현황',
	          },
	          bars: 'vertical',
	          vAxis: {format: 'decimal'},
	          colors: ['#6ea3f7'],
	          width:'1000',
	          height:'400'
	        };
	chart2 = new google.charts.Bar(document.getElementById('monthlyChart'));
	chart2.draw(data2, google.charts.Bar.convertOptions(options2)); 
	
}

//숫자 컴마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//날짜 포맷
function getFormatDate(date){
    var year = date.getFullYear();
    var month = (date.getMonth()+1);
    month = month >= 10 ? month : '0' + month;
    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    return year + '-' + month + '-' + day;
}

</script>
<script>
$(document).on("click","#tab1",function(){
	$("#tabs-1").css('display','block');
	$("#tabs-2").css('display','none');
	
});
$(document).on("click","#tab2",function(){
	$("#tabs-2").css('display','block');
	$("#tabs-1").css('display','none');
	google.charts.setOnLoadCallback(drawChart2);
	
});

</script>
</body>
</html>
