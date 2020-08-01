<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
</head>

<title>공지사항 수정</title>
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
                <h3 class="card-title">공지사항 수정</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form  id="frm"  action="<c:url value='/admin/modifyNotice'/>" method="post" name="frm"
              enctype="multipart/form-data">
                <div class="card-body">
               
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="NOTICE_ID" name="NOTICE_ID" value="${map.NOTICE_ID}">
                      <input class="form-control" type="text"  id="NOTICE_TITLE" name="NOTICE_TITLE" value="${map.NOTICE_TITLE}"  placeholder="회원 ID" >
                    </div>
                  </div>
                  
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="10" id="summernote" name="NOTICE_CONTENT">${map.NOTICE_CONTENT}</textarea>
                    </div>
                   </div>
                   
                   
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진</label>
                   
                    <div class="col-sm-10">
                    <c:choose>
                    	<c:when test="${map.NOTICE_IMG != NULL}">
                      <div class="custom-file" >
                      	<input type="hidden" name="orgFile" value="${map.NOTICE_IMG}" id="orgFile">
                      	<!-- 이미지_상대경로 -->
                      	<img src= "/hotel/image/${map.NOTICE_IMG}" style = "width:800px; heigth:600px;">
                      	<br>업로드된 파일명 : ${map.NOTICE_IMG}

		                <input type="button" class="btn btn-block btn-outline-success" onclick="fn_removeImg()"
		                style="width: 120px; height:30px; line-height: 10px; text-align: center;"
		                value="이미지 삭제"><br>
						<div class="custom-file">
	                        <input type="file" class="custom-file-input" id="newFile" name="newFile">
	                        <label class="custom-file-label" for="newFile">Choose file</label>
						</div>
                      </div>
                      </c:when>
					<c:otherwise>
					업로드된 이미지가 없습니다.
					<br>
					**파일 추가를 원하시면 아래 '파일 선택' 버튼을 클릭하여 이미지를 업로드해주세요.<br><br>
						<input type="hidden" name="orgFile" value="${map.NOTICE_IMG}" id="orgFile">
						<div class="custom-file">
	                        <input type="file" class="custom-file-input" id="newFile" name="newFile">
	                        <label class="custom-file-label" for="newFile">Choose file</label>
						</div>
					</c:otherwise>	
						</c:choose>
                   </div>
					</div>

                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공개여부</label>
                    <div class="col-sm-6">
                      <div class="form-check" style="display: inline-block;">
                          <input class="form-check-input" type="radio" name="NOTICE_ISVIEW" id="radio1" value=Y>
                          <label class="form-check-label" for="radio1">공개</label>
                      </div>&nbsp;&nbsp;&nbsp;
                      <div class="form-check" style="display: inline-block;">
                          <input class="form-check-input" type="radio" name="NOTICE_ISVIEW" id="radio2" value=N>
                          <label class="form-check-label" for="radio2">비공개</label>
                      </div>
                    </div>
                  </div>
                  
                  
                  
                  </div>
              </form>
	
	<table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/admin/noticeList"/>'" value="목록으로">
		</td>
		<td><input type="submit" class="btn btn-block btn-outline-primary" onclick="fn_noticeModify()" value="공지 수정">
		</td>
	</tr>
</table>
</div>
</div>
</div>
</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '내용'	//placeholder 설정
          
	});
});
/* 라디오 버튼(동의/미동의) 유효성 체크 */
	 function fn_noticeModify(obj){
			var radio1 = $('input:radio[id=radio1]').is(':checked');
			var radio2 = $('input:radio[id=radio2]').is(':checked');
				if(radio1==false && radio2 == false) {
					alert("공개여부를 설정해주세요.");
					return false;
				} else {
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/admin/modifyNotice' />");
					comSubmit.submit();
				}
	}

	function fn_removeImg() {
		/* var comSubmit = new ComSubmit("removeImg");
		comSubmit.setUrl = ("<c:url value='/admin/removeImg'/>");
		comSubmit.submit(); */
	}
	</script>	

</body>
</html>
