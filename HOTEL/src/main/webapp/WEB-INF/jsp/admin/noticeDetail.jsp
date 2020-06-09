<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<title>부대시설 상세보기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
<h3>부대시설 상세보기</h3>
	<form="frm">
	<table name="noticeDetail" class="table table-striped" align="center" width="800">
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td align="center">${map.NOTICE_TITLE}</td>
			</tr>
		 	<tr>
				<th scope="row">작성일</th>
				<td align="center">${map.NOTICE_DATE}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="center">${map.NOTICE_CONTENT}</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td align="center">${map.NOTICE_ISVIEW}</td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td align="center">${map.NOTICE_IMG}</td>
			</tr>
		</tbody>
	
	</table>
	</form>
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>		
	
	<script>
	$(document).ready(function(){
		$("#list").on("click", function(e){  //목록으로 누르면
			e.preventDefault();
			fn_facList();
		});
		

		$("#modify").on("click", function(e){ //수정하기 누르면
			e.preventDefault();
			fn_facModifyForm();
		});
	});   
    
	function fn_facList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeList' />");
		comSubmit.submit();
		
	}  
	
	function fn_facModifyForm(){
		var FAC_HOTEL_ID = "${map.FAC_HOTEL_ID}";
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/modifyFacilitiesForm' />");
		comSubmit.addParam("FAC_HOTEL_ID", FAC_HOTEL_ID);
		comSubmit.submit();
	}	  
	</script>

</body>
</html>