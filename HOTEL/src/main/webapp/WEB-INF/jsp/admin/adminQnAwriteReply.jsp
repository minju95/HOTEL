<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
</head>
<script type="text/javascript">
function fsubmit(){
	var QNA_RTITLE = document.getElementById("QNA_RTITLE").value;
	var QNA_RCONTENT =document.getElementById("QNA_RCONTENT").value;
	if(QNA_RTITLE==null || QNA_RTITLE==''){
		alert("답변 제목을 입력하세요.");
		return false;
	}
	if(QNA_RCONTENT==null || QNA_RCONTENT==''){
		alert("답변 내용을 입력하세요.");
		return false;
	}
	if(confirm("수정 하시겠습니까?") == true){  
		frm2.submit();
	 }else{   //취소
	     return false;
	 }
}
</script>
<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/WEB-INF/include/navbar.jsp" %>
  
  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/include/sidebar.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="card card-info">
  	<div class="card-header">
    	<h3 class="card-title">QnA 상세</h3>
    </div>
  <!-- /.card-header -->
  
  <!-- form start -->
  <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminQnAReply'/>" method="post">
  <div class="card-body">
  	<div class="form-group row">
    	<label for="inputEmail3" class="col-sm-2 col-form-label">상담 카테고리</label>
         <div class="col-sm-10">
         <input class="form-control" type="text"  id="QNA_CATE" name="QNA_CATE" value="${map.QNA_CATE}" placeholder="QnA번호" disabled>
         </div>
    </div>
    <div class="form-group row">
    	<label for="inputEmail3" class="col-sm-2 col-form-label">회원명</label>
        <div class="col-sm-10">
        <input class="form-control" type="text"  id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME}" placeholder="회원 ID" disabled>
        </div>
    </div>
	<div class="form-group row">
    	<label for="inputEmail3" class="col-sm-2 col-form-label">질문일</label>
        <div class="col-sm-10">
        <input class="form-control" type="text"  id="QNA_DATE" name="QNA_DATE" value="${map.QNA_DATE}" placeholder="질문 날짜" disabled>
     	</div>
    </div>
    <div class="form-group row">
        <label for="inputEmail3" class="col-sm-2 col-form-label">문의 제목</label>
        <div class="col-sm-10">
        	<input class="form-control" type="text"  id="QNA_TITLE" name="QNA_TITLE" value="${map.QNA_TITLE}" placeholder="질문 날짜" disabled>
        </div>
    </div>
    <div class="form-group row">
         <label for="inputEmail3" class="col-sm-2 col-form-label">문의 내용</label>
         <div class="col-sm-10">
         	<textarea class="form-control" rows="10" id="QNA_CONTENT" name="QNA_CONTENT" disabled>${map.QNA_CONTENT}</textarea>
         </div>
    </div>
	</div>
    <!-- /.card-body -->
    <!-- /.card-footer -->
    </form>
    </div>
    
    <c:choose>
    	<c:when test="${map.QNA_RSTATE =='Y'}">
        <div class="card card-success">
        <div class="card-header">
        	<h3 class="card-title">관리자 답변내용</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form class="form-horizontal" id="frm2" name="frm2" action="<c:url value='/admin/adminQnAwriteReply'/>" method="post">
        	<div class="card-body">
            <div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                <div class="col-sm-10">
                	<input class="form-control" type="text"  id="QNA_RTITLE" name="QNA_RTITLE" value="${map.QNA_RTITLE}" placeholder="답변 제목">
                	<input type="hidden" name="QNA_NUM" value="${map.QNA_NUM}">
                </div>
            </div>
            <div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
                <textarea class="form-control" id="QNA_RCONTENT" name="QNA_RCONTENT" rows="10" placeholder="답변 내용">${map.QNA_RCONTENT}</textarea>
            </div>	
            </div>
            <!-- /.card-body -->
            <!-- /.card-footer -->
         </form>
         </div> 
         </c:when>
     <c:otherwise>
     	<div class="card card-success">
        <div class="card-header">
        	<h3 class="card-title">관리자 답변내용</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form class="form-horizontal" id="frm2" name="frm2" action="<c:url value='/admin/adminQnAwriteReply'/>" method="post">
        	<div class="card-body">
            <div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                <div class="col-sm-10">
                	<input class="form-control" type="text"  id="QNA_RTITLE" name="QNA_RTITLE"  placeholder="답변 제목">
                    <input type="hidden" name="QNA_NUM" value="${map.QNA_NUM}">
                </div>
            </div>
            <div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
            	<div class="col-sm-10">
                	<textarea class="form-control" id="QNA_RCONTENT" name="QNA_RCONTENT" rows="10" placeholder="답변 내용"></textarea>
            	</div>
            </div>	
            </div>
            <!-- /.card-body -->
	        </form>
         </div> 
                	
       </c:otherwise>
       </c:choose>
   
    <table align="center">
	<tr>
		<td>
			<input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/admin/adminQnAList"/>'" value="목록으로">
		</td>
		<td>
			<button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">
    		<c:choose>
    			<c:when test="${map.QNA_RSTATE =='Y'}">
    			수정하기    		
    			</c:when>
        		<c:otherwise>
       		 	답변 달기
        		</c:otherwise>
    		</c:choose>
    		</button>
		</td>
	</tr>
</table>
</div>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>
</body>
</html>