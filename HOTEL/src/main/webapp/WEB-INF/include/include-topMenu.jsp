<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
a{text-decoration: none;}
a:hover {text-decoration: none;}
.header {
	width: 1900px;
	height: 90px;
    margin: 0 auto;
    margin-top: 20px;
}
.logo {
	width: 200px;
	height: 40px;
	margin: 0 auto;
}
.loginArea {
    width: 600px;
    height: 40px;
    float: right;
    padding: 10px;
    line-height: 1.5;
    text-align: center;
    // border: 1px solid black;
}

#topMenu { /* navigation bar 전체(글자 부분 박스 제외) */
	width: 1900px; /* [변경] 하위 메뉴와 동일하게 맞춤 */
	height: 60px;
	position: relative;
	margin: 0 auto;
	display: block;
	background-color: #81725f; /* [추가] 늘어난만큼 배경색도 보이도록 수정 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style: none;
	margin: 0 auto;
	padding: 0px;
	margin: 0 auto;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white;
	background-color: #81725f;
	float: left;
	line-height: 60px;
	vertical-align: middle;
	text-align: center;
	-position: relative;
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
/*글자 부분 박스(위의 글자)*/
	text-decoration: none;
	display: block;
	width: 165px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
}

.menuLink { /* 상위 메뉴의 글자색 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: white;
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 150px;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #0f1927;
	background-color: #DDD; /* [변경] 배경색 변경 */
	-border: solid 1px black; /* [삭제] 테두리 삭제 */
	-margin-right: -1px; /* [삭제] 공백 보정 삭제 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute;
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	-webkit-transition: height .2s;
	-moz-transition: height .2s;
	-o-transition: height .2s;
	width: 100%;
	left: 0;
	top: 60px; 
	background-color: #dddddd; /* 하위 메뉴 전체 배경색 설정 */
	z-index: 1;
}

.submenu li {
	display: inline-block;
}

.topMenuLi:hover .submenu {
	height: 300px; /*하위메뉴의 높이*/
}

.submenuLink:hover { /*글자에 마우스 올렸을 때*/
	color: ivory;
	background-color: #dddddd;
}

#login_form {font-size: 15px; text-decoration: none; padding: 5px; margin: 10px; font-weight: bold; color: black;}
</style>

<meta charset="UTF-8">
<title>Top Menu</title>
</head>
<body>
	<div class="header">
		<div class="logo">
				<a href="<c:url value='/main'/>"><img src="<c:url value='/image/Hotel_Logo.JPG'/>" class="logo"></a>
		</div>		
		
		<div class="loginArea">
			<c:set var="ID" value="${USERID}" />
			<c:set var="isAdmin" value="${ADMIN}" />
			<c:choose>
				<c:when test="${ID != NULL && isAdmin != 'Y'}">
		${ID} <a id="login_form" href="#">My reservation</a>|<a id="login_form" href="/hotel/logout">Sign Out</a>|<a id="login_form" href="/hotel/myPage">Manage Account</a> 
	    		</c:when>
	    		<c:when test="${ID != NULL && isAdmin == 'Y'}">
		${ID} <a id="login_form" href="#">My reservation</a>|<a id="login_form" href="/hotel/logout">Sign Out</a>|<a id="login_form" href="/hotel/myPage">Manage Account</a>|<a id="login_form" href="/hotel/admin/main">Admin</a> 
	    		</c:when>
				<c:otherwise>
					<c:choose>
	    				<c:when test="${ID == NULL}">
						<a id="login_form" href="/hotel/loginForm">Sign In</a>|<a id="login_form" href="/hotel/signUpTerms">Create Account</a>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
<nav id="topMenu"> 
	<ul class="topMenuUl">
		<li class="topMenuLi" style="margin-left: 550px;"> 
    		<a class="menuLink" href="/hotel/information">About Latte</a> 
  		</li> 
 		<li class="topMenuLi">
			<a class="menuLink" href="/hotel/rooms?ROOM_TYPE=1">객실</a>
  			<ul class="submenu">
		 	    <li style="margin-left: 150px;"><a href="/hotel/rooms?ROOM_TYPE=1" class="submenuLink longLink">Business Double</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=2" class="submenuLink longLink">Business Twin</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=3" class="submenuLink longLink">Superior Double</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=4" class="submenuLink longLink">Superior Twin</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=5" class="submenuLink longLink">Drama Suite</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=6" class="submenuLink longLink">Deluxe Suite</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=7" class="submenuLink lon gLink">Premium Suite</a></li> 
			    <li><a href="/hotel/rooms?ROOM_TYPE=8" class="submenuLink longLink">Sienna Suite</a></li> 
 			</ul> 
  		</li> 
        <li class="topMenuLi"> 
	    	<a class="menuLink" href="/hotel/board/list">프로모션</a> 
		</li>
		     
    <li class="topMenuLi"> 
    	<a class="menuLink" href="/hotel/facilities">부대시설</a> 
    	<ul class="submenu"> 
    		<li style="margin-left: 455px;"><a href="#" class="submenuLink">스파 & 피트니스</a>
    			<div class="" style="background-color:#dddddd; color:black; ">
	    			<div style="height: 30px; font-size: 14px;">피트니스 센터</div>
	    			<div style="height: 30px; font-size: 14px;">호텔 사우나</div>
	    			<div style="height: 30px; font-size: 14px;">설화수 스파</div>
	    			<div style="height: 30px; font-size: 14px;">호텔  수영장</div>
	    			<div style="height: 30px; font-size: 14px;">골프 연습장</div>
	    			<div style="height: 30px; font-size: 14px;">호텔 사우나</div>
    			</div>
    		</li>
     		<li><a href="#" class="submenuLink">비즈니스</a></li> 
     		<li><a href="#" class="submenuLink">문화</a></li>
      		<li><a href="#" class="submenuLink">쇼핑</a></li>
      		<li><a href="#" class="submenuLink">서비스</a></li>
      	</ul>
    </li> 
          
    <li class="topMenuLi"> 
    <a class="menuLink" href="/hotel/reservation/main">Book Now</a> 
    <ul class="submenu"> 
    <li style="margin-left: 638px;"><a href="/hotel/reservation/main" class="submenuLink">Reservation</a></li>
		<c:if test="${ID != null}">
    		<li><a href="/hotel/reservation/resList" name="list" class="submenuLink">Booking List</a></li>
    	<script type="text/javascript">
    	$(document).ready(function(){
    		$("a[name='list']").on("click", function(e){
    			e.preventDefault();
    			fn_list();
    		});
    	});
    	function fn_list(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/reservation/resList' />");
    		comSubmit.addParam("MEM_USERID", $("#ID").val());
    		comSubmit.submit();
    	}
    	</script>
    	</c:if>
      </ul> 
      </li> 
                
   
           
    
	
    
    
    
     </ul>
      </nav>
</body>
</html>