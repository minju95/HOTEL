<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>아이디 비밀번호 찾기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#findMemform {
	width: 648px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 100px
}

.findpwd {
	padding-top: 50px;
	padding-left: 0;
}

.findpwd>li {
	list-style: none;
	text-align: center;
}

.findpwd>li>a {
	float: right;
}

.findpwd>li>p {
	padding-right: 0;
}

.findpwd>li>input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	margin-bottom: 20px
}
button {
	width: 100%;
	height: 50px;
	background-color: #ffd014;
	display: block;
	border: none;
	margin-top: 10px;
	font-size: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<input type="hidden" name="alert" value="${resultMsg}"/>
<form action="/hotel/passwordReset" method="post">
		<div id="findMemform">
		
			<h1>비밀번호 재설정</h1>
			
			<ul class="findpwd">
				<li><input type="text" class="form-control" name="MEM_USERID" id="MEM_USERID" placeholder="아이디"></li>
				<li><input type="email" class="form-control" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="이메일주소"></li>	
	
				<button class="btn btn-primary" type="submit" id="pwResetBtn">비밀번호 재설정</button>
				<button type="button" class="btn btn-primary" id="submit" onclick="location.href='/hotel/main'">홈으로</button>
			</ul>		
			
		</div>
</form>
<script>
$(document).ready(function(){
	if($("input[name='alert']").val() != null && $("input[name='alert']").val() != ""){
		alert($("input[name='alert']").val());
	}
});



</script>

	
<!-- <script>	
//이메일로 임시비밀번호 발송
$(function(){
	$(document).on("click", "#pwResetBtn", function(){
		var MEM_EMAIL = $("#MEM_EMAIL").val()
		var MEM_USERID = $("#MEM_USERID").val()
		var data = {"MEM_EMAIL":MEM_EMAIL, "MEM_USERID":MEM_USERID};
		
		$.ajax({
			
			type:"POST",
			url : "/hotel/passwordReset",
			data : JSON.stringify(data),
			success : function(data){
					alert("비밀번호가 재설정 되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});

//이메일로 아이디 발송

$(function(){
	//	이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#findIdBtn", function(){
		
		// 이메일 중복 체크 후 메일 발송 비동기 처리 
		$.ajax({
			
			type:"POST",
			url : "/first/login/findId",
			data : "user_email=" + $("#user_email").val(),
			
			success : function(data){
					alert("아이디가 발송되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});








</script>	 -->
	
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>