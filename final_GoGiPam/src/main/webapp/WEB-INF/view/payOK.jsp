<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoGiPam</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<style type="text/css">
	#PayOk {
		border: none;
		width: 390px;
		height: 60px;
		background-color: black;
		color: white;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
	}
	
	button:focus {
		outline: 0
	}
</style>

<script type="text/javascript">
$(document).ready(function () {
	$('#PayOk').on('click', function () {
		$(location).attr('href','main.do');
	});
});
</script>
</head>
<body>
<div id = "payOK_Wrap" style="height: 550px; width: 100%">
	<div style="position: relative; top: 20%">
	<h1 style="text-align: center; vertical-align: middle">결제가 완료되었습니다. 이용해주셔서 감사합니다!</h1>
	<h3 style="text-align: center; vertical-align: middle">귀하의 배송일은 
		<c:set var="deliveryDay" value = "<%=new Date(new Date().getTime() + 60*60*24*1000*2)%>" />
		<span style="color : red; font-weight: bold"><fmt:formatDate value="${deliveryDay}" pattern="yyyy-MM-dd" /></span> 입니다.</h3>
	</div>
	<div style="width: 390px; margin-left: auto; margin-right: auto;">
		<button id="PayOk" type="button" style="text-align: center; margin-top: 150px;">메인으로 돌아가기</button>
	</div>
</div>	
</body>
</html>