<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>

<title>객실 등록</title>
</head>

<style>
.form-group {
	width: 300px;
}

#ROOM_TYPE, #ROOM_NAME {
	width: 300px;
}

#ROOM_ADULT, #ROOM_CHILD {
	width: 120px;
}

#ROOM_CHK_INTIME, #ROOM_CHK_OUTTIME {
	width: 120px;
}

#fileDiv>input {
	display: block;
	margin-bottom: 10px;
}

.div-about {
	background-image: url(/hotel/image/hotel.jpg);
	height: 250px;
	color: #e5a880;
	background-repeat: no-repeat;
	background-size: 100%;
}

.newRoom_form>div {
	text-align: left;
}
</style>
<body class="hold-transition sidebar-mini layout-fixed"><!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/WEB-INF/include/navbar.jsp" %>
  
  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/include/sidebar.jsp" %>
  
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">'
  
<div class="card card-info">
	<div class="card-header">
    	<h3 class="card-title">공지사항 등록</h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->

<form id="frm"  name="frm" action="/hotel/admin/newRoom" enctype="multipart/form-data" method="post">
	<div style="width:100%; margin-top:50px;" align="center">
	<div align="center" style="width: 1070px;" class="newRoom_form">
	<div>
					<div style="float: left">
						<div class="form-group">
							<label for="ROOM_TYPE">객실 유형</label> <select class="form-control"
								id="ROOM_TYPE" name="ROOM_TYPE" size="1">
								<option value="">선택하세요</option>
								<option id="ROOM_TYPE" value="1">Business Double</option>
								<option id="ROOM_TYPE" value="2">Business Twin</option>
								<option id="ROOM_TYPE" value="3">Superior Double</option>
								<option id="ROOM_TYPE" value="4">Superior Twin</option>
								<option id="ROOM_TYPE" value="5">Drama Suite</option>
								<option id="ROOM_TYPE" value="6">Deluxe Suite</option>
								<option id="ROOM_TYPE" value="7">Premium Suite</option>
								<option id="ROOM_TYPE" value="8">Sienna Suite</option>
							</select>
						</div>
						
						
						
						<div class="form-group">
							<label for="ROOM_NAME">객실 호수</label> <input type="text"
								class="form-control" id="ROOM_ID" name="ROOM_ID"
								placeholder="ex)101">
						</div>
						<label>기준 인원</label><br> 성인 <select class="form-control"
							id="ROOM_ADULT" name="ROOM_ADULT" size="1">
							<option value="">선택하세요</option>
							<c:forEach var="i" begin="1" end="10">
								<option id="ROOM_ADULT" value="${i }">${i }</option>
							</c:forEach>
						</select> 아동 <select class="form-control" id="ROOM_CHILD" name="ROOM_CHILD"
							size="1">
							<option value="">선택하세요</option>
							<c:forEach var="i" begin="0" end="10">
								<option id="ROOM_CHILD" value="${i }">${i }</option>
							</c:forEach>
						</select>
						<div class="form-group">
							<div>
								<label>객실 내용</label><br>
								<textarea name="ROOM_CONTENT" rows="8" cols="50"></textarea>
							</div>
						</div>
					</div>

					<div style="float: left; margin-left: 100px;" class="form-group">
						<label>편의 시설</label><br> <input type="checkbox" id="fac1"
							name="fac1" value="유/무선 인터넷 무료 제공"> 유/무선 인터넷 무료 제공<br>
						<input type="checkbox" id="fac2" name="fac2" value="순면 목욕가운">
						순면 목욕가운<br> <input type="checkbox" id="fac3" name="fac3"
							value="슬리퍼 및 헤어드라이기"> 슬리퍼 및 헤어드라이기<br> <input
							type="checkbox" id="fac4" name="fac4" value="최고급 수입 라텍스 베개 및 린넨">
						최고급 수입 라텍스 베개 및 린넨<br> <input type="checkbox" id="fac5"
							name="fac5" value="생수 2병 제공 및 각종 티 서비스"> 생수 2병 제공 및 각종 티
						서비스<br> <input type="checkbox" id="fac6" name="fac6"
							value="최고급 비데 설치"> 최고급 비데 설치<br> <input
							type="checkbox" id="fac7" name="fac7" value="럭셔리 1회용 어메니티">
						럭셔리 1회용 어메니티<br> <input type="checkbox" id="fac8" name="fac8"
							value="1회용 어메니티"> 1회용 어메니티<br> <input
							type="checkbox" id="fac9" name="fac9" value="전 객실 냉난방 시설 구비">
						전 객실 냉난방 시설 구비<br> <input type="checkbox" id="fac10"
							name="fac10" value="객실 내 안전금고"> 객실 내 안전금고<br> <input
							type="checkbox" id="fac11" name="fac11" value="대형 원형욕조 구비">
						대형 원형욕조 구비<br>
						<div class="form-group" style="margin-top: 50px;">
							<div id="fileDiv">
								<label>객실 이미지 업로드</label>&nbsp;&nbsp;&nbsp;<input type="button"
									class="btn btn-default" id="addFile" value="파일추가"> <input
									type="file" id="ROOM_IMGS_FILE_0" name="ROOM_IMGS_FILE_0">
							</div>
						</div>
					</div>
				</div>
				<div style="float: left; margin-left: 50px;">
					<div class="form-group">
						<label for="ROOM_SIZE">객실 크기</label> <input type="text"
							class="form-control" id="ROOM_SIZE" name="ROOM_SIZE"
							placeholder="ex)15평">
					</div>
					<div class="form-group">
						<label for="ROOM_BEDTYPE">침대 유형</label> <select
							class="form-control" id="ROOM_BEDTYPE" name="ROOM_BEDTYPE"
							size="1">
							<option value="">선택하세요</option>
							<option id="ROOM_BEDTYPE" value="1 DOUBLE BED">1 DOUBLE
								BED</option>
							<option id="ROOM_BEDTYPE" value="2 SINGLE BED">2 SINGLE
								BED</option>
							<option id="ROOM_BEDTYPE" value="1 QUEEN SIZE BED">1
								QUEEN SIZE BED</option>
							<option id="ROOM_BEDTYPE" value="1 DOUBLE BED + 1 SINGLE BED">1
								DOUBLE BED + 1 SINGLE BED</option>
						</select>
					</div>
					<div class="form-group">
						<div style="display: inline;">
							<label for="ROOM_CHK_INTIME">체크인</label> <select
								class="form-control" id="ROOM_CHK_INTIME" name="ROOM_CHK_INTIME"
								size="1">
								<option value="">선택하세요</option>
								<option id="ROOM_CHK_INTIME" value="15:00">15:00</option>
								<option id="ROOM_CHK_INTIME" value="16:00">16:00</option>
								<option id="ROOM_CHK_INTIME" value="17:00">17:00</option>
								<option id="ROOM_CHK_INTIME" value="18:00">18:00</option>
							</select>
						</div>
						<div>
							<label for="ROOM_CHK_OUTTIME">체크아웃</label> <select
								class="form-control" id="ROOM_CHK_OUTTIME"
								name="ROOM_CHK_OUTTIME" size="1">
								<option value="">선택하세요</option>
								<option id="ROOM_CHK_OUTTIME" value="11:00">11:00</option>
								<option id="ROOM_CHK_OUTTIME" value="12:00">12:00</option>
								<option id="ROOM_CHK_OUTTIME" value="13:00">13:00</option>
								<option id="ROOM_CHK_OUTTIME" value="14:00">14:00</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="ROOM_PRICE">예약 금액</label> <input type="text"
							class="form-control" id="ROOM_PRICE" name="ROOM_PRICE"
							placeholder="ex)50000">
					</div>
				</div>

				
			</div>
			<div align="center">
					<div class="form-group">
						<button type="button" id="list" class="btn btn-default">목록으로</button>
						<button type="button" id="write" class="btn btn-primary">등록하기</button>
					</div>
				</div>
		</div>
	</form>
</div>
</div>    
</div>	
</div>	
</div>	
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	<!-- jQuery -->
	<%@include file="/WEB-INF/include/script.jsp" %>

</body>	


<script type="text/javascript">
	var img_count = 1; //전역변수 선언(태그가 추가될 때마다 그 값을 1씩 증가시켜 name값이 계속 바뀜)

	$(document).ready(function() {
		$("#list").on("click", function(e) { //'목록으로'를 클릭하면
			e.preventDefault();
			fn_roomsList(); //fn_roomsList()함수 호출
		});

		$("#write").on("click", function(e) { //'등록하기'를 클릭하면
			e.preventDefault();
			fn_insertRooms();//fn_insertRooms()함수 호출
		});

		$("#addFile").on("click", function(e) { //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});
	})

	function fn_roomsList() {
		location.href = "<c:url value='/admin/roomsList'/>";
	}

	function fn_insertRooms() { //유효성 검사
		if ($("#ROOM_TYPE").val() == "") {
			alert("객실 유형을 선택해주세요");
		} else if ($("#ROOM_NAME").val() == "") {
			alert("객실 이름을 입력해주세요");
		} else if ($("#ROOM_ADULT").val() == "" || $("#ROOM_CHILD").val() == "") {
			alert("기준인원을 선택해주세요");
		} else if ($("#fac1").is(":checked") == false
					&& $("#fac2").is(":checked") == false
					&& $("#fac3").is(":checked") == false
					&& $("#fac4").is(":checked") == false
					&& $("#fac5").is(":checked") == false
					&& $("#fac6").is(":checked") == false
					&& $("#fac7").is(":checked") == false
					&& $("#fac8").is(":checked") == false
					&& $("#fac9").is(":checked") == false
					&& $("#fac10").is(":checked") == false
					&& $("#fac11").is(":checked") == false) {
				alert("편의시설을 최소 1개이상 선택해주세요");
		} else if ($("#ROOM_SIZE").val() == "") {
			alert("객실크기를 입력해주세요");
		} else if ($("#ROOM_BEDTYPE").val() == "") {
			alert("침대유형을 선택해주세요");
		} else if ($("#ROOM_CHK_INTIME").val() == ""
				|| $("#ROOM_CHK_OUTTIME").val() == "") {
			alert("체크인/체크아웃 시간을 선택해주세요");
		} else if ($("#ROOM_PRICE").val() == "") {
			alert("예약금액을 선택해주세요");
		} //else if($("#ROOM_IMGS_FILE_0").val() == "") {
			//alert("이미지를 최소 1개 이상 입력해주세요");
			//} 
		else {
			alert("새 객실이 등록되었습니다.")
			$('#frm').submit();
			}
		}

	function fn_addFile() {
		if (img_count != 4) {
		var str = "<input type='file' id='ROOM_IMGS_FILE_"
				+ (img_count++) + "' name='ROOM_IMGS_FILE_"
				+ (img_count) + "'>";
			$("#fileDiv").append(str);
		}
	}
</script>


</html>