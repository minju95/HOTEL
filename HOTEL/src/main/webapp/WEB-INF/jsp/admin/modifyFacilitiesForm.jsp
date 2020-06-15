<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta charset="UTF-8">
<style>
    #facModify{margin-left: calc(50% - 400px);width: 800px;}
	h2{width: 800px;  display: block; text-align: center;}
	
	#PAGE_NAVI{text-align: center;margin-top:10%}
	
	.div-about{
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;
=======
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
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
	color: #e5a880;
<<<<<<< HEAD
	background-repeat:no-repeat;
	background-size:100%;
	}
=======
	background-repeat: no-repeat;
	background-size: 100%;
}

a {
	text-decoration: none;
	color: black;
}
</style>
<!-- 부트스트랩 
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
	
	a{
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
<<<<<<< HEAD
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center">
   <br>
   <br>
   <br>
   <h1>F A C I L I T I E S </h1>
</div>	
<h3 align="center">부대시설 수정하기</h3>
<br>
	<form id="facModify" name="facModify" enctype="multipart/form-data">
	<table name="facModify" class="table table-striped" style="width: 800px;" >
=======
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>F A C I L I T I E S</h1>
	</div>
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
<h3>부대시설 수정하기</h3>
					<form id="frm" name="frm" enctype="multipart/form-data">
	
	<table name="facModify" align="center" class="table table-striped"
							style="width: 800px;">
		<thead>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
			<tr>
			</tr>
		<tbody>
		 	<tr>
<<<<<<< HEAD
		 		<td scope="row" width="20%">부대시설명</td>
				<td width="80">
					<input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID" value="${map.FAC_HOTEL_ID}">
					<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" size="30" value="${map.FAC_HOTEL_NAME}">
=======
				<td align="center">
					<input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID"
										value="${map.FAC_HOTEL_ID}">
					<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME"
										size="70" value="${map.FAC_HOTEL_NAME}">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
<<<<<<< HEAD
			</tr>
			<tr>
				<td scope="row">위치</td>
				<td>
					<input type="text" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" size="30" value="${map.FAC_HOTEL_LOCATION}"> 
=======
				<td align="center">
					<input type="text" id="FAC_HOTEL_LOCATION"
										name="FAC_HOTEL_LOCATION" size="70"
										value="${map.FAC_HOTEL_NAME}"> 
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
<<<<<<< HEAD
			</tr>
			<tr>
				<td scope="row">운영시간</td>
				<td>
					<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" size="30" value="${map.FAC_HOTEL_TIME}"> 
=======
				<td align="center">
					<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME"
										size="70" value="${map.FAC_HOTEL_TIME}"> 
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
<<<<<<< HEAD
			</tr>
			<tr>
				<td scope="row">전화번호</td>
				<td>
					<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" size="30" value="${map.FAC_HOTEL_PHONE}"> 
=======
				<td align="center">
					<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE"
										size="70" value="${map.FAC_HOTEL_PHONE}"> 
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
				</td>
<<<<<<< HEAD
=======
				<td align="center">
					<input type="text" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC"
										size="70" value="${map.FAC_HOTEL_FAC}"> 
				</td>
				
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
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
<<<<<<< HEAD
						<textarea rows="10" cols="80" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}</textarea>
=======
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_CONTENT"
											name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}</textarea>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
					</td>
			</tr>
			<tr>
				<td>세부사항</td>
					<td colspan="4" class="view_text">
<<<<<<< HEAD
						<textarea rows="10" cols="80" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}</textarea>
=======
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_DETAIL"
											name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}</textarea>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
					</td>
			</tr>
			<tr>
				<td scope="row">이미지</td>
				<td colspan="4">
					<c:forEach var="row" items="${list }" varStatus="var">
					<!-- varStatus: 상태용 변수로 for문이 돌아가는 상태를 알게 해주는 변수 -->
					<p>
						<!-- 숨김 처리 -->
<<<<<<< HEAD
						<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
						<input type="hidden" id="HOTEL_IMGS_ID"  name="HOTEL_IMGS_ID_${var.index}" value="${row.HOTEL_IMGS_ID }">
						
=======
						<input type="hidden" id="FAC_HOTEL_ID" name="IDX_${var.index}"
													value="${row.FAC_HOTEL_ID }">
						<input type="hidden" id="HOTEL_IMGS_ID"
													name="HOTEL_IMGS_ID_${var.index}"
													value="${row.HOTEL_IMGS_ID }">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
						<!-- 파일명 출력  -->
						<a href="#this" id="name_${var.index}" name="name_${var.index}">${row.HOTEL_IMGS_FILE}</a>
<<<<<<< HEAD
						<img src= "/hotel/image/${row.HOTEL_IMGS_FILE}" style = "width:600px; heigth:600px;">
=======
						<img src="/hotel/image/${row.HOTEL_IMGS_FILE}"
													style="width:200px; heigth:120px;">
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git
						
						<!-- 파일 등록 -->
						<input type="file" id="file_${var.index}" name="file_${var.index}">
					</p>
					</c:forEach>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<center>
		<a href="#this" class="btn" id="modify">수정하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>		
	
	<script>
		var img_count = 1;

		$(document).ready(function() {
			$("#modify").on("click", function(e) { //'수정하기' 누르면
				e.preventDefault();
				fn_facModify();
			});
<<<<<<< HEAD
	});   
    
	function fn_facList(pageNo){ //리스트로 이동하는 함수
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
		comSubmit.submit();
		
	}  
	
	function fn_facModify(){
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
		} else if($("#FAC_HOTEL_CONTENT").val() == "") {
			alert("상세내용을 입력해주세요");
		} 
		else {
			alert("부대시설 수정이 완료되었습니다.")
			var comSubmit = new ComSubmit("facModify");
			comSubmit.setUrl("<c:url value='/admin/modifyFacilities' />");
			comSubmit.submit();
		}
	}
</script>
=======

			$("#list").on("click", function(e) { //'목록으로' 누르면
				e.preventDefault();
				fn_facList();
			});
			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
		});

		function fn_facList(pageNo) { //리스트로 이동하는 함수
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/facilitiesList' />");
			comSubmit.submit();

		}

		function fn_facModify() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/modifyFacilities' />");
			comSubmit.submit();
		}
	</script>
>>>>>>> branch 'master' of https://github.com/mikye911/HOTEL.git


				</body>
</html>