<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.div1{
width: 300px;
  height:80px;
 background-color:  white;
position: relative;
/*bottom:70%;*/

font-size: 22px;
  margin: auto;
}
.div2{
width: 1000px;
position: relative;
 background-color:  white;
/*border:1px solid black ;*/
font-size: 20px;
  margin: auto;
}

.div3{
width: 1000px;
position: relative;
 background-color:  white;
/*border:1px solid black ;*/
font-size: 20px;
  margin: auto;
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
@media only screen and (max-width: 1000px) {
  .text {font-size: 11px}
}
.p1{
 text-align: center;
}
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: #e5a880;
background-repeat:no-repeat;
background-size:100%;
}
.aa{
text-decoration: none;
font-size: 18px;
 color:white;
}
.aa:hover { text-decoration: underline; }
.p1{

font-size: 14px;
}
#res-go{
 width: 200px;
 height:50px;
 font-size:20px;
}

.hotel{
 width: 100%;
 height:2350px;
}
</style>

<meta charset="UTF-8">
<title>객실 리스트</title>
</head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<body oncontextmenu="return false" ondragstart="return false">

<div class="hotel">
<div class="div1">
<br>
<b>${map.ROOM_NAME}</b>
</div>
<br>
<c:forTokens items="${map.ROOM_IMGS_FILE }" delims="," var="item">
   <div class="slideshow-container">

<div class="mySlides ">
<br>
  <img src="<c:url value='/image/${item}'/>" style="width:1000px; height:600px;">

</div>


</div>
</c:forTokens>
<br>
<br>

<div class="div2">
${map.ROOM_CONTENT}
<div>ROOM SIZE:${map.ROOM_SIZE}   BED TYPE:${map.ROOM_BEDTYPE}</div>
<br>
<br>
<br>


<P class="p1"><input id="res-go" type="button" value="RESERVATION"  onclick="location.href='/hotel/reservation/main'"></P>
</div>
<br>
<br>
<br>

<div class="div3">
<table>
<colgroup>
			<col width="20%"/>
			<col width="60%"/>
			<col width="20%"/>
		</colgroup>
<tr>
<td><b>이용요금</b></td><td><fmt:formatNumber value="${map.ROOM_PRICE}" pattern="#,###"/></td>
</tr>
<tr>
<td><b>어메니티</b></td><td>${map.ROOM_FAC_NAME}</td>
</tr>
<tr>
<td><b>이용안내</b></td><td>${map.ROOM_CHK_INTIME}|${map.ROOM_CHK_OUTTIME}<br>
조식 : 12,000 1인(세금포함)<br>
<font style="color:red; font-size:14px;">※ 모든 금액에는 부가가치세 10%가 포함되어 있습니다.</font></td>
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
    
    setTimeout(showSlides, 4000); // Change image every 2 seconds
}





$(document).ready(function(){ 
	  $("a[name='title']").on("click", function(e){ //제목
		   e.preventDefault(); fn_facDetail($(this));
		    });
	     });




		function fn_facDetail(obj){
          var comSubmit = new ComSubmit();
          comSubmit.setUrl("<c:url value='/rooms'/>");
          comSubmit.addParam("ROOM_TYPE", obj.parent().find("input[name='id']").val());
          comSubmit.submit();
      }
</script>
</div>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>

</body>
</html>