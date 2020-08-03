<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 수정</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/adminCommon.css'/>" />
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
</style>
<body>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<div class="div-about" align="center">
	</div>
	<h3 align="center">객실정보 수정</h3>
	<form id="frm" name="frm" action="/hotel/admin/modifyRoom"
		enctype="multipart/form-data" method="post">
		<div style="width: 100%; margin-top: 50px;" align="center">
			<div align="center" style="width: 1070px;" class="newRoom_form">
				<div>
					<div style="float: left">
						<div class="form-group">
							<label for="ROOM_TYPE">객실 유형</label> 
							<select class="form-control" id="ROOM_TYPE" name="ROOM_TYPE" size="1">
								<c:set var="room_type" value="${map.ROOM_TYPE}" />
								<option value="">선택하세요</option>
								<option id="ROOM_TYPE" value="1" <c:if test="${room_type eq 'Business Double'}">selected</c:if>>Business Double</option>
								<option id="ROOM_TYPE" value="2" <c:if test="${room_type eq 'Business Twin'}">selected</c:if>>Business Twin</option>
								<option id="ROOM_TYPE" value="3" <c:if test="${room_type eq 'Superior Double'}">selected</c:if>>Superior Double</option>
								<option id="ROOM_TYPE" value="4" <c:if test="${room_type eq 'Superior Twin'}">selected</c:if>>Superior Twin</option>
								<option id="ROOM_TYPE" value="5" <c:if test="${room_type eq 'Drama Suite'}">selected</c:if>>Drama Suite</option>
								<option id="ROOM_TYPE" value="6" <c:if test="${room_type eq 'Deluxe Suite'}">selected</c:if>>Deluxe Suite</option>
								<option id="ROOM_TYPE" value="7" <c:if test="${room_type eq 'Premium Suite'}">selected</c:if>>Premium Suite</option>
								<option id="ROOM_TYPE" value="8" <c:if test="${room_type eq 'Sienna Suite'}">selected</c:if>>Sienna Suite</option>
							</select>
						</div>
						<div class="form-group">
							<label for="ROOM_NAME">객실 호수</label> <input type="text"
								class="form-control" id="ROOM_ID" name="ROOM_ID"
								placeholder="ex)101" value="${map.ROOM_ID }">
						</div>
						<label>기준 인원</label><br> 성인 <select class="form-control"
							id="ROOM_ADULT" name="ROOM_ADULT" size="1">
							<option value="">선택하세요</option>
							<c:set var="room_adult" value="${map.ROOM_ADULT }" />
							<c:forEach var="i" begin="1" end="10">
								<option id="ROOM_ADULT" value="${i }"
									<c:if test="${i == room_adult}">selected</c:if>>${i }</option>
							</c:forEach>
						</select> 아동 <select class="form-control" id="ROOM_CHILD" name="ROOM_CHILD"
							size="1">
							<option value="">선택하세요</option>
							<c:set var="room_child" value="${map.ROOM_CHILD }" />
							<c:forEach var="i" begin="0" end="10">
								<option id="ROOM_CHILD" value="${i }"
									<c:if test="${i == room_child}">selected</c:if>>${i }</option>
							</c:forEach>
						</select>
						<div class="form-group">
							<div>
								<label>객실 내용</label><br>
								<textarea name="ROOM_CONTENT" rows="6" cols="50">${map.ROOM_CONTENT}</textarea>
							</div>
						</div>
					</div>

					<div style="float: left; margin-left: 100px;" class="form-group">
						<c:set var="fac" value="${map.ROOM_FAC_NAME}" />
						<label>편의 시설</label><br> <input type="checkbox" id="fac1"
							name="fac1" value="유/무선 인터넷 무료 제공"
							<c:forTokens var="fac_name" items="${fac }" delims=",">
	      <c:if test="${fac_name eq '유/무선 인터넷 무료 제공'}">checked</c:if>
	      </c:forTokens>>유/무선
						인터넷 무료 제공<br> <input type="checkbox" id="fac2" name="fac2"
							value="순면 목욕가운"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '순면 목욕가운'}">checked</c:if>
	      </c:forTokens>>순면
						목욕가운<br> <input type="checkbox" id="fac3" name="fac3"
							value="슬리퍼 및 헤어드라이기"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '슬리퍼 및 헤어드라이기'}">checked</c:if>
	      </c:forTokens>>슬리퍼
						및 헤어드라이기<br> <input type="checkbox" id="fac4" name="fac4"
							value="최고급 수입 라텍스 베개 및 린넨"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '최고급 수입 라텍스 베개 및 린넨'}">checked</c:if>
	      </c:forTokens>>최고급
						수입 라텍스 베개 및 린넨<br> <input type="checkbox" id="fac5"
							name="fac5" value="생수 2병 제공 및 각종 티 서비스"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '생수 2병 제공 및 각종 티 서비스'}">checked</c:if>
	      </c:forTokens>>생수
						2병 제공 및 각종 티 서비스<br> <input type="checkbox" id="fac6"
							name="fac6" value="최고급 비데 설치"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '최고급 비데 설치'}">checked</c:if>
	      </c:forTokens>>최고급
						비데 설치<br> <input type="checkbox" id="fac7" name="fac7"
							value="럭셔리 1회용 어메니티"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '럭셔리 1회용 어메니티'}">checked</c:if>
	      </c:forTokens>>럭셔리
						1회용 어메니티<br> <input type="checkbox" id="fac8" name="fac8"
							value="1회용 어메니티"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '1회용 어메니티'}">checked</c:if>
	      </c:forTokens>>1회용
						어메니티<br> <input type="checkbox" id="fac9" name="fac9"
							value="전 객실 냉난방 시설 구비"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '전 객실 냉난방 시설 구비'}">checked</c:if>
	      </c:forTokens>>전
						객실 냉난방 시설 구비<br> <input type="checkbox" id="fac10"
							name="fac10" value="객실 내 안전금고"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '객실 내 안전금고'}">checked</c:if>
	      </c:forTokens>>객실
						내 안전금고<br> <input type="checkbox" id="fac11" name="fac11"
							value="대형 원형욕조 구비"
							<c:forTokens var="fac_name" items="${fac }" delims=","> 
	      <c:if test="${fac_name eq '대형 원형욕조 구비'}">checked</c:if>
	      </c:forTokens>>대형
						원형욕조 구비<br>
						<div class="form-group" style="margin-top: 50px;">
							<div id="fileDiv">
								<label>객실 이미지 업로드</label>
								<c:forEach var="row" items="${list }" varStatus="var">
									<!-- varStatus: 상태용 변수로 for문이 돌아가는 상태를 알게 해주는 변수 -->
									<p>
										<!-- 숨김 처리 -->
										<input type="hidden" id="ROOM_ID" name="IDX_${var.index}"
											value="${row.ROOM_ID }"> <input type="hidden"
											id="ROOM_IMGS_ID" name="ROOM_IMGS_ID_${var.index}"
											value="${row.ROOM_IMGS_ID }"> <input type="hidden"
											id="OLD_FILE_NAME" name="OLD_FILE_NAME_${var.index}"
											value="${row.ROOM_IMGS_FILE}">
										<!-- 파일명 출력  -->
										<a href="#this" id="name_${var.index}"
											name="name_${var.index}">${row.ROOM_IMGS_FILE}</a>

										<!-- 파일 등록 -->
										<input type="file" id="file_${var.index}"
											name="file_${var.index}">
									</p>

								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div style="float: left; margin-left: 50px;">
					<div class="form-group">
						<label for="ROOM_SIZE">객실 크기</label> <input type="text"
							class="form-control" id="ROOM_SIZE" name="ROOM_SIZE"
							placeholder="ex)15평" value="${map.ROOM_SIZE}">
					</div>
					<div class="form-group">
						<label for="ROOM_BEDTYPE">침대 유형</label> <select
							class="form-control" id="ROOM_BEDTYPE" name="ROOM_BEDTYPE"
							size="1">
							<option value="">선택하세요</option>
							<option id="ROOM_BEDTYPE" value="1 DOUBLE BED"
								<c:if test="${map.ROOM_BEDTYPE eq '1 DOUBLE BED'}">selected</c:if>>1
								DOUBLE BED</option>
							<option id="ROOM_BEDTYPE" value="2 SINGLE BED"
								<c:if test="${map.ROOM_BEDTYPE eq '2 SINGLE BED'}">selected</c:if>>2
								SINGLE BED</option>
							<option id="ROOM_BEDTYPE" value="1 QUEEN SIZE BED"
								<c:if test="${map.ROOM_BEDTYPE eq '1 QUEEN SIZE BED'}">selected</c:if>>1
								QUEEN SIZE BED</option>
							<option id="ROOM_BEDTYPE" value="1 DOUBLE BED + 1 SINGLE BED"
								<c:if test="${map.ROOM_BEDTYPE eq '1 DOUBLE BED + 1 SINGLE BED'}">selected</c:if>>1
								DOUBLE BED + 1 SINGLE BED</option>
						</select>
					</div>
					<div class="form-group">
						<div style="display: inline;">
							<label for="ROOM_CHK_INTIME">체크인</label> <select
								class="form-control" id="ROOM_CHK_INTIME" name="ROOM_CHK_INTIME"
								size="1">
								<option value="">선택하세요</option>
								<option id="ROOM_CHK_INTIME" value="15:00"
									<c:if test="${map.ROOM_CHK_INTIME eq '15:00'}">selected</c:if>>15:00</option>
								<option id="ROOM_CHK_INTIME" value="16:00"
									<c:if test="${map.ROOM_CHK_INTIME eq '16:00'}">selected</c:if>>16:00</option>
								<option id="ROOM_CHK_INTIME" value="17:00"
									<c:if test="${map.ROOM_CHK_INTIME eq '17:00'}">selected</c:if>>17:00</option>
								<option id="ROOM_CHK_INTIME" value="18:00"
									<c:if test="${map.ROOM_CHK_INTIME eq '18:00'}">selected</c:if>>18:00</option>
							</select>
						</div>
						<div>
							<label for="ROOM_CHK_OUTTIME">체크아웃</label> <select
								class="form-control" id="ROOM_CHK_OUTTIME"
								name="ROOM_CHK_OUTTIME" size="1">
								<option value="">선택하세요</option>
								<option id="ROOM_CHK_OUTTIME" value="11:00"
									<c:if test="${map.ROOM_CHK_OUTTIME eq '11:00'}">selected</c:if>>11:00</option>
								<option id="ROOM_CHK_OUTTIME" value="12:00"
									<c:if test="${map.ROOM_CHK_OUTTIME eq '12:00'}">selected</c:if>>12:00</option>
								<option id="ROOM_CHK_OUTTIME" value="13:00"
									<c:if test="${map.ROOM_CHK_OUTTIME eq '13:00'}">selected</c:if>>13:00</option>
								<option id="ROOM_CHK_OUTTIME" value="14:00"
									<c:if test="${map.ROOM_CHK_OUTTIME eq '14:00'}">selected</c:if>>14:00</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="ROOM_PRICE">예약 금액</label> <input type="text"
							class="form-control" id="ROOM_PRICE" name="ROOM_PRICE"
							placeholder="ex)50000" value="${map.ROOM_PRICE }">
					</div>
				</div>


			</div>
			<div align="center">
				<div class="form-group">
					<button type="button" id="list" class="btn">목록으로</button>
					<button type="button" id="modify" class="btn">수정하기</button>
					<button type="button" id="delete" class="btn">삭제하기</button>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			// select checked 를 위한 ',' 나누기
			var fac = "${map.ROOM_FAC_NAME}";
			var fac_name = fac.split(",");

			$("#list").on("click", function(e) { //'목록으로' 누르면
				e.preventDefault();
				location.href = "<c:url value='/admin/roomsList'/>";
			});

			$("#modify").on("click", function(e) { //'수정하기' 누르면
				e.preventDefault();
				fn_roomModify();
			});
			$("#delete").on("click", function(e) { //'삭제하기' 누르면
				e.preventDefault();
				fn_roomDelete();
			});
		});

		function fn_roomModify() {

			//유효성 검사
			if ($("#ROOM_TYPE").val() == "") {
				alert("객실 유형을 선택해주세요");
			} else if ($("#ROOM_NAME").val() == "") {
				alert("객실 이름을 입력해주세요");
			} else if ($("#ROOM_ADULT").val() == ""
					|| $("#ROOM_CHILD").val() == "") {
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
				alert("객실이 수정되었습니다.")
				$('#frm').submit();
			}
		}

		function fn_roomDelete() {
			if (confirm("삭제하시겠습니까?") == true) {
				alert("삭제되었습니다.");
				$("#frm").attr("action", "/hotel/admin/deleteRoom");
				$('#frm').submit();
			} else {
				return;
			}
		}
	</script>

</body>
</html>