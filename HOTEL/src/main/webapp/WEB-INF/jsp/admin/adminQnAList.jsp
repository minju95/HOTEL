<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>

<style>
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }
</style>

<title>Q&A 목록</title>

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
                <h3 class="card-title">Q&A 현황</h3>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 400px;">
                  </div>
                </div>
     </div>
          	
<div class="card-body table-responsive p-0">
	   <form id="qnaList">
	    <table class="table table-hover" name="qnaList">
	       <thead>
			<tr>
				<th scope="col">번호</th>
                <th scope="col">질문 카테고리</th>
                <th scope="col">회원 ID</th>
                <th scope="col">질문 제목</th>
                <th scope="col">질문일</th>
                <th scope="col">답변상태</th>
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
	    </form>
	   </div>
	</div>
   <!--  row  div  end-->
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
		fn_qnaList(1);
	
	});
	
	
	
	function fn_qnaList(pageNo) { //페이징 함수
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectQnAList' />");
		comAjax.setCallback("fn_adminQnaListCallback"); //ajax요청 후 호출될 함수의 이름 지정
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $(
				"#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
		comAjax.ajax(); //실질적인 ajax기능 수행
		}
	
		function fn_adminQnaListCallback(data) { //콜백함수
			var total = data.TOTAL;
			//alert(total);//총 게시글 개수
			var body = $("table[name='qnaList'] > tbody");
			//alert(body);
			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='6' align='center'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_qnaList",
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
											+ value.QNA_CATE
											+ "</td>"
											+ "<td>"
											+ value.MEM_USERID
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='QNA_TITLE'>"
											+ value.QNA_TITLE
											+ "</a>"
											+ "<input type='hidden' name='QNA_NUM' value=" + value.QNA_NUM + ">"
											+ "</td>" + "<td>"
											+ value.QNA_DATE + "</td>"
											+ "<td>" + value.QNA_RSTATE
											+ "</td>" + "</tr>";
								});
				//이거 넣어야 데이터 들어감
				body.append(str);
				$("a[name='QNA_TITLE']").on("click", function(e) {
					e.preventDefault();
					fn_qnaDetail($(this));
				});
			}
		}

		function fn_qnaDetail(obj) { //회원 ID 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/adminQnADetail' />");
			comSubmit.addParam("QNA_NUM", obj.parent().find("input[name='QNA_NUM']").val());
			comSubmit.submit();
		}
</script>
</html>