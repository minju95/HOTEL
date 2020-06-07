<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
$(document).ready(function(){ 
	  $("a[name='title']").on("click", function(e){ //제목
		   e.preventDefault(); fn_facDetail($(this));
		    });
	     });



		function fn_facDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/rooms'/>");
            comSubmit.addParam("ROOM_TYPE", obj.parent().find("input[name='id']").val());
            comSubmit.submit();
        }
		</script>
<body>
<table>
	<tr>
<c:forEach items="${list}" var="room">
		
				<!--  <td>${fac.FAC_HOTEL_ID}</td>-->
				<td><a href='#this'  name="title" >| ${room.ROOM_NAME}  |</a>
				<input type='hidden' name='id' value="${room.ROOM_TYPE }"></td>
			
		</c:forEach>
		</tr>
</table>
</body>
</html>