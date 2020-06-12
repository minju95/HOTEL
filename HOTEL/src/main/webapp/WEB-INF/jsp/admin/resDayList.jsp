<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지(객실 예약 현황)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h3>관리자 메인 페이지</h3>

객실 관리<br>
<a href="/hotel/admin/roomsList">객실 목록 조회</a><br>

<a href="/hotel/admin/reservationList">예약자 리스트</a><br>
<a href="/hotel/admin/facilitiesList">부대시설 관리</a><br>
<a href="/hotel/admin/noticeList">공지사항 관리</a><br>
<a href="/hotel/admin/resDayList">일별 객실 예약 현황</a><br>

일별 매출 현황<br>
월별 매출 현황<br>

<table>
	<tr>
	</tr>
</table>
</body>
</html>