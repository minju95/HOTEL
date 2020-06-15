<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">

<title>부대시설 상세보기</title>

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
<div class="div-about" align="center" >
   <br><br><br>
   <h1>F A C I L I T I E S </h1>
</div>
	<%@ include file="/WEB-INF/include/include-admin.jspf"%>
<h3 align="center">부대시설 상세보기</h3>
<br>
	<form id="frm">
	<table name="facDetail" class="table table-striped" align="center" style="width: 1000px;" >
		<thead>
			<tr>
				<th width="20%" scope="row">부대시설명</th>
				<th width="20%" scope="row">위치</th>
				<th width="20%" scope="row">운영시간</th>
				<th width="20%" scope="row">전화번호</th>
				<th width="20%" scope="row">시설</th>
			</tr>
		</thead>
		<tbody>
		 	<tr>
				<td>${map.FAC_HOTEL_NAME}</td>
				<td>${map.FAC_HOTEL_LOCATION}</td>
				<td>${map.FAC_HOTEL_TIME}</td>
				<td>${map.FAC_HOTEL_PHONE}</td>
				<td>${map.FAC_HOTEL_FAC}</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<td colspan="5" height="100" style="padding-left:50px;">
					${fn:replace(map.FAC_HOTEL_CONTENT, cn, br)}
				</td>
			</tr>
			
			<tr>
				<th>세부사항</th>
			</tr>
			<tr>
				<td colspan="5" height="100" style="padding-left:50px;">${fn:replace(map.FAC_HOTEL_DETAIL, cn, br)}
				</td>
			</tr>
			<tr>
			 <th scope="row">이미지</th>
			<td colspan="4">
				<c:forEach var="row" items="${list }">
					<p>
					<input type="hidden" id="FAC_HOTEL_ID" value="${row.FAC_HOTEL_ID }">
						
					<!-- 이미지_상대경로 -->
					<img src= "/hotel/image/${row.HOTEL_IMGS_FILE}"
						style = "width:600px; heigth:600px;">
					<br>
					<!-- 이미지 파일명 -->
					<a href="#this" name="HOTEL_IMGS_FILE">${row.HOTEL_IMGS_FILE }</a>
					</p>
					<!-- 이미지_절대경로 -->
					<%-- <img src= "C:/Users/학생용/git/HOTEL/HOTEL/src/main/webapp/resources/${row.HOTEL_IMGS_FILE}"
						style = "width:200px; heigth:120px;"> --%>
				</c:forEach>

			</td>
			</tr>

		</tbody>
	</table>
	</form>
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a>
		<a href="#this" class="btn" id="delete">삭제하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
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
			$("#delete").on("click", function(e) { //'삭제하기' 누르면
				e.preventDefault();
				fn_facDelete();
			});
		});

		function fn_facList(pageNo) { //리스트로 이동하는 함수
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
			comSubmit.submit();

		}

		function fn_facModifyForm() {
			var FAC_HOTEL_ID = "${map.FAC_HOTEL_ID}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/modifyFacilitiesForm' />");
			comSubmit.addParam("FAC_HOTEL_ID", FAC_HOTEL_ID);
			comSubmit.submit();
		}

		function fn_facDelete() {
			if (confirm("삭제하시겠습니까?") == true) {
				alert("삭제되었습니다.");

				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/admin/deleteFacilities' />");
				comSubmit.addParam("FAC_HOTEL_ID", $("#FAC_HOTEL_ID").val());
				comSubmit.submit();
			} else {
				return;
			}
		}
	</script>


	</body>
</html>