<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">
<style>
#notice {
	margin-left: calc(50% - 400px);
	width: 800px;
	text-align: center
}

h2 {
	width: 800px;
	display: block;
	text-align: center;
}

#PAGE_NAVI {
	text-align: center;
	margin-top: 10%
}

.div-about {
	background-image: url(/hotel/image/hotel.jpg);
	height: 250px;
	color: #e5a880;
	background-repeat: no-repeat;
	background-size: 100%;
}

a {
	text-decoration: none;
	color: black;
}
</style>

<title>공지사항 상세보기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>N O T I C E</h1>
	</div>
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
	<h3 align="center">공지사항 상세보기</h3>
	<br>

	<form id="frm">
		<input type="hidden" id="NOTICE_ID" name="NOTICE_ID"
			value="${map.NOTICE_ID }">

		<table name="noticeDetail" class="table table-striped" align="center"
			style="width: 800px;">
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
					<c:choose>
						<c:when test="${map.NOTICE_IMG != NULL}">
							<td align="center">${map.NOTICE_IMG}<!-- 이미지_상대경로 --> <img
								src="/hotel/image/${map.NOTICE_IMG}"
								style="width: 200px; heigth: 120px;">
							</td>
						</c:when>
						<c:otherwise>
							<td>업로드된 이미지가 없습니다.</td>
						</c:otherwise>
					</c:choose>

					<%-- <td align="center">
						${map.NOTICE_IMG}
						<img src= "/hotel/image/${map.NOTICE_IMG}" style = "width:200px; heigth:120px;">
					</td> --%>
				</tr>

				<tr>
					<th>공개여부</th>
					<td align="center">${map.NOTICE_ISVIEW}</td>
				</tr>
			</tbody>

		</table>
	</form>
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a> <a href="#this"
			class="btn" id="delete">삭제하기</a> <a href="#this" class="btn"
			id="list">목록으로</a>
	</center>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script>
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 누르면
				e.preventDefault();
				fn_facList();
			});

			$("#modify").on("click", function(e) { //수정하기 누르면
				e.preventDefault();
				fn_facModifyForm();
			});

			$("#delete").on("click", function(e) { //삭제하기 누르면
				e.preventDefault();
				fn_deleteNotice();
			});
		});

		function fn_facList(pageNo) { //리스트로 이동하는 함수
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeList' />");
			comSubmit.submit();

		}

		function fn_facModifyForm() {
			var NOTICE_ID = "${map.NOTICE_ID}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/modifyNoticeForm' />");
			comSubmit.addParam("NOTICE_ID", NOTICE_ID);
			comSubmit.submit();
		}

		function fn_deleteNotice() {
			if (confirm("삭제하시겠습니까?") == true) {
				alert("삭제되었습니다.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/admin/deleteNotice' />");
				comSubmit.addParam("NOTICE_ID", $("#NOTICE_ID").val());
				comSubmit.submit();
			} else {
				return;
			}
		}
	</script>

</body>
</html>