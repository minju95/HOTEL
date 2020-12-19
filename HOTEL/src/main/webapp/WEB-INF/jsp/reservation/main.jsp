<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<jsp:useBean id="today" class="java.util.Date"/>

<!-- Quest1 : Ajax 검색기능 필요 (6/09) -->
<!DOCTYPE html>
<html>
<head>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
</head>
<title>부대시설 메인</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<!-- 링크) jQuery 링크 -->
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>

<!-- 스크립트) 성인/아동 +- 버튼 기능 -->
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

<!-- css) 입/퇴실 달력 css datepicker -->
<link rel="stylesheet" href="<c:url value='/js/calendar.css'/>">

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


<!-- 스크립트) 예약하기 버튼 눌렀을 때 동작 -->
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='rsvbtn']").on("click", function(e){
		if ($("#MEM_USERID").val() == '') {
			alert('로그인 후 이용 바랍니다.');
			location = '/hotel/loginForm';
			return false;
		}
		e.preventDefault();
		fn_nextStep($(this));
	});
});
function fn_nextStep(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/writeForm' />");
	comSubmit.addParam("MEM_USERID", $("#MEM_USERID").val());
	comSubmit.addParam("fromdate", $("#fromdate").val());
	comSubmit.addParam("todate", $("#todate").val());
	comSubmit.addParam("adult", $("#adult").val());
	comSubmit.addParam("child", $("#child").val());
	comSubmit.addParam("ROOM_ID", obj.parent().find("#ROOM_ID").val());
	comSubmit.addParam("ROOM_PRICE", obj.parent().find("#DC").val());
	comSubmit.submit();
}
</script>


<!-- reservation/main css -->
<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
<body>
<div>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<div class="a_layer">
<div class="a_layer_inner">
<div class="a_content">

<!-- 검색 start -->
<div class="top">
<input type="hidden" class="date" id="currentdate" value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
<input type="hidden" class="date" id="beforeto" value="${param.todate}">
	<table style="width:950px; text-align:center; margin:20px;">
		<colgroup>
			<col width="25%" />
			<col width="25%" />
			<col width="20%" />
			<col width="20%" />
			<col width="*%" />
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
				<a href="#" id="adultMinus" class="plma">-</a>
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
				<a href="#" id="childMinus" class="plma">-</a>
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

<!-- List start -->
<div class="bottom">
<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="row" varStatus="status">
		<table style="width:1000px; text-align:center; margin:10px;">
			<colgroup>
				<col width="*%" />
				<col width="*%" />
				<col width="*%" />
				<col width="*%" />
			</colgroup>
			<tr class="type">
				<td>
				<c:choose>
					<c:when test="${empty row.ROOM_IMGS_FILE}">
						<div class="roomIMG">이미지 준비 중</div>
					</c:when>
					<c:otherwise>
						<div class="roomIMG">
						<a href="#this" name="atag_${status.index}" id="atag_${status.index}">
						<img alt="main" width="300" height="250" src="<spring:url value='/image/rooms/${list[status.index].ROOM_IMGS_FILE}'/>"></a></div>
					</c:otherwise>
				</c:choose>
				</td>
				<td class="roomName">
					${row.ROOM_NAME}<br>
					<p class="cnt">( Only ${row.CNT} left! )</p><br>
					<input type="button" id="button_${status.index}" name="button_${status.index}" class="detailBtn" value="상세보기">
					<!-- 상세보기 hidden 전달 값 -->
				<input type="hidden" id="index_no" value="/hotel/image/${list[status.index].ROOM_IMGS_FILE}">
				<input type="hidden" id="R_NAME" value="${row.ROOM_NAME}">
				<input type="hidden" id="ROOM_ADULT" value="${row.ROOM_ADULT}">
				<input type="hidden" id="ROOM_CHILD" value="${row.ROOM_CHILD}">
				<input type="hidden" id="ROOM_FAC_NAME" value="${fn:replace(fn:trim(row.ROOM_FAC_NAME),',','br')}">
				<input type="hidden" id="ROOM_CHK_INTIME" value="${row.ROOM_CHK_INTIME}">
				<input type="hidden" id="ROOM_CHK_OUTTIME" value="${row.ROOM_CHK_OUTTIME}">
				</td>
				<td class="priceInfo" <c:if test="${row.DC eq row.ROOM_PRICE}"> style="margin-top:60px;"</c:if>>
				<c:choose>
					<c:when test="${row.DC eq row.ROOM_PRICE}">
						${row.ROOM_PRICE}
					</c:when>
					<c:otherwise>
						<p style="color:red;">${row.DC}</p>
						<p style="text-decoration-line:line-through;">${row.ROOM_PRICE}</p>
					</c:otherwise>
				</c:choose>
				<br><br>
				<a href="#this" name="rsvbtn" class="booking">Reserve</a>
				<!-- 예약하기 hidden 전달 값 -->
				<input type="hidden" id="ROOM_ID" value="${row.ROOM_ID}">
				<input type="hidden" id="ROOM_NAME" value="${row.ROOM_NAME}">
				<input type="hidden" id="DC" value="${row.DC}">
				</td>
			</tr>
		</table>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr style="text-align:center;">
			<td colspan="4">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
</div>
<!-- List end -->

<!-- include) include/include-body.jspf -->
<%@include file="/WEB-INF/include/include-body.jspf"%>

<!-- 스크립트) 테스트 -->
<script type="text/javascript">
$(function(){
	$("a[name^='atag']").on("click", function(e) {
		e.preventDefault();
		fn_indexNo($(this));
		return false;
	});
});
$(function(){
	$("input[name^='button']").on("click", function(e) {
		e.preventDefault();
		fn_indexNo($(this));
		return false;
	});
});
function fn_indexNo(obj) {
	var index = obj.parent().find("#index_no").val();
	var name = obj.parent().find("#R_NAME").val();
	var fac_detail = obj.parent().find("#ROOM_FAC_NAME").val().replace(/br/g, '\r\n');
	var adult = obj.parent().find("#ROOM_ADULT").val();
	var child = obj.parent().find("#ROOM_CHILD").val();
	var checkIn = obj.parent().find("#ROOM_CHK_INTIME").val();
	var checkOut = obj.parent().find("#ROOM_CHK_OUTTIME").val();

	$('#pop_img').attr('src',index);
	$('#pop_name').attr('value',name);
	$("#pop_fac").val(fac_detail);
	$('#pop_adult').attr('value',adult);
	$('#pop_child').attr('value',child);
	$('#pop_checkIn').attr('value',checkIn);
	$('#pop_checkOut').attr('value',checkOut);

	
	var temp = $('#' + 'layer2');
	var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수
	
	if(bg){
		$('.layer').fadeIn();   //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	}else{
		temp.fadeIn();
	}
	
	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() )
		temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() )
		temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');
	
	//cbtn 클릭하면 'bg' 클래스가 존재하면 레이어를 사라지게 한다.
	temp.find("a[name='cbtn']").on("click", function(e){
		e.preventDefault();
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();
		}
	});
	
	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});
}
</script>

<!-- 스크립트) 상세페이지 - 수정 필요 -->
<script type="text/javascript">
function layer_open(el){
	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수
	
	if(bg){
		$('.layer').fadeIn();   //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	}else{
		temp.fadeIn();
	}
	
	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() )
		temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() )
		temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');
	
	//cbtn 클릭하면 'bg' 클래스가 존재하면 레이어를 사라지게 한다.
	temp.find("a[name='cbtn']").on("click", function(e){
		e.preventDefault();
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();
		}
	});
	
	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});
}
</script>

<!-- 상세보기 버튼 s-->
<div class="layer">
	<div class="bg"></div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
				<div style="font-family: nanum -webkit-pictograph; font-size: 1rem; padding:5px;">
				<p class="ctxt mb20">
				<div style="width: 400px; height: auto; overflow: hidden; float: left;">
					<img id="pop_img" alt="main" width="100%" src="">
				</div><br>
				<div style="margin-top:280px;">
					<div class="pop_div" style="border-bottom: 1px solid black;">객실명 : <input type="text" id="pop_name" class="pop_ee" readonly></div>
					<div class="pop_div">기준인원 : Adults: <input type="text" id="pop_adult" class="pop_person" readonly>, Children : <input type="text" id="pop_child" class="pop_person" readonly></div>
					<div class="pop_div">객실 편의 시설 : <br>
						<div style="width: 400px; float: left;">
							<textarea id="pop_fac" class="pop_fac" cols="20" rows="12" readonly></textarea>
						</div>
					</div>
					<div class="pop_div">체크인 : <input type="text" id="pop_checkIn" class="pop_tt" readonly>, 체크아웃 : <input type="text" id="pop_checkOut" class="pop_tt" readonly></div>
				</div>
				</p>
				</div>
				<div class="btn-r">
					<a href="#" name="cbtn" class="cbtn">닫기</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
</div>
<!-- 상세보기 버튼 e-->

</div>
</div>
</div>
<!-- include) 푸터 -->
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>