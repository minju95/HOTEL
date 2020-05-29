<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- form 안의 name 값을 SQL쿼리에서 받아오는 변수값과 동일하게 지정-->
<form action="/hotel/join/memberVerify" method="post">
사용자 유형 <input type="radio" name="MEM_TYPE" value="1">일반사용자
<input type="radio" name="MEM_TYPE" value="2">호스트<br>
아이디<input type="text" name="MEM_USERID"><br>
회원명<input type="text" name="MEM_NAME"><br>
패스워드<input type="text" name="MEM_PW"><br>
전화번호<input type="text" name="MEM_PHONE"><br>
이메일<input type="text" name="MEM_EMAIL">
<input type="submit" value="전송">
<!-- 전송 클릭 시  hotel.common.controller.JoinController으로 요청 -->
</form>



</body>
</html>