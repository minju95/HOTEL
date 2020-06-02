<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<!-- form 안의 name 값을 SQL쿼리에서 받아오는 변수값과 동일하게 지정-->
<form action="/hotel/signUp" method="post">
<div>
<label>아이디</label>
<input type="text" id="MEM_USERID" name="MEM_USERID" placeholder="아이디를 입력하세요" required><br>
<div id="id_check"></div>
<label>이름</label>
<input type="text" name="MEM_NAME" placeholder="이름을  입력하세요" required><br>
<label>비밀번호</label>
<input type="password" id="pw1" name="MEM_PW" placeholder="비밀번호" required><br>
<label>비밀번호 확인</label>
<input type="password" id="pw2" placeholder="비밀번호 확인" required><br>
<div id="pw_check"></div>
<label>전화번호</label>
<input type="text" name="MEM_PHONE" placeholder="전화번호를 입력하세요" required><br>
<label>이메일</label>
<input type="text" id="user_email" name="MEM_EMAIL" placeholder="이메일을  입력하세요" required>
<button type="button" id="emailBtn">이메일 발송</button>
<label>이메일 인증</label>
<input type="text" id="emailAuth" name="emailAuth" placeholder="인증번호를  입력하세요" required>
<button type="button" id="emailAuthBtn">이메일 인증</button>
</div>
<input type="submit" id="reg_submit" value="전송">
</form>

<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#MEM_USERID").blur(function() {
		
		var mem_userid = $('#MEM_USERID').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/idCheck?mem_userid='+ mem_userid,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);						
	
				if (data > 0) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						
				} else if(mem_userid == ""){
						// 입력하지 않을 경우
						$('#id_check').text('아이디를 입력해주세요.');
						$('#id_check').css('color', 'red');				
						
				} else if(data == 0){
						// 0 : 사용가능
						$("#id_check").text("사용가능한 아이디입니다.");
						$("#id_check").css("color", "blue");
							
				}
			
			}	
		});
	});

	//비번일치
	$("#pw2").blur(function(){
	        var pwd1=$("#pw1").val();
	        var pwd2=$("#pw2").val();
	        if(pwd1 != "" || pwd2 != ""){
	            if(pwd1 == pwd2){
	                $("#pw_check").text('비밀번호가 일치 합니다.');
	                $("#pw_check").css('color', 'blue');
	            }else{
	            	$("#pw_check").text('비밀번호가 일치 하지 않습니다.');
	                $("#pw_check").css('color', 'red');
	            }    
	        }
	});
	//이메일 인증 (미구현)
	$(function(){
		   //   이메일 인증 버튼 클릭시 발생하는 이벤트
		   $(document).on("click", "#emailBtn", function(){
		      
		      // 이메일 중복 체크 후 메일 발송 비동기 처리 
		      $.ajax({
		         
		         type:"POST",
		         url : "/emailAuth",
		         data : "user_email=" + $("#user_email").val(),
		         success : function(data){
		               alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
		            
		         },
		         error : function(data){
		            alert("에러가 발생했습니다.");
		            return false;
		         }
		         });
		      });   
		   
		   // 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
		   $(document).on("click", "#emailAuthBtn", function(){
		      
		      $.ajax({
		         
		         type:"POST",
		         url:"/emailAuthCheck",
		         data:"joinCode=" + $('#emailAuth').val() + "&ran=" + $("#ran").val(),
		         success:function(data){
		            console.log(data.result);
		            if(data.result == "complete"){
		               alert("인증이 완료되었습니다.");
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
</body>
</html>