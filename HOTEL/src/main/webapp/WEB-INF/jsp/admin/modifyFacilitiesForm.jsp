<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
</head>

<title>부대시설 수정</title>
<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/WEB-INF/include/navbar.jsp" %>
  
  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/include/sidebar.jsp" %>
  
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
  
  
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">부대시설 수정</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form  id="frm"  action="<c:url value='/admin/modifyFacilities'/>" method="post" name="frm"
              enctype="multipart/form-data">
                <div class="card-body">
               
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">부대시설명</label>
                    <div class="col-sm-10">
                      <input type="hidden" id="FAC_HOTEL_ID" name="FAC_HOTEL_ID" value="${map.FAC_HOTEL_ID}">
                      <input class="form-control" type="text"  id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" value="${map.FAC_HOTEL_NAME}"  placeholder="회원 ID" >
                    </div>
                  </div>
                  
                    <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">위치</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" value="${map.FAC_HOTEL_LOCATION}"  placeholder="회원 ID" >
                    </div>
                  </div>
                  
                     <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">운영시간</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" value="${map.FAC_HOTEL_TIME}"  placeholder="회원 ID" >
                    </div>
                  </div>
                  
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" value="${map.FAC_HOTEL_PHONE}"  placeholder="회원 ID" >
                    </div>
                  </div>
                  
                  
                  
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">시설</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="10" id="FAC_HOTEL_FAC" name="FAC_HOTEL_FAC">${map.FAC_HOTEL_FAC}</textarea>
                    </div>
                   </div>
                   
                     
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="10" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT">${map.FAC_HOTEL_CONTENT}</textarea>
                    </div>
                   </div>
               
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">세부사항</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="10" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL">${map.FAC_HOTEL_DETAIL}</textarea>
                    </div>
                   </div>
                   
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이미지</label>
                   
                    <div class="col-sm-10">
                    <c:forEach var="row" items="${list }" varStatus="var">
                    
                      <div class="custom-file" >
							<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
							<input type="hidden" id="HOTEL_IMGS_ID"  name="HOTEL_IMGS_ID_${var.index}" value="${row.HOTEL_IMGS_ID }">
							<input type="hidden" id="OLD_FILE_NAME" name="OLD_FILE_NAME_${var.index}" value="${row.ROOM_IMGS_FILE}">
	                      	
	                      	<!-- 이미지_상대경로 -->
							<img src= "/hotel/image/${row.HOTEL_IMGS_FILE}" style = "width:600px; heigth:600px;">
							<br>
							<a href="#this" id="name_${var.index}" name="name_${var.index}">${row.HOTEL_IMGS_FILE}</a>
						
						<div class="custom-file">
	                        <input type="file" class="custom-file-input" id="file_${var.index}" name="file_${var.index}">
	                        <label class="custom-file-label" for="file_${var.index}">Choose file</label>
                      </div>
					  </div>
					</c:forEach>
                   </div>
					</div>
					
                     <div id="fileDiv">
						<input type="hidden" id="FAC_HOTEL_ID"  name="IDX_${var.index}" value="${row.FAC_HOTEL_ID }">
					</div>
                  </div>
                  
              </form>
	
	<table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/admin/facilitiesList"/>'" value="목록으로">
		</td>
		<td><input type="submit" class="btn btn-block btn-outline-primary" onclick="fn_facModify()" value="공지 수정">
		</td>
		<td>
		 <input type="button" class="btn btn-block btn-outline-success" onclick="fn_addFile()" value="이미지 추가"></td>
	</tr>
</table>
</div>
</div>
</div>
</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>
<script>
var imageNum = ${fn:length(list)};

function fn_facModify(){
	//유효성 검사
	if($("#FAC_HOTEL_NAME").val() == "") {
		alert("부대시설명을 입력해주세요");
	} else if($("#FAC_HOTEL_LOCATION").val() == "") {
		alert("부대시설 위치를 입력해주세요");
	} else if($("#FAC_HOTEL_TIME").val() == "") {
		alert("운영시간을 입력해주세요");
	} else if($("#FAC_HOTEL_PHONE").val() == "") {
		alert("전화번호를 입력해주세요");
	} else if($("#FAC_HOTEL_CONTENT").val() == "") {
		alert("상세내용을 입력해주세요");
	} 
	else {
		alert("부대시설 수정이 완료되었습니다.");
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/modifyFacilities' />");
		comSubmit.submit();
	}
}


function fn_addFile() {
	//var out = '<c:out value="${list}"/>'; //[{HOTEL_IMGS_ID=5, HOTEL_IMGS_FILE=dddd.jpg, FAC_HOTEL_ID=6}]
	//alert(out.length);
	//alert(${fn:length(list)});
	//alert(imageNum);
	//var img_count = 1;

	if(imageNum == 1) {
		//alert("처음!"+imageNum);
		//alert(img_count); //1
		var str = "<div class='form-group row'><label for='inputEmail3' class='col-sm-2 col-form-label'>이미지</label><div class='col-sm-10'><div class='custom-file'><input type='file' class='custom-file-input' id='HOTEL_IMGS_FILE' name='HOTEL_IMGS_FILE"+(imageNum)+"'><label class='custom-file-label' for='HOTEL_IMGS_FILE'>Choose file</label></div></div></div>";
		//${fn:length(list)};
		imageNum++;
		$("#fileDiv").append(str);
		//alert("두번째"+imageNum);
	} else {
	alert("이미지는 2개까지 업로드 가능합니다.");
		}
	
}

/* 
<div class="form-group row">
 <label for="inputEmail3" class="col-sm-2 col-form-label">이미지</label>
 
 <div class="col-sm-10">
   <div class="custom-file">
     <input type="file" class="custom-file-input" id="NOTICE_IMG" name="NOTICE_IMG">
     <label class="custom-file-label" for="NOTICE_IMG">Choose file</label>
   </div>
 </div>
	</div>


 */
</script>	

</body>
</html>



