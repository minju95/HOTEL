<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#mypageform {
	width: 648px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 10px;
}

.pwdchecktable {
	padding-top: 30px;
	padding-left: 0;
}

.pwdchecktable>li {
	list-style: none;
	text-align: center;
}

.pwdchecktable>li>a {
	float: right;
}

.pwdchecktable>li>p {
	padding-right: 0;
}

.pwdchecktable>li>input {
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

<input type="hidden" name="alert" value="${alert}"/>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<form action="/hotel/modifyMemForm" id=pwdcheckfrm onsubmit="return passcheck();" method="post">
	<div id="mypageform">
		<h1>개인정보변경</h1>
		<!-- 패스워드확인-->
		<div id="pwdcheck">
			<h5>안전한 개인정보변경을 위해서<br> 현재 사용중인 
			비밀번호를 입력해주세요</h5>
			<ul class="pwdchecktable">
				<li>
					<input type="password" class="form-control" name="MEM_PW" id="MEM_PW"
						placeholder="비밀번호를 입력해주세요.">
				</li>
				<li>
					<button class="btn btn-primary" type="submit">확인</button>
					<button type="button" class="btn btn-primary" id="submit" onclick="location.href='/hotel/main'">홈으로</button>
				</li>
			</ul>
		</div>
	</div>
</form>
<div style="margin-top:500px;">
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	if($("input[name='alert']").val() != null && $("input[name='alert']").val() != ""){
		alert($("input[name='alert']").val());
	}
});

function passcheck() {
	if($("#MEM_PW").val()==""){
		alert("비밀번호를 입력해주세요");
		$("#MEM_PW").focus();
		return false;
	}
	return true;
}



</script>
