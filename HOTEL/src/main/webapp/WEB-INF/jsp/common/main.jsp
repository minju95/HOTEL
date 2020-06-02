<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메인화면 입니다.<br/>
<!-- 회원가입 테스트 폼 -->
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 폼"><br>
<input type="button" onclick="location.href='/hotel/loginForm'" value="로그인 폼"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
사용자 권한 : ${USERID } <br>
관리자 권한 : ${ADMIN }
</body>
</html>