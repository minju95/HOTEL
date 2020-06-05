<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<title>예약자 리스트</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

<h3>예약자 리스트</h3>
	
	<table name="reservationList" class="table table-striped">
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
			 <c:forEach var="resList" items="${list}">
				<tr>
					<td>${resList.ROOM_ID }</td>
					<td>${resList.RES_NO }</td>
					<td>${resList.MEM_NAME}</td>
					<td>${resList.RES_DATE}</td>
					<td>${resList.ROOM_TYPE}</td>
					<td>${resList.RES_ADULT}</td>
					<td>${resList.RES_CHILD}</td>
					<td>${resList.RES_CHK_SDAY}</td>
					<td>${resList.RES_CHK_EDAY }</td>
					<td>${resList.RES_PRICE}</td>
					<td>${resList.RES_ANOTHER}</td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	
	 <center>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</center>
	
	<form id="search" class="form-inline" method="post">
	  <div class="form-group">
		<select id="searchOption" size="1">
			<option id="ROOM_ID" value="ROOM_ID" selected="selected">객실번호</option>
			<option id="RES_NO" value="RES_NO">예약번호</option>
			<option id="MEM_NAME" value="MEM_NAME">예약자명</option>
		</select>
	    <input type="text" name="keyword" value="${keyword}" placeholder=""
	    	class="form-control" id="exampleInputName2" onkeyup="enteryKey()">
	  </div>
  		<button type="submit" class="btn btn-default" onclick="fn_reservationList(1)">검색</button>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
<script>
	$(document).ready(function(){
		fn_selectReservationList(1);
	});

	/*검색창에서 엔터 누르면 검색 실행*/ 
	function enteryKey() {
		if(window.event.keyCode == 13) { //JavaScript의 keyCode 13 = enter를 의미 
			fn_selectReservationList(1); //최초로 화면이 호출되면 1페이지 내용 조회
		}
	}
	
	/*페이징 함수*/
	function fn_reservationList(pageNo)	{ //pageNo : 호출하고자 하는 페이지 번호
		var comAjax = new ComAjax();

		comAjax.setUrl("<c:url value='/admin/reservationList' />");
		comAjax.setCallback("fn_selectReservationListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val()); //검색
		 
		comAjax.ajax();	
	} 
		
	   function fn_fn_selectReservationListCallback(data){
		var total = data.TOTAL;
		var body = $("table[name='reservationList'] > tbody");
		body.empty();
		if(total == 0){
			var str = "<tr><td colspan='11'>조회된 결과가 없습니다.</td></tr>"; 
			body.append(str);
		}else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectReservationList",
				recordCount : 10
			};
			gfn_renderPaging(params);
			var str = "";
			$.each(data.list, function(key, value){
				str += "<tr>" + "<td>" 
				+ value.ROOM_ID  + "</td>" + "<td>" 
			    + value.RES_NO + "</td>" + "<td>"
			    + value.NAME_DATE + "</td>" + "<td>"
			    + value.RES_DATE + "</td>" + "<td>"
			    + value.ROOM_TYPE + "</td>" + "<td>"
			    + value.RES_ADULT + "</td>" + "<td>"
			    + value.RES_CHILD + "</td>" + "<td>"
			    + value.RES_CHK_SDAY + "</td>" + "<td>"
			    + value.RES_CHK_EDAY + "</td>" + "<td>"
			    + value.RES_PRICE + "</td>" + "<td>"
			    + value.RES_ANOTHER + "</td>" + "<td>"
				+ "</td>" + "</tr>";
			}); 
			
		} 
	}  
 
</script>
</body>
</html>