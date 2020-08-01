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
<title>부대시설 상세보기</title>
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
                <h3 class="card-title">부대시설 상세</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<div class="card-body">
		
		<div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">부대시설 타입</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="FAC_HOTEL_TYPE" name="FAC_HOTEL_TYPE" value="${map.FAC_HOTEL_TYPE}" readonly>
                    </div>
        </div>
		
		<div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">부대시설명</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" value="${map.FAC_HOTEL_NAME}" readonly>
                    </div>
        </div>
        
        
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">위치</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" value="${map.FAC_HOTEL_LOCATION}"  readonly>
                    </div>
        </div>
          <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" value="${map.FAC_HOTEL_PHONE}" readonly>
                    </div>
                  </div>
                  
                   
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">시설정보</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="5" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT" readonly>${map.FAC_HOTEL_CONTENT}</textarea>
                    </div>
                  </div>
                  
                     
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">세부사항</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="5" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL"  readonly>${map.FAC_HOTEL_DETAIL}</textarea>
                    </div>
                  </div>
                  
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진</label>
                   
                    <div class="col-sm-10">
                      <c:forEach var="row" items="${list}">
                    
                      <div class="custom-file" >
                      	<input type="hidden" id="FAC_HOTEL_ID" value="${row.FAC_HOTEL_ID }">
                      	<!-- 이미지_상대경로 -->
                      	<img src= "/hotel/image/facilities/${row.HOTEL_IMGS_FILE}" style = "width:800px; heigth:600px;">
                      	<br>
						<!-- 이미지 파일명 -->
						<a href="#this" name="HOTEL_IMGS_FILE">${row.HOTEL_IMGS_FILE }</a>
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
				<input type="button" class="btn btn-block btn-outline-success" onclick="fn_facModifyForm()" value="수정하기">
			</td>
			<td>
				<input type="button" class="btn btn-block btn-outline-danger" onclick="fn_facDelete()" value="삭제하기">
			</td>
			<td>
				<input type="button" class="btn btn-block btn-outline-primary" onclick="fn_facList() " value="목록으로"/>
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


