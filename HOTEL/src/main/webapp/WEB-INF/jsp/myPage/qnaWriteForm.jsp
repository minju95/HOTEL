<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 Q&A 등록 폼</title>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
/* 테이블 css */
.board_view {width:100%;border-top:2px solid #81725f;border-bottom:1px solid #ccc; margin-top: 50px;}
.board_view tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a}
.board_view tbody th.list_tit {font-size:13px;color:#000;letter-spacing:0.1px}
.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {border-bottom:none}
.board_view tbody th, .board_view tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc}
.board_view tbody td.view_text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px}
.board_view tbody th.th_file {padding:0 0 0 15px; vertical-align:middle}
/* 확인,취소 버튼 감싸는 div */
.btnBox {width:100%; margin: 0 auto; display: flex; flex-direction: row; justify-content: center; align-items: center;}
</style>
</head>

<body>
<%@ include file="/WEB-INF/jsp/myPage/myMembership.jsp"%>
<div class="container">
	<form id="frm" name="frm" method="POST" action="<c:url value='/qnaWrite'/>">
	
		<table class="board_view" style="width: 100%;">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>고객의 소리</caption>
			<tbody>
				<tr>
					<th scope="row">성명</th>
					<td>
						<!--참고)
						- include-topMenu.jsp 에서 가져온 회원 아이디 값이 USERID로 설정되어 있음
						- id가 아니라 name 값이 데이터로 넘어가는 것! -->
						<input type="hidden" id="MEM_USERID" name="MEM_USERID" value="${USERID}"/>
						<input type="text" id="QNA_NAME" name="QNA_NAME" class="wdp_20"></input>
					</td>
				</tr>
				<tr>
					<th scope="row">문의 유형</th>
					<td><select id="QNA_CATE" name="QNA_CATE" style="width: 180px;">
					<option>칭찬</option>
					<option>질문</option>
					<option>불만</option>
					<option>기타</option>
					</select>
					</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text"  title="제목" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">내용</th>
						<td>
						<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
						</td>
					<th>
				</tr>
			</tbody>
		</table>
		<br><br>
		<div class="btnBox" style="margin: 0 auto; text-align: center;">
			<button type="button" id="completeQnA" class="buttons" onclick="fsubmit(); return false;">확인</button>
			<button type="button" id="cancel" class="buttons" onclick="location.href='/hotel/myPage'">취소</button>
		</div>
	</form>
</div>		
<script>
function fsubmit(){
	var QNA_TITLE = $("#QNA_TITLE")[0].value;
	var QNA_CONTENT = $("#QNA_CONTENT")[0].value;
	
	if(QNA_TITLE==null || QNA_TITLE==''){
		alert("제목을 입력하세요.");
		return false;
	}
	if(QNA_CONTENT==null || QNA_CONTENT==''){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	frm.submit();
}
</script>
</body>
</html>