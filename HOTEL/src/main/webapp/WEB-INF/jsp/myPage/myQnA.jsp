<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<title>마이페이지</title>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	
<style>
.myPageText {
	width: 648px;
	heigth: 300px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	padding-bottom: 40px;
}

.btn-group{
	align:center;
	width:100%;
	top: 20px;
	
}
.myPageInfo{
	border: 1px solid #e7e7e7;
	font-size: 14px;
	width:80%;
	margin-left:10%;
	margin-right:10%;
}
.myPageInfo .info1{
	border: 1px solid #e7e7e7;
	width: 25%;
	text-align: center;
	height:100px;
	padding-top:20px;
	float:left;
	background-color: #f5f5f5;;
}
.title {
	font-size: 18px;
}
.content {
	color: #998465;
	margin-top: 3px;
	font-size: 24px;
	}
.buttonBox{
	margin-top:5%;
	margin-left:10%;
	width:80%;
	border: 1px solid black;
}
.buttons{
	width: 24.8%;
	height: 40px;
	color: #fff;
	background-color: #ad9e87;
	border: none;
}

/* 테이블 css */
.board_list {
	width:80%;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 200px;
	border-top:3px solid #81725f;
	border-bottom:1px solid #ccc;
}
.board_list thead th:first-child{background-image:none}
.board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a; text-align:center; vertical-align:middle}
.board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle}
.board_list tbody tr:first-child td {border:none}
.board_list tbody td.title {text-align:left; padding-left:20px}
.board_list tbody td a {display:inline-block}
.btn1 {
border-radius:3px;
padding:5px 11px;
color:#000000 !important;
display:inline-block;
background-color:#F0F8FF;
float:center;
border:1px solid #56819d;
vertical-align:middle}
.btnDiv {
width: 80%;
margin-left: 10%;
margin-right: 10%;
margin-top: 200px;
border: 1px solid black;
}
</style>


</head>

<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	
	<div class="myPageText">
			<h3 style="margin-top: 100px;">나의 멤버십 정보</h3>
	</div>


<!-- 상단박스영역 -->
	<div class="myPageInfo">
	<!-- 상단박스1 -->
		<div class="info1">
			<span class="title">성명</span>
			
			<br>
			<span class="content" style="font-weight: bold;">박민주</span>
		</div>
	<!-- 상단박스2 -->
		<div class="info1">
			<span class="title">리워즈번호</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<div class="info1">
			<span class="title">롯데호텔 리워즈등급</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<div class="info1">
			<span class="title">롯데호텔 리워즈등급</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<br>
		
		<!-- 목록박스 -->
		<div class="btn-group" role="group" aria-label="Basic example">
		<!-- Standard button -->
		  <input type="button" class="buttons" value="예약내역" onclick="location.href='/hotel/myFavorite';">
		   <input type="button" class="buttons" value="나의 Q&A" onclick="location.href='/hotel/myQnA';">
		    <input type="button" class="buttons" value="나의 관심목록" onclick="location.href='/hotel/myFavorite';">
		     <input type="button" class="buttons" value="회원 정보 수정" onclick="location.href='/hotel/modifyMemForm';">
		</div>
	</div>
	
	<form id="frm" method="post" action="<c:url value='/qnaWriteForm'/>">
	<input type="hidden" id="MEM_USERID" name="MEM_USERID" value="${USERID}"/>
	<table class="board_list" id="qnaList">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">답변확인</th>
			</tr>
		</thead>
		<tbody>
		
		<!-- <tr>
				<td colspan="5">ddd</td>
		</tr>	 --> 		
		</tbody>
	</table>
	<div class="btnDiv">
	<a href="<c:url value='/qnaWriteForm'/>"  class="btn1" id="write">글쓰기</a>
	</div>
	</form>
<script>
$(document).ready(function() {
	$("#write").on("click", function(e) { 
		e.preventDefault();
		fn_nextStep($(this));
		qnaPage();
	});
});

function fn_nextStep(obj){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/qnaWriteForm' />");
	comSubmit.addParam("MEM_USERID", $("#MEM_USERID").val());
	comSubmit.submit();
}
 function qnaPage(){
	var body = $("table[id='qnaList'] > tbody");
	//alert("하하하하하하");
	//alert(body); //object
	body.empty();
	var formData = $("#frm").serialize();
	alert(formData); //MEM_USERID=1
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/myQnA"/>',
	      dataType : "json",
	      data : formData,
	      success : function(data){
		      	alert("제발");
	         var str = "";
	         if(data.list.length>0){
					alert("메롱메롱");
	         } else {
	        	 str +=' <tr>'+
					'<td colspan="5">조회된 결과가 없습니다.</td>'+
				'</tr>';
		     }
	         $("#qnaList tbody").append(str);
	      }
	});

} 
qnaPage(1);
</script>
</body>
</html>