<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- include) include/include-header.jspf -->
<%@include file="/WEB-INF/include/include-header.jspf"%>
<!-- include) include/include-topMenu.jsp -->
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<table style="border:1px solid #ccc">
<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="ttt">
			<input type="hidden" id="RES_ID" value="${ttt.RES_ID}">
			<input type="hidden" id="CAR_ID" value="${ttt.CAR_ID}">
			<tr>
				<td>입실</td>
				<td>퇴실</td>
			</tr>
			<tr>
				<td>${ttt.RES_CHK_SDAY}</td>
				<td>${ttt.RES_CHK_EDAY}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>전화번호</td>
			</tr>
			<tr>
				<td>${ttt.MEM_NAME}</td>
				<td>${ttt.MEM_PHONE}</td>
			</tr>
			<tr>
				<td>예약번호</td>
				<td>이메일</td>
			</tr>
			<tr>
				<td>${ttt.RES_NO}</td>
				<td>${ttt.MEM_EMAIL}</td>
			</tr>
			<tr>
				<td colspan="2">
				${ttt.ROOM_NAME}<br>
				성인:${ttt.RES_ADULT}, 아동:${ttt.RES_CHILD}</td>
			</tr>
			<tr>
				<td colspan="2">총액:${ttt.RES_PRICE}</td>
			</tr>
			<tr>
				<th colspan="2">호텔취소정책</th>
			</tr>
			<tr>
				<td colspan="2"><a href="#this" name="cancel">취소하기</a><td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tr>
				<td colspan="4">ERROR</td>
			</tr>
	</c:otherwise>
</c:choose>
</table>

<%@include file="/WEB-INF/include/include-body.jspf"%>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript">
<!-- F5키 막는 방법 -->
function noEvent() {
	if (event.keyCode == 116 || event.keyCode == 9) {
	return false;
	}
	else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
	return false;
	}
}
document.onkeydown = noEvent;

function doNotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
document.onkeydown = doNotReload;


$(document).ready(function(){
	$("a[name='cancel']").on("click", function(e){
		if (confirm("취소하시겠습니까?") == true){
			e.preventDefault();
			fn_cancel();
		}
		return false;
	});
});
function fn_cancel(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/cancel' />");
	comSubmit.addParam("RES_ID", $("#RES_ID").val());
	comSubmit.addParam("CAR_ID", $("#CAR_ID").val());
	comSubmit.submit();
}
</script>
</body>
</html>