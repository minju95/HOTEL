<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>아이디 비밀번호 찾기</title>
<style>
#findMemform{width:648px; margin:0 auto;text-align:center;margin-bottom:100px}

.findpwd{width: 500px;text-align: center;   margin-left: calc(50% - 250px);}
.findpwd>dd>input {width:100%; height: 50px;} 
 
 h6{font-color:#65656;}
 p>a{color:blue} 
.findpwd>dd>button{cursor:pointer;width:100%; height: 50px;background-color:#ffd014; display: block; border:none;margin-top: 10px;font-size: 20px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<input type="hidden" name="alert" value="${resultMsg}"/>
		<div id="findMemform">
		
			<h1>비밀번호 재설정</h1>
			<form action="/hotel/passwordReset" method="post">
			<dl class="findpwd">
				<dd><input type="text" name="MEM_USERID" id="MEM_USERID" placeholder="아이디">	</dd>
				<dd><input type="email" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="이메일주소">	</dd>
	
				<dd><button type="submit" id="pwResetBtn">비밀번호 재설정</button></dd>
			</dl>		
			</form>
			
			<p>아직 회원이 아니신가요? <a href="/hotel/signUpForm">회원가입하기</a></p>
			
		</div>
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
	
	
</body>
</html>