<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Quest1 :  -->

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="EUC-KR">
<title>RESERVATION DETAILS</title>
</head>
<body>
<form id="frm">
<input type="hidden" id="ROOM_ID" value="${param.ROOM_ID}">
<input type="hidden" id="MEM_USERID" value="${param.MEM_USERID}">
<input type="hidden" id="RES_ID" value="${RES_ID}">
<input type="hidden" id="CAR_ID" value="${CAR_ID}">
<div>
<table style="border:1px solid #ccc">
		<tr>
			<th>INFOMATION</th>
		</tr>
		<tr>
			<td>입실</td>
			<td>퇴실</td>
		</tr>
		<tr>
			<td><input type="text" id="fromdate" value="${param.fromdate}" readonly></td>
			<td><input type="text" id="todate" value="${param.todate}" readonly></td>
		</tr>
		<tr>
			<td>성인</td>
			<td>아동</td>
		</tr>
		<tr>
			<td><input type="text" id="adult" value="${param.adult}" readonly></td>
			<td><input type="text" id="child" value="${param.child}" readonly></td>
		</tr>
		<tr>
			<td>한줄 요청사항</td>
			<td><input type="text" id="RES_ANOTHER"></td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>
				<c:set var="ROOM_PRICE" value="${fn:replace(fn:trim(param.ROOM_PRICE), ',', '')}"/>
				<input type="text" id="ROOM_PRICE" value="${ROOM_PRICE}" readonly>
			</td>
		</tr>
		<tr>
			<td>
			<button type="button" id="card">결제하기</button>
			<!-- <button type="button" id="card">결제하기</button> -->
			</td>
		</tr>
</table><br><br>
</div>
<div id="cardForm">
	<table style="border:1px solid #ccc">
		<tr>
			<th>CARD INFOMATION</th>
		</tr>
		<tr>
			<td>카드사명</td>
			<td>
				<input type="text" id="CAR_COMPANY">
			</td>
		</tr>
		<tr>
			<td>카드번호</td>
			<td>
				<input type="text" id="CAR_NUMBER">
			</td>
		</tr>
		<tr>
			<td>소유자명</td>
			<td>
				<input type="text" id="CAR_NAME">
			</td>
		</tr>
		<tr>
			<td>유효기간</td>
			<td>
				<input type="text" id="CAR_VALIDITYPERIOD">
			</td>
		</tr>
		<tr>
			<td>CVC번호</td>
			<td>
				<input type="text" id="CAR_CVCNUM">
			</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>
				<input type="text" id="ROOM_PRICE" value="${ROOM_PRICE}" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" id="pay">결제하기</button>
			</td>
		</tr>
	</table>
</div>
</form>
<%@include file="/WEB-INF/include/include-body.jspf"%>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#cardForm").hide();
	$("#pay").hide();

	$("#card").on("click", function(e){
		$("#cardForm").show();
		$("#card").hide();
		$("#pay").show();
		e.preventDefault();
	});
	
});

//유효성 검사
$(document).ready(function(){
	$("#pay").on("click", function(e){
		e.preventDefault();
		var numSplit = $(CAR_NUMBER).val().split("-");
		if ($(CAR_COMPANY).val() == '') {
			alert('CAR_COMPANY');
			return false;
		}
		if ($(CAR_NUMBER).val().replace(/-/g,'').length > 16 ||
			$(CAR_NUMBER).val().split("-").length != 4) {
			alert('CAR_NUMBER');
			return false;
		}
		if ($(CAR_NAME).val() == '') {
			alert('CAR_NAME');
			return false;
		}
		if ($(CAR_VALIDITYPERIOD).val().replace(/-/g,'').length > 6 ||
			$(CAR_VALIDITYPERIOD).val().split("-").length > 2) {
			alert('CAR_VALIDITYPERIOD');
			return false;
		}
		var reda = $(CAR_VALIDITYPERIOD).val().split("-");
		var year = reda[0];
		var month = reda[1];
		if (year.length > 4 || year < 2020) {
			alert('year');
			return false;
		}
		if (month.length > 2 || month < 1 || month > 12) {
			alert('month');
			return false;
		}
		fn_pay();
	});
});

function fn_pay(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/pay' />");
	comSubmit.addParam("ROOM_ID", $("#ROOM_ID").val());
	comSubmit.addParam("MEM_USERID", $("#MEM_USERID").val());
	comSubmit.addParam("adult", $("#adult").val());
	comSubmit.addParam("child", $("#child").val());
	comSubmit.addParam("RES_ANOTHER", $("#RES_ANOTHER").val());
	comSubmit.addParam("fromdate", $("#fromdate").val());
	comSubmit.addParam("todate", $("#todate").val());
	comSubmit.addParam("ROOM_PRICE", $("#ROOM_PRICE").val());
	comSubmit.addParam("RES_ID", $("#RES_ID").val());
	
	comSubmit.addParam("CAR_ID", $("#CAR_ID").val());
	comSubmit.addParam("CAR_COMPANY", $("#CAR_COMPANY").val());
	comSubmit.addParam("CAR_NUMBER", $("#CAR_NUMBER").val());
	comSubmit.addParam("CAR_NAME", $("#CAR_NAME").val());
	comSubmit.addParam("CAR_VALIDITYPERIOD", $("#CAR_VALIDITYPERIOD").val());
	comSubmit.addParam("CAR_CVCNUM", $("#CAR_CVCNUM").val());
	comSubmit.submit();

}
</script>

</body>
</html>