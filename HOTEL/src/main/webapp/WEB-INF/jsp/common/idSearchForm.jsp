<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>아이디 비밀번호 찾기</title>
<style>
#findMemform{width:648px; margin:0 auto;text-align:center;margin-bottom:100px}

.findpwd{width: 500px;text-align: center;   margin-left: calc(50% - 250px);}
.findpwd>dd>input {width:100%; height: 50px;} 
 
 h6{font-color:#65656;}
 p>a{color:blue} 
.findpwd>dd>button{cursor:pointer;width:100%; height: 50px;background-color:#ffd014; display: block; border:none;margin-top: 10px;font-size: 20px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<input type="hidden" name="alert" value="${resultMsg}"/>
		<div id="findMemform">
		
			<h1>아이디 찾기</h1>
			<form action="/hotel/idSearch" method="post">
			<dl class="findpwd">
				<dd><input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름">	</dd>
				<dd><input type="email" name="MEM_EMAIL" id="MEM_EMAIL" placeholder="이메일주소">	</dd>
				
				<dd><button type="submit" id="findIdBtn">찾기</button></dd>
			</dl>		
			</form>
			<p>아직 회원이 아니신가요? <a href="/hotel/signUpForm">회원가입하기</a></p>
			
		</div>
<script>
$(document).ready(function(){
	if($("input[name='alert']").val() != null && $("input[name='alert']").val() != ""){
		alert($("input[name='alert']").val());
	}
});
</script>
<!-- <script>
$(document).on("click", "#findIdBtn", function(){
  var mem_name =  $("#MEM_NAME").val();
  var mem_email = $("#MEM_EMAIL").val();

  $.ajax({
    type: "POST",
    url : "/hotel/idSearch",
    data : {"MEM_NAME" : mem_name, "MEM_EMAIL" : mem_email},
    dataType: "json",
    contentType:"application/json;charset=UTF-8",
    success : function(data) {
      console.log(data);
    },
    error: function(jqXHR, textStatus, errorThrown) {
      alert("error= " + errorThrown);
    }
  });
});
</script> -->

	
<!-- <script>	
$(document).ready(function(){
	if($("input[name='alert']").val() != null){
		alert($("input[name='alert']").val());
	}
});

//이메일로 아이디 발송

$(function(){
	//	이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#findIdBtn", function(){
		
		// 이메일 중복 체크 후 메일 발송 비동기 처리 
		$.ajax({
			
			type:"POST",
			url : "/first/login/findId",
			data : "user_email=" + $("#user_email").val(),
			
			success : function(data){
					alert("아이디가 발송되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});




//이메일로 임시비밀번호 발송

$(function(){
	//	이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#findPwdBtn", function(){
		
		// 이메일 중복 체크 후 메일 발송 비동기 처리 
		$.ajax({
			
			type:"POST",
			url : "/first/login/findPwd",
			data : "user_email=" + $("#user_email").val(),
			
			success : function(data){
					alert("아이디가 발송되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});

</script>	 -->
	
	
</body>
</html>