<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고기팜 메인화면</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		
<link rel="stylesheet" href="css/navbar.css">
<style type="text/css">
#header_wrap {
	background-color: black;
	width: 100%;
	height: 128px;
	position: fixed;
	z-index: 100;
}

#header_body {
	width: 1180px;
	height: 128px;
	margin-left: auto;
	margin-right: auto;
}

#header_logo {
	width: 250px;
	height: 80px;
	background-color: gray;
	display: inline-block;
	position: relative;
	top: 23px;	
}

#header_navbar1 {
	width: 500px;
	height: 30px;
	position: relative;
	top: 23px;
	float: right;
	margin-right: 20px;
}

#header_navbar2 {
	width: 800px;
	height: 40px;
	position: relative;
	top: -23px;
	background-color: black;
	float: right;
	margin-right: 20px;
	clear: both;
}

#goBasket {
	display: inline-block;
	float: right;
	margin-right: 70px;
	width: 33px;
	height: 29px;
	background: url(images/basket.png);
	object-fit: cover;
	cursor: pointer;
}

.h_navbar1C_no {
    font-size: 15px;
    color: white;
    margin-left: 0px;
    margin-right: -15px;
    float: right;
}

.h_navbar1C_on {
	font-size: 15px;
	color: white;
	margin-left: 30px;
	float: right;
	text-decoration: underline;
	cursor: pointer;
}

.h_navbar1C_off {
	font-size: 15px;
	color: white;
	margin-left: 30px;
	float: right;
	text-decoration: none;
	cursor: pointer;
}

.h_navbar2C_on {
	font-size: 20px;
	color: white;
	font-weight: 700;
	margin-left: 70px;
	text-decoration: underline;
	cursor: pointer;
}

.h_navbar2C_off {
	font-size: 20px;
	color: white;
	font-weight: 700;
	margin-left: 70px;
	text-decoration: none;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$('#goJoin').on('click', function() {
		$(location).attr('href','memagree.do');
	});
	
	$('#goLogin').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goGuide').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goEvent').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goNotice').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goShopping').on('click', function() {
		$(location).attr('href','productlist.do');
	});
	
	$('#goIntroduce').on('click', function() {
		$(location).attr('href','introduce.do');
	});
	
	$('#goReview').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goCCenter').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	$('#goBasket').on('click', function() {
		/* $(location).attr('href',''); */
	});
	
	var Hhref_split = $(location).attr('href').split("/")[4];
	/* Hhref_split.substring(0,14) */ /* 주소값에 데이터가 있어서 주소가 변할 경우 판별 */
	
	if(Hhref_split == 'memagree.do' || Hhref_split == 'memjoin.do') {
		$('#goJoin').attr('class', 'h_navbar1C_on');
	}
	
	if(Hhref_split == 'productlist.do' || Hhref_split.substring(0,14) == 'productlist.do') {
		$('#goShopping').attr('class', 'h_navbar2C_on');
	}	
	/* on, off class 변환 */
	
})
</script>
</head>
<body>	
	<div id="header_wrap">
		<div id="header_body">
			<div id="header_logo">
			</div>
			
			<div id="header_navbar1">
				<span class="h_navbar1C_off" id="goJoin">회원가입</span>
				<span class="h_navbar1C_no">|</span>
				<span class="h_navbar1C_off" id="goLogin">로그인</span>
				<span class="h_navbar1C_off" id="goGuide">이용가이드</span>
				<span class="h_navbar1C_off" id="goEvent">이벤트</span>
				<span class="h_navbar1C_off" id="goNotice">공지사항</span>
			</div>
			
			<div id="header_navbar2">
				<span class="h_navbar2C_off" id="goShopping">쇼핑하기</span>
				<span class="h_navbar2C_off" id="goIntroduce">고기팜 소개</span>
				<span class="h_navbar2C_off" id="goReview">리뷰</span>
				<span class="h_navbar2C_off" id="goCCenter">호갱센터</span>
				<div id="goBasket"></div>
			</div>
		</div>
	</div>
</body>
</html>







