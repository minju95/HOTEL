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
#pwdcheck {
width: 700px;
height: 300px;
}
.confirmText {
	width: 648px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
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

.buttons {
width:150px;
height:55px;
border-color: #ad9e87;
border:none;
background-color: #ad9e87;
color: #fff;
}
</style>

<input type="hidden" name="alert" value="${alert}"/>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<form action="/hotel/modifyMemForm" id=pwdcheckfrm onsubmit="return passcheck();" method="post">
	<div id="mypageform">
	<div class="confirmText">
		<h2 style="margin-top: 100px;">회원정보</h2>
		<br>
		<h5>외부로부터 고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.</h5>
	</div>
		<!-- 패스워드확인-->
		<div id="pwdcheck">
			
			<ul class="pwdchecktable">
				<li style="text-align: left;">
					<label>비밀번호</label>
				</li>
				<li>
					<input type="password" class="form-control" name="MEM_PW" id="MEM_PW"
						placeholder="비밀번호를 입력하세요.">
				</li>
			</ul>
					<input type="submit" class="buttons" value="확인">
					<input type="button" class="buttons" onclick="location.href='/hotel/main'" value="홈으로">
					
			
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
