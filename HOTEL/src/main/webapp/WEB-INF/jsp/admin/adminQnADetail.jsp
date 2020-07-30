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
<!-- 테이블 색상 여기서 정할 것 --> 
<div class="card card-secondary">
              <div class="card-header" >
                <h3 class="card-title">상담 상세</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm" method="post">
		<div class="card-body">
		
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">상담 카테고리</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="QNA_CATE" name="QNA_CATE" value="${map.QNA_CATE}"  readonly>
                    </div>
        </div>
        <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원명</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME}" readonly>
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">질문일</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="QNA_DATE" name="QNA_DATE" value="${map.QNA_DATE}" readonly>
                    </div>
        </div>
        <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">문의 제목</label>
                    <div class="col-sm-10">
                       <input class="form-control" type="text"  id="QNA_TITLE" name="QNA_TITLE" value="${map.QNA_TITLE}" readonly>
                    </div>
        </div>
        <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">문의 내용</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="10" id="QNA_TITLE" name="QNA_TITLE"  readonly>${map.QNA_TITLE}</textarea>
                    </div>
        </div>
			</div>
		</form>
</div>
<c:choose>
	<c:when test ="${map.QNA_RSTATE =='Y'}">
    <div class="card card-success">
    	<div class="card-header">
        	<h3 class="card-title">답변내용</h3>
        </div>
        <!-- /.card-header -->
             
    <!-- form start -->
    <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
    	<div class="card-body">
        	<div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                <div class="col-sm-10">
                	<input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.QNA_RTITLE}" placeholder="QnA번호" disabled>
                </div>
             </div>
                  
             <div class="form-group row">
              	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 날짜</label>
                <div class="col-sm-10">
                 	<input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.QNA_RDATE}" placeholder="질문자 이름" disabled>
                </div>
             </div>
             <div class="form-group row">
             	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
             	<div class="col-sm-10">
                	<textarea class="form-control" rows="10" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.QNA_RCONTENT}</textarea>
                </div>
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
        	<h3 class="card-title">답변</h3>
        </div>
        <!-- /.card-header -->
    <!-- form start -->
    <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
    	<div class="card-body">
        	<div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">답변 미등록</label>
             </div>
        </div>
    </form>
    </div>
	</c:otherwise>
</c:choose>
	<table align="center">
		<tr>
			<td>
				<input type="button" class="btn btn-block btn-outline-primary" onclick="fn_memList() " value="목록으로"/>
			</td>
			<c:choose>
    			<c:when test="${map.QNA_RSTATE =='Y'}">
    		<td>
    			<input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminQnAReply?QNA_NUM=${map.QNA_NUM}"/>'" value="답변 수정">
    		</td>
    		<td>
    			<input type="button" class="btn btn-block btn-outline-danger" onclick="delete2()" value="답변 삭제">
    			</td>
    		</c:when>
        	<c:otherwise>
       		<td>
       			<input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/admin/adminQnAReplyForm?QNA_NUM=${map.QNA_NUM}"/>'" value="답변 달기">
       		</td>
        	</c:otherwise>
    		</c:choose>
		</tr>
	</table>

	</div>
	 </div>
</body>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

<script>
function fn_memList() { //리스트로 이동하는 함수
	location.href = "<c:url value='/admin/adminQnAList'/>";
}

</script>
</html>


