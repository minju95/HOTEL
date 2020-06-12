<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta charset="UTF-8">
	
	<style>
    #notice{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
	h2{width: 800px;  display: block; text-align: center;}
	
	#PAGE_NAVI{text-align: center;margin-top:10%}
	
	.div-about{
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;
	color: #e5a880;
	background-repeat:no-repeat;
	background-size:100%;
	}
a{
text-decoration: none;
color: black;
}
</style>
<!-- 부트스트랩 
	
	<title>부대시설 수정하기</title>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>F A C I L I T I E S </h1>
</div>	
<h3>부대시설 수정하기</h3>
	<form id="frm" name="frm" enctype="multipart/form-data">
	
	<table name="facModify" align="center"   class="table table-striped"  style="width: 800px;" >
		<thead>
			<tr>
				<th scope="row">부대시설명</th>
				<th scope="row">위치</th>
				<th scope="row">운영시간</th>
				<th scope="row">전화번호</th>
				<th scope="row">시설</th>
			</tr>
		</thead>
		<tbody>
		
		 	<tr>
				<td align="center">
					<input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID" value="${map.FAC_HOTEL_ID}">
					<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" size="70" value="${map.FAC_HOTEL_NAME}">
				</td>
				<td align="center">
					<input type="text" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" size="70" value="${map.FAC_HOTEL_NAME}"> 
				</td>
				<td align="center">
					<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" size="70" value="${map.FAC_HOTEL_TIME}"> 
				</td>
				<td align="center">
					<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" size="70" value="${map.FAC_HOTEL_PHONE}"> 
				</td>
				<td align="center">
					<input type="text" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC" size="70" value="${map.FAC_HOTEL_FAC}"> 
				</td>
				
			</tr>
		</tbody>
		<tbody>
		 	<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}</textarea>
					</td>
			</tr>
			<tr>

					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}</textarea>
					</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="4">
					<c:forEach var="row" items="${list }" varStatus="var">
					<!-- varStatus: 상태용 변수로 for문이 돌아가는 상태를 알게 해주는 변수 -->
					<p>
						<!-- 숨김 처리 -->
						<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
						<input type="hidden" id="HOTEL_IMGS_ID"  name="HOTEL_IMGS_ID_${var.index}" value="${row.HOTEL_IMGS_ID }">
						<!-- 파일명 출력  -->
						<a href="#this" id="name_${var.index}" name="name_${var.index}">${row.HOTEL_IMGS_FILE}</a>
						<img src= "/hotel/image/${row.HOTEL_IMGS_FILE}" style = "width:200px; heigth:120px;">
						
						<!-- 파일 등록 -->
						<input type="file" id="file_${var.index}" name="file_${var.index}">
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
	var img_count = 1;
	
	$(document).ready(function(){
		$("#modify").on("click", function(e){ //'수정하기' 누르면
			e.preventDefault();
			fn_facModify();
		});
		
		$("#list").on("click", function(e){  //'목록으로' 누르면
			e.preventDefault();
			fn_facList();
		});
		$("#addFile").on("click", function(e){ //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
			});
	});   
    
	function fn_facList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
		comSubmit.submit();
		
	}  
	
	function fn_facModify(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/modifyFacilities' />");
		comSubmit.submit();
	}
	 
	


	</script>

</body>
</html>