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
	<title>부대시설 등록</title>
</head>

<body>
<form id="frm" enctype="multipart/form-data">
<table name="facWrite" class="" border="1" cellspacing="0" cellpadding="0">
	<colgroup>
		<col width="15%"/>
		<col width="85%"/>
	</colgroup>
	<caption>부대시설 등록</caption>
	<tbody>
		<tr>
		
			<th>부대시설명</th>
			<input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID" value="${FAC_HOTEL_ID}">
			<td>
				<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" size="70">
			</td>
		</tr>
		<tr>
			<th>위치</th>
			<td>
				<input type="text" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" size="70">
			</td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td>
				<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" size="70">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" size="70">
			</td>
		</tr>
		<tr>
			<th>시설</th>
			<td>
				<textarea rows="5" cols="100" title="내용" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC"></textarea>
			</td>
		</tr>
		<tr>
			<th>상세내용1</th>
			<td>
				<textarea rows="10" cols="100" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT"></textarea>
			</td>
		</tr>
		<tr>
			<th>상세내용2</th>
			<td>
				<textarea rows="10" cols="100" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL"></textarea>
			</td>
		</tr>
		<!-- <tr>
			한개의 파일만 업로드 가능 
			<th>파일1</th>
			<td>
				<input type="file" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE">
			</td>
		</tr>
		<tr>
			<th>파일2</th>
			<td>
				<input type="file" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE">
			</td>
		</tr>
		<tr>
			여러개의 파일 업로드 가능 
			<th>파일3(여러개의 파일을 한꺼번에 올리기)</th>
			<td>
				<input multiple="multiple" type="file" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE">
			</td>
		</tr> -->
		
	</tbody>
	
</table>

<center><a href="#this" class="btn" id="write">등록하기</a></center>
</form>

	<center><a href="#this" class="btn" id="list">목록으로</a></center>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
		$("#write").on("click", function(e){ //'등록하기'를 클릭하면
				e.preventDefault();
				fn_insertFac();//fn_insertFac()함수 호출
		}); 

		$(document).ready(function(){
	  		$("#list").on("click", function(e){ //'목록으로'를 클릭하면
	         	e.preventDefault();
	            fn_facList(); //fn_facList()함수 호출
	        });
		}) 
		
	  	function fn_facList(){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/facilitiesList'/>"); //리스트 페이지로 이동
	            comSubmit.submit();
	    }

		function fn_insertFac(){
			//유효성 검사
			if($("#FAC_HOTEL_NAME").val() == "")
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
			else {
				alert("새 부대시설이 등록되었습니다.")
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/admin/newFacilities' />");
				comSubmit.submit();
				}
		}
	</script>	
</body>
</html>