<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
$(function(){
	IMP.init('imp93503809'); //iamport 가맹점 식별코드" 입력
	var msg;
	IMP.request_pay({
		pg : 'kakaopay',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : 'Hotel Sienna',
		amount : '${param.ROOM_PRICE}',
	}, function(rsp) {
		if ( rsp.success ) { //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			jQuery.ajax({
				url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
				type: 'POST',
				dataType: 'json',
				data: {imp_uid : rsp.imp_uid} //기타 필요한 데이터가 있으면 추가 전달	
				}).done(function(data) {//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					if ( everythings_fine ) {
						msg = '결제가 완료되었습니다.';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);
					} else {
						//[3] 아직 제대로 결제가 되지 않았습니다.
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					}
				});
			//결제 성공시 이동할 페이지
			alert('결제 완료');
			location.href='<%=request.getContextPath()%>/reservation/main';
		} else { //사용자가 결제완료 전 팝업을 닫아 종료할 경우
			msg = rsp.error_msg; //msg = [결제포기] 사용자가 결제를 취소하셨습니다
			//실패시 이동할 페이지
			location.href="<%=request.getContextPath()%>/reservation/main";
			alert(msg);
		}
	});
});
</script>
 
</body>
</html>
