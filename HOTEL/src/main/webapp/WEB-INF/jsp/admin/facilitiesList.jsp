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
<title>부대시설 목록</title>
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
                <h3 class="card-title">부대시설 목록</h3>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 400px;">
                  	<select id="searchOption" size="1">
		                <option id="FAC_HOTEL_NAME" value="FAC_HOTEL_NAME" selected="selected">부대시설명</option>
		        	</select>
                    <input type="text" name="keyword" class="form-control float-right" value="${keyword}" placeholder="검색어 입력"  onkeyup="enterkey();">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
     </div>
<div class="card-body table-responsive p-0">
	    <table class="table table-hover" name="facList">
	       <thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">타입</th>
                <th scope="col">부대시설명</th>
                <th scope="col">위치</th>
                <th scope="col">운영시간</th>
                <th scope="col">전화번호</th>
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
			fn_facList(1);

			$("#write").on("click", function(e) { //'등록'을 클릭하면
				e.preventDefault();
				fn_facWrite(); //fn_facWrite()함수 호출
			});
		});

		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_facList(1);
			}
		}
		function fn_facDetail(obj) { //부대시설명 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/facilitiesDetail' />");
			comSubmit.addParam("FAC_HOTEL_ID", obj.parent().find(
					"input[name='title']").val());
			comSubmit.submit();
		}

		function fn_facList(pageNo) { //페이징 함수
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectFacList' />");
			comAjax.setCallback("fn_facListCallback"); //ajax요청 후 호출될 함수의 이름 지정
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $(
					"#searchOption > option:selected").val());
			comAjax.addParam("keyword", $("input[name='keyword']").val());
			comAjax.ajax(); //실질적인 ajax기능 수행
		}

		function fn_facListCallback(data) { //콜백함수
			var total = data.TOTAL;
			//alert(total); //총 게시글 개수
			var body = $("table[name='facList'] > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='5' align='center'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_facList",
					recordCount : 10
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
					str += "<tr>"
						+ "<td>"
						+ value.RNUM
						+ "</td>"
						+ "<td>"
						+ value.FAC_HOTEL_TYPE
						+ "</td>"
						+ "<td>"
						+ "<a href='#this' name='title'>"
						+ value.FAC_HOTEL_NAME
						+ "</a>"
						+ "<input type='hidden' name='title' value=" + value.FAC_HOTEL_ID + ">"
						+ "</td>" + "<td>"
						+ value.FAC_HOTEL_LOCATION
						+ "</td>" + "<td>"
						+ value.FAC_HOTEL_TIME + "</td>"
						+ "<td>" + value.FAC_HOTEL_PHONE
						+ "</td>" + "</tr>";
				});
				//이거 넣어야 데이터 들어감
				body.append(str);

				$("a[name='title']").on("click", function(e) {
					e.preventDefault();
					fn_facDetail($(this));
				});

			}
		}
	</script>

</html>