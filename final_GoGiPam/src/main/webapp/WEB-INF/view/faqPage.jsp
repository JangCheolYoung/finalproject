<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style type="text/css">

.faq_box{
	width: 1000px;
	margin-top:100px;
	margin-left:auto;
	margin-right:auto;
	border: 0;
	padding: 0;
}


.faq_title {
	font-size: 30px;
	border: 0px solid;
}

.support_box{
	overflow: auto;
	margin-top: 42px;
	top: 50%;
}

.support_tab {
	float: left;
	font-weight: 600;
	display: inline-block;
	color: #c2c2c2;
	cursor: pointer;
	margin-right: 50px;
	font-size: 20px;
	padding-top: 10px;
}

.support_tab.support_tab_active{
	color: black;
	border-bottom: 1px solid black;
}

.product_box{
	height: 30px;
	margin-top: 15px;
}

.product_tab {
	font-weight: 600;
	display: inline-block;
	margin-right: 30px;
	cursor: pointer;
	color: #c2c2c2;
}

.product_tab.product_tab_active{
	color: black;
}


.support_question_btn{
	float: right;
	color: white;
	background-color: black;
	cursor: pointer;
	border: 0;
	outline: 0;
	width: 160px;
	height: 45px;
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 10px;
}

.support_tab:hover{
	border-bottom: 1px solid black; 
	color: black;
}


.contents{
	height: 750px;
}

.content{
}

.faq_question{
	padding: 30px;
	cursor:pointer;
	border: 1px solid #c2c2c2;
	
}
.faq_answer{
	background-color: #f7f7f7;
	height: auto;
	display: none;
	border: 1px solid #c2c2c2;
	padding: 30px 30px ;
	font: 12px;
}

.part{
	font-weight: 600;
	margin-right: 150px;
}

.text{
	font-size: 14px;
}

.arrow {
	float: right;
    padding: 7px;
    margin-right: 3%;
    margin-top: 3px;
    border-style: solid;
    border-width: 0 2px 2px 0;
    display: inline-block;
    transform: rotate(45deg);
    color: rgba(0,0,0,.54);
}
.arrow::after {
    transform: rotate(180deg);
}


</style>

<script type="text/javascript">
	$(document).ready(function() {
		var product = $('.product_tab.product_tab_active').text();
		var faq_category = $('.support_tab.support_tab_active').text();

			
		$('#button').on('click', function() {
			alert($('#text').val());
		});
			
		$('.support_tab').on('click', function() {
			faq_category = $(this).text();
			$.ajax({
				type: 'GET',
				dataType: 'json',
				url: 'faqPage2.do?faq_category=' + faq_category,
				success: successMessage,
				error: errorMessage
				
			});
			
			$('.support_tab.support_tab_active').attr('class', $(this).attr('class'));
			$(this).attr('class', 'support_tab support_tab_active');
			$('.product_box').empty();
		
			if($(this).html() == '상품관련'){
				$('.product_box').append('<div class="product_tab product_tab_active">돼지고기</div>'
						+ '<div class="product_tab">소고기</div>'
						+ '<div class="product_tab">닭고기</div>');
			}
		});
		
		$(document).on('click','.product_tab', function() {
			
			$('.product_tab.product_tab_active').attr('class', $(this).attr('class'));
			$(this).attr('class', 'product_tab product_tab_active');
			
			$.ajax({
				type: 'GET',
				dataType: 'json',
				url: 'faqPage2.do?faq_category=' + faq_category,
				success: appendMethod,
				error: errorMessage
				
			});
			
		});
		
		/* $('.product_tab').on('click', function() {
			
			$('.product_tab.product_tab_active').attr('class', $(this).attr('class'));
			$(this).attr('class', 'product_tab product_tab_active');
		
			
			$.ajax({
				type: 'GET',
				dataType: 'json',
				url: 'faqPage2.do?faq_category=' + faq_category,
				success: appendMethod,
				error: errorMessage
				
			});
			
			
		}); */
		$(document).on('click', '.faq_question', function(){
			// alert($(this).next().css('display'));
			// $(this).next().prop('style', 'display: block; height: auto; padding: 10px 10px;');
			
/* 			if($(this).next().css('display') == 'none'){
				$(this).next().prop('style', 'display: block;');
			}else if($(this).next().css('display') == 'block'){
				$(this).next().prop('style', 'display: none');
			} */

			if($(this).next().css('display') == 'none'){
				$(this).children('div.arrow').attr('style', 'transform: rotate(225deg);');
				
			}else{
				$(this).children('div.arrow').attr('style', 'transform: rotate(45deg);');
				
			}
			$(this).next().slideToggle(150);
			
			//$('.arrow').attr('style', 'transform: rotate(225deg);');
		});
		
		
		$('.support_question_btn').on('click', function(){
			
			location.href="qnaPage.do";
			
		});
		
		

	});// end ready()/////////////////////////////////////////
	
	function appendMethod(res){
		product = $('.product_tab.product_tab_active').text();
		$('.contents').empty();
		$.each(res, function(i, v){
			if(v.faq_question.indexOf(product) != -1)
			$('.contents').append('<div class="content"><div class="faq_question"><span class="part">' + v.faq_category +'</span><span>' + v.faq_question +'</span><div class="arrow"></div></div><div class="faq_answer"><span class="text">'+v.faq_answer+'</span></div></div>');
		});
	};
	
	function successMessage(res){
		product = $('.product_tab.product_tab_active').text();
		$('.contents').empty();
		$.each(res, function(i, v){
			if(v.faq_question.indexOf(product) != -1)
			$('.contents').append('<div class="content"><div class="faq_question"><span class="part">' + v.faq_category +'</span><span>' + v.faq_question +'</span><div class="arrow"></div></div><div class="faq_answer"><span class="text">'+v.faq_answer+'</span></div></div>');
		});
		
	};
	
	function errorMessage(res){
		alert("error");
	}
	
	
</script>
</head>
<body>

	<div class="faq_box">
		<div class="faq_title">자주 묻는 질문</div>
		<div class="support_box">
			<div class="support_tab support_tab_active">상품관련</div>
			<div class="support_tab">주문/결제</div>
			<div class="support_tab">배송</div>
			<div class="support_tab">취소/교환/환불</div>
			<button class="support_question_btn">1:1 문의하러 가기</button>
		</div>
		<div class="product_box">
			<div class="product_tab product_tab_active">돼지고기</div><div class="product_tab">소고기</div><div class="product_tab">닭고기</div>
		</div>
		<div class="contents">
			<c:forEach var="dto" items="${list}">
				
				<c:if test='${dto.faq_category == "상품관련"}'>
					<c:if test="${fn:contains(dto.faq_question, '돼지고기')}">
						<div class="content">
							<div class="faq_question"><span class="part">${dto.faq_category}</span><span>${dto.faq_question}</span><div class="arrow"></div></div>
							<div class="faq_answer"><span class="text">${dto.faq_answer}</span></div>
						</div>
					</c:if>
				</c:if>
			</c:forEach>
		</div>

	</div>

</body>
</html>