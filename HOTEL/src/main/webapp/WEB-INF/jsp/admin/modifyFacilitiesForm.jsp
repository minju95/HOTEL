<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
	<meta charset="UTF-8">
<style>
    #facModify{margin-left: calc(50% - 400px);width: 800px;}
	h2{width: 800px;  display: block; text-align: center;}
	
	#PAGE_NAVI{text-align: center;margin-top:10%}
	
	.div-about{
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;
	color: #e5a880;
	background-repeat:no-repeat;
	background-size:100%;
	}
	a {
		text-decoration: none;
		color: black;
	}
</style>
<title>부대시설 수정하기</title>
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
   <br>
   <br>
   <br>
   <h1>F A C I L I T I E S </h1>
</div>	
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
<h3 align="center">부대시설 수정하기</h3>
<br>
	<form id="facModify" name="facModify" enctype="multipart/form-data">
	<table name="facModify" class="table table-striped" style="width: 800px;" >
		<tbody>
		 	<tr>
		 		<td scope="row" width="20%">부대시설명</td>
				<td width="80">
					<input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID" value="${map.FAC_HOTEL_ID}">
					<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" size="30" value="${map.FAC_HOTEL_NAME}">

				</td>
			</tr>
			<tr>
				<td scope="row">위치</td>
				<td>
					<input type="text" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" size="30" value="${map.FAC_HOTEL_LOCATION}"> 

				</td>
			</tr>
			<tr>
				<td scope="row">운영시간</td>
				<td>
					<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" size="30" value="${map.FAC_HOTEL_TIME}"> 

				</td>
			</tr>
			<tr>
				<td scope="row">전화번호</td>
				<td>
					<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" size="30" value="${map.FAC_HOTEL_PHONE}"> 

				</td>

			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>시설</td>
				<td>
					<textarea rows="5" cols="80" title="내용" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC">${map.FAC_HOTEL_FAC}</textarea>
				</td>
			</tr>
		 	<tr>
		 		<td>내용</td>
					<td colspan="4" class="view_text">
						<textarea rows="5" cols="80" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}</textarea>
					</td>
			</tr>
			<tr>
				<td>세부사항</td>
					<td colspan="4" class="view_text">
						<textarea rows="5" cols="80" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}</textarea>
					</td>
			</tr>
			<tr>
				<td scope="row">이미지</td>
				<td colspan="4">
					<c:forEach var="row" items="${list }" varStatus="var">
					<!-- varStatus: 상태용 변수로 for문이 돌아가는 상태를 알게 해주는 변수 -->
					<p>
						<!-- 숨김 처리 -->
						<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
						<input type="hidden" id="HOTEL_IMGS_ID"  name="HOTEL_IMGS_ID_${var.index}" value="${row.HOTEL_IMGS_ID }">
						<input type="hidden" id="OLD_FILE_NAME" name="OLD_FILE_NAME_${var.index}" value="${row.ROOM_IMGS_FILE}">
						
						<!-- 이미지 출력 -->
						<img src= "/hotel/image/${row.HOTEL_IMGS_FILE}" style = "width:600px; heigth:600px;">
						<input type="file" id="file_${var.index}" name="file_${var.index}">
						
						<!-- 파일명 출력  -->
						
						<a href="#this" id="name_${var.index}" name="name_${var.index}">${row.HOTEL_IMGS_FILE}</a>
					</p>
					</c:forEach>
					<div id="fileDiv">
						<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a>
		<a href="#this" class="btn" id="addFile">이미지 추가</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	</form>
	<br>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>		
	
	<script>
		var img_count = 1;
		
		$(document).ready(function() {
			$("#modify").on("click", function(e) { //'수정하기' 누르면
				e.preventDefault();
				fn_facModify();
			});
			$("#addFile").on("click", function(e) { //파일추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			$("#list").on("click", function(e) { //'목록으로'를 클릭하면
				e.preventDefault();
				fn_facList(); //fn_facList()함수 호출
			});
	});   
   
	function fn_facList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
		comSubmit.submit();
		
	}  
	
	function fn_facModify(){
		//유효성 검사
		if($("#FAC_HOTEL_NAME").val() == "") {
			alert("부대시설명을 입력해주세요");
		} else if($("#FAC_HOTEL_LOCATION").val() == "") {
			alert("부대시설 위치를 입력해주세요");
		} else if($("#FAC_HOTEL_TIME").val() == "") {
			alert("운영시간을 입력해주세요");
		} else if($("#FAC_HOTEL_PHONE").val() == "") {
			alert("전화번호를 입력해주세요");
		} else if($("#FAC_HOTEL_CONTENT").val() == "") {
			alert("상세내용을 입력해주세요");
		} 
		else {
			alert("부대시설 수정이 완료되었습니다.");
			var comSubmit = new ComSubmit("facModify");
			comSubmit.setUrl("<c:url value='/admin/modifyFacilities' />");
			comSubmit.submit();
		}
	}

	function fn_addFile() {
		//alert(img_count); //1 -> 3
		while (img_count <= 2) { //이미지 개수 제한

			var str = "<tr><td><input type='file' name='HOTEL_IMGS_FILE_"
					+ (img_count) + "'></td></tr>";
			img_count++; //숫자올리고
			//alert(img_count); //2
		}
		$("#fileDiv").append(str);
	}

	function fn_facList(pageNo) { //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
		comSubmit.submit();

	}
</script>
<%@ include file="/WEB-INF/include/include-footer.jsp"%>

</body>
</html>