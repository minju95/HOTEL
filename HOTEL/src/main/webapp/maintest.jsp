<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
메인화면 입니다.<br/>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
<!-- 회원가입 테스트 폼 -->
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 폼"><br>
<input type="button" onclick="location.href='/hotel/loginForm'" value="로그인 폼"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
<input type="button" onclick="location.href='/hotel/signUpForm'" value="회원가입 테스트"><br>
<input type="button" onclick="location.href='/hotel/board/list'" value="공지사항"><br>
<input type="button" onclick="location.href='/hotel/facilitieslist'" value="호텔부대시설"><br>
<input type="button" onclick="location.href='/hotel/roomslist'" value="호텔부대시설"><br>
사용자 권한 : ${USERID } <br>
관리자 권한 : ${ADMIN }
</body>
</html>