<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta charset="UTF-8">
	<title>부대시설 수정하기</title>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<h3>부대시설 수정하기</h3>
	<form id="frm" name="frm" enctype="multipart/form-data">
	
	<table name="facModify" class="table table-striped" align="center" width="800">
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
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}
						</textarea>
					</td>
			</tr>
			<tr>

					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}
						</textarea>
					</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="4">
					<c:forEach var="row" items="${list }" varStatus="var">
					<p>
						<input type="hidden" id="FAC_HOTEL_ID"  name="${row.FAC_HOTEL_ID }" value="${row.FAC_HOTEL_ID }">
						<a href="#this" id="FAC_HOTEL_ID" name="HOTEL_IMGS_FILE">${row.HOTEL_IMGS_FILE }</a>
						<input type="file" id="" name=""><a></a>
					</p>
					
					<p>
			 			<input type="hidden" id="IDX" name="IDX_${var.index}" value="${row.IDX }">
						<a href="#this" id="name_${var.index}" name="name_${var.index }">${row.ORIGINAL_FILE_NAME}</a>
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
		<a href="#this" class="btn" id="delete">삭제하기</a>
	</center>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>		
	
	<script>
	$(document).ready(function(){
		$("#list").on("click", function(e){  //'목록으로' 누르면
			e.preventDefault();
			fn_facList();
		});

		$("#modify").on("click", function(e){ //'수정하기' 누르면
			e.preventDefault();
			fn_facModify();
		});
		$("#delete").on("click", function(e){ //'삭제하기' 누르면
			e.preventDefault();
			fn_facDelete();
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
		alert(comSubmit);
	}
	 
	function fn_facDelete(){
		if(confirm("삭제하시겠습니까?") == true){
			alert("삭제되었습니다.");
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/admin/deleteFacilities' />");
		comSubmit.addParam("FAC_HOTEL_ID", $("#FAC_HOTEL_ID").val());
		comSubmit.submit();
		}else{
			return;
		}
	}
	</script>

</body>
</html>