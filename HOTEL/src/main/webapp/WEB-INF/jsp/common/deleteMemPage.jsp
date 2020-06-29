<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
<style>
.deleteText {
	width: 800px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	font-size: 16px;
}
.contents {
    width: 100%;
    float: left;
    text-align: center;
    font-size: 1.875em;
    color: #444;
    margin-bottom: 50px;
}
.myForm-group {
	position : relative;
	width: 600px;
	height: 800px;
	left : calc(50% - 400px/2);
	top : 100px;
}
.form-control {
	width : 400px;
	height : 700px;
}
#user_email {
	width : 325px;
}
#email_check {
	display : block;
}
#isCheck_Email {
	width : 70px;
}
p {
	text-align : right;
}
p>a {
	color : blue;
}
pre {
	width : 400px;
	font-size : 20px;
	text-align : center;
}
</style>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="deleteText">
		<h2 style="margin-top: 100px;"><b>회원탈퇴</b></h2>
		<br>
		<h3><b>회원을 탈퇴하시겠습니까?</b></h3>
		<br>회원 탈퇴를 신청하시면 리워즈 회원 자격이 상실됩니다.
		<br>해당 아이디는 즉시 탈퇴가 처리되며 영구적으로 사용이 중지되므로 해당 아이디로 재가입이 불가능합니다.
</div>

<div class="myForm-group">
<pre>
회원 탈퇴시 호텔 예약 및 서비스는

더이상 이용할 수 없으며

<strong>${id}</strong>님의 회원정보, 이용기록은

모두 삭제 됩니다.
</pre>
	<div class="checkbox">
		<label>
			<input type="checkbox" id="isAgree"> 안내 사항을 확인하였으며, 이에 동의합니다.<br><br>
		</label>
	</div>
	<button type="button" class="btn btn-default btn-lg btn-block" id="deleteMemBtn">탈퇴 하기</button>
	<button type="button" class="btn btn-default btn-lg btn-block" id="submit" onclick="location.href='/hotel/main'">홈으로</button>
</div>
<script>
	$("#deleteMemBtn").click(function(){
		if($("#isAgree").prop("checked")) {
			
			$.ajax({
		         
		         type:"POST",
		         url:"/hotel/deleteMem",
		         data:"json",
		         
		         success:function(data){
		            console.log(data.result);
		            if(data.result == "complete"){
		               alert("회원탈퇴가 완료되었습니다.")
		               location.href=data.URL;
		            }else{
		               alert("에러가 발생했습니다.")
		            }
		         },
		         error:function(data){
		            alert("에러가 발생했습니다.");
		         }
		      });
			}
		else{
			alert("탈퇴안내를 확인하고 동의해주세요.");
			}
	});
</script>
</body>
</html>