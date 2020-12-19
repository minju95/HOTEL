<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
a {
text-decoration: none;
}
#loginform {
	width: 648px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 100px
}
.loginText {
	width: 648px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: left;
	border-bottom: 3px solid black;
}
.logintable {
	padding-top: 50px;
	padding-left: 0;
}

.logintable>li {
	list-style: none;
	text-align: center;
}

.logintable>li>a {
	float: right;
}

.logintable>li>p {
	padding-right: 0;
}

.logintable>li>input {
	width: 100%;
	height: 50px;
	border: 1px solid #e0e0e0;
	margin-bottom: 20px
}

button {
	width: 100%;
	height: 50px;
	border-color: #ad9e87;
    background-color: #ad9e87;
    color: #fff;
	display: block;
	border: none;
	margin-top: 10px;
	font-size: 20px;
	text-align: center;
}
a {
text-decoration: none;
}
</style>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<script type="text/javascript">

	 function fn_login() {
		 if($("#MEM_USERID").val()==""){
			 
			 alert("아이디를 입력해주세요");
			 $("MEM_USERID").focus();
			 return false;
		 }
		 else if($("#MEM_PW").val()==""){
			 
			 alert("비밀번호를 입력해주세요");
			 $("MEM_PW").focus();
			 return false;
			 //버튼실행시
	 }
	 return true;
	 }
		
</script>
<form action="/hotel/login" method="post" id="frm"
	onsubmit="return fn_login();">
	<div id="loginform">
	<div class="loginText">
		<h3 style="margin-top: 100px;">Sign in</h3>
	</div>
		<ul class="logintable">
			<li><input type="text" class="form-control" name="MEM_USERID"
				id="MEM_USERID" placeholder="아이디"></li>
			<li><input type="password" class="form-control" name="MEM_PW"
				id="MEM_PW" placeholder="비밀번호"></li>
			<li><a class="btn btn-link" href="/hotel/passwordResetForm">비밀번호
					재설정</a></li>
			<li><a class="btn btn-link" href="/hotel/idSearchForm">Forgot your ID?</a></li>
			<li>
				<button type="submit" class="button" id="submit">Sign in</button>
				<button type="button" class="button" id="submit" onclick="location.href='/hotel/main'">Home</button>
			</li>
		</ul>
		<p>
			아직 회원이 아니신가요? <a class="btn btn-link" href="/hotel/signUpTerms">회원가입하기</a>

		</p>
	</div>
</form>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
<label></label>
