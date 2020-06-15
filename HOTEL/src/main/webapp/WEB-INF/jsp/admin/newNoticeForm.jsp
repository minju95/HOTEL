<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">
<style>
<<<<<<< HEAD
    #noticeWrite{margin-left: calc(50% - 400px);width: 800px;} 
	h2{width: 800px;  display: block; text-align: center;}
	
	.div-about{
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;
=======
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
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
	color: #e5a880;
<<<<<<< HEAD
	background-repeat:no-repeat;
	background-size:100%;
	}
	
	a{
	text-decoration: none;
	color: black;
	}
=======
	background-repeat: no-repeat;
	background-size: 100%;
}

a {
	text-decoration: none;
	color: black;
}
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
</style>
<<<<<<< HEAD
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
=======
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
<title>공지사항 등록</title>
</head>

<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>N O T I C E</h1>
	</div>
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
<h3 align="center">공지사항 등록</h3> <br>

<<<<<<< HEAD
<h3 align="center">공지사항 등록</h3>
<br>

<form id="noticeWrite"  name="noticeWrite" enctype="multipart/form-data">
=======
<form id="frm" name="frm" enctype="multipart/form-data">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git

<table name="noticeWrite" border="0" cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="15%" />
		<col width="85%" />
	</colgroup>
	
	<tbody>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" size="70">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
<<<<<<< HEAD
				<textarea rows="30" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
=======
				<textarea rows="10" cols="100" title="내용" id="NOTICE_CONTENT"
											name="NOTICE_CONTENT"></textarea>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
			</td>
		</tr>
		 <tr>
			<th>이미지 등록</th>
			<td>
				<input type="file" id="NOTICE_IMG" name="NOTICE_IMG">
			</td>
		</tr>
	</tbody>
</table>

<center>
	<a href="#this" class="btn" id="write">등록하기</a>
	<a href="#this" class="btn" id="list">목록으로</a>
</center>
</form>

<<<<<<< HEAD
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
=======
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
<script>
	$(document).ready(function() {
		$("#list").on("click", function(e) { //'목록으로'를 클릭하면
			e.preventDefault();
			fn_noticeList(); //fn_facList()함수 호출
		});

<<<<<<< HEAD
		function fn_insertNotice(){
				var comSubmit = new ComSubmit("noticeWrite");
				comSubmit.setUrl("<c:url value='/admin/newNotice' />");
				comSubmit.submit();
		}
	
	</script>	
</body>
=======
		$("#write").on("click", function(e) { //'등록하기'를 클릭하면
			e.preventDefault();
			fn_insertNotice();//fn_insertFac()함수 호출
		});

	})

	function fn_noticeList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeList'/>"); //리스트 페이지로 이동
		comSubmit.submit();
	}

	function fn_insertNotice() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/newNotice' />");
		comSubmit.submit();
	}
</script>	

				</body>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
</html>