<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<jsp:useBean id="today" class="java.util.Date"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
	<!-- 부트스트랩.슬라이드 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/journal/bootstrap.min.css">
	<!-- reservation/main css -->
	<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
	<!-- css) 입/퇴실 달력 css datepicker -->
	<link rel="stylesheet" href="<c:url value='/js/calendar.css'/>">
</head>
	
<style>
	/*이미지슬라이드*/
	* {box-sizing: border-box;}
	body {font-family: Verdana, sans-serif;}
	.mySlides {display: none;}
	.img { vertical-align: middle;}
	.title {width: 1900px; height:auto; margin: 0 auto; text-align:center; font-size: 35px; padding-right: 400px; padding-left:400px; margin-top: 50px;}
	
</style>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<body oncontextmenu="return false" ondragstart="return false">

	
<div class="main1" style="width: 1900px; height: 900px; margin: 0 auto;">
<div class="a_layer_inner" style="margin: 0px;">
<div class="a_content">
<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%;">
	<!-- Indicators -->
	<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox" style="width: 80%; margin-left: 10%;">
				<div class="item active" style="height:700px;">
					<div class="carousel-caption" style="text-align: right;">
        				<h4>Peninsula Lounge & Bar</h4>
     				</div>
					<img class="img" src="<c:url value='/image/main/180821-24-2000-din-seoul-hotel.jpg.thumb.1920.1920.jpg'/>">
				</div>
				<div class="item" style="height:700px;">
					<div class="carousel-caption" style="text-align: right;">
        				<h4>Executive Tower</h4>
     				</div>
					<img class="img" src="<c:url value='/image/main/191114-1-2000-fac-LTSE.jpg.thumb.1920.1920.jpg'/>">
				</div>
				<div class="item" style="height:700px;">
					<img class="img" src="<c:url value='/image/main/181023-1-2000-mai-LTSE.jpg.thumb.1920.1920.jpg'/>">
				</div>
	
	 <!-- Left and right controls -->
	  <a class="left view_button" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right view_button" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	</div>
</div>
</div>

<!-- 검색 start -->
<div class="top">
<input type="hidden" class="date" id="currentdate" value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
<input type="hidden" class="date" id="beforeto" value="${param.todate}">
	<table style="width:950px;" class="resTable">
		<colgroup>
			<col width="25%"/>
			<col width="25%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="*%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">Check In</th>
				<th scope="col">Check Out</th>
				<th scope="col">Adults</th>
				<th scope="col">Children</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
		<form id="frm">
		<input type="hidden" id="MEM_USERID" value="${USERID}"/>
			<tr>
				<td style="text-align:center;">
				<c:choose>
					<c:when test="${empty param.fromdate}">
						<input type="text" class="date" id="fromdate" readonly value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
					</c:when>
					<c:otherwise>
						<input type="hidden" id="beforefrom" value="${param.fromdate}">
						<input type="text" class="date" id="fromdate" readonly value="${param.fromdate}">
					</c:otherwise>
				</c:choose>
				</td>
				
				<td style="text-align:center;">
				<c:choose>
					<c:when test="${empty param.todate}">
						<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>" />
						<input type="text" class="date" id="todate" readonly value="<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" />">
					</c:when>
					<c:otherwise>
						<input type="text" class="date" id="todate" readonly value="${param.todate}">
					</c:otherwise>
				</c:choose>
				</td>
				
				<td style="text-align:center;">
				<a href="#" id="adultMinus" class="plma">–</a>
				
				<c:choose>
					<c:when test="${empty param.adult}">
						<input type="text" class="person" id="person_adult" readonly value="1">
						<input type="hidden" id="adult" value="1">
					</c:when>
					<c:otherwise>
						<input type="text" class="person" id="person_adult" readonly value="${param.adult}">
						<input type="hidden" id="adult" value="${param.adult}">
					</c:otherwise>
				</c:choose>
				<a href="#" id="adultPlus" class="plma">+</a>
				</td>
				
				<td style="text-align:center;">
				<a href="#" id="childMinus" class="plma">–</a>
				
				<c:choose>
					<c:when test="${empty param.child}">
						<input type="text" class="person" id="person_child" readonly value="0">
						
						<input type="hidden" id="child" value="0">
					</c:when>
					<c:otherwise>
						<input type="text" class="person" id="person_child" readonly value="${param.child}">
						<input type="hidden" id="child" value="${param.child}">
					</c:otherwise>
				</c:choose>
				<a href="#" id="childPlus" class="plma">+</a>
				</td>
				
				<td>
					<a href="#this" class="searchBtn" name="search">Search</a>
					<%@include file="/WEB-INF/include/include-body.jspf"%>
				</td>
			</tr>
			</form>
		</tbody>
	</table>
</div>
<!-- 검색 end -->
</div>


<!-- 호텔 지도(롯데 호텔 서울 기준) -->
<div class="title">라떼호텔 소개</div>
<div class="intro" style="width: 1400px; height: 600px; margin: 0 auto;  padding: 30px;">
	
	<div class="section_left" style=" float: left; width: 450px; padding-right: 50px; font-size: 18px;
	letter-spacing: -1px; line-height: 32px; color: #666; padding: 0 15px; display: inline-block;">
	<p>
	한국 최고의 럭셔리 비즈니스호텔인 롯데호텔 서울은 1,015실 규모를 자랑하며 서울 소공동에 자리 잡고 있습니다.
	명동, 을지로, 청계천 등 서울의 중심 관광지들로의 접근성이 뛰어나 서울 관광을 위한 최적의 위치를 자랑합니다.
	네 개의 세계적인 인테리어 회사들이 참가하여 설계한 독창적인 객실은 최신 트렌드를 반영하고 있으며, 성공적인 비즈니스를 위한 클럽 플로어에서는 품격과 정교함을 경험할 수 있습니다.
	또한, 롯데호텔 서울에서는 품격있는 가족모임과 고품격 웨딩, 대규모 국제회의와 비즈니스 행사를 위한 최상의 장소를 제공하고 있으며,
	최고급 레스토랑을 갖추고 있어 국빈 등 VIP 고객을 모시기에 최적의 공간을 제공합니다.
	</p>
	</div>
	
	<div class="section_right" id="map" style=" width: 800px; height: 500px ; margin-left: 30px;
	float: right; display: inline-block;">
	
	</div>
</div>

<!-- Google Map API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCojNma89wZgqHo98zrk9SaBeC7ioBmWjw&callback=initMap&region=kr">
</script>
<script>
function initMap() {
	var seoul = { lat: 37.565462 ,lng: 126.980947 };
	var map = new google.maps.Map(
		document.getElementById('map'), {
			zoom: 16,
			center: seoul
		});
	new google.maps.Marker({
		position: seoul,
		map: map});
	}
</script>







<!-- 스크립트) 성인/어린이 +- 버튼 기능 -->
<script type="text/javascript">
	$(function(){
		$('#adultMinus').click(function(e){
			e.preventDefault();
			var stat = $('#person_adult').attr('value');
			var num = parseInt(stat,10);
			num--;
			if(num<=1){
				num = 1;
			}
			$('#person_adult').attr('value',num);
		});
		$('#adultPlus').click(function(e){
			e.preventDefault();
			var stat = $('#person_adult').attr('value');
			var num = parseInt(stat,10);
			num++;
			if(num>3){
				num=3;
			}
			$('#person_adult').attr('value',num);
		});
	});
	$(function(){
		$('#childMinus').click(function(e){
			e.preventDefault();
			var stat = $('#person_child').attr('value');
			var num = parseInt(stat,10);
			num--;
			if(num<=0){
				num = 0;
			}
			$('#person_child').attr('value',num);
		});
		$('#childPlus').click(function(e){
			e.preventDefault();
			var stat = $('#person_child').attr('value');
			var num = parseInt(stat,10);
			num++;
		
			if(num>1){
				num=1;
			}
			$('#person_child').attr('value',num);
		});
	});
</script>
<!-- 링크) datepicker 링크 -->
<script src="<c:url value='/js/jquery-1.12.4.js'/>" charset="UTF-8"></script>
<script src="<c:url value='/js/jquery-ui.js'/>" charset="UTF-8"></script>

<!-- 스크립트) 입/퇴실 datepicker -->
<script>
$( function() {
	$("#fromdate").datepicker({
		showOn: "both",
		buttonImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzoSW0WNf23o6cUoLBL8K1ZHNkEeJmx_8f8ZGb-uOJLHpzQ4S4&usqp=CAU",
		buttonImageOnly: true,
		buttonText: "Select Date"
	});
});
$( function() {
	$("#todate").datepicker({
		showOn: "both",
		buttonImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzoSW0WNf23o6cUoLBL8K1ZHNkEeJmx_8f8ZGb-uOJLHpzQ4S4&usqp=CAU",
		buttonImageOnly: true,
		buttonText: "Select Date"
	});
});
</script>

<!-- 스크립트) 입/퇴실 날짜 유효성 검사 -->
<script>
$( function() {
	//입실 유효성 검사
	$("#fromdate").on("change", function() {
		//데이트 변수 선언
		var fromdate = $("#fromdate").val(); //입실
		var todate = $("#todate").val(); //퇴실
		var currentdate = $("#currentdate").val(); //오늘
		var beforefrom = $("#beforefrom").val(); //param입실
		
		//현재날짜 c로 date저장
		var current = currentdate.split("-");
		var c = new Date(current[0], current[1]-1, current[2], 0, 0, 0, 0);
		
		if (fromdate < currentdate) { // 입실 < 당일
			
			if (beforefrom != "" && beforefrom >= currentdate) { //param입실 !="" && param입실 >= 오늘
				var before = beforefrom.split("-");
				alert('지난 날짜의 예약은 불가합니다.');
				$("#fromdate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('지난 날짜의 예약은 불가합니다.');
				$("#fromdate").datepicker("setDate", c);
				return false;
			}
		}
		
		if (fromdate >= todate) { // 입실 >= 퇴실
			
			if (beforefrom != "" && beforefrom >= currentdate) { //param입실 !="" && param입실 >= 오늘
				var before = beforefrom.split("-");
				var b = new Date(before[0], before[1]-1, before[2], 0, 0, 0, 0);
				alert('퇴실일 이후 날짜로 예약은 불가합니다.');
				$("#fromdate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('퇴실일 이후 날짜로 예약은 불가합니다.');
				$("#fromdate").datepicker("setDate", c);
				return false;
			}
		}
		fn_search();
	});
	//퇴실 유효성 검사
	$("#todate").on("change", function() {
		//데이트 변수 선언
		var fromdate = $("#fromdate").val(); //입실
		var todate = $("#todate").val(); //퇴실
		var currentdate = $("#currentdate").val(); //오늘
		var beforeto = $("#beforeto").val(); //param퇴실
		
		//현재+1날짜 c로 date저장
		var current = currentdate.split("-");
		var temp = new Date(current[0], current[1]-1, current[2], 0, 0, 0, 0);
		var c = new Date(current[0], current[1]-1, temp.getDate()+1, 0, 0, 0, 0);
		//선택한 퇴실일
		var to = todate.split("-");
		var t = new Date(to[0], to[1]-1, to[2], 0, 0, 0, 0);
		//오늘기준 90일 뒤 날짜 가져오기
		var maxDate = temp;
		maxDate.setDate(maxDate.getDate() + 90);
		
		if (t > maxDate) { //퇴실 > 오늘+90일
			if (beforeto != "" && beforeto > currentdate) { // param퇴실 !="" && param퇴실 > 오늘
				var before = beforeto.split("-");
				var b = new Date(before[0], before[1]-1, before[2], 0, 0, 0, 0);
				alert('퇴실일로 설정할 수 없는 날짜입니다.');
				$("#todate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('퇴실일로 설정할 수 없는 날짜입니다.');
				$("#todate").datepicker("setDate", c); // 내일날짜
				return false;
			}
		}

		if (todate == currentdate || todate == fromdate) { // 퇴실 == 당일 or 퇴실 == 입실
			
			if (beforeto != "" && beforeto > currentdate) { // param퇴실 !="" && param퇴실 > 오늘
				var before = beforeto.split("-");
				var b = new Date(before[0], before[1]-1, before[2], 0, 0, 0, 0);
				alert('퇴실일로 설정할 수 없는 날짜입니다.');
				$("#todate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('퇴실일로 설정할 수 없는 날짜입니다.');
				$("#todate").datepicker("setDate", c); // 내일날짜
				return false;
			}
		}
		
		if (todate < currentdate) { // 퇴실 < 당일
			
			if (beforeto != "" && beforeto > currentdate) { // param퇴실 !="" && param퇴실 > 오늘
				var before = beforeto.split("-");
				var b = new Date(before[0], before[1]-1, before[2], 0, 0, 0, 0);
				alert('지난 날짜의 예약은 불가합니다.');
				$("#todate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('지난 날짜의 예약은 불가합니다.');
				$("#todate").datepicker("setDate", c); // 내일날짜
				return false;
			}
		}
		
		if (todate < fromdate) { // 퇴실 < 입실
			
			if (beforeto != "" && beforeto > currentdate) { // param퇴실 !="" && param퇴실 > 오늘
				var before = beforeto.split("-");
				var b = new Date(before[0], before[1]-1, before[2], 0, 0, 0, 0);
				alert('입실일 이전 날짜로 예약은 불가합니다.');
				$("#todate").datepicker("setDate", b);
				return false;
			} else { //그 외
				alert('입실일 이전 날짜로 예약은 불가합니다.');
				$("#todate").datepicker("setDate", c); // 내일날짜
				return false;
			}
		}
		fn_search();
	});
});
</script>

<!-- 스크립트) 검색 버튼 -->
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='search']").on("click", function(e){
		e.preventDefault();
		fn_search();
	});
});
function fn_search(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/main' />");
	comSubmit.addParam("fromdate", $("#fromdate").val());
	comSubmit.addParam("todate", $("#todate").val());
	comSubmit.addParam("adult", $("#person_adult").val());
	comSubmit.addParam("child", $("#person_child").val());
	comSubmit.submit();
}
</script>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>