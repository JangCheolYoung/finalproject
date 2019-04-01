<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		.off {
			color: #ccc;
		}
		
		.off:hover {
			color: black;
			text-decoration: underline;		
		}
		
		.on {
			color: black;
			text-decoration: underline;
		}
		
	</style>
<script type="text/javascript">
$(document).ready(function() {
	var PList_split = $(location).attr('href').split("=");
	var target;

	if(PList_split[1] == 'beef') {
		$('#allProd').attr('class', 'off');
		$('#beefProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'all') {
		$('#allProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'chicken') {
		$('#allProd').attr('class', 'off');
		$('#chickenProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'pork') {
		$('#allProd').attr('class', 'off');
		$('#porkProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'milk') {
		$('#allProd').attr('class', 'off');
		$('#milkProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'egg') {
		$('#allProd').attr('class', 'off');
		$('#eggProd').attr('class', 'on');
	}
	
	if(PList_split[1] == 'rice') {
		$('#allProd').attr('class', 'off');
		$('#riceProd').attr('class', 'on');
	}
	/* on, off class 변환 */
	
	$('#allProd').css('cursor','pointer');	 
	$('#allProd').on('click', function() {
		$(location).attr('href','productlist.do?target=all');
	});
	/* allProd end*/
	
	$('#beefProd').css('cursor','pointer');			 
	$('#beefProd').on('click', function() {
	 	$(location).attr('href','productlist.do?target=beef');
	});
	/* beefProd end */
	
	$('#porkProd').css('cursor','pointer');
	$('#porkProd').on('click', function() {
		$(location).attr('href','productlist.do?target=pork');
	});
	/* porkProd end */
	
	$('#chickenProd').css('cursor','pointer');
	$('#chickenProd').on('click', function() {
		$(location).attr('href','productlist.do?target=chicken');
	});
	/* chickenProd end */
	
	$('#milkProd').css('cursor','pointer');
	$('#milkProd').on('click', function() {
		$(location).attr('href','productlist.do?target=milk');
	});
	/* milkProd end */
	
	$('#eggProd').css('cursor','pointer');
	$('#eggProd').on('click', function() {
		$(location).attr('href','productlist.do?target=egg');
	});
	/* eggProd end */
	
	$('#riceProd').css('cursor','pointer');
	$('#riceProd').on('click', function() {
		$(location).attr('href','productlist.do?target=rice');
	});
	/* riceProd end */
	
	$('.list_pic').css('cursor','pointer');
	$('.list_pic').on('click', function() {
		target = $(this).attr('id');
		$(location).attr('href','productdetail.do?target=' + target);
	});
	/* 클릭시 상세 페이지로 */
 });
 
</script>
<link rel="stylesheet" href="css/list.css">
</head>
<body>
<div id="list_wrap">
	<div id=list_select style="margin-top: 20px;">
		<span style="width: 100px;" id="allProd" class="on">전체상품</span>
		<span style="width: 100px; margin-left: 40px;" id="beefProd" class="off">소고기</span>
		<span style="width: 100px; margin-left: 40px;" id="porkProd" class="off">돼지고기</span>
		<span style="width: 100px; margin-left: 40px;" id="chickenProd" class="off">닭고기</span>
		<span style="width: 100px; margin-left: 40px;" id="milkProd" class="off">우유</span>
		<span style="width: 100px; margin-left: 40px;" id="eggProd" class="off">달걀</span>
		<span style="width: 100px; margin-left: 40px;" id="riceProd" class="off">쌀</span>
	</div>
	
	<!-- 벤치마킹 정육각은 이 부분을 ajax로 처리한 듯 하다 -->
	
	<div id=list_print>
	<c:forEach items="${plist}" var="plist">
		<div class="list_itembox">
			<div class="list_pic" id="${plist.item_key}">
				<img src="${plist.item_thumbnail}" style="width: 320px; height: 320px; object-fit: fit; margin-left: 30px; margin-top: 80px;"/>
			</div>
			<div class="list_name">
				${plist.item_title}
			</div>
			<div class="list_price">
				<fmt:formatNumber value="${plist.item_price}" type="currency"></fmt:formatNumber> 
			</div>
			<div class="list_unit" id="${plist.item_category}">
				<c:choose>
					<c:when test="${plist.item_category == 'egg'}">
						<span>1구당</span>
					</c:when>
					<c:when test="${plist.item_category == 'milk'}">
						<span>100ml당</span>
					</c:when>
					<c:otherwise>
						<span>100g당</span>
					</c:otherwise>
				</c:choose>
				<fmt:formatNumber value="${plist.item_unit}" type="currency"></fmt:formatNumber>
			</div>
			<div class="list_addition">
				${plist.item_addition}
			</div>
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>