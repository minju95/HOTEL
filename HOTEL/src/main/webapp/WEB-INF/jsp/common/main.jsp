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
</head>
<body>
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
</body>
</html>