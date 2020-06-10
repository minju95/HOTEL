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
		
			<h1>아이디 찾기</h1>
			<form action="/hotel/idSearch" method="post">
			<dl class="findpwd">
				<dd><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름">	</dd>
				<dd><input type="email" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="이메일주소">	</dd>
				
				<dd><button type="submit" id="findIdBtn">찾기</button></dd>
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
</body>
</html>