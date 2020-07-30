<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL</title>
	<!-- 부트스트랩.슬라이드 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/journal/bootstrap.min.css">
	<!-- reservation/main css -->
	<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
	
<style>
	/*이미지슬라이드*/
	* {box-sizing: border-box;}
	body {font-family: Verdana, sans-serif;}
	.mySlides {display: none;}
	.img { vertical-align: middle;}
	.headline {width: 1200px; height: 150px; margin: 0 auto; text-align:center; padding:20px; margin-top: 30px;  line-height:2.0;}
	
	.description {width: 1900px; margin: 0 auto; text-align:center; font-size: 15px; padding-right: 300px; padding-left:300px; margin-bottom: 50px; line-height:2.0;}
	.info {width: 1900px; height:150px; margin: 0 auto; text-align:left; font-size: 15px; padding-right: 400px; padding-left:400px; margin-top: 50px; line-height:2.0;}
	.info2 {width: 1900px; height:auto; overflow: auto; margin: 0 auto; text-align:left; font-size: 15px; padding-right: 400px; padding-left:400px; margin-top: 50px; line-height:2.0;}
	.title{font-size: 28px; float: left; width: 25%; font-weight: 600; display: inline;}
	.content{float: left; width: 75%; height: auto; font-size: 18px; padding: 15px; display: block;}
	.list{padding-right: 250px;}
	.tel {width: 1200px; height: 80px; margin: 0 auto; text-align:left; font-size: 15px; padding-left: 50px; background-color: #f5f5f5; margin-top: 50px; line-height:2.0;}
</style>

</head>
<body oncontextmenu="return false" ondragstart="return false">
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	
<div class="headline">
		<span style="font-size: 18px; font-weight:450;">${map.FAC_HOTEL_TYPE}</span> 
		<p style="font-size: 40px; font-weight:500;">${map.FAC_HOTEL_NAME}</p>
</div>

<div class="main1" style="width: 1900px; height: 750px; margin: 0 auto;">
<div class="a_layer_inner" style="margin: 0px;">
<div class="a_content">

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%;">
	<!-- Indicators -->
	
	<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<c:forEach items="${list}" var="img">
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox" style="width: 80%; margin-left: 10%;">
				<div class="item active" style="height:700px;">
					<img class="img" src="<c:url value='/image/facilities/${img.HOTEL_IMGS_FILE}'/>">
				</div>
				<div class="item" style="height:700px;">
					<img class="img" src="<c:url value='/image/facilities/${img.HOTEL_IMGS_FILE}'/>">
				</div>
	
				<div class="item" style="height:700px;">
					<img class="img" src="<c:url value='/image/facilities/${img.HOTEL_IMGS_FILE}'/>">
				</div>
	 
	 <!-- Left and right controls -->
	  <a class="left view_button" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right view_button" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	  
	</div>
	</c:forEach>
	</div>
</div>
</div>
</div>

<div class="description">
	<p>${fn:replace(map.FAC_HOTEL_CONTENT, cn, br)}</p>
</div>
<hr class="featurette-divider" style="width: 70%; margin: 0 auto; size: 10px;" >

<div class="info">
	<h2 class="title">부대시설 개요</h2>
	<div class="content">
		<ul class="list">
			<li><b>타입</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.FAC_HOTEL_TYPE}</li>
			<li><b>위치</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.FAC_HOTEL_LOCATION}</li>
			<li><b>이용시간</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.FAC_HOTEL_TIME}</li>
		</ul>
	</div>
</div>
<hr class="featurette-divider" style="width: 70%; margin: 0 auto; size: 10px;" >
<div class="info2">
	<div>
	<h2 class="title">추가정보</h2>
	<div class="content" style="height: auto;">
		<p>${fn:replace(map.FAC_HOTEL_DETAIL, cn, br)}</p>
	</div>
	</div>
</div>
<hr class="featurette-divider" style="width: 70%; margin: 0 auto; size: 10px;" >
<div class="tel">
	<h2 class="title">문의안내</h2>
	<div class="content">
		<ul class="list">
			<li><b>TEL</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.FAC_HOTEL_PHONE}</li>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>