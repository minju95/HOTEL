<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<title>객실 상세보기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
<h3>객실 상세보기</h3>
	<form="frm">
	<table name="facDetail" class="table table-striped" align="center" width="800">
		<thead>
			<tr>
				<th scope="row">객실유형</th>
				<th scope="row">객실이름</th>
				<th scope="row">객실호수</th>
				<th scope="row">예약금액</th>
				<th scope="row">예약금액</th>
			</tr>
		</thead>
		<tbody>
		 	<tr>
				<td align="center">${map.ROOM_TYPE}</td>
				<td align="center">${map.ROOM_NAME}</td>
				<td align="center">${map.ROOM_ID}</td>
				<td align="center">${map.ROOM_PRICE}</td>
				<td align="center">??</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
					<td colspan="5" height="200" style="padding-left:50px;">
						${fn:replace(map.ROOM_CONTENT, cn, br)}
					</td>
			</tr>
			<tr>
			 <th scope="row">첨부파일</th>
			<td colspan="4">
				<c:forEach var="row" items="${list }">
				<p>
					<input type="hidden" id="FAC_HOTEL_ID" value="${row.ROOM_ID }">
					<a href="#this" name="HOTEL_IMGS_FILE">${row.ROOM_IMGS_FILE }</a>
				</p>
				</c:forEach>
			</td>
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
		comSubmit.setUrl("<c:url value='/admin/roomsList' />");
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