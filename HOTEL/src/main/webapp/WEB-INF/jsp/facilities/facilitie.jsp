<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<style>
.div1{
width: 300px;
  height:80px;
 background-color:  white;
position: absolute;
/*bottom:70%;*/
left:45%;
top:60%;
font-size: 22px;
}
.div2{
width: 1000px;

 background-color:  white;
/*border:1px solid black ;*/
font-size: 20px;
margin-left: 250px;
}

.div3{
width: 1000px;

 background-color:  white;
/*border:1px solid black ;*/
font-size: 20px;
margin-left: 250px;
}
.p1{
color:red;
font-size: 14px;
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
.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color:   #e5a880;
background-repeat:no-repeat;
background-size:100%;
}
.aa{
text-decoration: none;
font-size: 18px;
 color:white;
}
.aa:hover { text-decoration: underline; }

.fac-list{
 background-color: #0f1927;
 height:50px;

}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>F A C I L I T I E S</h1>
	</div>

	<div class="fac-list">
		<table align="center">
			<br>
			<tr>
				<c:forEach items="${list}" var="fac">

					<!--  <td>${fac.FAC_HOTEL_ID}</td>-->
					<td><a class="aa" href='#this' name="title">${fac.FAC_HOTEL_NAME}</a>&emsp;
						<input type='hidden' name='id' value="${fac.FAC_HOTEL_ID }"></td>

				</c:forEach>
			</tr>
		</table>
	</div>
	<br>
<br>
<div class="div1">
<b>${map.FAC_HOTEL_NAME}</b>
</div>
<br>
<br>
<c:forTokens items="${map.HOTEL_IMGS_FILE }" delims="," var="item">
   <div class="slideshow-container">

<div class="mySlides fade">

  <img src="<c:url value='/image/${item}'/>" style="width:1000px; height:600px;">

</div>


</div>
</c:forTokens>

<br>
<div class="div2">
<br>
${fn:replace(map.FAC_HOTEL_CONTENT, replaceChar, "<br/>")}
</div>
<br>
<div class="div3">

<pre><b>위치</b>               ${map.FAC_HOTEL_LOCATION}</pre><br>
<pre><b>운영시간</b>           ${map.FAC_HOTEL_TIME}</pre><br>
<c:choose>
	<c:when test="${map.FAC_HOTEL_FAC != null}">
<pre><b>시설 </b>              ${map.FAC_HOTEL_FAC}</pre><br>
</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
<pre><b>대표번호</b>           ${map.FAC_HOTEL_PHONE}</pre>
<c:choose>
	<c:when test="${map.FAC_HOTEL_DETAIL != null}">
<p class="p1">*${map.FAC_HOTEL_DETAIL}</p>
	</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
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
          comSubmit.setUrl("<c:url value='/facilities'/>");
          comSubmit.addParam("FAC_HOTEL_ID", obj.parent().find("input[name='id']").val());
          comSubmit.submit();
      }
</script>

<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>