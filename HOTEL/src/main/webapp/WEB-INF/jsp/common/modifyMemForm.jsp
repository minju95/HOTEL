<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%session.setAttribute("joinCode", ""); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
<style>
.contents {
    width: 100%;
    float: left;
    text-align: center;
    font-size: 1.875em;
    color: #444;
    margin-bottom: 50px;
}
.myForm-group {
	position : absolute;
	left : calc(50% - 400px/2);
	top : 100px;
}
.form-control {
	width : 400px;
}
#email_check {
	display : block;
}
#isCheck_Email {
	width : 70px;
}
p {
	text-align : right;
}
#signUpBtn {
	width : 400px;
	height : 40px;
}
</style>
	<%@ include file="/WEB-INF/include/include-topMenu.jsp"%>
<form id="signUp" action="/hotel/modifyMem">
<h3 class="contents" style="margin-top:80px;">회원 정보 수정</h3>
<div class="myForm-group" style="margin-top:150px;">
	<div class="form-group">
	  <label for="MEM_USERID">아이디</label>
	  <input type="text" class="form-control" id="MEM_USERID" name="MEM_USERID" value="${MemberInfo.MEM_USERID}" readonly>
	</div>
	<div id="id_check"></div>
	<input type="hidden" id="isCheck" value="0">
	<div class="form-group">
	  <label for="MEM_NAME">이름</label>
	  <input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" placeholder="이름을 입력하세요" value="${MemberInfo.MEM_NAME }">
	</div>
	<div id="name_check"></div>
	<div class="form-group">
	  <label for="pw1">비밀번호</label>
	  <input type="password" class="form-control" id="pw1" name="MEM_PW" placeholder="비밀번호를 입력하세요">
	</div>
	<div id="pw1_check"></div>
	<div class="form-group">
	  <label for="pw2">비밀번호 확인</label>
	  <input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인">
	</div>
	<div id="pw2_check"></div>
	<div class="form-group">
	  <label for="MEM_PHONE">전화번호</label>
	  <input type="text" class="form-control" id="MEM_PHONE" name="MEM_PHONE" placeholder="전화번호를 입력하세요" value="${MemberInfo.MEM_PHONE }">
	</div>
	<div id="phone_check"></div>
	<div class="form-group">
	  <label for="user_email">이메일 주소</label>
	  <input type="email" class="form-control" id="user_email" name="MEM_EMAIL" placeholder="이메일을 입력하세요" value="${MemberInfo.MEM_EMAIL }" readonly>
	</div>
	<div id="email_check"></div>
	<div id="isCheck_EmailForm" class="form-group">
	  <label for="user_email">인증번호 확인</label>
	  <div class="form-inline">
		  <input type="email" class="form-control" id="emailAuth" name="emailAuth" placeholder="인증번호를 입력하세요">
		  <button type="button" class="btn btn-default" id="isAuth">확인</button>
		  <input type="hidden" id="isEmailAuth" value="0">
	  </div>
	</div>
	<button type="button" class="btn btn-primary" id="signUpBtn">수정 하기</button><br><br>
	<button type="button" class="btn btn-primary" id="signUpBtn" onclick="location.href='/hotel/main'">홈으로</button>
</div>
</form>

<script>
$(function(){
	$(document).ready(function(){
		$("#isCheck_EmailForm").hide();
		
	});
	
	//이름입력
	$("#MEM_NAME").blur(function(){
        var mem_name=$("#MEM_NAME").val();
        if(mem_name == ""){
                $("#name_check").text('필수 항목 입니다.');
                $("#name_check").css('color', 'red');
        } else {
				$("#name_check").text('');
         	}
	});
	//비밀번호 입력
	$("#pw1").blur(function(){
        var pw1=$("#pw1").val();
        if(pw1 == ""){
                $("#pw1_check").text('필수 항목 입니다.');
                $("#pw1_check").css('color', 'red');
        }else {
			$("#pw1_check").text('');
     	}
	});
	//전화번호 입력
	$("#MEM_PHONE").blur(function(){
        var mem_phone=$("#MEM_PHONE").val();
        if(mem_phone == ""){
                $("#phone_check").text('필수 항목 입니다.');
                $("#phone_check").css('color', 'red');
        }else {
			$("#phone_check").text('');
     	}
	});
	//이메일 입력
	$("#user_email").blur(function(){
        var user_email=$("#user_email").val();
        if(user_email == ""){
                $("#email_check").text('필수 항목 입니다.');
                $("#email_check").css('color', 'red');
        }else {
			$("#email_check").text('');
     	}
	});
	//비번일치
	$("#pw2").blur(function(){
        var pwd1=$("#pw1").val();
        var pwd2=$("#pw2").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#pw2_check").text('비밀번호가 일치 합니다.');
                $("#pw2_check").css('color', 'blue');
            }else {
            	$("#pw2_check").text('비밀번호가 일치 하지 않습니다.');
                $("#pw2_check").css('color', 'red');
            }
        }
        
        else if(pwd2 == ""){
        	$("#pw2_check").text('필수 항목 입니다.');
            $("#pw2_check").css('color', 'red');
        } 
});
	//공란 확인
	$(document).ready(function() {
	    $("#signUpBtn").unbind("click").click(function(e) {
	     e.preventDefault();
	     fn_signUp();
	    });
	   });
	    
	   function fn_signUp() {
	    if ($("#MEM_NAME").val().length < 1)
	    {
	     alert("이름을 입력해주세요.");
	    }
	    else if ($("#pw1").val().length < 1)
	    {
	     alert("사용하실 비밀번호를 입력해주세요.");
	    }
	    else if ($("#pw2").val().length < 1)
	    {
	     alert("사용하실 비밀번호를 입력해주세요.");
	    }
	    else if ($("#MEM_PHONE").val().length < 1)
	    {
	     alert("전화번호를 입력해주세요.");
	    }
	    else if ($("#user_email").val().length < 1)
	    {
	     alert("이메일을 입력해주세요.");
	    }
/* 	    else if ( $("#isEmailAuth").val() != '1' )
	    {
	     alert("이메일 인증을 해주세요.");
	    } */
	    else
	    { 
	     $('#signUp').submit();
	    }
	   }
	   
	   
	//이메일 인증 		
	   //   이메일 인증 버튼 클릭시 발생하는 이벤트
	   $(document).on("click", "#isCheck_Email", function(){
		   if($("#user_email").val().length < 1) {
				   alert("이메일을 입력해주세요.");
				   return false;
			   } else {
				   $("#isCheck_EmailForm").show();
				}
		   
	      // 이메일 중복 체크 후 메일 발송 비동기 처리 
	      $.ajax({
	         
	         type:"POST",
	         url : "/hotel/emailAuth",
	         data : "user_email=" + $("#user_email").val(),
	         success : function(data){
	               alert("Please enter a verification code that we send to your email. ");
	            
	         },
	         error : function(data){
	            alert("에러가 발생했습니다.");
	            return false;
	         }
	         });
	      });   
	   
	   // 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	   $(document).on("click", "#isAuth", function(){
	      
	      $.ajax({
	         
	         type:"POST",
	         url:"/hotel/emailAuthCheck",
	         data:"joinCode=" + $('#emailAuth').val() + "&ran=" + $("#ran").val(),
	         success:function(data){
	            console.log(data.result);
	            if(data.result == "complete"){
	               $("#isAuth").contents().unwrap().wrap( '<div id="isAuth"></div>' );
	               $("#isAuth").text("인증완료");
	               $("#isAuth").css('color', 'blue').css('display','inline');
	               $("#isEmailAuth").val("1");
	            }else if(data.result == "fail"){
	               alert("인증번호를 잘못 입력하셨습니다.")
	            }
	         },
	         
	         error:function(data){
	            alert("에러가 발생했습니다.");
	         }
	      });
	   });
	});
</script>
	<div style="margin-top:800px;">
	<%@ include file="/WEB-INF/include/include-footer.jsp"%>
	</div>
</body>
</html>