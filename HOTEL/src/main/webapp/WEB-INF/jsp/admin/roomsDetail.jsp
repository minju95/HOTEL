<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>  --%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
	<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/include/mata.jsp" %>
<title>Rooms Detail</title>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<!-- Site wrapper -->
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
    	<h3 class="card-title">Room Detail</h3>
    </div>
<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
	<div class="card-body">

		<div class="form-group row">
        	<label for="ITEM_NUM" class="col-sm-2 col-form-label">Room Type</label>
    		<div class="col-sm-10">
            	<input type="text" class="form-control" id="ROOM_TYPE" name="ROOM_TYPE" value="${map.ROOM_TYPE}" readonly>
            </div>
        </div>
		
		<div class="form-group row">
        	<label for="ITEM_NUM" class="col-sm-2 col-form-label">Room Name</label>
            <div class="col-sm-10">
            	<input type="text" class="form-control" id="ROOM_NAME" name="ROOM_NAME" value="${map.ROOM_NAME}" readonly>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="ITEM_NAME" class="col-sm-2 col-form-label">Room Number</label>
            <div class="col-sm-10">
            	<input type="text" class="form-control" id="ROOM_ID" name="ROOM_ID" value="${map.ROOM_ID}"  readonly>
        	</div>
        </div>
         
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Capacity</label>
            <div class="col-sm-10">
            	<input class="form-control" type="text"  id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" value="${map.FAC_HOTEL_PHONE}" readonly>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Room Size</label>
            <div class="col-sm-10">
            	<input class="form-control" type="text"  id="ROOM_SIZE" name="ROOM_SIZE" value="${map.ROOM_SIZE}" readonly>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Bed Type</label>
            <div class="col-sm-10">
            	<input class="form-control" type="text"  id="ROOM_BEDTYPE" name="ROOM_BEDTYPE" value="${map.ROOM_BEDTYPE}" readonly>
            </div>
        </div>
         
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Rate per Night</label>
            <div class="col-sm-10">
            	<input class="form-control" type="text"  id="ROOM_PRICE" name="ROOM_PRICE" value="${map.ROOM_PRICE}" readonly>
            </div>
        </div>    
                   
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Room Description</label>
        	<div class="col-sm-10">
        		<textarea class="form-control" rows="5" id="ROOM_CONTENT" name="ROOM_CONTENT" readonly>${map.ROOM_CONTENT}</textarea>
        	</div>
        </div>
                  
                     
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">General Amenities</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="5" id="ROOM_AMTY1" name="ROOM_AMTY1"  readonly>${map.ROOM_AMTY1}</textarea>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Bathroom Amenities</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="5" id="ROOM_AMTY2" name="ROOM_AMTY2"  readonly>${map.ROOM_AMTY2}</textarea>
            </div>
        </div>
        
        <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Other Amenities</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="5" id="ROOM_AMTY3" name="ROOM_AMTY3"  readonly>${map.ROOM_AMTY3}</textarea>
            </div>
        </div>
        
         <div class="form-group row">
        	<label for="inputEmail3" class="col-sm-2 col-form-label">Special Features</label>
            <div class="col-sm-10">
            	<textarea class="form-control" rows="5" id="ROOM_SERVICE" name="ROOM_SERVICE"  readonly>${map.ROOM_SERVICE}</textarea>
            </div>
        </div>
                  
        <div class="form-group row">
       		<label for="inputEmail3" class="col-sm-2 col-form-label">사진</label>
			<div class="col-sm-10">
            <c:forEach var="row" items="${list}">
				<div class="custom-file" >
                <input type="hidden" id="ROOM_ID" value="${row.ROOM_ID }">
                <!-- 이미지_상대경로 -->
                <img src= "/hotel/image/rooms/${row.ROOM_IMGS_FILE}" style = "width:800px; heigth:600px;">
                <br>
				<!-- 이미지 파일명 -->
				<a href="#this" name="ROOM_IMGS_FILE">${row.ROOM_IMGS_FILE }</a>
                </div>
            </c:forEach>
            </div>
         </div>
			</div>
		</form>
		</div>
		
	<table align="center">
		<tr>
			<td>
				<input type="button" class="btn btn-block btn-outline-success" onclick="fn_facModifyForm()" value="Modify">
			</td>
			<td>
				<input type="button" class="btn btn-block btn-outline-danger" onclick="fn_facDelete()" value="Delete">
			</td>
			<td>
				<input type="button" class="btn btn-block btn-outline-primary" onclick="fn_facList() " value="List"/>
			</td>
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
function fn_facList() { //리스트로 이동하는 함수
	location.href = "<c:url value='/admin/facilitiesList'/>";
}

function fn_facModifyForm() {
	 location.href='<c:url value="/admin/modifyFacilitiesForm?FAC_HOTEL_ID=${map.FAC_HOTEL_ID}"/>'
}

 function fn_facDelete() {
	if (confirm("삭제하시겠습니까?") == true) {
		location.href='<c:url value="/admin/deleteFacilities?FAC_HOTEL_ID=${map.FAC_HOTEL_ID}"/>'
		alert("삭제되었습니다.");
	} else {
		return false;
	}
 }
</script>
</html>


