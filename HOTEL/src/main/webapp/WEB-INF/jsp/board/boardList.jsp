<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style>
    #notice{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
	h2{width: 800px;  display: block; text-align: center;}
	#PAGE_NAVI{text-align: center;margin-top:10%}
	.notice_list{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_list th{border-bottom:1px solid black;}
	.notice_list tr{height: 50px}
	.notice_list tr td{border-bottom:1px solid black;}
	
	.div-about{
 background-image:url(/hotel/image/hotel.jpg);
height:250px;
color: #e5a880;
background-repeat:no-repeat;
background-size:100%;
}
td>#a1{
text-decoration: none;
color: black;
}
</style>
<title>공지 사항 뷰</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>N O T I C E</h1></div>
   <br>
<form id="notice">
	<center><h2>공지사항</h2></center>
		<table name="noticeList" class="notice_list" align="center" width="800">
			<colgroup>
				<col width="15%"/>
				<col width="55%"/>
				<col width="30%"/>
				
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성일</th>
					
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		
		<center>
			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</center><br>
		
		
            <select id="searchOption" size="1">
                <option id="NOTICE_TITLE" value="NOTICE_TITLE" selected="selected">제  목</option>
                <option id="NOTICE_CONTENT" value="NOTICE_CONTENT" >내  용</option>
                <option id="ALL" value="ALL" >제목+내용</option>
            </select>
                 <input type="text" size="16" name="keyword" value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" />
                 <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <!-- HTML 2.0 표준 스펙에 명시되어 있습니다. (:
			 	 http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2
			 	 When there is only one single-line text input field in a form, 
				 the user agent should accept Enter in that field as a request to submit the form. -->
                 <input type="button" value="검 색" onClick="fn_noticeList(1)">
                
   		</form>    

		<br/>
	

			<%@ include file="/WEB-INF/include/include-body.jspf"%>		
		<script type="text/javascript">
		
       		$(document).ready(function(){
       			
       		 /* 페이징 관련 */
       			fn_noticeList(1);
       			
       			$("#write").on("click", function(e){ 
                    e.preventDefault();
                    fn_noticeWrite();
                });
				
			});
       		
       		/* 검색칸에서 엔터키 누르면 실행 */
			function enterkey() {
		        if (window.event.keyCode == 13) {
		        	fn_noticeList(1);
		        }
			}
       		/*
       		function fn_noticeWrite(){
                var comSubmit = new ComSubmit();
                comSubmit.setUrl("<c:url value='/admin/noticeWriteForm'/>");
                comSubmit.submit();
            }*/
       		
			function fn_noticeDetail(obj){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/board/boardDetail' />");
	            comSubmit.addParam("NOTICE_ID", obj.parent().find("input[name='title']").val());
	            comSubmit.submit();
	        }
			
			/* 페이징 관련 */
			 function fn_noticeList(pageNo){
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/board/selectlist' />");
				comAjax.setCallback("fn_noticeListCallback");
				comAjax.addParam("PAGE_INDEX", pageNo);
				comAjax.addParam("PAGE_ROW", 10);
				comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
				comAjax.addParam("keyword", $("input[name='keyword']").val());
				 /* id로 줬을때는 '#'이용 name으로 줬을때는 'input[name='keyword']' 방식 class로 줬을때는'.'(마침표) 방식으로 연결 */
				comAjax.ajax();
			}
			
			function fn_noticeListCallback(data){
				var total = data.TOTAL; 
				var body = $("table[name='noticeList'] > tbody");
				body.empty();
				if(total == 0){
					var str = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>"; 
					body.append(str);
				}else{
					var params = {
						divId : "PAGE_NAVI",
						pageIndex : "PAGE_INDEX",
						totalCount : total,
						eventName : "fn_noticeList",
						recordCount : 10
					};
					gfn_renderPaging(params);
					var str = "";
					$.each(data.list, function(key, value){
						str += "<tr>" + "<td>" + value.NOTICE_ID + "</td>" + "<td class='title'>" 
						+ "<a id='a1' href='#this' name='title'>" + value.NOTICE_TITLE + "</a>" 
						+ "<input type='hidden' name='title' value=" + value.NOTICE_ID + ">" 
						+ "</td>" + "<td>" + value.NOTICE_DATE + "</td>"+ "</tr>";
						
					}); 
					body.append(str);
					$("a[name='title']").on("click", function(e){
						e.preventDefault();
						fn_noticeDetail($(this));
					});
				}
			} 
		</script>
		<%@ include file="/WEB-INF/include/include-footer.jsp"%>
</body>
</html>
