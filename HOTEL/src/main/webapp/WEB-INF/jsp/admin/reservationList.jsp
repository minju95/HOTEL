<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">

<title>예약자 리스트</title>
<style>
    #reservation{margin-left: calc(50% - 400px); width: 800px;} 
	h2{width: 800px;  display: block;}
	
	#PAGE_NAVI{text-align: center;}


h2 {
	width: 800px;
	display: block;
	text-align: center;
}

#PAGE_NAVI {
	text-align: center;
	margin-top: 10%
}

.div-about {
	background-image: url(/hotel/image/hotel.jpg);
	height: 250px;
	color: #e5a880;
	background-repeat:no-repeat;
	background-size:100%;
	}
	
	a{
	text-decoration: none;
	color: black;
	}

</style>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
		<br> <br> <br>
		<h1>R E S E R V A T I O N</h1>
	</div>
<%@ include file="/WEB-INF/include/include-admin.jspf"%>
	<h3 align="center">예약자 목록</h3> <br>

	<br>
	<form id="reservation">
	<table name="resList" class="table table-striped" align="center" style="width: 1200px;" >

		<thead>
			<tr>
				<th>객실번호</th>
				<th>예약번호</th>
				<th>예약자명</th>
				<th>예약일</th>
				<th>예약 객실유형</th>
				<th>성인수</th>
				<th>아동수</th>
				<th>체크인 일자</th>
				<th>체크아웃 일자</th>
				<th>결제가</th>
				<th>부가요청</th>
			</tr>
		</thead>
		<tbody>
	
		</tbody>
	</table>
	
	<div id="PAGE_NAVI">
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	<br>
		<select id="searchOption" size="1">
			<option id="ROOM_ID" value="ROOM_ID" selected="selected">객실번호</option>
			<option id="RES_NO" value="RES_NO">예약번호</option>
			<option id="MEM_NAME" value="MEM_NAME">예약자명</option>
		</select>
		
	    <input type="text" size="16" name="keyword" value="${keyword}" placeholder="" onkeyup="enteryKey()">
	    <input type="text" style="display: none;" />
  		<button type="button" onclick="fn_resList(1)">검색</button>

	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
<script>
	$(document).ready(function() {
		fn_resList(1);
	});

	/*검색창에서 엔터 누르면 검색 실행*/
	function enteryKey() {
		if (window.event.keyCode == 13) { //JavaScript의 keyCode 13 = enter를 의미 
			fn_resList(1); //최초로 화면이 호출되면 1페이지 내용 조회
		}
	}

	/*페이징 함수*/
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
			var str = "<tr><td colspan='11'>조회된 결과가 없습니다.</td></tr>";
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
				str += "<tr>" + "<td>" + value.ROOM_ID + "</td>" + "<td>"
						+ value.RES_NO + "</td>" + "<td>" + value.MEM_NAME
						+ "</td>" + "<td>" + value.RES_DATE + "</td>" + "<td>"
						+ value.ROOM_TYPE + "</td>" + "<td>" + value.RES_ADULT
						+ "</td>" + "<td>" + value.RES_CHILD + "</td>" + "<td>"
						+ value.RES_CHK_SDAY + "</td>" + "<td>"
						+ value.RES_CHK_EDAY + "</td>" + "<td>"
						+ value.RES_PRICE + "</td>" + "<td>"
						+ value.RES_ANOTHER + "</td>" + "</tr>";
			});
			//이거 넣어야 데이터 들어감
			body.append(str);

		}
	}
</script>

				</body>
</html>