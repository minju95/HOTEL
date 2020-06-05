<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

/* 적용할부분 */
h1{	margin-bottom:30px;}
#mypageform {width: 100%;}
/* 정보수정비밀번호입력란 */
#pwdcheck {	width: 400px;margin: 0 auto;text-align: center;border: 1px solid #ccc;}
.pwdchecktable {margin: 10px;padding-left: 0;padding-bottom: 20px;}
.pwdchecktable>li {	list-style: none;text-align: center;}
.pwdchecktable>ul>li>a {	float: right}
.pwdchecktable>li>p {	padding-right: 0;}
.pwdchecktable>li>input {width: 100%;height: 50px;border: 1px solid #e0e0e0;}
h5 {margin-top: 10px;}
button {width: 100%;height: 50px;background-color: #ffd014;	display: block;	border: none;margin-top: 10px;font-size: 20px;}
</style>

<input type="hidden" name="alert" value="${alert}"/>
<form action="/hotel/modifyMemForm" id=pwdcheckfrm onsubmit="return passcheck();" method="post">
	<div id="mypageform">
		<h1>개인정보변경</h1>
		<!-- 패스워드확인-->
		<div id="pwdcheck">
			<h5>안전한 개인정보변경을 위해서<br> 현재 사용중인 
			비밀번호를 입력해주세요</h5>
			<ul class="pwdchecktable">
				<li>
					<input type="password" name="MEM_PW" id="MEM_PW"
						placeholder="비밀번호를 입력해주세요.">
				</li>
				<li>
					<button type="submit">확인</button>
				</li>
			</ul>
		</div>
	</div>
</form>

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
