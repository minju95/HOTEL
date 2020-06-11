<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL</title>
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
height:850px;
border:1px solid black ;
}

.div-fac{
weith:100%;
height:650px;
border:1px solid black ;
}

.div-notice{
weith:100%;
height:500px;
border:1px solid black ;
 background-image:url(/hotel/image/main-notice.jpg);
 background-repeat:no-repeat;
 background-position:center;
background-size:cover;

}
.div-notice-son{
width: 850px;
  height:300px;
 background-color:  white;
position: absolute;
/*bottom:70%;*/
left:22%;
top:268%;

}

    #notice{margin-left: calc(50% - 425px);width: 700px;text-align: center} 
	h2{width: 100px;  display: block; text-align: center;}
	#PAGE_NAVI{text-align: center;margin-top:10%}
	.notice_list{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_list th{border-bottom:1px solid black;}
	.notice_list tr{height: 48px}
	.notice_list tr td{border-bottom:1px solid black;}
	.h1 {
     color: white;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
메인화면 입니다.<br/>
<c:set var="ID" value="${USERID }" />
<c:choose>
<c:when test="${ID != NULL}">
${ID }님, 환영합니다. <a href="/hotel/logout">로그아웃</a> | <a href="/hotel/modifyMemForm">회원정보 수정</a>
</c:when>
<c:otherwise>
<a href="/hotel/signUpForm">회원가입</a> | <a href="/hotel/loginForm">로그인</a>
</c:otherwise>
</c:choose>
<br>
<c:set var="isAdmin" value="${ADMIN }" />
<c:if test="${isAdmin == 'Y' }">
<a href="/hotel/admin">호텔 관리</a>
</c:if>
</div>
<div class="div-reservation">
</div>
<div class="div-fac">
<br>
<center><h1 >시설소개</h1></center>
</div>
<div class="div-notice">
<br>

<center><h1 class="h1" >NOTICE</h1></center>
<div class="div-notice-son">
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
						<a href='#this' name='title'>${board.NOTICE_TITLE }</a>
						<input type='hidden' name='title' value="${board.NOTICE_ID }"> 
						</td><td>${board.NOTICE_DATE }</td>
						</tr>
						</c:forEach>
			</tbody>
		</table>
		</form>
</div>
</div>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>