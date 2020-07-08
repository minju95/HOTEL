<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 비밀번호 찾기</title>
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

.findid {
	padding-top: 50px;
	padding-left: 0;
}

.findid>li {
	list-style: none;
	text-align: center;
}

.findid>li>a {
	float: right;
}

.findid>li>p {
	padding-right: 0;
}

.findid>li>input {
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<input type="hidden" name="alert" value="${resultMsg}" />
	<form action="/hotel/idSearch" method="post">
		<div id="findMemform">

			<h1>아이디 찾기</h1>

			<ul class="findid">
				<li><input type="text" class="form-control" name="MEM_NAME"
					id="MEM_NAME" placeholder="이름"></li>
				<li><input type="email" class="form-control" name="MEM_EMAIL"
					id="MEM_EMAIL" placeholder="이메일주소"></li>

				<button class="btn btn-primary" type="submit" id="findIdBtn">찾기</button>
				<button type="button" class="btn btn-primary" id="submit" onclick="location.href='/hotel/main'">홈으로</button>
			</ul>

		</div>
	</form>
	<script>
		$(document).ready(
				function() {
					if ($("input[name='alert']").val() != null
							&& $("input[name='alert']").val() != "") {
						alert($("input[name='alert']").val());
					}
				});
	</script>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>