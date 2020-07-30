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
</style>
<title>부대시설 리스트</title>
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
                <h3 class="card-title">예약자 목록</h3>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 400px;">
                  	<select id="searchOption" size="1">
						<option id="RES_NO" value="RES_NO"  selected="selected">예약번호</option>
						<option id="ROOM_ID" value="ROOM_ID">객실번호</option>
						<option id="MEM_NAME" value="MEM_NAME">예약자명</option>
		        	</select>
                    <input type="text" name="keyword" class="form-control float-right" value="${keyword}" placeholder="검색어 입력"  onkeyup="enterkey();">
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
<div class="card-body table-responsive p-0">
	    <table class="table table-hover" name="resList">
	       <thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">예약번호</th>
				<th scope="col">객실유형</th>
                <th scope="col">객실번호</th>
                <th scope="col">에약자명</th>
                <th scope="col">예약일</th>
                <th scope="col">성인수</th>
                <th scope="col">아동수</th>
                <th scope="col">체크인</th>
                <th scope="col">체크아웃</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	    </table>
        <!-- /.card -->
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
			fn_resList(1);
		});

		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_resList(1);
			}
		}
		function fn_resDetail(obj) { //부대시설명 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/facilitiesDetail' />");
			comSubmit.addParam("FAC_HOTEL_ID", obj.parent().find(
					"input[name='title']").val());
			comSubmit.submit();
		}

		function fn_resList(pageNo) { //pageNo : 호출하고자 하는 페이지 번호
			var comAjax = new ComAjax();

			comAjax.setUrl("<c:url value='/admin/selectResList' />");
			comAjax.setCallback("fn_resListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $("#searchOption > option:selected")
					.val());
			comAjax.addParam("keyword", $("input[name='keyword']").val()); //검색

			comAjax.ajax();
		}

		function fn_resListCallback(data) {
			var total = data.TOTAL;
			//alert(total);//총 게시글 개수
			var body = $("table[name='resList'] > tbody");

			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='10' align='center'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);

			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_resList",
					recordCount : 10
				};
				gfn_renderPaging(params);
				var str = "";
				$.each(data.list, function(key, value) {
						str +="<tr>"
							+ "<td>" + value.RNUM + "</td>"
							+ "<td>" + value.RES_NO + "</td>"
							+ "<td>" + value.ROOM_TYPE + "</td>"
							+ "<td>" + value.ROOM_ID+ "</td>"
							+ "<td>" + value.MEM_NAME + "</td>"
							+ "<td>" + value.RES_DATE + "</td>"
							+ "<td>" + value.RES_ADULT+ "</td>"
							+ "<td>" + value.RES_CHILD + "</td>"
							+ "<td>" + value.RES_CHK_SDAY + "</td>"
							+ "<td>" + value.RES_CHK_EDAY + "</td>" + "<td>"
							+ "</tr>";
				});
				//이거 넣어야 데이터 들어감
				body.append(str);
			}
		}
	</script>

</html>
