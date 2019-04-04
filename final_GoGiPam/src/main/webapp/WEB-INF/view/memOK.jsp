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
	#MemOk {
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
	
	#MemOK_img {
		width: 128px;
		height: 128px;
		margin-left: auto;
		margin-right: auto;
		background: url(images/user-account-box.png);
		margin-top: 43px;
	}	
</style>

<script type="text/javascript">
$(document).ready(function () {
	$('#MemOk').on('click', function () {
		$(location).attr('href','main.do');
	});
});
</script>
</head>
<body>
<div id = "payOK_Wrap" style="height: 550px; width: 100%">
	<div style="position: relative; top: 20%">
		<h1 style="text-align: center; vertical-align: middle">회원 가입이 완료되었습니다. 즐거운 쇼핑되세요!</h1>
		<div id="MemOK_img"></div>
	</div>
	<div style="width: 390px; margin-left: auto; margin-right: auto;">
		<button id="MemOk" type="button" style="text-align: center; margin-top: 150px;">메인으로 돌아가기</button>
	</div>
</div>	
</body>
</html>