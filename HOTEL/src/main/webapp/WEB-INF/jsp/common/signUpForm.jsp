<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("joinCode", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>


<style>
.signUpText {
	width: 648px;
	heigth: 300px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	padding-bottom: 40px;
}
.stepbox {
color: #333; font-size: 16px; line-height: 1.6;
word-break: keep-all; font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif; letter-spacing: -1px;
-webkit-font-smoothing: antialiased; outline: 0; margin: 0 auto; min-width: 350px;
padding: 0 15px; max-width: 760px;
}

.stepbox__wrap col-3 {
color: #333;
font-size: 16px;
line-height: 1.6;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
padding: 0;
list-style: none;

}

.inner {line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
position: relative;
color: #fff;
height: 50px;
padding: 12px 10px;
background-color: #998465;
}

.inner_n {line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
position: relative;
color: #fff;
height: 50px;
padding: 12px 10px;
background-color: #ccc;
}

.stepbox__list {
color: #333;
line-height: 1.6;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0 auto;
list-style: none;
float: left;
font-size: 18px;
text-align: center;
padding: 0 1px;
width: 31%;
}

.text {
line-height: 1.6;
list-style: none;
font-size: 18px;
text-align: center;
color: #fff;
word-break: keep-all;
font-family: "Open Sans",Noto-lang-Regular,NotoKR-Regular,"Malgun Gothic",sans-serif;
box-sizing: border-box;
letter-spacing: -1px;
-webkit-font-smoothing: antialiased;
outline: 0;
margin: 0;
padding: 0;
display: inline-block;
}

.contents {
	width: 100%;
	float: left;
	text-align: center;
	font-size: 1.875em;
	color: #444;
	margin-bottom: 50px;
}

.myForm-group {
	width: 700px;
	height: 800px;
	margin: 0 auto;
	margin-top: 80px;
}

.form-control {
	width: 690px;
	height: 55px;
}

#MEM_EMAIL {
	width: 325px;
}

#email_check {
	display: block;
}

#isCheck_Email {
	width: 70px;
}
.buttons {
width:345px;
height:55px;
border-color: #ad9e87;
border:none;
background-color: #ad9e87;
color: #fff;
}
.box {
width: 800px;
height: 1000px;
margin: 0 auto;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
	<form id="signUp" method="POST" action="/hotel/signUpComplete">
	<div class="signUpText">
		<h3 style="margin-top: 100px;">Join Latte Honors</h3>
	</div>
		
	<div class="box">	
        <div class="stepbox">
           <ol class="stepbox__wrap col-3">
                <li class="stepbox__list">
                    <div class="inner_n">
                        <p class="text">Step 1</p>
                    </div>
                </li>
                <li class="stepbox__list">
                    <div class="inner">
                        <p class="text">Step 2</p>
                    </div>
                </li>
                <li class="stepbox__list">
                    <div class="inner_n">
                        <p class="text">Step 3</p>
                    </div>
                </li>
            </ol>          
        </div>
        <br><br><br>
		

		<div class="myForm-group">
			
			<div class="form-group">
				<label for="MEM_NAME">성명 (국문)</label> <input type="text"
					class="form-control" id="MEM_NAME" name="MEM_NAME">
			<div id="name_check"></div>
			</div>
			
			<div class="form-inline">
				<label for="MEM_NAME_EN">성명 (영문)</label>
				<br>
					<input type="text" id="MEM_LN_EN" name="MEM_LN_EN" placeholder="First name" class="form-control" style="width: 340px; height: 55px" >
					<input type="text" id="MEM_FN_EN" name="MEM_FN_EN" placeholder="Last name" class="form-control" style="width: 350px; height: 55px">
			</div>
			
			
			<div class="form-group">
				<label for="MEM_USERID">ID *</label> <input type="text"
					class="form-control" id="MEM_USERID" name="MEM_USERID">
			<div id="id_check"></div><!-- 유효성 체크 -->
			</div>
			<input type="hidden" id="isCheck" value="0">
			
			<div class="form-group">
				<label for="pw1">Password *</label> <input type="password"
					class="form-control" id="pw1" name="MEM_PW">
			<div id="pw1_check"></div><!-- 유효성 체크 -->
			</div>
			
			<div class="form-group">
				<label for="pw2">Re-enter password *</label> <input type="password"
					class="form-control" id="pw2">
			<div id="pw2_check"></div>
			</div>
			
			<div class="form-group">
				<label for="MEM_PHONE">Mobile number (띄어쓰기 없이 '-'를 생략한 형식으로 입력하세요.)</label> <input type="text"
					class="form-control" id="MEM_PHONE" name="MEM_PHONE">
			<div id="phone_check"></div>
			</div>
			
			
			<div class="form-group">
				<label for="MEM_EMAIL">Email *</label>
				<div class="form-inline">
					<input type="email" class="form-control" id="MEM_EMAIL"
						name="MEM_EMAIL" placeholder="example@gmail.com" style="width:610px;">
					<button type="button" class="btn btn-default" id="isCheck_Email" style="width:80px; height: 55px;">인증</button>
				</div>
			<div id="email_check"></div>
			</div>
		
			<div id="isCheck_EmailForm" class="form-group">
				<label for="MEM_EMAIL">Enter verification code.</label>
				<div class="form-inline">
					<input type="text" class="form-control" id="emailAuth"
						name="emailAuth" placeholder="인증번호를 입력하세요." style="width:610px;">
					<button type="button" class="btn btn-default" id="isAuth" style="width:80px; height: 55px;">확인</button>
					<input type="hidden" id="isEmailAuth" value="0">
				</div>
			</div>
			
			<button type="button" id="main" class="buttons" onclick="location.href='/hotel/signUpTerms'">이전</button>
			<input type="submit" id="signUpBtn" class="buttons" onclick="fn_signUp(); return false;" value="Continue">
		</div>
	</div>
	</form>
	
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	
	
<script>
	$(document).on("click", "#signUpBtn", function(){
	    //alert('클릭됨');
	});
	
	function fn_signUp() {
		if ($("#MEM_USERID").val().length < 1) {
			alert("아이디를 입력해주세요.");
		} else if ($("#MEM_NAME").val().length < 1) {
			alert("이름을 입력해주세요.");
		} else if ($("#pw1").val().length < 1) {
			alert("사용하실 비밀번호를 입력해주세요.");
		} else if ($("#pw2").val().length < 1) {
			alert("사용하실 비밀번호를 입력해주세요.");
		} else if ($("#MEM_PHONE").val().length < 1) {
			alert("전화번호를 입력해주세요.");
		} else if ($("#MEM_EMAIL").val().length < 1) {
			alert("이메일을 입력해주세요.");
		} else if ($("#isCheck").val() != '1') {
			alert("아이디를 확인해주세요.");
		} else if ($("#isEmailAuth").val() != '1') {
			alert("이메일 인증을 해주세요.");
		} else {
			$("#signUp").submit();
			//alert("가입이 완료되었습니다.");
			
		}
	}
	
	$(function() {
		$(document).ready(function() {
			$("#isCheck_EmailForm").hide();
	});

	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#MEM_USERID").blur(
	function() {
		var mem_userid = $('#MEM_USERID').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/idCheck?mem_userid='+ mem_userid,
			type : 'get',
			success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);
			if (data > 0) {
				$("#id_check").text("That ID is taken.");
				$("#id_check").css("color","red");
				$("#isCheck").val("0");
			} else if (mem_userid == "") { // 입력하지 않을 경우
				$('#id_check').text('아이디를 입력해주세요.');
				$('#id_check').css('color','red');
				$("#isCheck").val("0");
			} else if (data == 0) { // 0 : 사용가능
				$("#id_check").text("사용가능한 아이디입니다.");
				$("#id_check").css("color", "blue");
				$("#isCheck").val("1");
			}
			}
			});
	});

	//이름입력
	$("#MEM_NAME").blur(function() {
	var mem_name = $("#MEM_NAME").val();
	if (mem_name == "") {
		$("#name_check").text("User name is required.");
		$("#name_check").css('color', 'red');
	} else {
		$("#name_check").text('');
	}
	});
	
	//비밀번호 입력
	$("#pw1").blur(function() {
	var pw1 = $("#pw1").val();
	if (pw1 == "") {
		$("#pw1_check").text('필수 항목 입니다.');
		$("#pw1_check").css('color', 'red');
	} else {
		$("#pw1_check").text('');
	}
	});
	
	//전화번호 입력
	$("#MEM_PHONE").blur(function() {
	var mem_phone = $("#MEM_PHONE").val();
	if (mem_phone == "") {
		$("#phone_check").text('필수 항목 입니다.');
		$("#phone_check").css('color', 'red');
	} else {
		$("#phone_check").text('');
		}
	});
	
	//이메일 입력
	$("#MEM_EMAIL").blur(function() {
	var MEM_EMAIL = $("#MEM_EMAIL").val();
	var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var mail_check = regExp.test($("#MEM_EMAIL").val());
	if (MEM_EMAIL == "") {
		$("#email_check").text('Email address is required.');
		$("#email_check").css('color', 'red');
	}
	else if(mail_check == false){
		$("#email_check").text('Invalid email format');
		$("#email_check").css('color', 'red');
	}
	else {
		$("#email_check").text('');
	}
	});

	//비번일치
	$("#pw2").blur(function() {
	var pwd1 = $("#pw1").val();
	var pwd2 = $("#pw2").val();
	if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$("#pw2_check").text('비밀번호가 일치 합니다.');
			$("#pw2_check").css('color', 'blue');
		} else {
			$("#pw2_check").text('비밀번호가 일치 하지 않습니다.');
			$("#pw2_check").css('color', 'red');
		}
	}
	else if (pwd2 == "") {
		$("#pw2_check").text('필수 항목 입니다.');
		$("#pw2_check").css('color', 'red');
	}
	});
			
	//이메일 인증 		
	//이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#isCheck_Email", function() {
		var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var mail_check = regExp.test($("#MEM_EMAIL").val());
		if (  $("#MEM_EMAIL").val().length < 1) {
			return false;
		} 
		else if(mail_check == false) { //정규표현식을 이용한 유효성 검사
			return false;
		}
		else { // 이메일 중복 체크 후 메일 발송 비동기 처리 
			$.ajax({
				type : "POST",
				url : "/hotel/emailAuth",
				data : "MEM_EMAIL=" + $("#MEM_EMAIL").val(),
				success : function(data) {
					alert("Please enter a verification code that we send to your email. ");
					$("#isCheck_EmailForm").show();
					},
				error : function(data) {
					alert("에러가 발생했습니다.");
					return false;
				}
			});
		}
	});

	// 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	$(document).on("click","#isAuth", function() {
		$.ajax({
			type : "POST",
			url : "/hotel/emailAuthCheck",
			data : "joinCode=" + $('#emailAuth').val()	+ "&ran=" + $("#ran").val(),
			success : function(data) {
			console.log(data.result);
				if (data.result == "complete") {
					$("#isAuth").contents().unwrap().wrap('<div id="isAuth"></div>');
					$("#isAuth").text("인증완료");
					$("#isAuth").css('color', 'blue').css('display', 'inline');
					$("#isEmailAuth").val("1");
				} else if (data.result == "fail") {
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},				
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	});
});
</script>
</body>
</html>