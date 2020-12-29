<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminCommon.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<meta charset="UTF-8">
<%@include file="/WEB-INF/include/mata.jsp" %>
<title>Add Room Details</title>
</head>

<style>
.form-group {width: 600px;}
#ROOM_TYPE, #ROOM_NAME, #ROOM_ADULT, #ROOM_CHILD, #ROOM_BEDTYPE, #ROOM_SIZE, #ROOM_PRICE{width: 150px;}
#fileDiv>input {display: block; margin-bottom: 10px;}
.newRoom_form>div {text-align: left;}
.checkbox {font-weight: 400;}
</style>

<body class="hold-transition sidebar-mini layout-fixed">
<!-- Site wrapper -->
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
    <h3 class="card-title">Add Room Details</h3>
    </div>
    <!-- /.card-header -->

<!-- form start -->
<form id="frm"  name="frm" action="/hotel/admin/newRoom" enctype="multipart/form-data" method="post">
<div class="card-body">

<div style="width:100%;" align="center">
	<div align="center" style="width: 100%;" class="newRoom_form">

<div>


<!--1st div  -->	
<div style="float: left; width:25%;">
	<div class="form-group">
		<label for="ROOM_TYPE">Room Type</label>
		<select class="form-control" id="ROOM_TYPE" name="ROOM_TYPE" size="1">
			<option id="ROOM_TYPE" value="Standard">Standard</option>
			<option id="ROOM_TYPE" value="Club Access">Club Access</option>
			<option id="ROOM_TYPE" value="Suite">Suite</option>
		</select>
	</div>
	
	<div class="form-group">
		<label for="ROOM_NAME">Room Name</label>
		<select class="form-control" id="ROOM_NAME" name="ROOM_NAME" size="1">
			<option id="ROOM_NAME" value="Superior Room">Superior Room</option>
			<option id="ROOM_NAME" value="Deluxe Room">Deluxe Room</option>
			<option id="ROOM_NAME" value="Suite Room">Suite Room</option>
			<option id="ROOM_NAME" value="Junior Suite Room">Junior Suite Room</option>
			<option id="ROOM_NAME" value="Deluxe Suite Room">Deluxe Suite Room</option>
			<option id="ROOM_NAME" value="Royal Suite Room">Royal Suite Room</option>
		</select>
	</div>
	
	<label>Capacity</label>
	<br>Base Adults (Max 3)
	<select class="form-control" id="ROOM_ADULT" name="ROOM_ADULT" size="1">
		<c:forEach var="i" begin="1" end="3">
			<option id="ROOM_ADULT" value="${i}">${i}</option>
		</c:forEach>
	</select>
	
	Base Children (Max 2)
	<select class="form-control" id="ROOM_CHILD" name="ROOM_CHILD" size="1">
		<c:forEach var="i" begin="0" end="2">
			<option id="ROOM_CHILD" value="${i}">${i}</option>
		</c:forEach>
	</select>
	<br>
	<div class="form-group">
	<div>
		<label>Room Description</label><br>
		<textarea name="ROOM_CONTENT" rows="6" cols="40"></textarea>
	</div>
	</div>
</div>

<!--2nd div -->	
<div style="float: left;  width:15%; margin-left: 60px;" class="form-group">
	<label>General Amenities</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_1" name="amty1_1" value="Flashlight">&nbsp;&nbsp;Flashlight
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_2" name="amty1_2" value="Slippers">&nbsp;&nbsp;Slippers
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_3" name="amty1_3" value="Telephone">&nbsp;&nbsp;Telephone
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_4" name="amty1_4" value="Electric Kettle">&nbsp;&nbsp;Electric Kettle
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_6" name="amty1_6" value="Shoe Horn">&nbsp;&nbsp;Shoe Horn
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_7" name="amty1_7" value="Shoe Cleaner">&nbsp;&nbsp;Shoe Cleaner
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_8" name="amty1_8" value="Minibar">&nbsp;&nbsp;Minibar<br>
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_9" name="amty1_9" value="37” LCD TV">&nbsp;&nbsp;37” LCD TV
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_10" name="amty1_10" value="42” LCD TV">&nbsp;&nbsp;42” LCD TV
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_11" name="amty1_11" value="55” LCD TV">&nbsp;&nbsp;55” LCD TV
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_12" name="amty1_12" value="55” UHD TV">&nbsp;&nbsp;55” UHD TV
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_13" name="amty1_13" value="Safe">&nbsp;&nbsp;Safe
		</label><br>
		
		<br><label>Bathroom Amenities</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_1" name="amty2_1" value="Free Toiletries">&nbsp;&nbsp;Free Toiletries
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_4" name="amty2_4" value="Bathrobe">&nbsp;&nbsp;Bathrobe
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_6" name="amty2_6" value="Hair Dryer">&nbsp;&nbsp;Hair Dryer
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_7" name="amty2_7" value="Whirlpool Tub">&nbsp;&nbsp;Whirlpool Tub
		</label><br>
</div>

<!--3rd div -->	
<div style="float: left;  width:25%;  margin-left: 60px;" class="form-group">
	<label>Other Amenities</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_2" name="amty3_2" value="Bottle of Water">&nbsp;&nbsp;Bottle of Water
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_3" name="amty3_3" value="Voicemail">&nbsp;&nbsp;Voicemail
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_4" name="amty3_4" value="Complementary Tea Service">&nbsp;&nbsp;Complementary Tea Service
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_5" name="amty3_5" value="Nespresso Coffee Machine">&nbsp;&nbsp;Nespresso Coffee Machine
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_6" name="amty3_6" value="Concierge">&nbsp;&nbsp;Concierge
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_7" name="amty3_7" value="Elevator">&nbsp;&nbsp;Elevator
		</label><br>	
	<br>
	<label>Special Features</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc1" name="svc1" value="Great View of the City">&nbsp;&nbsp;Great View of the City
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc3" name="svc3" value="Finess Center">&nbsp;&nbsp;Finess Center
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc5" name="svc5" value="Free Wifi">&nbsp;&nbsp;Free Wifi
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc6" name="svc6" value="Daily Housekeeping">&nbsp;&nbsp;Daily Housekeeping
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc7" name="svc7" value="클럽 라운지 혜택 무료 이용">&nbsp;&nbsp;Rooftop Lounge
		</label><br>	
</div>

</div>

<!--4th div -->			
<div style="float: left; margin-left: 60px; width:15%;">
	<div class="form-group">
		<label for="ROOM_SIZE">Room Size</label>
		<input type="text" class="form-control" id="ROOM_SIZE" name="ROOM_SIZE" placeholder="20m²">
	</div>
	<div class="form-group">
		<label for="ROOM_BEDTYPE">Bed Type</label>
		<select class="form-control" id="ROOM_BEDTYPE" name="ROOM_BEDTYPE" size="1">
			<option id="ROOM_BEDTYPE" value="Double">Double</option>
			<option id="ROOM_BEDTYPE" value="Twin">Twin</option>
			<option id="ROOM_BEDTYPE" value="Triple">Triple</option>
		</select>
	</div>
	<div class="form-group">
		<label for="ROOM_PRICE">Rate per Night</label>
		<input type="text" class="form-control" id="ROOM_PRICE" name="ROOM_PRICE" placeholder="50000">
	</div>
	<div id="fileDiv">
			<label>Room Pictures</label>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" id="addFile" value="Add Files">
			<input type="file" id="ROOM_IMGS_FILE_0" name="ROOM_IMGS_FILE_0">
	</div>	
</div>
		
	
</div>
</div>
</div>
</div>
<div align="center">
	<div class="form-group">
		<button type="button" id="list"  class="btn btn-default">목록으로</button>
		<button type="button" id="write" class="btn btn-primary">Submit</button>
	</div>
</div>
</form>
</div>
</div>    
</div>	
</div>
<%@ include file="/WEB-INF/include/footer.jsp"%>
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
		} else if ($("#ROOM_ID").val() == "") {
			alert("객실 호수를 입력해주세요");
		}/*  else if ($("#fac1").is(":checked") == false
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
		}  */
		  else if ($("#ROOM_SIZE").val() == "") {
			alert("객실 면적을 입력해주세요");
		} else if ($("#ROOM_BEDTYPE").val() == "") {
			alert("침대 타입을 선택해주세요");
		} else if ($("#ROOM_PRICE").val() == "") {
			alert("예약금액을 선택해주세요");
		}  else {
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