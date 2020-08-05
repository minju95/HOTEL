<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>

<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>

<title>공지사항 목록</title>
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
      <div class="container-fluid">
        
   <div class="row">
     <div class="col-12">
      <div class="card">
    <div class="card-header">
                <h3 class="card-title">공지사항 목록</h3>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 400px;">
                  	<select id="searchOption" size="1">
		                <option id="NOTICE_TITLE" value="NOTICE_TITLE" selected="selected">제목</option>
		        	</select>
                    <input type="text" name="keyword" class="form-control float-right" value="${keyword}" placeholder="검색어 입력"  onkeyup="enterkey();">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
     </div>
      
<div class="card-body table-responsive p-0">
	    <table class="table table-hover" name="noticeList">
	       <thead>
			<tr>
				<th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">공개여부</th>
                <th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	    </table>
	    
	    <div class="card-footer clearfix" >
	    	<ul class="pagination pagination-sm m-0 float-right" id="PAGE_NAVI">
				<li  class="page-item">
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
				</li>
			</ul>
		</div>
		
	   </div>
	</div>
    </div>
</div>
</div>
</div>
</div>    
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

</body>
	<script>
		$(document).ready(function() {
			fn_noticeList(1);
		
		});
		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_noticeList(1);
			}
		}
		function fn_noticeWrite() { //등록 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/newNoticeForm'/>");
			comSubmit.submit();
		}
		function fn_noticeDetail(obj) { //부대시설명 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeDetail' />");
			comSubmit.addParam("NOTICE_ID", obj.parent().find(
					"input[name='title']").val());
			comSubmit.submit();
		}
		function fn_noticeList(pageNo) { //페이징 함수
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectNoticeList' />");
			comAjax.setCallback("fn_noticeListCallback"); //ajax요청 후 호출될 함수의 이름 지정
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $(
					"#searchOption > option:selected").val());
			comAjax.addParam("keyword", $("input[name='keyword']").val());
			comAjax.ajax(); //실질적인 ajax기능 수행
		}
		function fn_noticeListCallback(data) { //콜백함수
			var total = data.TOTAL;
			//alert(total);//총 게시글 개수
			var body = $("table[name='noticeList'] > tbody");
			//alert(body);
			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='4' align='center'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_noticeList",
					recordCount : 10
				};
				gfn_renderPaging(params);
				var str = "";
				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RNUM
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title'>"
											+ value.NOTICE_TITLE
											+ "</a>"
											+ "<input type='hidden' name='title' value=" + value.NOTICE_ID + ">"
											+ "</td>" + "<td>"
											+ value.NOTICE_ISVIEW + "</td>"
											+ "<td>" + value.NOTICE_DATE
											+ "</td>" + "</tr>";
								});
				//이거 넣어야 데이터 들어감
				body.append(str);
				$("a[name='title']").on("click", function(e) {
					e.preventDefault();
					fn_noticeDetail($(this));
				});
			}
		}
	</script>
</html>