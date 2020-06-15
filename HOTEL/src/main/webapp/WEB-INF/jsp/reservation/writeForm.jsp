<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Quest1 :  -->

<!DOCTYPE html>
<html>
<head>
<!-- include) include/include-header.jspf -->
<%@include file="/WEB-INF/include/include-header.jspf"%>
<!-- include) include/include-topMenu.jsp -->
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
</head>
<!-- reservation/main css -->
<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
<!-- 마우스 우클릭 방지 -->
<body oncontextmenu="return false" ondragstart="return false">
<form id="frm">
<input type="hidden" id="ROOM_ID" value="${param.ROOM_ID}">
<input type="hidden" id="MEM_USERID" value="${param.MEM_USERID}">
<input type="hidden" id="RES_ID" value="${RES_ID}">
<input type="hidden" id="CAR_ID" value="${CAR_ID}">
<div class="a_layer">
<div class="a_layer_inner">
<div class="a_content">

<div class="top">
<table style="width:1000px; text-align:center; margin:10px;">
		<tr>
			<th colspan="4" class="write_title">INFOMATION</th>
		</tr>
		<tr>
			<td class="write_midlleTitle">입실</td>
			<td class="write_midlleTitle">퇴실</td>
			<td class="write_midlleTitle">인원(성인/아동)</td>
			<td class="write_midlleTitle">결제금액</td>
		</tr>
		<tr>
			<td><input class="write_date" type="text" id="fromdate" value="${param.fromdate}" readonly></td>
			<td><input class="write_date" type="text" id="todate" value="${param.todate}" readonly></td>
			<td>
			<input class="write_person" type="text" id="adult" value="${param.adult}" readonly>/
			<input class="write_person" type="text" id="child" value="${param.child}" readonly>
			</td>
			<td>
				<c:set var="ROOM_PRICE" value="${fn:trim(param.ROOM_PRICE)}"/>
				<input class="write_date" type="text" id="price1" value="${ROOM_PRICE}" readonly>
				<c:set var="ROOM_PRICE" value="${fn:replace(ROOM_PRICE, ',', '')}"/>
				<input type="hidden" id="ROOM_PRICE" value="${ROOM_PRICE}" readonly>
			</td>
		</tr>
		<tr>
			<td class="write_midlleTitle">한줄 요청사항</td>
			<td colspan="3"><input class="write_comments" type="text" id="RES_ANOTHER" maxlength="200"></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:right; padding:20px;">
			<button type="button" id="card" class="write_btn">다음단계</button>
			</td>
		</tr>
</table><br><br>
</div>
<div id="cardForm">
	<table style="width:1000px; text-align:center; margin:10px;">
		<tr>
			<th colspan="4" class="write_title">RESERVATION INFOMATION</th>
		</tr>
		<tr>
			<td class="write_midlleTitle">카드사명</td>
			<td class="write_tdbox">
				<input type="text" id="CAR_COMPANY" class="write_company">
			</td>
			<td class="write_midlleTitle">소유자명</td>
			<td class="write_tdbox">
				<input type="text" id="CAR_NAME" class="write_name">
				<div class="write_check" id="name_check"></div>
			</td>
		</tr>
		<tr>
			<td class="write_midlleTitle">카드번호</td>
			<td colspan="3" class="write_tdbox">
				<input type="text" id="NUM_1" maxlength="4" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_carNum">  -  
				<input type="text" id="NUM_2" maxlength="4" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_carNum">  -  
				<input type="text" id="NUM_3" maxlength="4" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_carNum">  -  
				<input type="text" id="NUM_4" maxlength="4" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_carNum">
				<div class="write_check" id="number_check"></div>
			</td>
		</tr>
		<tr>
			<td class="write_midlleTitle">유효기간</td>
			<td class="write_tdbox">
				<input type="text" id="VAL_YEAR" maxlength="4" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_val">  /  
				<input type="text" id="VAL_MONTH" maxlength="2" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_val">
				<div class="write_check" id="val_check"></div>
			</td>
			<td class="write_midlleTitle">CVC번호</td>
			<td class="write_tdbox">
				<input type="text" id="CAR_CVCNUM" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="write_cvc">
				<div class="write_check" id="cvc_check"></div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:right; padding:20px;">
				<button type="button" id="pay" class="write_btn">결제하기</button>
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</div>
</form>
<%@include file="/WEB-INF/include/include-body.jspf"%>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>


<!-- 스크립트) F5키 막는 방법 -->
<script type="text/javascript">
function noEvent() {
	if (event.keyCode == 116) {
	return false;
	}
	else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)) {
	return false;
	}
}
document.onkeydown = noEvent;
</script>

<!-- 스크립트) 폼 숨김/표시 -->
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
</script>

<!-- 스크립트) 결제하기 버튼 기능 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#pay").on("click", function(e){
		e.preventDefault();
		if ($(NUM_1).val() == '' || $(NUM_2).val() == '' || $(NUM_3).val() == '' || $(NUM_4).val() == '') {
			alert('카드번호를 정확히 입력해주세요.');
			return false;
		}
		if ($(CAR_NAME).val() == '') {
			alert('소유자명을 정확히 입력해주세요.');
			return false;
		}
		if ($(VAL_YEAR).val() == '' || $(VAL_MONTH).val() == '') {
			alert('유효기간을 정확히 입력해주세요.');
			return false;
		}
		if ($(CAR_CVCNUM).val() == '') {
			alert('CVC번호를 정확히 입력해주세요.');
			return false;
		}
		if ($(ROOM_PRICE).val() == '' || $(ROOM_PRICE).val() < 0) {
			alert('결제금액 오류입니다. 재 확인 바랍니다.');
			return false;
		}
		fn_pay();
	});
});
</script>

<!-- 스크립트) 결제하기 전달 -->
<script type="text/javascript">
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
	
	var CAR_NUMBER = $(NUM_1).val()+"-"+$(NUM_2).val()+"-"+$(NUM_3).val()+"-"+$(NUM_4).val();
	
	comSubmit.addParam("CAR_NUMBER", CAR_NUMBER);
	comSubmit.addParam("CAR_NAME", $("#CAR_NAME").val());
	
	var CAR_VALIDITYPERIOD = $(VAL_YEAR).val() + "-" + $(VAL_MONTH).val();
	
	comSubmit.addParam("CAR_VALIDITYPERIOD", CAR_VALIDITYPERIOD);
	comSubmit.addParam("CAR_CVCNUM", $("#CAR_CVCNUM").val());
	comSubmit.submit();
}
</script>

<!-- 스크립트) 유효성 검사 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#NUM_1").blur(function(){
        var num1=$("#NUM_1").val();
        if(num1 == "" || num1.length < 4){
			$("#number_check").text('카드번호를 정확히 입력해주세요.');
			$("NUM_1").focus();
        }else {
			$("#number_check").text('');
			$("#NUM_2").focus();
     	}
	});
	$("#NUM_2").blur(function(){
        var num2=$("#NUM_2").val();
        if(num2 == "" || num2.length < 4){
			$("#number_check").text('카드번호를 정확히 입력해주세요.');
			$("NUM_2").focus();
        }else {
			$("#number_check").text('');
			$("#NUM_3").focus();
     	}
	});
	$("#NUM_3").blur(function(){
        var num3=$("#NUM_3").val();
        if(num3 == "" || num3.length < 4){
			$("#number_check").text('카드번호를 정확히 입력해주세요.');
			$("NUM_3").focus();
        }else {
			$("#number_check").text('');
			$("#NUM_4").focus();
     	}
	});
	$("#NUM_4").blur(function(){
        var num4=$("#NUM_4").val();
        if(num4 == "" || num4.length < 3){
			$("#number_check").text('카드번호를 정확히 입력해주세요.');
			$("NUM_4").focus();
        }else {
			$("#number_check").text('');
			$("CAR_NAME").focus();
     	}
	});
	$("#CAR_NAME").blur(function(){
        var name=$("#CAR_NAME").val();
        if(name == "" || name.length < 2){
			$("#name_check").text('소유자명을 정확히 입력해주세요.');
			$("CAR_NAME").focus();
        }else {
			$("#name_check").text('');
			$("VAL_YEAR").focus();
     	}
	});
	$("#VAL_YEAR").blur(function(){
		var toYear = new Date().getFullYear();
		var year=$("#VAL_YEAR").val();
        if(year == "" || year.length < 4){
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
			$("VAL_YEAR").focus();
        } else if (year < toYear) {
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
            $("VAL_YEAR").focus();
        } else if (year > (toYear+6)) {
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
            $("VAL_YEAR").focus();
        } else {
			$("#val_check").text('');
			$("VAL_MONTH").focus();
     	}
	});
	$("#VAL_MONTH").blur(function(){
		var toMonth = new Date().getMonth() + 1;
        var month=$("#VAL_MONTH").val();
        var toYear = new Date().getFullYear();
		var year=$("#VAL_YEAR").val();
		
        if(month == "" || month.length < 2){
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
			$("VAL_MONTH").focus();
        } else if (month < toMonth && year <= toYear) {
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
			$("VAL_MONTH").focus();
        } else if (month > 12) {
			$("#val_check").text('유효기간을 정확히 입력해주세요.');
			$("VAL_MONTH").focus();
        } else {
			$("#val_check").text('');
			$("CAR_NAME").focus();
     	}
	});
	$("#CAR_CVCNUM").blur(function(){
        var cvc=$("#CAR_CVCNUM").val();
        if(cvc == "" || cvc.length < 3){
			$("#cvc_check").text('CVC번호를 정확히 입력해주세요.');
        } else {
			$("#cvc_check").text('');
     	}
	});
});

</script>

<!-- 스크립트) 숫자만 허용 -->
<script>
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
    	return;
    }
    else {
    	return false;
    }
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>

</body>
</html>