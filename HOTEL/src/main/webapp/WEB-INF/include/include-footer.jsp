<%@ page language="java" pageEncoding="utf-8"%>
<style>
#footer {
	border-top: 4px solid #FF4F00;
	position: relative;
	clear: both;
	zoom: 1;
	background: #192a39;
	color: White;
	font-size: 12px;
}

.main_common {
	display: inline-block;
	width: 300px;
	vertical-align: top;
	border: 1px solid #192a39;
	margin-left: 50px;
	margin-top: 15px;
}

.imge {
	display: inline-block;
	margin-left: 10px;
}
</style>
<!-- 하단정보 시작 -->

<div id="footer">
	<div class="location_wrap">
		<div class="main">
			<div class="imge">
				<p>
					<img src="<c:url value='/image/SIENNA-FOOT.PNG'/>"
						style="width: 150px; height: 100px">
				</p>
			</div>
			<div class="main_1 main_common">

				<p>
					우편번호: 10908<br> 주소: 경기도 파주시 야당동 소리천로 31<br> (야당동
					1081-2번지)
				</p>
				<p>대표자:홍길동</p>
			</div>
			<div class="main_2 main_common">
				<p>객실예약문의번호 :031-943-7260/031.943.7260</p>
				<p>기업체제휴문의 :031-943-7255</p>
				<p>FAX : 031 943 7277</p>
			</div>
		</div>
	</div>
	<!--메인 location 끝-->
	<footer>
		<p>Copyright © 2017 HOTEL SIENNA. All rights reserved.</p>
	</footer>
	<!--푸터 끝-->
	<script>
/* 		$(document).ready(function() {
			headerMain();
		}) */
	</script>
</div>
<!--// 라인업 끝 -->

