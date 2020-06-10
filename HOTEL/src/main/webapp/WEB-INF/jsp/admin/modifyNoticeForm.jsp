<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta charset="UTF-8">
	
	<title>공지사항 수정폼</title>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<h3>공지사항 수정</h3>
	<form id="frm"  name="frm" enctype="multipart/form-data">

	<table name="noticeModify" class="table table-striped" align="center" width="800">
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td align="center">
					<input type="hidden" id="NOTICE_ID" name="NOTICE_ID" value="${map.NOTICE_ID}">
					<input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" size="70" value="${map.NOTICE_TITLE}">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="center">
					<input type="text" id="NOTICE_CONTENT" name="NOTICE_CONTENT" size="70" value="${map.NOTICE_CONTENT}">
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
					<input type="file" name="newFile" id="newFile">
					<p>업로드된 파일 : ${map.NOTICE_IMG}</p>
					<input type="hidden" name="orgFile" value="${map.NOTICE_IMG}" id="orgFile">
				</td>
			</tr>
			<tr>
				<th>공개여부</th>
				<td align="center">
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW" size="70" value=Y> 공개&nbsp;
					<input type="radio" id="NOTICE_ISVIEW" name="NOTICE_ISVIEW" size="70" value=N> 비공개
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
		$("#list").on("click", function(e){  //'목록으로' 누르면
			e.preventDefault();
			fn_noticeList();
		});

		$("#modify").on("click", function(e){ //'수정하기' 누르면
			e.preventDefault();
			fn_noticeModify();
		});
	});   
    
	function fn_noticeList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/noticeList' />");
		comSubmit.submit();
		
	}  
	
	function fn_noticeModify(obj){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/modifyNotice' />");
		comSubmit.submit();
	}
	 
	
	</script>
	

</body>
</html>