<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL</title>
<!-- include) 부트스트랩.슬라이드 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- reservation/main css -->
<link rel="stylesheet" href="<c:url value='/js/reservation_main.css'/>">
<style type="text/css">
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}
.div-reservation{
weith:100%;

/*border:1px solid black ;*/
/*background-image:url(/hotel/image/mainHotel.jpg);
 background-repeat:no-repeat;
background-size:100%;*/
}

.div-fac{
weith:100%;
/*border:1px solid black ;*/
}

.div-notice{
weith:100%;

border:1px solid black ;
 background-image:url(/hotel/image/main-notice.jpg);
 background-repeat:no-repeat;
 background-position:center;
background-size:cover;
 color: white;
}
.div-notice-son{
width: 850px;

 background-color:  white;
position: relative;
/*bottom:70%;*/
left:22%;
top:268%;

}

    #notice{margin-left: calc(50% - 425px);width: 700px;text-align: center} 
	h2{width: 100px;  display: block; text-align: center;}
	#PAGE_NAVI{text-align: center;margin-top:10%}
	.notice_list{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_list th{border-bottom:1px solid  white;}
	.notice_list tr{height: 48px}
	.notice_list tr td{border-bottom:1px solid white;}
	.h1 {
     color: white;
}
.a1{
color: white;
text-decoration: none;
}

#p1{
color:red;
font-size: 14px;
}


.div-fac_2{
font-size: 22px;
height:500px;
width: 1500px;
position: relative;
margin: 0 auto;
/*bottom:70%;*/
/*left:60%;
top:190%;*/
/*border:1px solid red ;*/
}



<!-- 이미지슬라이드-->
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
margin-top: 15px;
max-width: 700px;
position: relative;
/*margin-left: 5%;*/
float: left;
/*bottom:70%;*/
/*left:10%;*/
/*top:190%;*/
}

.fac-text{
font-size: 22px;
height: 450px;
width: 700px;
position: relative;
float:left;
margin-left: 80px;
/*bottom:70%;*/
/*left:60%;
top:190%;*/
/*border:1px solid black;*/
}


.fac-name{
font-size: 22px;
height: 50px;
width: 200px;
position: relative;
margin: auto;
/*bottom:70%;*/
/*left:60%;
top:190%;*/
/*border:1px solid black ;*/
}
.fac-content{
font-size: 18px;
height: 120px;
width: 700px;
position: relative;
margin: auto;
/*bottom:70%;*/
/*left:60%;
top:198%;*/
/*border:1px solid black ;*/

}

.fac-all{
height: 190px;
width: 700px;
position: relative;
margin: auto;
/*bottom:70%;*/
/*left:60%;
top:228%;*/
/*border:1px solid black ;*/
}




/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
 position: relative;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: white;
background-repeat:no-repeat;
background-size:100%;
}

</style>

</head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<body oncontextmenu="return false" ondragstart="return false">

<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<div class="div-about" align="center" ></div>

<!-- 객실 소개 s -->
<div class="div-reservation">
<div class="a_layer">
<div class="a_layer_inner" style="margin: 0px;">
<div class="a_content">
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 80%; margin-left: 10%; margin-top: 50px;">
	<!-- Indicators -->
	<ol class="carousel-indicators" style="bottom: 200px;">
	<c:choose>
		<c:when test="${fn:length(roomView) > 0}">
			<c:forEach items="${roomView}" var="row" varStatus="status">
				<li data-target="#myCarousel" data-slide-to="${status.index}" <c:if test="${status.index eq 0}">class="active"</c:if>></li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		</c:otherwise>
	</c:choose>
	</ol>
	
	<!-- Wrapper for slides -->
	<div class="view_title">객실 소개</div>
	<div class="carousel-inner" role="listbox" style="width: 80%; margin-left: 10%;">
	<c:choose>
		<c:when test="${fn:length(roomView) > 0}">
			<c:forEach items="${roomView}" var="row" varStatus="status">
				<div class="item <c:if test="${status.index eq 0}">active</c:if>" style="background-color: #fff;">
					<img class="" alt="${row.ROOM_TYPE}" src="<spring:url value='/image/${row.ROOM_IMGS_FILE}'/>">
					<div style="margin-top: 10px; padding: 10px;">
						<span class="view_name">${row.ROOM_NAME}</span><br/><br/>
						<span class="view_content">${row.ROOM_CONTENT}</span><br/><br/>
						<span class="view_type">ROOM SIZE 약 ${row.ROOM_SIZE}</span><br/>
						<span class="view_type">BED TYPE ${row.ROOM_BEDTYPE}</span>
						<a href="/hotel/reservation/main" class="reserBtn" name="search">예약하기</a>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h2>조회된 결과가 없습니다.</h2>
		</c:otherwise>
	</c:choose>
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
</div>
</div>
</div>
</div>
<br>
<!-- 시설 소개-->

<div class="div-fac">
	<center><h1 >시설소개</h1></center>
	
<div class="div-fac_2">
	<c:forEach items="${list2}" var="fac">
	<c:forTokens items="${fac.HOTEL_IMGS_FILE }" delims="," var="item">		
	<div class="slideshow-container">
		<div class="mySlides ">
		  <img src="<c:url value='/image/${item}'/>" style="width:700px; height:480px;">
		</div>
	</div>
	</c:forTokens><br>
	
	
	<div class="fac-text">
		<div class="fac-name">
			<b>${fac.FAC_HOTEL_NAME}</b>
		</div>
		<br>
		
		<div class="fac-content">
		${fn:replace(fac.FAC_HOTEL_CONTENT, replaceChar, "<br/>")}
		</div>

		
		<div class="fac-all">
		위치: ${fac.FAC_HOTEL_LOCATION}<br><br>
		이용시간: ${fac.FAC_HOTEL_TIME}<br><br>
		<c:choose>
			<c:when test="${fac.FAC_HOTEL_FAC != null}">
		시설: ${fac.FAC_HOTEL_FAC}<br><br>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		대표전화: ${fac.FAC_HOTEL_PHONE}<br>
		<c:choose>
			<c:when test="${fac.FAC_HOTEL_DETAIL != null}">
		<p id="p1">* ${fac.FAC_HOTEL_DETAIL}</p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	</c:forEach>		
</div>	
</div>
<br><br>


<div class="div-notice">


<center><h1 class="h1" >NOTICE</h1></center>
<!--  <div class="div-notice-son">-->
<form id="notice">
	
		<table name="noticeList" class="notice_list" align="center" width="850">
			<colgroup>
				<col width="15%"/>
				<col width="55%"/>
				<col width="30%"/>
				
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성일</th>
					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="board">
			<tr>
			<td>${board.RNUM}</td>
			<td class='title'>
						<a class="a1" href='#this' name='title'>${board.NOTICE_TITLE }</a>
						<input type='hidden' name='id' value="${board.NOTICE_ID }"> 
						</td><td>${board.NOTICE_DATE }</td>
						</tr>
						</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
<br>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">

$(document).ready(function(){ 
	  $("a[name='title']").on("click", function(e){ //제목
		   e.preventDefault(); fn_noticeDetail($(this));
		    });
	     });


function fn_noticeDetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/boardDetail' />");
    comSubmit.addParam("NOTICE_ID", obj.parent().find("input[name='id']").val());
    comSubmit.submit();
}


var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    
    setTimeout(showSlides, 7000); // Change image every 2 seconds
}
</script>

<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>