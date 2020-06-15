<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<title>객실목록 리스트</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.pop_type {
 border: none;
 font-family: nanum -webkit-pictograph;
}
.pop_div {
 margin: 5px 5px 5px 0;
 font-family: nanum -webkit-pictograph;
 font-size: 15px;
}
.pop_person {
width: 30px;
 border: none;
 font-family: nanum -webkit-pictograph;
 font-size: 20px;
 text-align: center;
}
.pop_ee {
border: none;
 font-family: nanum -webkit-pictograph;
 font-size: 20px;
 text-align: center;
}
.pop_tt {
width: 50px;
 border: none;
 font-family: nanum -webkit-pictograph;
 font-size: 20px;
 text-align: center;
}
.pop_fac {
 border: none;
 font-family: nanum -webkit-pictograph;
 font-size: 20px;
 text-align: left;
 width: 490px;
}
</style>
</head>

<body>

<h3>객실목록 리스트</h3>
	
	<table name="roomsList" class="table table-striped" align="center" width="800">
		<thead>
			<tr>
				<th>번호</th>
				<th>객실유형</th>
				<th>객실이름</th>
				<th>객실호수</th>
				<th>예약금액</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	<center>
		<a href="#this" class="btn" id="write" >등록</a>
	</center>
	
	<center>
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</center>
	
	<form  id="search"  method="post" >
            <select id="searchOption" size="1">
                <option id="ROOM_NAME" value="ROOM_NAME" selected="selected">객실이름</option>
                <option id="ROOM_ID" value="ROOM_ID">객실호수</option>
            </select>
            
                 <input type="text" size="16" name="keyword" value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" />
                 <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <input type="button" value="검 색" onClick="fn_roomsList(1)">
   	</form> 

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"><input type="text" id="pop_type" class="pop_type" readonly></h4>
				</div>
				<!--content //-->
				<div>
					<p class="ctxt mb20">
					<div style="width:100%; text-align:center;">
						<img id="pop_img" alt="main" width="500" height="450" src="">
					</div>
					<div class="pop_div">
						객실명 : <input type="text" id="pop_name" class="pop_ee" readonly>
					</div>
					<div class="pop_div">
						기준인원 : Adults: <input type="text" id="pop_adult"
							class="pop_person" readonly>, Children : <input
							type="text" id="pop_child" class="pop_person" readonly>
					</div>
					<div class="pop_div">
						객실 편의 시설 : <br>
						<textarea id="pop_fac" class="pop_fac" cols="20" rows="11" readonly></textarea>
					</div>
					<div class="pop_div">
						체크인 : <input type="text" id="pop_checkIn" class="pop_tt" readonly>,
						체크아웃 : <input type="text" id="pop_checkOut" class="pop_tt"
							readonly>
					</div>
					<div class="pop_div">
						<div>
							취소 정책
							<div>체크인 1일 17시 까지 50% 환불</div>
							<div>체크인 2일 17시 까지 80% 환불</div>
							<div>체크인 3일 17시 까지 100% 환불</div>
						</div>
					</div>
					</p>
				</div>
				<!--// content-->
				<div class="modal-footer">
					<input type="hidden" id="room_id">
					<button type="button" class="btn btn-primary" id="Modify">Modify</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="/WEB-INF/include/include-body.jspf" %>		

	<script>
	var room_id; //수정클릭 시 방 호수 가져오기위해 전역변수 선언
	
		$(document).ready(function() {
			fn_roomsList(1);

			$("#write").on("click", function(e) { //'등록'을 클릭하면
				e.preventDefault();
				fn_roomsWrite(); //fn_roomsWrite()함수 호출
			});
		});

		function enterkey() { //검색창에서 엔터 누르면 실행
			if (window.event.keyCode == 13) {
				fn_roomsList(1);
			}
		}

		function fn_roomsWrite() { //등록 클릭시
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/newRoomForm'/>");
			comSubmit.submit();
		}

		 function fn_roomsDetail(obj){ //부대시설명 클릭시
			room_id = obj.parent().find("#ROOM_ID").val();
	    	var index = obj.parent().find("#ROOM_IMGS_FILE").val();
	    	alert(index);
	    	var index_0 = index.split(',');
	    	var name = obj.parent().find("#ROOM_TYPE_NAME").val();
	    	var fac_detail = obj.parent().find("#ROOM_FAC_NAME").val().replace(/br/g,'\r\n');
	    	var adult = obj.parent().find("#ROOM_ADULT").val();
	    	var child = obj.parent().find("#ROOM_CHILD").val();
	    	var checkIn = obj.parent().find("#ROOM_CHK_INTIME").val();
	    	var checkOut = obj.parent().find("#ROOM_CHK_OUTTIME").val();
	    	$('#pop_type').attr('value',name);
	    	$('#pop_img').attr('src',"/hotel/image/"+index_0[0]);
	    	$('#pop_name').attr('value',name);
	    	$('#pop_fac').val(fac_detail);
	    	$('#pop_adult').attr('value',adult);
	    	$('#pop_child').attr('value',child);
	    	$('#pop_checkIn').attr('value',checkIn);
	    	$('#pop_checkOut').attr('value',checkOut);
	    	$('#room_id').attr('value',room_id);
	    	

	    	
		 }

		function fn_roomsList(pageNo) { //페이징 함수
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectRoomsList' />");
			comAjax.setCallback("fn_roomsListCallback"); //ajax요청 후 호출될 함수의 이름 지정
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("searchOption", $(
					"#searchOption > option:selected").val());
			comAjax.addParam("keyword", $("input[name='keyword']").val());
			comAjax.ajax(); //실질적인 ajax기능 수행
		}

		function fn_roomsListCallback(data) { //콜백함수
			var total = data.TOTAL;
			var body = $("table[name='roomsList'] > tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr><td colspan='5'>조회된 결과가 없습니다.</td></tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_roomsList",
					recordCount : 10
				};
				gfn_renderPaging(params);

				var str = "";
				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.RNUM
											+ "</td>"
											+ "<td>"
											+ value.ROOM_TYPE_NAME
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title' data-toggle='modal' data-target='#myModal'>"
											+ "<input type='hidden' id='ROOM_ID' name='title' value=\"" + value.ROOM_ID + "\">"
											+ "<input type='hidden' id='ROOM_TYPE' name='type' value=\"" + value.ROOM_TYPE + "\">"
											+ "<input type='hidden' id='ROOM_TYPE_NAME' name='type' value=\"" + value.ROOM_TYPE_NAME + "\">"
											+ "<input type='hidden' id='ROOM_FAC_NAME' name='type' value=\"" + value.ROOM_FAC_NAME + "\">"
											+ "<input type='hidden' id='ROOM_ADULT' name='type' value=\"" + value.ROOM_ADULT + "\">"
											+ "<input type='hidden' id='ROOM_CHILD' name='type' value=\"" + value.ROOM_CHILD + "\">"
											+ "<input type='hidden' id='ROOM_CHK_INTIME' name='type' value=\"" + value.ROOM_CHK_INTIME + "\">"
											+ "<input type='hidden' id='ROOM_CHK_OUTTIME' name='type' value=\"" + value.ROOM_CHK_OUTTIME + "\">"
											+ "<input type='hidden' id='ROOM_IMGS_FILE' name='type' value=\"" + value.ROOM_IMGS_FILE + "\">"
											+ value.ROOM_NAME + "</a></td>"
											+ "<td id='id'>" + value.ROOM_ID + "</td>"
											+ "<td>" + value.ROOM_PRICE
											+ "</td>" + "</tr>";
								});
				
				//이거 넣어야 데이터 들어감
				body.append(str);
				
				$("a[name='title']").on("click", function(e){
					e.preventDefault();
					fn_roomsDetail($(this));
				});
			}
		}
    	$("#Modify").on("click", function(e){
			e.preventDefault();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/modifyRoomForm' />");
			comSubmit.addParam("ROOM_ID", room_id);
			comSubmit.submit();
		});
	  
	</script>

</body>

</html>