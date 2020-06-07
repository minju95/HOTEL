<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date" %>
<jsp:useBean id="today" class="java.util.Date"/>

<!-- Quest1 : From~To 유효성 검사 필요 (6/04) -->
<!-- Quest2 : Ajax 검색기능 필요 (6/04) -->

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/include/include-header.jspf"%>
<title>RESERVATION</title>
</head>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<!-- 인원수 증감 -->
<script type="text/javascript">
	$(function(){
		$('#adultMinus').click(function(e){
			e.preventDefault();
			var stat = $('#adult').attr('value');
			var num = parseInt(stat,10);
			num--;
			if(num<=0){
				num = 0;
			}
			$('#adult').attr('value',num);
		});
		$('#adultPlus').click(function(e){
			e.preventDefault();
			var stat = $('#adult').attr('value');
			var num = parseInt(stat,10);
			num++;
			if(num>10){
				num=10;
			}
			$('#adult').attr('value',num);
		});
	});
	$(function(){
		$('#childMinus').click(function(e){
			e.preventDefault();
			var stat = $('#child').attr('value');
			var num = parseInt(stat,10);
			num--;
			if(num<=0){
				num = 0;
			}
			$('#child').attr('value',num);
		});
		$('#childPlus').click(function(e){
			e.preventDefault();
			var stat = $('#child').attr('value');
			var num = parseInt(stat,10);
			num++;
		
			if(num>10){
				num=10;
			}
			$('#child').attr('value',num);
		});
	});
	$(".mainLayerPopClose").click( function () {
		mainLayerPopCloseAct();
	});
	
	//팝업
	$(document).ready(function(){
        $("#contents").click(function(){
            $("#popup").fadeIn();
        });
        $("#popup").click(function(){
            $("#popup").fadeOut();
        });
	});
</script>

<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="<c:url value='/js/jquery-1.12.4.js'/>" charset="UTF-8"></script>
<script src="<c:url value='/js/jquery-ui.js'/>" charset="UTF-8"></script>
<script>
	$( function() {
		$( "#fromdate" ).datepicker();
	} );
</script>
<script>
	$( function() {
		$( "#todate" ).datepicker();
	} );
</script>

<!-- 입력 날짜 체크 -->
<script>

</script>

<style>
@charset "utf-8";
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

/*RESET*/
* {
    margin: 0;
    padding: 0;
}

body {
    font: 17px 'Nanum Gothic', sans-serif;
}

a {
    text-decoration: none;
    color: #404040;
}

li {
    list-style: none;
}

/*BODY*/

/*팝업창*/
#popup {
    display: none; /*숨기기*/
    /* position: fixed; */
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.9);
}

#popmenu {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    width: 300px;
    height: 200px;
    text-align: center;
    background: #fff;
}

#popmenu p {
    margin-top: 80px;
}

.exit {
    position: absolute;
    left: 50%;
    bottom: 10px;
    transform: translate(-50%,0);
    width: 60px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    background: #007AAE;
    cursor: pointer;
}

/*본문내용*/
#contents {
    width: 300px;
    height: 250px;
    text-align: center;
    line-height: 150px;
    color: #fff;
    background: #555;
    cursor: pointer;
}
</style>
<body>
<div>
	<table>
		<thead>
			<tr>
				<th>입실</th>
				<th>퇴실</th>
				<th>성인</th>
				<th>아동</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<form id="frm">
			<tr>
				<td>
				<c:choose>
					<c:when test="${empty param.fromdate}">
						<input type="text" id="fromdate" readonly value="<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" />">
					</c:when>
					<c:otherwise>
						<input type="text" id="fromdate" readonly value="${param.fromdate}">
					</c:otherwise>
				</c:choose>
				</td>
				
				<td>
				<c:choose>
					<c:when test="${empty param.todate}">
						<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>" />
						<input type="text" id="todate" readonly value="<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" />">
					</c:when>
					<c:otherwise>
						<input type="text" id="todate" readonly value="${param.todate}">
					</c:otherwise>
				</c:choose>
				</td>
				
				<td>
				<a href="#" id="adultPlus">+</a>
				<c:choose>
					<c:when test="${empty param.adult}">
						<input type="text" id="adult" readonly value="1">
					</c:when>
					<c:otherwise>
						<input type="text" id="adult" readonly value="${param.adult}">
					</c:otherwise>
				</c:choose>
				<a href="#" id="adultMinus">-</a>
				</td>
				
				<td>
				<a href="#" id="childPlus">+</a>
				<c:choose>
					<c:when test="${empty param.child}">
						<input type="text" id="child" readonly value="0">
					</c:when>
					<c:otherwise>
						<input type="text" id="child" readonly value="${param.child}">
					</c:otherwise>
				</c:choose>
				<a href="#" id="childMinus">-</a>
				<td>
					<a href="#this" name="search">Search</a>
					<%@include file="/WEB-INF/include/include-body.jspf"%>
				</td>
			</tr>
			</form>
		</tbody>
	</table><br/><br/>
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
		comSubmit.addParam("adult", $("#adult").val());
		comSubmit.addParam("child", $("#child").val());
		comSubmit.submit();
	}
	</script>
</div>
<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="row">
		<table style="width:800px;">
			<colgroup>
				<col width="*%" />
				<col width="30%" />
				<col width="30%" />
			</colgroup>
			<tr>
				<td>
				<c:choose>
					<c:when test="${empty row.ROOM_IMGS_FILE}">
						이미지 준비 중
					</c:when>
					<c:otherwise>
					<div id="contents">
						<img alt="main" width="300" height="250" src="<spring:url value='/images/${row.ROOM_IMGS_FILE}'/>">
					</div>
					</c:otherwise>
				</c:choose>
				</td>
				<td>
				${row.ROOM_NAME}
				<br>
				(잔여객실 : ${row.CNT})
				</td>
				<td>
				<c:choose>
					<c:when test="${row.DC eq row.ROOM_PRICE}">
						${row.ROOM_PRICE}
					</c:when>
					<c:otherwise>
						${row.DC}<br/>
						<p style="color:red; text-decoration-line:line-through;">${row.ROOM_PRICE}</p>
					</c:otherwise>
				</c:choose>
				<br><br>
				<a href="#this" name="rsvbtn">예약하기</a>
				<input type="hidden" id="ROOM_ID" value="${row.ROOM_ID}">
				<input type="hidden" id="ROOM_NAME" value="${row.ROOM_NAME}">
				<input type="hidden" id="DC" value="${row.DC}">
				</td>
				<td>
				<div id="popup">
					<div id="popmenu">
						<p>안녕하세요!</p>
						<div class="exit">닫기</div>
					</div>
				</div>
				</td>
			</tr>
		</table>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="4">조회된 결과가 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
<%@include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='rsvbtn']").on("click", function(e){
		e.preventDefault();
		fn_nextStep($(this));
	});
});
function fn_nextStep(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/writeForm' />");
	comSubmit.addParam("MEM_USERID", "maaaal");
	/* comSubmit.addParam("MEM_USERID", $("#MEM_USERID").val()); */
	comSubmit.addParam("fromdate", $("#fromdate").val());
	comSubmit.addParam("todate", $("#todate").val());
	comSubmit.addParam("adult", $("#adult").val());
	comSubmit.addParam("child", $("#child").val());
	comSubmit.addParam("ROOM_ID", obj.parent().find("#ROOM_ID").val());
	comSubmit.addParam("ROOM_PRICE", obj.parent().find("#DC").val());
	comSubmit.submit();
}
</script>
</body>
</html>