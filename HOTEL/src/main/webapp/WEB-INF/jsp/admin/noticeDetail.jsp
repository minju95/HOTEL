<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>

<title>부대시설 상세화면</title>
<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/WEB-INF/include/navbar.jsp" %>
  
  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/include/sidebar.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
  
<div class="card card-info">
	<div class="card-header">
    	<h3 class="card-title">공지사항 상세</h3>
    </div>
	
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="NOTICE_ID" name="NOTICE_ID" value="${map.NOTICE_ID }">
		
		<div class="card-body">
		<div class="form-group row">
        	<label for="ITEM_NUM" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
            	<input type="text" class="form-control" id="map.NOTICE_TITLE" name="map.NOTICE_TITLE" value="${map.NOTICE_TITLE}" readonly>
            </div>
        </div>
        <div class="form-group row">
        	<label for="ITEM_NAME" class="col-sm-2 col-form-label">작성일</label>
            <div class="col-sm-10">
            	<input type="text" class="form-control" id="map.NOTICE_DATE" name="map.NOTICE_DATE" value="${map.NOTICE_DATE}"  readonly>
            </div>
        </div>
        
         <div class="form-group row">
         	<label for="ITEM_NAME" class="col-sm-2 col-form-label">공개여부</label>
           	<div class="col-sm-10">
            	<input type="text" class="form-control" id="map.NOTICE_ISVIEW" name="map.NOTICE_ISVIEW" value="${map.NOTICE_ISVIEW}"  readonly>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
        	<!-- Ref: textarea로 태그 지정시, 태그 적용이 안된 채로 데이터 출력 -->
        	<div class="col-sm-10" style="border: 1px solid black; padding: 5px;">${map.NOTICE_CONTENT}</div>
        </div>
                  
                  
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">사진</label>
                   
            <div class="col-sm-10">
            <c:choose>
	            <c:when test="${map.NOTICE_IMG != NULL}">
	            <div class="custom-file" >
	            <input type="hidden" id="OLD_FILE_NAME" name="OLD_FILE_NAME_${var.index}" value="${row.ROOM_IMGS_FILE}">
	            <!-- 이미지_상대경로 -->
	            <img src= "/hotel/image/${map.NOTICE_IMG}" style = "width:800px; heigth:600px;">
	            <br>${map.NOTICE_IMG}
	            </div>
	            </c:when>
				<c:otherwise>
				업로드된 이미지가 없습니다.
				</c:otherwise>	
			</c:choose>
            </div>
			</div>
			</div>
	</form>
</div>
		
	<table align="center">
		<tr>
			<td><input type="button" class="btn btn-block btn-outline-success" onclick="fn_noticeModifyForm()" value="수정하기"></td>
			<td><input type="button" class="btn btn-block btn-outline-danger" onclick="fn_noticeDelete()" value="삭제하기"></td>
			<td><input type="button" class="btn btn-block btn-outline-primary" onclick="fn_noticeList() " value="목록으로"/></td>
		</tr>
	</table>
</div>
</div>
</div>
</body>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

<script>
function fn_noticeList() { //리스트로 이동하는 함수
	location.href = "<c:url value='/admin/noticeList'/>";
}

function fn_noticeModifyForm() {
	 location.href='<c:url value="/admin/modifyNoticeForm?NOTICE_ID=${map.NOTICE_ID}"/>';
}

function fn_noticeDelete() {
	if (confirm("삭제하시겠습니까?") == true) {
		location.href='<c:url value="/admin/deleteNotice?NOTICE_ID=${map.NOTICE_ID}"/>'
		alert("삭제되었습니다.");
	} else {
		return false;
	}
}
</script>
</html>