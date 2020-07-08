<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("joinCode", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>


<style>
.signUpText {
	width: 648px;
	heigth: 300px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	padding-bottom: 40px;
}
.stepbox {
color: #333; font-size: 16px; line-height: 1.6;
word-break: keep-all; font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif; letter-spacing: -1px;
-webkit-font-smoothing: antialiased; outline: 0; margin: 0 auto; min-width: 320px;
padding: 0 15px; max-width: 760px;
}

.stepbox__wrap col-3 {
color: #333;
font-size: 16px;
line-height: 1.6;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
padding: 0;
list-style: none;
margin: 0 -1px;
}

.inner {line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
box-sizing: border-box;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
position: relative;
color: #fff;
height: 50px;
padding: 12px 10px;
background-color: #998465;
}

.inner_n {line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
box-sizing: border-box;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
position: relative;
color: #fff;
height: 50px;
padding: 12px 10px;
background-color: #ccc;
}

.stepbox__list {
color: #333;
line-height: 1.6;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
list-style: none;
float: left;
font-size: 18px;
text-align: center;
padding: 0 1px;
width: 33.33%;
}

.text {
line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
color: #fff;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
box-sizing: border-box;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
padding: 0;
display: inline-block;
}

.contents {
	width: 100%;
	float: left;
	text-align: center;
	font-size: 1.875em;
	color: #444;
	margin-bottom: 50px;
}

.form-control {
	width: 690px;
	height: 55px;
}

.myForm-group { /* 버튼 div */
	width:345px;
	margin: 0 auto;
	margin-top: 20px;
	border: 1px solid black;
}
.buttons {
width:345px;
height:55px;
border-color: #ad9e87;
border:none;
background-color: #ad9e87;
color: #fff;
margin: 0 auto;
}
.contentBox { /* 컨텐츠 박스 */
width: 780px;
height: 800px;
margin: 0 auto;
border: 1px solid black;
margin-top: 100px;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<form id="signUp" method="POST" action="/hotel/signUp">
	<div class="signUpText">
		<h3 style="margin-top: 100px;">회원가입</h3>
	</div>
		
        <div class="stepbox">
           <ol class="stepbox__wrap col-3">
                <li class="stepbox__list">
                    <div class="inner_n">
                        <p class="text">Step 1</p>
                    </div>
                </li>
                <li class="stepbox__list">
                    <div class="inner_n">
                        <p class="text">Step 2</p>
                    </div>
                </li>
                <li class="stepbox__list">
                    <div class="inner">
                        <p class="text">Step 3</p>
                    </div>
                </li>
            </ol>          
        </div>
		<div class="contentBox">
		${list.MEM_USERID}
		${list.MEM_NAME}
		${list.MEM_EMAIL}
		
		</div>
<br><br><br>
		<div class="myForm-group">
			<button type="button" id="main" class="buttons" onclick="location.href='/hotel/main'">완료</button>
		</div>
	</form>
	
	<script>

	</script>
</body>
</html>