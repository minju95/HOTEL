<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.div1{
border:1px solid black ;
border-collapse: collapse;
}

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
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
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<body>

<div class="div1">
<%@ include file="/WEB-INF/jsp/room/roomList.jsp"%>
${map.ROOM_NAME}
</div>
<br>

<c:forTokens items="${map.ROOM_IMGS_FILE }" delims="," var="item">
   <div class="slideshow-container">

<div class="mySlides fade">

  <img src="<c:url value='/image/${item}'/>" style="width:100%">

</div>


</div>
</c:forTokens>

<br>
<div class="div1">
${map.ROOM_CONTENT}
<div>ROOM SIZE:${map.ROOM_SIZE}   BED TYPE:${map.ROOM_BEDTYPE}</div><br>
<input type="button" value="RESERVATION">
</div>
<br>
<div class="div1">
<table>
<colgroup>
			<col width="20%"/>
			<col width="60%"/>
			<col width="20%"/>
		</colgroup>
<tr>
<td>이용요금</td><td><fmt:formatNumber value="${map.ROOM_PRICE}" pattern="#,###"/></td>
</tr>
<tr>
<td>어메니티</td><td>${map.ROOM_FAC_NAME}</td>
</tr>
<tr>
<td>이용안내</td><td>${map.ROOM_CHK_INTIME}|${map.ROOM_CHK_OUTTIME}<br>
조식 : 12,000 1인(세금포함)<br>
※ 모든 금액에는 부가가치세 10%가 포함되어 있습니다.</td>
</tr>
</table>
         
       
       
         

</div>
<br>
<script type="text/javascript">

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
    
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


</body>
</html>