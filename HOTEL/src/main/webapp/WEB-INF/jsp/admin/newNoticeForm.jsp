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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<title>공지사항 등록</title>
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
                <h3 class="card-title">공지사항 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="frm" class="form-horizontal" name="frm" action="<c:url value='/adminNoticeWrite'/>" method="post" enctype="multipart/form-data">
                <div class="card-body">
                
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NOTICE_TITLE" name="NOTICE_TITLE" placeholder="제목">
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10">
                       <!-- <textarea class="form-control" rows="10" id="NOTICE_CONTENT" name="NOTICE_CONTENT"
                        placeholder="내용" ></textarea> -->
                        <textarea id="summernote" class="form-control" name="NOTICE_CONTENT" placeholder="내용" ></textarea>
                    </div>
                   </div>
                 
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이미지</label>
                    
                    <div class="col-sm-10">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="NOTICE_IMG" name="NOTICE_IMG">
                        <label class="custom-file-label" for="NOTICE_IMG">Choose file</label>
                      </div>
                    </div>
         			</div>

                  
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
</div>
		
		
	<table align="center">
	<tr>
		<td>
			<input type="button" class="btn btn-block btn-outline-success" id="write" value="등록하기">
		</td>
		<td>
			<input type="button" class="btn btn-block btn-outline-primary" id="list" value="목록으로" >
		</td>
	</tr>
	</table>


</div>
</div>    
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>
</body>

<script>
	var img_count = 1; //전역변수 선언(태그가 추가될 때마다 그 값을 1씩 증가시켜 name값이 계속 바뀜)
	
	$(document).ready(function() { //페이지 실행시 자동으로 동작하는 함수
		$("#list").on("click", function(e) { //'목록으로'를 클릭하면
			e.preventDefault();
			fn_noticeList(); //fn_facList()함수 호출
		});
		
		$("#write").on("click", function(e) { //'등록하기'를 클릭하면
			e.preventDefault();
			fn_insertNotice();//fn_insertFac()함수 호출
		});
		
		$('#summernote').summernote({
			height: 300, // 에디터 높이
			minHeight: null, // 최소 높이
			maxHeight: null, // 최대 높이
			focus: true, // 에디터 로딩후 포커스를 맞출지 여부
			lang: 'ko-KR', // 한글 설정
			placeholder: '내용'	//placeholder 설정
		});
		$('.dropdown-toggle').dropdown()

				
		
	});

	function fn_insertNotice() { //유효성 검사
		if($("#NOTICE_TITLE").val() == "") {
			alert("제목을 입력해주세요");
		} else if($("#NOTICE_CONTENT").val() == "") {
			alert("내용을 입력해주세요");
		} else {
			alert("공지사항이 등록되었습니다.")
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/newNotice' />");
			comSubmit.submit();
		}
	}

	function fn_noticeList() {
		location.href = "<c:url value='/admin/noticeList'/>";
	}
</script>	

</body>
</html>
