<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>마이페이지 헤더</title>
<style>
	.myPageText { width: 648px; height: auto; margin: 0 auto; text-align: center;}
	.myPageInfo {border: 1px solid #e7e7e7; font-size: 14px; width:80%; margin-left:10%; margin-right:10%;}
	.myPageInfo .info1 {border: 1px solid #e7e7e7; width: 25%; text-align: center; padding-top:20px; float:left; background-color: #f5f5f5;}
	.btn-group {width:100%; margin: 0 auto; display: flex; flex-direction: row; justify-content: center; align-items: center;}
	.buttons {width: 24%; height: 50px;	text-align: center; padding: 5px; float:left; margin: 10px;	color: #fff; background-color: #ad9e87; border: none;}
	.title {font-size: 18px;}
	.content {color: #998465; margin-top: 3px; font-size: 24px;}
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
			<span class="content" style="font-weight: bold;">${map.MEM_USERID}</span>
		</div>
	<!-- 상단박스2 -->
		<div class="info1">
			<span class="title">리워즈번호</span>
			<br>
			<span class="content" style="font-weight: bold;">${map.MEM_ID}</span>
		</div>
		<div class="info1">
			<span class="title">롯데호텔 리워즈등급</span>
			<br>
			<span class="content" style="font-weight: bold;">${map.MEM_GRADE}</span>
		</div>
		<div class="info1">
			<span class="title">LH 포인트</span>
			<br>
			<span class="content" style="font-weight: bold;">${map.MEM_POINT}</span>
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
</body>
