<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<meta charset="UTF-8">

<title>부대시설 리스트</title>
<style>
    #facilities{margin-left: calc(50% - 400px);width: 800px;} 
	h2{width: 800px;  display: block; text-align: center;}
	
	#PAGE_NAVI{text-align: center;}
	
	.div-about{
 	background-image:url(/hotel/image/hotel.jpg);
	height:250px;

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
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>F A C I L I T I E S </h1></div>
    <%@ include file="/WEB-INF/include/include-admin.jspf"%>  	
   
<form id="facilities">
<h3 align="center">부대시설 관리</h3>
<br>	
	<table name="facList" class="table table-striped" align="center" style="width: 800px;" >

		<thead>
			<tr>
				<td>번호</td>
				<td>부대시설명</td>
				<td>위치</td>
				<td>운영시간</td>
				<td>전화번호</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
				<a href="#this" class="btn" id="write" >등록</a>
				</td>
			</tr>
		</tfoot>
	</table>

	
	
	<div id="PAGE_NAVI">
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	<br>

            <select id="searchOption" size="1">
                <option id="FAC_HOTEL_NAME" value="FAC_HOTEL_NAME"
								selected="selected">부대시설명</option>
            </select>
            
                 <input type="text" size="16" name="keyword"
							value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" />
                 <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <input type="button" value="검 색" onClick="fn_facList(1)">
   	</form>

	
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>		
	
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

		function fn_facWrite() { //등록 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/newFacilitiesForm'/>");
			comSubmit.submit();
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
			//alert(body);
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


				</body>
</html>