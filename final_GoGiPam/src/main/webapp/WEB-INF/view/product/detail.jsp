<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoGipam</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
		var d_amount = $('#d_amount').text();
		
		$('#d_minus').on('click', function() {
			if(d_amount > 1) {
				d_amount = Number(d_amount) - 1;
				$('#d_amount').text(d_amount);
			}
		});
		
		$('#d_plus').on('click', function() {
			d_amount = Number(d_amount) + 1;
			$('#d_amount').text(d_amount);
		});
		/* +, - 버튼 */
		
		$('#drop_default').text($('#opt').text().split(',')[0]);
		$('#drop_key').text($('#opt').text().split(',')[1].trim());
		/* 기본 옵션 불러오기 */
		
		$('#dropBtn').on('click', function() {
			if($('#d_dropContent').attr('class') == 'd_off')
				$('#d_dropContent').attr('class', 'd_on');
			else
				$('#d_dropContent').attr('class', 'd_off');
		});
		/* 옵션 선택을 하지않고 버튼 눌렀을 경우 그냥 드롭다운 목록을 닫아버림 */
		
		$('.optlist').on('click', function() {
			$('.optlist active').attr('class', 'optlist');
			$(this).attr('class', 'optlist active');
			
			$('#drop_default').text($(this).text().split(',')[0]);
			$('#drop_key').text($(this).text().split(',')[1]);
			$('#d_dropContent').attr('class', 'd_off');
		});
		/* 옵션 선택 */
		
		$('#detail_cart').on('click', function() {
			var member_id = '<%= (String) session.getAttribute("member_id")%>';
			//alert(member_id);
			var item_key = '${plist.item_key}';
			var option_key = $('#drop_key').text();
			var cart_amount = parseInt($('#d_amount').text());
			var cart_price = ${plist.item_price};
			
			$.ajax({
				type: "POST",
				url: "insert_cart.do",
				data: {
					'member_id' : member_id,
					'item_key' : item_key,
					'option_key' : option_key,
					'cart_amount' : cart_amount,
					'cart_price' : cart_price
				},
				success: function() {
					$('#cartModal1').modal();
				}
			});
		})
	})
</script>

<style type="text/css">
	.d_on {
		display: block;
	}
	
	.d_off {
		display: none;
	}
	
	button:focus {
		outline: none;
	}
	
	#d_minus, #d_amount, #d_plus {
		user-select: none;
	}
</style>	
</head>
<body>
	<div id="detail_wrap" style="height: 829px;"> <!-- 전체 틀 -->
		
		<div id="detail_container" style="width: 1180px; margin-left: auto; margin-right: auto; /* 내부 내용(사진, 양 조절, 옵션 포함)을 포함하는 전체 크기 틀 */ 
			position: relative; top: 50px; height: 550px;">
			
			<div id="detail_main" style="width: 1055px; margin-left: 25px; display: table;"> <!-- 내부 내용의 틀 -->
				<img src="${plist.item_thumbnail}" style="float: left; width: 550px; height: 550px;" alt="">
				<div id="detail_product" style="width: 380px; display: table-cell; 
					vertical-align: middle; margin-left: 123px; margin-top: 65px;"> 
					<div id="detail_itemkey" style="display: none">${plist.item_key}</div>
					<div id="detail_name" style="font-size: 28px; font-weight: bold; color: black; width: 380px; line-height: 1.5;">
						${plist.item_title}
					</div>
					
					<div id="detail_unit" style="margin-top: 16.9px; font-size: 16px; height: 24px; color: black;">
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
						<fmt:formatNumber type="currency">${plist.item_unit}</fmt:formatNumber>
					</div>
						
					<div id="detail_price" style="margin-top: 6px; height: 33px; font-size: 24px; color: black;">
						<fmt:formatNumber type="currency">${plist.item_price}</fmt:formatNumber>
					</div>
					
					<div id="detail_split" style="width: 380px; height: 1px; background-color: black; margin-top: 20px;"></div>
					
					<div id="detail_amount" style="margin-top: 29px; height: 50px">
						<div id="detail_amountText" style="display: inline-block; float: left; margin-top: 9px; width: 34px; height: 33px; font-size: 18px;">
						수량
						</div>
						<div id="detail_amountBox" style="width: 318px; margin-left: 26px; height: 48px; border: 1px solid black; display: inline-block; float: left">
							<span id="d_minus" style="border-right: 1px solid black; float: left; display: inline-block; height: 47px; width: 49px; cursor: pointer; text-align: center; font-size: 40px; line-height: 45px;">-</span>
							<span id="d_amount" style="text-align: center; font-size: 18px; line-height: 45px; float: left; display: inline-block; height: 49px; width: 218px; color: black;">1</span>
							<span id="d_plus" style="border-left: 1px solid black; float: right; display: inline-block; height: 47px; width: 49px; cursor: pointer; text-align: center; font-size: 35px; line-height: 45px;">+</span>
						</div>
					</div>
					
					<div id="detail_option" style="margin-top: 19px; height: 50px;">
						<div id="detail_amountText" style="display: inline-block; float: left; margin-top: 9px; width: 34px; height: 33px; font-size: 18px;">
						옵션
						</div>
						<div id="detail_dropdown" style="border: 1px solid black; height: 50px; margin-left: 26px; position: absolute; display: inline-block;">
							<button id="dropBtn" style="width: 316px; height: 48px; font-size:18px; background-color: white; border: none; color: black; cursor: pointer;">
								<span id="drop_default"></span>
								<span id="drop_key" style="display: none"></span>
							</button>
							
							<div id=d_dropContent class="d_off" style="position: absolute; overflow: auto; margin-top: -2px; margin-left: -1px; border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black;">
								<c:forEach items="${popt}" var="optlist">
									<div id="opt" class="optlist active" style="width: 316px; height: 48px; font-size:18px; background-color: white; border: none; color: black; cursor: pointer; text-align: center; line-height: 48px;">
										${optlist.option_name}<span style="display: none">,${optlist.option_key}</span>
									</div>
								</c:forEach>
							</div>
							
						</div>
					</div>
										
				<div id="detail_button" style="width: 380px; height: 60px; margin-top: 40px; overflow: auto;">
					<div id="detail_direct" style="background-color: gray; display: inline-block; 
						width: 180px; height: 60px; font-size: 20px; font-weight: bold; line-height: 60px; 
						text-align: center; color: white; float: left; cursor: pointer">
						바로구매
					</div>
					
					<div id="detail_cart" style="background-color: red; margin-left: 20px; display: inline-block; 
						width: 180px; line-height: 60px; font-size: 20px; font-weight: bold; height: 60px; 
						text-align: center; color: white; float: left; cursor: pointer">
						장바구니
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>

<!-- 장바구니에 담겼다는 모달 출력 -->	
<div class="modal modal-center fade" id="cartModal1" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">상품이 장바구니에 담겼습니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>	
</body>
</html>