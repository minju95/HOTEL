<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<!-- include) include/include-topMenu.jsp -->
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
</head>
<!-- reservation/main css -->
<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
<body oncontextmenu="return false" ondragstart="return false">
<div class="top">
<table style="width:1000px; text-align:center; margin:10px;">
<c:choose>
	<c:when test="${fn:length(list) > 0}">
		<c:forEach items="${list}" var="ttt">
			<input type="hidden" id="RES_ID" value="${ttt.RES_ID}">
			<input type="hidden" id="CAR_ID" value="${ttt.CAR_ID}">
			<tr>
				<th colspan="4" class="write_title">요약 정보</th>
			</tr>
			<tr>
				<td class="write_midlleTitle">예약번호</td>
				<td class="write_midlleTitle">이름</td>
				<td class="write_midlleTitle">전화번호</td>
				<td class="write_midlleTitle">이메일</td>
			</tr>
			<tr>
				<td><input class="write_date" type="text" id="number" value="${ttt.RES_NO}" readonly></td>
				<td><input class="write_date" type="text" id="name" value="${ttt.MEM_NAME}" readonly></td>
				<td><input class="write_date" type="text" id="phone" value="${ttt.MEM_PHONE}" readonly></td>
				<td><input class="write_date" type="text" id="email" value="${ttt.MEM_EMAIL}" readonly></td>
			</tr>
			<tr>
				<td class="write_midlleTitle">입실</td>
				<td class="write_midlleTitle">퇴실</td>
				<td class="write_midlleTitle" style="width: 250px;">인원(성인/아동)</td>
				<td class="write_midlleTitle">결제금액</td>
			</tr>
			<tr>
				<td><input class="write_date" type="text" id="fromdate" value="${ttt.RES_CHK_SDAY}" readonly></td>
				<td><input class="write_date" type="text" id="todate" value="${ttt.RES_CHK_EDAY}" readonly></td>
				<td>
					<input class="write_person" type="text" id="adult" style="width: 70px;" value="${ttt.RES_ADULT}" readonly>/
					<input class="write_person" type="text" id="child" style="width: 70px;" value="${ttt.RES_CHILD}" readonly>
				</td>
				<td><input class="write_date" type="text" id="price1" value="${ttt.RES_PRICE}" readonly></td>
			</tr>
			<tr>
				<td class="write_midlleTitle">객실명</td>
				<td colspan="3"><input class="write_comments" type="text" id="RES_ANOTHER" value="${ttt.ROOM_NAME}" readonly></td>
			</tr>
			<tr>
				<td class="write_midlleTitle">한줄 요청사항</td>
				<td colspan="3"><input class="write_comments" type="text" id="RES_ANOTHER" value="${ttt.RES_ANOTHER}" readonly></td>
			</tr>
			<tr>
				<td class="write_midlleTitle" style="height: 100px; background-color: #fff;">호텔 취소 정책</td>
				<td colspan="3"><p class="write_comments" style="margin-left: 30px; height: 100%; border: none; font-size: small;">체크인 1일 17시 까지 50% 환불<br/>체크인 2일 17시 까지 80% 환불<br/>체크인 3일 17시 까지 100% 환불
				</p></td>
			</tr>
			<tr>
				<td colspan="4"><a href="#this" name="cancel" class="searchBtn">취소하기</a><td>
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
</div>

<%@include file="/WEB-INF/include/include-body.jspf"%>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript">
<!-- 스크립트) F5키 막는 방법 -->
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
</script>

<!-- 스크립트) 취소하기 버튼 -->
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='cancel']").on("click", function(e){
		if (confirm("취소하시겠습니까?") == true){
			e.preventDefault();
			fn_cancel();
		}
		return false;
	});
});
</script>

<!-- 스크립트) 취소하기 버튼 작동 -->
<script type="text/javascript">
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