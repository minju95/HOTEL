<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<style>
#notice{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
h2{width: 800px;  display: block; text-align: center;}
#PAGE_NAVI{text-align: center;}
.div-about{background-image:url(/hotel/image/hotel.jpg); height:250px; color: #e5a880; background-repeat:no-repeat; background-size:100%;}
a {text-decoration: none;}
.resList_searchBtn {font-weight: bold; text-align: center; padding: 8px 0; margin-left: 4px; width: 70px; background-color: #f8585b; border: none; color: #fff; text-decoration: none; display: inline-block; font-size: 12px; cursor: pointer; border-radius: 5px;}
.resList_searchBtn:hover {background-color: #87ceeb; color: black; text-decoration: none;}
.resList_cancelBtn {font-weight: bold; text-align: center; padding: 8px 0; margin-left: 4px; width: 70px; background-color: #f8585b; border: none; color: #fff; text-decoration: none; display: inline-block; font-size: 12px; cursor: pointer; border-radius: 5px;}
.resList_cancelBtn:hover {background-color: #87ceeb; color: black; text-decoration: none;}
</style>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>R E S E R V A T I O N</h1>
</div>

<div style="margin-top: 40px; height: 750px;">
	<h3 align="center">예약/결제 현황</h3>
	<br>
	
	<form>
	<input type="hidden" id="MEM_USERID" value="${USERID}"/>
	<table name="resList" class="table table-striped" align="center" style="width: 1200px;" >
		<thead>
			<tr>
				<th style="text-align: center; vertical-align: middle;">예약번호</th>
				<th style="text-align: center; vertical-align: middle;">객실번호</th>
				<th style="text-align: center; vertical-align: middle;">객실명</th>
				<th style="text-align: center; vertical-align: middle;">예약일</th>
				<th style="text-align: center; vertical-align: middle;">인원<br>(성인/아동)</th>
				<th style="text-align: center; vertical-align: middle;">체크인</th>
				<th style="text-align: center; vertical-align: middle;">체크아웃</th>
				<th style="text-align: center; vertical-align: middle;">결제금액</th>
				<th style="text-align: center; vertical-align: middle;">요청사항</th>
				<th style="text-align: center; vertical-align: middle;"></th>
			</tr>
		</thead>
		<tbody>
	
		</tbody>
	</table>
	</form>
	<div>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	
	<div style="text-align: center; margin-top: 20px;">
	<form id="search" class="form-inline" method="post">
		<div class="form-group">
			<select id="searchOption" size="1" style="width: 100px; height: 30px; border: 1px solid gray; border-radius: 10px; font-size: 12px; font-weight: bold; text-align: center;">
				<option id="RES_NO" value="RES_NO" selected="selected">예약번호</option>
				<option id="RES_CHK_SDAY" value="RES_CHK_SDAY">입실일자</option>
				<option id="RES_CHK_EDAY" value="RES_CHK_EDAY">퇴실일자</option>
			</select>
			<input type="text" name="keyword" value="${keyword}" placeholder="" class="form-control" id="exampleInputName2" onkeyup="enteryKey()">
		<input type="text" style="display: none;" />
		</div>
		<button type="button" class="resList_searchBtn" onclick="fn_resList(1)">검색</button>
	</form>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	</div>
</div>
<script>
$(document).ready(function(){
	fn_resList(1);
	
	
});

function enteryKey() {
	if(window.event.keyCode == 13) {
		fn_resList(1);
	}
}

/*페이징 함수*/
function fn_resList(pageNo)	{ //pageNo : 호출하고자 하는 페이지 번호
	var comAjax = new ComAjax();
		
	comAjax.setUrl("<c:url value='/reservation/searchResList' />");
	comAjax.setCallback("fn_resListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("MEM_USERID", $("#MEM_USERID").val());
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val()); //검색
	 
	comAjax.ajax();	
}

function fn_resListCallback(data){
	var total = data.TOTAL;
	var body = $("table[name='resList'] > tbody");
	
	body.empty();
	if(total == 0){
		var str = "<tr><td colspan='10'>조회된 결과가 없습니다.</td></tr>";
		body.append(str);
		
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_resList",
			recordCount : 10
		};
		gfn_renderPaging(params);
	var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>"
				+ "<td style='text-align: center; vertical-align: middle;'>" + value.RES_NO + "</td>"
				+ "<td style='text-align: center; vertical-align: middle;'>" + value.ROOM_ID  + "</td>"
				+ "<td style='text-align: left; vertical-align: middle;'>" + value.ROOM_NAME  + "</td>"
				+ "<td style='text-align: center; vertical-align: middle;'>" + value.RES_DATE + "</td>"
				+ "<td style='text-align: center; vertical-align: middle;'>" + value.RES_ADULT + " / " + value.RES_CHILD + "</td>"
			    + "<td style='text-align: center; vertical-align: middle;'>" + value.RES_CHK_SDAY + "</td>"
			    + "<td style='text-align: center; vertical-align: middle;'>" + value.RES_CHK_EDAY + "</td>"
			    + "<td style='text-align: right; vertical-align: middle;'>" + value.RES_PRICE + "</td>"
			    + "<td style='text-align: left; vertical-align: middle;'>" + value.RES_ANOTHER + "</td>"
			    + "<td><a href='#this' class='resList_cancelBtn' name='cancel'>취소</a></td>"
			    + "<input type='hidden' id='RES_ID' value='" + value.RES_ID + "'>"
			    + "<input type='hidden' id='CAR_ID' value='" + value.CAR_ID + "'>"
		    + "</tr>";
		});
	body.append(str);
	
	$("a[name='cancel']").on("click", function(e){ //취소하기 버튼
		if (confirm("취소하시겠습니까?") == true){
			e.preventDefault();
			fn_cancel();
		}
		return false;
	});
	
	}
}
</script>

<!-- 스크립트) 취소하기 버튼 작동 -->
<script type="text/javascript">
function fn_cancel(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/reservation/resCancel' />");
	comSubmit.addParam("MEM_USERID", $("#MEM_USERID").val());
	comSubmit.addParam("RES_ID", $("#RES_ID").val());
	comSubmit.addParam("CAR_ID", $("#CAR_ID").val());
	comSubmit.submit();
}
</script>
<!-- include) 푸터 -->
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>