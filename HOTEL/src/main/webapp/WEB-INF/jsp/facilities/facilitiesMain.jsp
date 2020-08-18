<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부대시설 메인</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<!-- include) 부트스트랩.슬라이드 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<style>
a{text-decoration: none;}
a:hover{text-decoration: none;}
.headline {width: 1200px; height: 200px; margin: 0 auto; text-align:center; padding:30px; margin-top: 30px;  line-height:2.0;}
#searchArea{width: 1200px; height: 60px; margin: 0 auto; padding: 15px; background-color: #f5f5f5;}
.checkbox {width: 18px; height: 18px; border: 1px solid black;}
.checkbox-inline {font-size: 18px;}
.button {width:90px; height:30px; border-color: #ad9e87; border:none; background-color: #ad9e87; color: #fff; margin-left: 300px;}
.container {width: 1400px; margin: 0 auto; padding: 30px;}
img {vertical-align: middle;}
</style>

<body oncontextmenu="return false" ondragstart="return false">
	<div class="headline">
		<span style="font-size: 40px;">부대시설</span>
		<p style="font-size: 16px;">활력 있는 생활을 추구할 수 있는 운동시설부터, 심신의 균형과 조화를 다스려주는 한방 스파 및 사우나까지 다양한 최상의 시설을 경험해 보세요.</p>
	</div>
	
	<form>
	<div id="searchArea" >
			<label class="checkbox-inline"><b>타입</b></label>
			<label class="checkbox-inline">
	    		<input type="checkbox" id="chk-agreeAll" name="FAC_HOTEL_TYPE2" class="checkbox" value="all">&nbsp;전체
			</label>
				<c:choose>
				<c:when test ="${fn:length(list2) > 0}">
				 <c:forEach items="${list2}" var="row">
					<c:if test="${row.FAC_HOTEL_TYPE =='SPA'}">
						<label class="checkbox-inline">
						<input type="checkbox" name="FAC_HOTEL_TYPE" class="checkbox" value="${row.FAC_HOTEL_TYPE}">&nbsp;스파 & 피트니스
						</label>
					</c:if>
					<c:if test="${row.FAC_HOTEL_TYPE =='BSN'}">
						<label class="checkbox-inline">
						<input type="checkbox" name="FAC_HOTEL_TYPE" class="checkbox" value="${row.FAC_HOTEL_TYPE}">&nbsp;비즈니스
						</label>
					</c:if>
					<c:if test="${row.FAC_HOTEL_TYPE =='CLT'}">
						<label class="checkbox-inline">
						<input type="checkbox" name="FAC_HOTEL_TYPE" class="checkbox" value="${row.FAC_HOTEL_TYPE}">&nbsp;문화
						</label>
					</c:if>
					<c:if test="${row.FAC_HOTEL_TYPE =='SHP'}">
						<label class="checkbox-inline">
						<input type="checkbox" name="FAC_HOTEL_TYPE" class="checkbox" value="${row.FAC_HOTEL_TYPE}">&nbsp;쇼핑
						</label>
					</c:if>
					<c:if test="${row.FAC_HOTEL_TYPE =='SVC'}">
						<label class="checkbox-inline">
						<input type="checkbox" name="FAC_HOTEL_TYPE" class="checkbox" value="${row.FAC_HOTEL_TYPE}">&nbsp;서비스
						</label>
					</c:if>
				</c:forEach>
				</c:when>
				
			</c:choose>
			
			
			<label class="checkbox-inline">
				<input type="submit" id="main" class="button" onclick="fn_search" value="검색">
			</label>
	</div>
	</form>
	
	<div class="container">
	<div class="row" id="imageBoard">
	<%-- <c:forEach var="list" items="${list}">
	<div class="col-6">
		<div class="card" >
			<a href="<c:url value="/facilitiesDetail?FAC_HOTEL_ID=${list.FAC_HOTEL_ID}"/>">
				<img class="card-img-top" alt="" height="300px" src="<c:url value="/image/facilities/${list.HOTEL_IMGS_FILE}"/>" >
			</a>
			<div class="card-body text-center">
				<div class="d-flex justify-content-between align-items-center">
					<h4>${list.FAC_HOTEL_TYPE}</h4>
			 	</div>
			 	<div class="d-flex justify-content-start align-items-center">
					<h3 style="font-family: 맑은고딕;"><b>${list.FAC_HOTEL_NAME}</b></h3>
			 	</div>
			 	<div class="d-flex justify-content-between align-items-center">
					<h4 style="font-family: 맑은고딕;">위치 <b>${list.FAC_HOTEL_LOCATION}</b></h4>
					<h4 style="font-family: 맑은고딕;"><a href="<c:url value="/facilitiesDetail?FAC_HOTEL_ID=${list.FAC_HOTEL_ID}"/>">자세히 보기 ></a></h4>
			 	</div> 
			 </div>
		 </div>
	</div>	
	</c:forEach> --%>
	</div>
	</div>
<!-- include) 푸터 -->
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
<script>

//체크으으으박스으으
$(".checkbox").click(function(){
	$("input[name=FAC_HOTEL_TYPE]:checked").each(function() {
        var test = $(this).val();
        alert(test);
     });
});


$(document).ready(function(){
    //$("input:checkbox[id='chk-agreeAll']").prop("checked", true);
    fn_chkCheckBox();
});

//체크박스 '전체' 클릭시
$(document).on("click", "#chk-agreeAll", function(){
	fn_chkCheckBox();
}); 

function fn_chkCheckBox() {
	var agreeAll = $('#chk-agreeAll').is(':checked');
	if(agreeAll == true) {
		$('input[name*="FAC_HOTEL_TYPE"]').prop('checked', true);
	} else {
		$('input[name*="FAC_HOTEL_TYPE"]').prop('checked', false);
	}
}

$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : '<c:url value="/selectFacList" />',
		data : {FAC_HOTEL_TYPE:"${FAC_HOTEL_TYPE}"},
		success : function(data){
			var str = "";
			$.each(data.list,function(index,list){
			str+='<div class="col-6">'+
						'<div class="card">'+
						'<a href="<c:url value="/facilitiesDetail?FAC_HOTEL_ID='+list.FAC_HOTEL_ID+'"/>">'+
						'<img class="card-img-top" alt="" height="300px" src="<c:url value="/image/facilities/'+list.HOTEL_IMGS_FILE+'"/>">'+
						'</a>'+
						'<div class="card-body text-center">'+
						'<div class="d-flex justify-content-between align-items-center">'+
						'<h4>'+list.FAC_HOTEL_TYPE+'</h4>'+
			 			'</div>'+
			 			'<div class="d-flex justify-content-start align-items-center">'+
						'<h3 style="font-family: 맑은고딕;"><b>'+list.FAC_HOTEL_NAME+'</b></h3>'+
			 			'</div>'+
			 			'<div class="d-flex justify-content-between align-items-center">'+
						'<h4 style="font-family: 맑은고딕;">위치 <b>'+list.FAC_HOTEL_LOCATION+'</b></h4>'+
						'<h4 style="font-family: 맑은고딕;"><a href="<c:url value="/facilitiesDetail?FAC_HOTEL_ID='+list.FAC_HOTEL_ID+'"/>">자세히 보기 ></a></h4>'+
			 			'</div>'+ 
			 			'</div>'+
		 				'</div>'+
						'</div>';
			})
			$("#imageBoard").append(str);
		}
	});		
	
	
});

</script>	
</body>
</html>