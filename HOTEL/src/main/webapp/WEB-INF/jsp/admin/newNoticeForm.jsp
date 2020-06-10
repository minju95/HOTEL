<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	
	<meta charset="UTF-8">
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<title>공지사항 등록</title>
</head>

<body>
<form id="frm"  name="frm" enctype="multipart/form-data">
<table name="noticeWrite" class="" border="1" cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="15%"/>
		<col width="85%"/>
	</colgroup>
	<caption>공지사항 등록</caption>
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
				<textarea rows="10" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
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

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
		var img_count = 1; //전역변수 선언(태그가 추가될 때마다 그 값을 1씩 증가시켜 name값이 계속 바뀜)

		$(document).ready(function(){
	  		$("#list").on("click", function(e){ //'목록으로'를 클릭하면
	         	e.preventDefault();
	            fn_noticeList(); //fn_facList()함수 호출
	        });
	        
	  		$("#write").on("click", function(e){ //'등록하기'를 클릭하면
				e.preventDefault();
				fn_insertNotice();//fn_insertFac()함수 호출
			});
			
		}) 
		
	  	function fn_noticeList(){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/noticeList'/>"); //리스트 페이지로 이동
	            comSubmit.submit();
	    }

		function fn_insertNotice(){
			//유효성 검사
			/* if($("#FAC_HOTEL_NAME").val() == "")
				{
				alert("부대시설명을 입력해주세요");
			} else if($("#FAC_HOTEL_LOCATION").val() == "") {
				alert("부대시설 위치를 입력해주세요");
			} else if($("#FAC_HOTEL_TIME").val() == "") {
				alert("운영시간을 입력해주세요");
			} else if($("#FAC_HOTEL_PHONE").val() == "") {
				alert("전화번호를 입력해주세요");
			} else if($("#FAC_HOTEL_FAC").val() == "") {
				alert("시설을 입력해주세요");
			} else if($("#FAC_HOTEL_CONTENT").val() == "") {
				alert("상세내용을 입력해주세요");
			} 
			else { */
				//alert("공지사항이 등록되었습니다.")
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/admin/newNotice' />");
				comSubmit.submit();
				/* } */
		}
	
	</script>	
</body>
</html>