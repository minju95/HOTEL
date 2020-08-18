<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<title>부대시설 등록</title>
</head>

<%@include file="/WEB-INF/include/mata.jsp" %>

<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper-->
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
    	<h3 class="card-title">부대시설 등록</h3>
    </div>
    <!-- /.card-header -->
    
    <!-- form start -->
    <form class="form-horizontal" id="frm" name="frm"  method="post" enctype="multipart/form-data">
    	<div class="card-body">
        	<div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">부대시설 타입</label>
                <div class="col-sm-10">
                	<select class="form-control" id="FAC_HOTEL_TYPE" name="FAC_HOTEL_TYPE">
						<option value="SPA">스파 & 피트니스</option>
						<option value="BSN">비즈니스</option>
						<option value="CLT">문화</option>
						<option value="SHP">쇼핑</option>
						<option value="SVC">서비스</option>
					</select>
                </div>
        	</div>
        	
        	<div class="form-group row">
           		<label for="inputEmail3" class="col-sm-2 col-form-label">부대시설명</label>
                <div class="col-sm-10">
                	<input class="form-control" type="text"  id="FAC_HOTEL_NAME" name="FAC_HOTEL_NAME" placeholder="부대시설명">
                </div>
            </div>
            
            <div class="form-group row">
            	<label for="inputEmail3" class="col-sm-2 col-form-label">위치</label>
            	<div class="col-sm-10">
                	<input class="form-control" type="text"  id="FAC_HOTEL_LOCATION" name="FAC_HOTEL_LOCATION" placeholder="위치">
                </div>
            </div>
                  
            <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">운영시간</label>
                <div class="col-sm-10">
                	<input class="form-control" type="text"  id="FAC_HOTEL_TIME" name="FAC_HOTEL_TIME" placeholder="운영 시간">
                </div>
            </div>
                  
            <div class="form-group row">
	            <label for="inputEmail3" class="col-sm-2 col-form-label">문의 안내</label>
	            <div class="col-sm-10">
	            	<input class="form-control" type="text"  id="FAC_HOTEL_PHONE" name="FAC_HOTEL_PHONE" placeholder="전화번호">
	            </div>
            </div>
                  
             <div class="form-group row">
	             <label for="inputEmail3" class="col-sm-2 col-form-label">시설 정보</label>
	             <div class="col-sm-10">
	             	<textarea class="form-control" rows="5" id="FAC_HOTEL_CONTENT" name="FAC_HOTEL_CONTENT"  placeholder="시설 정보"></textarea>
	             </div>
             </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">추가 정보</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" rows="5" id="FAC_HOTEL_DETAIL" name="FAC_HOTEL_DETAIL" placeholder="추가 정보"></textarea>
                    </div>
                  </div>
                  
                  
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진</label>
                    
                    <div class="col-sm-10">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE">
                        <label class="custom-file-label" for="HOTEL_IMGS_FILE">Choose file</label>
                      </div>
                    </div>
         			</div>
         			
         			<div id="fileDiv">
         			<!-- 
		                   <div class="form-group row">
		                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진2</label>
		                    
		                    <div class="col-sm-10">
		                      <div class="custom-file">
		                        <input type="file" class="custom-file-input" id="HOTEL_IMGS_FILE" name="HOTEL_IMGS_FILE">
		                        <label class="custom-file-label" for="HOTEL_IMGS_FILE">Choose file</label>
		                      </div>
		                    </div>
		         			</div>
		         			
		         			 -->
                  	</div>
                  
                  
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
</div>
		
		
	<table align="center">
	<tr>
		<td>
			<input type="button" class="btn btn-block btn-outline-success" id="write" value="등록하기">
		</td>
		<td>
			<input type="submit" class="btn btn-block btn-outline-success"  id="addFile" value="이미지 추가">
		</td>
		<td>
			<input type="button" class="btn btn-block btn-outline-primary" id="list" value="목록으로" >
		</td>
	</tr>
	</table>


</div>
</div>    
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<!-- jQuery -->
<%@include file="/WEB-INF/include/script.jsp" %>

</body>
<script>
	var img_count = 1; //전역변수 선언(태그가 추가될 때마다 그 값을 1씩 증가시켜 name값이 계속 바뀜)

	$(document).ready(function() {
		$("#list").on("click", function(e) { //'목록으로'를 클릭하면
			e.preventDefault();
			fn_facList(); //fn_facList()함수 호출
		});
		
		$("#write").on("click", function(e) { //'등록하기'를 클릭하면
			e.preventDefault();
			fn_insertFac();//fn_insertFac()함수 호출
		});
		
		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});
	});

		function fn_insertFac(){
			//유효성 검사
			if($("#FAC_HOTEL_NAME").val() == "")
				{
				alert("부대시설명을 입력해주세요");
			} else if($("#FAC_HOTEL_LOCATION").val() == "") {
				alert("부대시설 위치를 입력해주세요");
			}else if($("#FAC_HOTEL_CONTENT").val() == "") {
				alert("시설정보를 입력해주세요");
			} else if($("#HOTEL_IMGS_FILE").val() == "") {
				alert("이미지를 1개 이상 업로드해주세요.");
			}
			else {
				alert("새 부대시설이 등록되었습니다.")
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/admin/newFacilities' />");
				comSubmit.submit();
				}

		}

	function fn_facList() {
		location.href = "<c:url value='/admin/facilitiesList'/>";
	}

	function fn_addFile() {
		while (img_count <= 4) { //파일 추가 개수 제한
			var str = "<tr><td><input type='file' name='HOTEL_IMGS_FILE_"
					+ (img_count++) + "'></td></tr>";

			var str = "<div class='form-group row'><label for='inputEmail3' class='col-sm-2 col-form-label'>사진2</label><div class='col-sm-10'><div class='custom-file'><input type='file' class='custom-file-input' id='HOTEL_IMGS_FILE' name='HOTEL_IMGS_FILE"
				+ (img_count++) + "'><label class='custom-file-label' for='HOTEL_IMGS_FILE'>Choose file</label></div></div></div>";
			$("#fileDiv").append(str);
		}
	}
</script>	

</body>
</html>