<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style>

/* 테이블 css */
.board_list {
	width:80%;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 50px;
	border-top:3px solid #81725f;
	border-bottom:1px solid #ccc;
}
.board_list thead th:first-child{background-image:none}
.board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a; text-align:center; vertical-align:middle}
.board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle}
.board_list tbody tr:first-child td {border:none}
.board_list tbody td.title {text-align:left; padding-left:20px}
.board_list tbody td a {display:inline-block}
.btn1 {
border-radius:3px;
padding:5px 11px;
color:#000000 !important;
display:inline-block;
background-color:#F0F8FF;
float:center;
border:1px solid #56819d;
vertical-align:middle}
/* 테이블 아래 버튼 div */
.btnDiv {
width: 80%;
margin-left: 10%;
margin-right: 10%;
margin-top: 50px;
border: 1px solid black;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/myPage/myMembership.jsp"%>
<div class="container">
	<form id="frm" method="post" action="<c:url value='/qnaWriteForm'/>">
	<input type="hidden" id="MEM_USERID" name="MEM_USERID" value="${USERID}"/>
	<table class="board_list" id="qnaList" name="qnaList">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">답변확인</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="btnDiv">
		<input type="button" class="buttons" value="글쓰기" id="write" style="width: 80px; height: 40px; ">
	</div>
	</form>
</div>	
<script>
		$(document).ready(function() {
			fn_qnaList(1);

			$("#write").on("click", function(e) { //'등록'을 클릭하면
				e.preventDefault();
				fn_qnaWrite();
			});
		});

		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_qnaList(1);
			}
		}

		function fn_qnaWrite() { //부대시설명 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qnaWriteForm' />");
			comSubmit.submit();
		}
		

		function fn_qnaList(pageNo) { //페이징 함수
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/qnaList' />");
			comAjax.setCallback("fn_qnaListCallback"); //ajax요청 후 호출될 함수의 이름 지정
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $(
					"#searchOption > option:selected").val());
			comAjax.addParam("keyword", $("input[name='keyword']").val());
			comAjax.ajax(); //실질적인 ajax기능 수행
		}

		function fn_qnaListCallback(data) { //콜백함수
			var total = data.TOTAL;
			//alert(total); //총 게시글 개수
			var body = $("table[name='qnaList'] > tbody");
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
					eventName : "fn_qnaList",
					recordCount : 10
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RNUM
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title'>"
											+ value.QNA_TITLE
											+ "</a>"
											+ "<input type='hidden' name='QNA_NUM' value=" + value.QNA_NUM + ">"
											+ "</td>" + "<td>"
											+ value.MEM_USERID
											+ "</td>" + "<td>"
											+ value.QNA_DATE + "</td>"
											+ "<td>" + value.QNA_RSTATE
											+ "</td>" + "</tr>";
								});
				//이거 넣어야 데이터 들어감
				body.append(str);

				$("a[name='title']").on("click", function(e) {
					e.preventDefault();
					fn_qnaDetail($(this));
				});

			}
		}
		function fn_qnaDetail(obj) { //Q&A 제목 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/qnaDetail' />");
			comSubmit.addParam("QNA_NUM", obj.parent().find("input[name='QNA_NUM']").val());
			comSubmit.submit();
		}
	</script>	

</body>
</html>