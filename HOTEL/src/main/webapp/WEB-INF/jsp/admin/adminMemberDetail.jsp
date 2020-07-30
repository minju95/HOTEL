<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>


<title>회원정보 상세보기</title>
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
                <h3 class="card-title">회원정보 상세</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<div class="card-body">
		
		<div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">회원 번호</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="MEM_ID" name="MEM_ID" value="${map.MEM_ID}" readonly>
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="MEM_USERID" name="MEM_USERID" value="${map.MEM_USERID}"  readonly>
                    </div>
        </div>
          <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원명</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME}" readonly>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 영문명 (이름)</label>
                    <div class="col-sm-10">
                    	<input class="form-control" type="text"  id="MEM_LN_FN" name="MEM_LN_FN" value="${map.MEM_LN_FN}" readonly>
                    </div>
                   </div>
                   
                     
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 영문명 (성)</label>
                    <div class="col-sm-10">
                    	<input class="form-control" type="text"  id="MEM_LN_EN" name="MEM_LN_EN" value="${map.MEM_LN_EN}" readonly>
                    </div>
                   </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 전화번호</label>
                    <div class="col-sm-10">
                       <input class="form-control" type="text"  id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE}" readonly>
                    </div>
                   </div>
                   
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 이메일</label>
                    <div class="col-sm-10">
                       <input class="form-control" type="text"  id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL}" readonly>
                    </div>
                   </div>
                   
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">웹 사이트 가입일</label>
                    <div class="col-sm-10">
                       <input class="form-control" type="text"  id="MEM_JOINDATE" name="MEM_JOINDATE" value="${map.MEM_JOINDATE}" readonly>
                    </div>
                   </div>
               
                  
                 
			</div>
		</form>
		</div>
		
		
		
	<table align="center">
		<tr>
			<td><input type="button" class="btn btn-block btn-outline-primary" onclick="fn_memList() " value="목록으로"/>
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
function fn_memList() { //리스트로 이동하는 함수
	location.href = "<c:url value='/admin/memberList'/>";
}

</script>
</html>


