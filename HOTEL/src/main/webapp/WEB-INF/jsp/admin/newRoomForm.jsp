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
<title>객실 등록</title>
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
    <h3 class="card-title">객실 등록</h3>
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
		<label for="ROOM_TYPE">객실 타입</label>
		<select class="form-control" id="ROOM_TYPE" name="ROOM_TYPE" size="1">
			<option id="ROOM_TYPE" value="스탠다드">스탠다드</option>
			<option id="ROOM_TYPE" value="클럽 플로어">클럽 플로어</option>
			<option id="ROOM_TYPE" value="스위트">스위트</option>
		</select>
	</div>
	
	<div class="form-group">
		<label for="ROOM_NAME">객실명</label>
		<select class="form-control" id="ROOM_NAME" name="ROOM_NAME" size="1">
			<option id="ROOM_NAME" value="슈페리어 룸">슈페리어 룸</option>
			<option id="ROOM_NAME" value="디럭스 룸">디럭스 룸</option>
			<option id="ROOM_NAME" value="스위트">스위트</option>
			<option id="ROOM_NAME" value="주니어 스위트 룸">주니어 스위트 룸</option>
			<option id="ROOM_NAME" value="디럭스 스위트 룸">디럭스 스위트 룸</option>
			<option id="ROOM_NAME" value="로얄 스위트 룸">로얄 스위트 룸</option>
		</select>
	</div>
	
	<label>기준 인원</label>
	<br>성인
	<select class="form-control" id="ROOM_ADULT" name="ROOM_ADULT" size="1">
		<c:forEach var="i" begin="1" end="3">
			<option id="ROOM_ADULT" value="${i}">${i}</option>
		</c:forEach>
	</select>
	
	어린이
	<select class="form-control" id="ROOM_CHILD" name="ROOM_CHILD" size="1">
		<c:forEach var="i" begin="0" end="2">
			<option id="ROOM_CHILD" value="${i}">${i}</option>
		</c:forEach>
	</select>
	<br>
	<div class="form-group">
	<div>
		<label>객실 설명</label><br>
		<textarea name="ROOM_CONTENT" rows="6" cols="40"></textarea>
	</div>
	</div>
</div>

<!--2nd div -->	
<div style="float: left;  width:15%; margin-left: 60px;" class="form-group">
	<label>일반 어메니티</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_1" name="amty1_1" value="손전등">&nbsp;&nbsp;손전등
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_2" name="amty1_2" value="슬리퍼">&nbsp;&nbsp;슬리퍼
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_3" name="amty1_3" value="전화기">&nbsp;&nbsp;전화기
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_4" name="amty1_4" value="티포트">&nbsp;&nbsp;티포트
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_5" name="amty1_5" value="금고">&nbsp;&nbsp;금고
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_6" name="amty1_6" value="구둣주걱">&nbsp;&nbsp;구둣주걱
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_7" name="amty1_7" value="구두클리너">&nbsp;&nbsp;구두클리너
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_8" name="amty1_8" value="미니바">&nbsp;&nbsp;미니바<br>
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
			<input type="checkbox" class="checkbox" id="amty1_13" name="amty1_13" value="객실 내 안전금고">&nbsp;&nbsp;객실 내 안전금고
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
			<input type="checkbox" class="checkbox" id="amty1_14" name="amty1_14" value="대형 원형욕조 구비">&nbsp;&nbsp;빔프로젝터<br>
		</label><br>
		
		<br><label>욕실 어메니티</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_1" name="amty2_1" value="욕실용품(몰튼브라운)">&nbsp;&nbsp;욕실용품(몰튼브라운)
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_2" name="amty2_2" value="1회용 칫솔 및 치약">&nbsp;&nbsp;1회용 칫솔 및 치약
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_3" name="amty2_3" value="면도기">&nbsp;&nbsp;면도기
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_4" name="amty2_4" value="목욕가운">&nbsp;&nbsp;목욕가운
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_5" name="amty2_5" value="비데">&nbsp;&nbsp;비데
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_6" name="amty2_6" value="헤어 드라이어">&nbsp;&nbsp;헤어 드라이어
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty2_7" name="amty2_7" value="월풀">&nbsp;&nbsp;월풀
		</label><br>
</div>

<!--3rd div -->	
<div style="float: left;  width:25%;  margin-left: 60px;" class="form-group">
	<label>기타 어메니티</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_1" name="amty3_1" value="케이블/위성 TV 채널">&nbsp;&nbsp;케이블/위성 TV 채널
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_2" name="amty3_2" value="무료 생수 1일 2병">&nbsp;&nbsp;무료 생수 1일 2병
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_3" name="amty3_3" value="보이스 메일 서비스">&nbsp;&nbsp;보이스 메일 서비스
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_4" name="amty3_4" value="무료 차(TEA) 서비스">&nbsp;&nbsp;무료 차(TEA) 서비스
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_5" name="amty3_5" value="네스프레소 커피 머신">&nbsp;&nbsp;네스프레소 커피 머신
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_6" name="amty3_6" value="개인 버틀러 서비스">&nbsp;&nbsp;개인 버틀러 서비스
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="amty3_7" name="amty3_7" value="전용 엘리베이터 운영">&nbsp;&nbsp;전용 엘리베이터 운영
		</label><br>	
	<br>
	<label>특별 서비스</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc1" name="svc1" value="서울 시내 중심에서 스카이라인을 감상할 수 있는 객실">&nbsp;&nbsp;서울 시내 중심에서 스카이라인을 감상할 수 있는 객실
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc2" name="svc2" value="해온 베딩 시스템: 최상의 숙면을 위한 침대 및 침구류">&nbsp;&nbsp;해온 베딩 시스템: 최상의 숙면을 위한 침대 및 침구류
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc3" name="svc3" value="피트니스 센터 (수영장 포함) 무료 이용">&nbsp;&nbsp;피트니스 센터 (수영장 포함) 무료 이용
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc4" name="svc4" value="맞춤형 베개 제공">&nbsp;&nbsp;맞춤형 베개 제공
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc5" name="svc5" value="전 객실 초고속 무료 인터넷 (유선, 와이파이)">&nbsp;&nbsp;전 객실 초고속 무료 인터넷 (유선, 와이파이)
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc6" name="svc6" value="턴다운 서비스 제공">&nbsp;&nbsp;턴다운 서비스 제공
		</label><br>
		<label class="checkbox" style="font-weight: 400;">
		<input type="checkbox" id="svc7" name="svc7" value="클럽 라운지 혜택 무료 이용">&nbsp;&nbsp;클럽 라운지 혜택 무료 이용
		</label><br>	
</div>

</div>

<!--4th div -->			
<div style="float: left; margin-left: 60px; width:15%;">
	<div class="form-group">
		<label for="ROOM_SIZE">객실 면적</label>
		<input type="text" class="form-control" id="ROOM_SIZE" name="ROOM_SIZE" placeholder="20m²">
	</div>
	<div class="form-group">
		<label for="ROOM_BEDTYPE">침대 타입</label>
		<select class="form-control" id="ROOM_BEDTYPE" name="ROOM_BEDTYPE" size="1">
			<option id="ROOM_BEDTYPE" value="더블">더블</option>
			<option id="ROOM_BEDTYPE" value="트윈">트윈</option>
		</select>
	</div>
	<div class="form-group">
		<label for="ROOM_PRICE">예약 금액</label>
		<input type="text" class="form-control" id="ROOM_PRICE" name="ROOM_PRICE" placeholder="50000">
	</div>
	<div id="fileDiv">
			<label>객실 이미지</label>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" id="addFile" value="파일추가">
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
		<button type="button" id="write" class="btn btn-primary">등록하기</button>
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