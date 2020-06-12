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
	
	#PAGE_NAVI{text-align: center;margin-top:10%}

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>부대시설 등록</title>
</head>

<body>
<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>

<div class="div-about" align="center" >
   <br>
   <br>
   <br>
   <h1>F A C I L I T I E S </h1></div>
   
<h3 align="center">부대시설 등록</h3>
<br>

<form id="frm"  name="frm" enctype="multipart/form-data">
<table name="facWrite" border="1" cellspacing="0" cellpadding="0" align="center">
	<colgroup>
		<col width="15%"/>
		<col width="85%"/>
	</colgroup>
	<tbody>
		<tr>
		
			<th>부대시설명</th>
			<td>
				<input type="text" id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" size="70">
			</td>
		</tr>
		<tr>
			<th>위치</th>
			<td>
				<input type="text" id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" size="70">
			</td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td>
				<input type="text" id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" size="70">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" size="70">
			</td>
		</tr>
		<tr>
			<th>시설</th>
			<td>
				<textarea rows="5" cols="100" title="내용" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC"></textarea>
			</td>
		</tr>
		<tr>
			<th>상세내용1</th>
			<td>
				<textarea rows="10" cols="100" title="내용" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT"></textarea>
			</td>
		</tr>
		<tr>
			<th>상세내용2</th>
			<td>
				<textarea rows="10" cols="100" title="내용" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL"></textarea>
			</td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<div id="fileDiv">
					<p><input type="file" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE_0"></p>
				</div>
			</td>
		</tr>
		
		
	</tbody>
	
</table>


<center>
	<a href="#this" class="btn" id="write">등록하기</a>
	<a href="#this" class="btn" id="addFile">파일추가</a>
	<a href="#this" class="btn" id="list">목록으로</a>
</center>
</form>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
		var img_count = 1; //전역변수 선언(태그가 추가될 때마다 그 값을 1씩 증가시켜 name값이 계속 바뀜)

		$(document).ready(function(){
	  		$("#list").on("click", function(e){ //'목록으로'를 클릭하면
	         	e.preventDefault();
	            fn_facList(); //fn_facList()함수 호출
	        });
	        
	  		$("#write").on("click", function(e){ //'등록하기'를 클릭하면
				e.preventDefault();
				fn_insertFac();//fn_insertFac()함수 호출
			});
			
	  		$("#addFile").on("click", function(e){ //파일추가 버튼
				e.preventDefault();
				fn_addFile();
			});
		}) 
		
	  	function fn_facList(){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/facilitiesList'/>"); //리스트 페이지로 이동
	            comSubmit.submit();
	    }

		function fn_insertFac(){
			//유효성 검사
			if($("#FAC_HOTEL_NAME").val() == "")
				{
				alert("부대시설명을 입력해주세요");
			} else if($("#FAC_HOTEL_LOCATION").val() == "") {
				alert("부대시설 위치를 입력해주세요");
			} else if($("#FAC_HOTEL_TIME").val() == "") {
				alert("운영시간을 입력해주세요");
			} else if($("#FAC_HOTEL_PHONE").val() == "") {
				alert("전화번호를 입력해주세요");
			} else if($("#FAC_HOTEL_FAC").val() == "") {
				alert("시설을 입력해주세요");
			} else if($("#FAC_HOTEL_CONTENT").val() == "") {
				alert("상세내용을 입력해주세요");
			} 
			else {
				alert("새 부대시설이 등록되었습니다.")
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/admin/newFacilities' />");
				comSubmit.submit();
				}
		}
		
		function fn_addFile() {
				while(img_count<2) { //파일 추가 개수 제한
					var str = "<tr><td><input type='file' name='HOTEL_IMGS_FILE_"+(img_count++)+"'></td></tr>";
					$("#fileDiv").append(str);
				}
		}
		
	</script>	
</body>
</html>