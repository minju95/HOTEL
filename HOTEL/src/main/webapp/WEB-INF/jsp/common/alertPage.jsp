<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<meta charset="UTF-8">
</head>
<body>
<input id="msg" type="hidden" value="${MESSAGE}">
<input id="nextView" type="hidden" value="${NEXT_VIEW}">
 
<script>
$(document).ready(function(){
	alert($("#msg").val());
	if($("#nextView").val()!=""){
		var view = $('#nextView').val();
		console.log("nextView : "+view);
		location.href="<c:url value='"+view+"'/>";
	}else{
		history.go(-1);
	}
	
	
})
</script>
</body>
</html>