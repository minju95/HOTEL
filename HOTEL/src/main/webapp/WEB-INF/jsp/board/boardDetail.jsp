<%@ page language="java" pageEncoding="utf-8"%>
 <% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<style>
  #frm{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
	#backbutton{text-align: center;margin-top:10%}
	.notice_detail{/*border-bottom:1px solid black ;*/border-collapse: collapse;}
	.td1{border-bottom:1px solid gray;}
	.notice_detail tr{height: 50px}
	
	
	#backbutton>button{width: 100px; height: 30px;border: 0;background-color:#d8d1d1; }
	#backbutton>button:hover {
	color:white;border:1px solid gray;
}

	.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: #e5a880;
background-repeat:no-repeat;
background-size:100%;
}
#a111{
color: #0f1927;
text-decoration: none;

}

.p-pre:hover{
                 
        background-color:   #e9e9e9;
}
.p-next:hover{
              
        background-color:   #e9e9e9;
}
.p-pre{

height:70px;
border-top:1px solid gray;
text-align:left;


}
.p-next{
height:70px;
border-bottom:1px solid gray;
text-align:left;

}
.notice-img {
  max-width: 100%;
  height: auto;
}
.board_date{
float: right;
width: 200px;
text-align:right;
color:gray;
}
</style>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>N O T I C E</h1></div>
   <br>
	<form id="frm">
	<table class="notice_detail" align="center" width="800" >
		<colgroup>
			<col width="10%" />
			<col width="67%" />
			<col width="23%" />
		</colgroup>
		<thead>
				<tr>
					<td class="td1" scope="col"><b>번호:</b> ${map.NOTICE_ID}</td>
					<td class="td1" scope="col"><b>제목:</b> ${map.NOTICE_TITLE}</td>
					<td class="td1" scope="col"><b>날짜:</b> ${map.NOTICE_DATE}</td>
				</tr>
			</thead>
				<tbody>
			<tr>
			<c:choose>
		<c:when test="${map.NOTICE_IMG != null}">
				<p>
				<td colspan="4" height="200" class="notice-content">
				<img class="notice-img" src="<c:url value='/image/${map.NOTICE_IMG}'/>" />
				<br>${fn:replace(map.NOTICE_CONTENT, replaceChar, "<br/>")}
				</td>
				</p>
				</c:when>
		<c:otherwise>
		<p>
				<td colspan="4" height="200">
				<br>${fn:replace(map.NOTICE_CONTENT, replaceChar, "<br/>")}
				</td>
				</p>
				</c:otherwise>
				</c:choose>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<div id="backbutton">
	<button href="#this" class="btn" id="list">목록으로</button>
	</div>
	<br>
	<div class="p-pre">
	<br>
		<c:choose>
		<c:when test="${map.PRE_IDX != null}">
	<a id="a111" href='/hotel/board/boardDetail?NOTICE_ID=${map.PRE_IDX }'  ><font style="color:#e5a880; font-weight: bold;">▲&nbsp;이전글</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.PRE_TITLE}</a>
	<div class="board_date">${map.PRE_DATE }</div>
		</c:when>
		<c:otherwise>
		<font style="color:#e5a880; font-weight: bold;">▲&nbsp;이전글</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.PRE_TITLE}
		</c:otherwise>
		</c:choose>
	</div>
	<div class="p-next">
	<br>
	<c:choose>
		<c:when test="${map.NEXT_IDX != null}">
	<a id="a111" href='/hotel/board/boardDetail?NOTICE_ID=${map.NEXT_IDX}'  ><font style="color:#e5a880; font-weight: bold;">▼&nbsp;다음글</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.NEXT_TITLE}</a>
	<div class="board_date">${map.NEXT_DATE }</div>
	</c:when>
		<c:otherwise>
		<font style="color:#e5a880; font-weight: bold;">▼&nbsp;다음글</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${map.NEXT_TITLE}
		</c:otherwise>
		</c:choose>

</div>
<br>
	  	</form>
	  <%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
	});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/list' />");
			comSubmit.submit();
		}

		
	</script>
		
<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>