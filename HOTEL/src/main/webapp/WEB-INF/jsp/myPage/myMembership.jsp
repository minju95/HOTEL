<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<title>마이페이지</title>
<!-- jQuery -->
<script src="./마이페이지_files/jquery.min.js.다운로드"></script>
<script src="./마이페이지_files/common.js.다운로드" charset="utf-8"></script>
<link rel="stylesheet" href="./마이페이지_files/bootstrap.min.css">

<!-- JS -->
 <link href="./마이페이지_files/css2" rel="stylesheet">
 <link href="./마이페이지_files/css2(1)" rel="stylesheet"> 
 <script src="./마이페이지_files/popper.min.js.다운로드"></script> 
 <link href="./마이페이지_files/font-awesome.min.css" rel="stylesheet"> 
 
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./마이페이지_files/bootstrap.min(1).css">
<link rel="stylesheet" href="./마이페이지_files/bootstrap-theme.min.css">
<script src="./마이페이지_files/bootstrap.min.js.다운로드"></script> 
<style>

.myPageText {
	width: 648px;
	heigth: 300px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	padding-bottom: 40px;
}

.btn-group{
	align:center;
	width:100%;
	top: 20px;
	
}
.myPageInfo{
	border: 1px solid #e7e7e7;
	font-size: 14px;
	width:80%;
	margin-left:10%;
	margin-right:10%;
}
.myPageInfo .info1{
	border: 1px solid #e7e7e7;
	width: 25%;
	text-align: center;
	height:100px;
	padding-top:20px;
	float:left;
	background-color: #f5f5f5;;
}
.title {
	font-size: 18px;
}
.content {
	color: #998465;
	margin-top: 3px;
	font-size: 24px;
	}
.buttonBox{
	margin-top:5%;
	margin-left:10%;
	width:80%;
	border: 1px solid black;
}
.buttons{
	width: 24.8%;
	height: 40px;
	color: #fff;
	background-color: #ad9e87;
	border: none;
}

</style>
</head>

<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<div class="myPageText">
		<h3 style="margin-top: 100px;">나의 멤버십 정보</h3>
</div>


<!-- 상단박스영역 -->
	<div class="myPageInfo">
	<!-- 상단박스1 -->
		<div class="info1">
			<span class="title">성명</span>
			
			<br>
			<span class="content" style="font-weight: bold;">박민주</span>
		</div>
	<!-- 상단박스2 -->
		<div class="info1">
			<span class="title">리워즈번호</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<div class="info1">
			<span class="title">롯데호텔 리워즈등급</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<div class="info1">
			<span class="title">롯데호텔 리워즈등급</span>
			<br>
			<span class="content" style="font-weight: bold;">123456</span>
		</div>
		<br>
		
		<!-- 목록박스 -->
		<div class="btn-group" role="group" aria-label="Basic example">
		<!-- Standard button -->
		  <input type="button" class="buttons" value="예약내역" onclick="location.href='/hotel/myFavorite';">
		   <input type="button" class="buttons" value="나의 Q&A" onclick="location.href='/hotel/myQnA';">
		    <input type="button" class="buttons" value="나의 관심목록" onclick="location.href='/hotel/myFavorite';">
		     <input type="button" class="buttons" value="회원 정보 수정" onclick="location.href='/hotel/modifyMemForm';">
		</div>
	</div>
	


</body></html>