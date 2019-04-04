<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoGipam</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.purchase_title {
		font-size: 21px;
		font-weight: bold;
		line-height: 24px;
	}
	
	#purchase_header {
	 	width: 100%; 
	 	text-align: center; 
	 	font-size: 38px; 
	 	line-height: .80;
	}
	
	.paySelector {
		width: 980px;
		height: 59px;
		border: 1px solid black;
	}
	
	.payRadio {
		display: inline-block;
		float: left;
		margin-left: 22px;
		margin-top: 16px;
	}
	
	input[type="radio"] {
		width: 20px;
		height: 20px;
	}
	
	.payTitle {
		font-size: 20px;
		font-weight: bold;
		line-height: 58px;
		margin-left: 16px;
		display: inline-block;
	}
	
	.bottom-line {
		margin-left: 20px;
		width: 940px;
		height: 1px;
		background-color: black	
	}
	
	.cardSelector {
		border: 1px solid black;
		border-radius: 3px;
		background-color: white;
		width: 120px;
		height: 26px;
		font-size: 15px;
		display: inline-block;
		margin-top: 14px;
    	margin-right: 20px;		
	}
	
	.mileageSelector {
		border: 1px solid black;
		border-radius: 3px;
		background-color: white;
		width: 120px;
		height: 26px;
		font-size: 15px;
		display: inline-block;
    	margin-right: 20px;		
	}
	
	.purchase-box {
		width: 978px;
		border: 1px solid black; 
	}
	
	.payitemList {
		margin-top: 40px;
		margin-left: 99px;
		border-bottom: 1px solid black;
		width: 780px;
	}
	
	.payitemName {
		font-size: 15px;
		display: inline-block;
		color: black;
	}
	
	.payitemOption {
		font-size: 13px;
		font-weight: bold;
		margin-left: 20px;
		color: black;
		display: inline-block;
	}
	
	.payitemPrice {
		font-size: 15px;
		width: 130px;
		float: right;
		text-align: right;
		color: black;
	}
	
	.payitemUnit {
		font-size: 15px;
		width: 110px;
		float: right;
		text-align: right;
		color: black;
	}
	
	.payitemAmount {
		font-size: 15px;
		width: 90px;
		float: right;
		text-align: right;
		color: black;
	}
	
	.payitemSummary {
		width: 940px;
		height: 100px;
		background-color: #f7f7f7;
		margin: 40px auto 22px;
	}
	
	.paySummaryPrice {
		display: inline-block;
		float: left;
	}
	
	.itemPriceTitle {
		font-size: 13px;
		font-weight: bold;
		line-height: 43px;
		margin-top: 17px;
	}
	
	.itemPriceValue {
		font-size: 21px;
		font-weight: bold;
		line-height: 43px;
		margin-top: -20px;
	}
	
	.itemPlusMinus {
		width: 29px;
		height: 29px;
		display: inline-block;
		float: left;
		margin-top: 36px;
		font-size: 29px;
	}
	
	.mileage_box {
		width: 978px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		border: 1px solid black;
	}
	
	.delivery_box {
		width: 978px;
		height: 60px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		border: 1px solid black;
		line-height: 60px;
		color: blue;
		font-size: 18px;
		font-weight: bold;
		text-align: center;		
	}
	
	.checklist_box {
		width: 978px;
		height: 120px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		border: 1px solid black;
		line-height: 60px;
	}
	
	#purchase_submitBtn {
		float: left;
		border: none;
		width: 390px;
		height: 60px;
		background-color: black;
		color: white;
		font-size: 16px;
		font-weight: bold;
		text-align: center;
		margin-left: 190px;
	}
	
	.card_AddBtn {
		width: 282px;
		height: 183px;
		background: url(images/purchase/emptycard.svg) no-repeat;
		display: inline-block;
		margin-left: 65px;
		margin-top: 42px;
		border: none;
	}
	
	.card_Active {
		width: 282px;
		height: 183px;
		background: url(images/purchase/addcard.svg) no-repeat;
	}
	
	.card_ActiveTitle {
		float: right;
		margin-right: 19px;
		font-size: 16px;
		font-weight: bold;
		display: inline-block;
		margin-top: 26px;
	}
	
	.card_DeleteBtn {
		background-color: #acacac;
		border: none;
		color: white;
		width: 389px;
		font-size: 16px;
		font-weight: bold;
		border-bottom-left-radius: 7px;
	}
	
	.card_SubmitBtn {
		background-color: black;
		border: none;
		color: white;
		width: 389px;
		font-size: 16px;
		font-weight: bold;
		border-bottom-right-radius: 7px;
	}
	
	.card_RegisterBtn {
		background-color: black;
		border: none;
		color: white;
		width: 599px;
		font-size: 16px;
		font-weight: bold;
		border-bottom-left-radius: 7px;
		border-bottom-right-radius: 7px;
	}
	
	.card_RegBox {
		width: 550px; 
		height: 430px; 
		border: 1px solid black; 
		margin-left: 10px; 
		margin-top: 15px;
	}
	
	.card_titleBox {
		height: 85.8px;
		border-bottom: 1px solid black;
	}
	
	.card_titleinnerBox {
		width: 200px; 
		border-right: 1px solid black; 
		display: inline-block;
		float: left; 
		height: 100%;
	}
	
	#DefaultCardName {
   	 	height: 26px;
    	font-size: 15px;
   		display: inline-block;
   	 	margin-top: 18px;
   	 	margin-right: 20px;
   	 	float : right;
	}
	
	#mileageUsingBtn {
    	border: none;
    	width: 100px;
    	background-color: black;
    	color: white;
    	font-size: 16.8px;
    	text-align: center;
	}
	
	button:focus {
		outline: 0
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//사용 전 적립금 상태 보여주기
		$('#mileageValueShow').text('0');
		
		//카드 선택 버튼 누를시 선택 모달 출력
		$('#cardSelector').on('click', function() {
			$('#cardModal').modal();
		});
		
		//선택 모달에서 등록 모달 누를시 기존 모달 닫고 등록 모달 출력, 동적이벤트
		$(document).on('click','.card_AddBtn', function() {
			$('#cardModal2').modal();
			$('#cardModal').modal('hide');
		});
		
		//등록모달 내에 카드별명 이외 란에 문자입력 차단
		 $("#card_password, #card_month, #card_year, #card_number, #card_birthday, #mileageVal").keyup(function(event) { // 키다운의 경우 앞 한글자를 못받음
	         if (!(event.keyCode >=37 && event.keyCode<=40)) { // del, backspace 허용하기 위해
	             var inputVal = $(this).val();
	             $(this).val(inputVal.replace(/[^0-9]/gi,''));
	         }
	     });
		
		//숫자 검사를 위한 정규식, 년도, 월일을 위한 정규식, 생년월일 6자리를 위한 정규식
		var cardchk = /^([0-9]{16})/;
		var yearchk = /^([0-9]{1})([0-9]{1})/;
		var monthchk = /^(0[1-9]|1[012])/;
		var passWordchk = /^([0-9]{1,2})/;
		var birthchk = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		
		$('.card_RegisterBtn').on('click', function() {
			var card_title = $('#card_nickname').val();
			var card_number = $('#card_number').val();
			var card_password = $('#card_password').val();
			var card_exp_month = $('#card_month').val();
			var card_exp_year = $('#card_year').val();
			var card_birthday = $('#card_birthday').val();
			var member_id = '<%= (String) session.getAttribute("member_id")%>';
			
			if($('#card_nickname').val() != '' &&
			   $('#card_birthday').val() != ''  && birthchk.test($('#card_birthday').val()) == true &&
			   $('#card_number').val() != '' && cardchk.test($('#card_number').val()) == true &&
			   $('#card_year').val() != '' && yearchk.test($('#card_year').val()) == true &&
			   $('#card_month').val() != '' && monthchk.test($('#card_month').val()) == true && 
			   $('#card_password').val() != '' && passWordchk.test($('#card_password').val()) == true) {
			   		$.ajax({
			   			url: "card_insert.do",
			   			type: "POST",
			   			data: {
			   				"card_title" : card_title,
			   				"card_number" : card_number,
			   				"card_password" : card_password,
			   				"card_exp_month" : card_exp_month,
			   				"card_exp_year" : card_exp_year,
			   				"card_birthday" : card_birthday,
			   				"member_id" : member_id			   				
			   			},
			   			success : function(res) {
			   				$('#cardModal2').modal('hide');
			   				$('#card_nickname').val('');
			   				$('#card_birthday').val('');
			   				$('#card_number').val('');
			   				$('#card_password').val('');
			   				$('#card_month').val('');
			   				$('#card_year').val('');
			   				$('#cardinsertSuccess').modal();
			   				cardList(res);
			   			},
			   			error : function() {
			   				$('#cardErrorModal1').modal();
			   			}
			   		});				
			} else {
				 $('#cardErrorModal1').modal();
			} 
			   
		});////////////////////////////////////////////////////////////// 카드 입력하기
		
		
		$('.card_DeleteBtn').on('click', function() {
			var selected_cardNum = $('input:radio[name="cardgroup"]:checked').val();
			var member_id = '<%= (String) session.getAttribute("member_id") %>';
			var card_defaultNum = $('#defaultNumchk').text();
			
			if(typeof selected_cardNum ===  "undefined")
				$('#cardErrorModal3').modal();		
			else			
				$.ajax({
					url: "card_delete.do",
					type: "POST",
					data: {
						"card_num_seq" : selected_cardNum,
						"member_id" : member_id,
					},
					beforeSend: function() {
						if(card_defaultNum == selected_cardNum)
						$('#DefaultCardName').text('기본카드 없음');			
					}
					,
					success : cardList,
					error : function() {
						$('#cardErrorModal3').modal();
					}
				});	
		});////////////////////////////////////////////////////////////// 카드 삭제하기
		
		
		function cardList(res) {
			$('#cardModal_cards').empty();
			
			$.each(res, function(index, value) {
				var source = '<div class="cardList {{card_num_seq}}" style="display: inline-block; float: left; margin-left: 65px; margin-top: 42px;">'
          					 + '<div class="card_Active">'
          					 + '<div class="card_ActiveTitle">'
      						 + '<input type="radio" name="cardgroup" value="{{card_num_seq}}" />'
      						 + '</div>'
      						 + '<div class="card_ActiveTitle">{{card_title}}</div>'
      						 + '</div>'
      					     + '</div>'
      					     		     				
      			var template = Handlebars.compile(source);
      			$('#cardModal_cards').append(template(value));
      			
			});
				
			var addbtn = '<button class="card_AddBtn" type="button" style="display: inline-block"></button>';
				$('#cardModal_cards').append(addbtn);
   					
 
   				
		}///////////////////////////////////////////////////////////////// 실시간 검사
		
		$('.card_SubmitBtn').on('click', function() {
			var selected_cardNum = $('input:radio[name="cardgroup"]:checked').val();
			var member_id = '<%= (String) session.getAttribute("member_id") %>';
			
			if(typeof selected_cardNum === "undefined")
				$('#cardErrorModal3').modal();
			else
				$.ajax({
					url: "card_default.do",
					type: "POST",
					data: {
						"card_num_seq" : selected_cardNum,
						"member_id" : member_id,
					},
					success : function(res) {
						$('#cardDefaultSuccess').modal();
						$('#defaultNumchk').text(selected_cardNum);
						$('#DefaultCardName').text(res.card_title);
						$('#cardModal').modal('hide');
					},
					error : function() {
						$('#cardErrorModal3').modal();
					}
				});
		});/////////////////////////////////////////////////////////////////// 기본값 검사
		
		$('.mileageSelector').on('click', function() {
			$('#mileageModal').modal();
		});
		
		$('#mileageUsingBtn').on('click', function() {
			var mileagechk = /^([0-9])/;
			var usingMileage = parseInt($('#mileageVal').val());
			var memMileage = parseInt($('#memMileage').text());
			
			//마일리지를 설정하면 값이 바뀌어야 한다.
			if(memMileage >= usingMileage && mileagechk.test(usingMileage) == true) {
				$('#useMileage').text(usingMileage);
				$('#mileageValueShow').text(usingMileage);
				$('#final_Price').text(parseInt($('#total_price').text()) + 2500 - usingMileage);
				$('#mileageModal').modal('hide');
			} else {
				$('#mileageError').modal();
			}
		});
		
		$('#purchase_submitBtn').on('click', function() {
			var cardOrDeposit = $('input:radio[name="radio-card/deposit"]:checked').val();
			
			if(cardOrDeposit == null) {
				$('#payMethodError').modal();
			}
			
			if(cardOrDeposit == "deposit") {
				var status = "입금대기";
				var tel = '${userInfo.member_tel}';
				var order_num = tel.substring(tel.length-4, tel.length);
				var member_id = '<%= session.getAttribute("member_id")%>';
				var fullprice = $('#final_Price').text().trim();
				var order_usemileage = $('#useMileage').text().trim();
				var order_plusmileage = $('#add_mileage').text().trim();
				
				if('${cardDefault.card_num_seq}' == null)
					$('#cardError').modal();
				else {
					$.ajax({
						url: "purchase_insert.do",
						type: "POST",
						data : {
							"order_method" : cardOrDeposit,
							"order_status" : status,
							"member_id" : member_id,
							"order_num" : order_num,
							"order_fullprice" : (Number)(fullprice),
							"order_usemileage" : (Number)(order_usemileage),
							"order_plusmileage" : (Number)(order_plusmileage)
						},
						success : function() {
							$(location).attr('href','payOk.do');
						}
					});
				}	
			}
			
			if(cardOrDeposit == "card") {
				var status = "주문확인";
				var tel = '${userInfo.member_tel}';
				var order_num = tel.substring(tel.length-4, tel.length);
				var member_id = '<%= session.getAttribute("member_id")%>';
				var fullprice = $('#final_Price').text().trim();
				var order_usemileage = $('#useMileage').text().trim();
				var order_plusmileage = $('#add_mileage').text().trim();
				var address = "${addressDefault.address}";
				var address_detail = "${addressDefault.address_detail}";
				var receiver_name = "${addressDefault.receiver_name}";
				var receiver_tel = "${addressDefault.receiver_tel}"; 
				
				if('${cardDefault.card_num_seq}' == null)
					$('#cardError').modal();
				else {
					$.ajax({
						url: "purchase_insert.do",
						type: "POST",
						data : {
							"order_method" : cardOrDeposit,
							"order_status" : status,
							"member_id" : member_id,
							"order_num" : order_num,
							"order_fullprice" : (Number)(fullprice),
							"order_usemileage" : (Number)(order_usemileage),
							"order_plusmileage" : (Number)(order_plusmileage),
							"address" : address,
							"address_detail" : address_detail,
							"receiver_name" : receiver_name,
							"receiver_tel" : receiver_tel
						},
						success : function() {
							$(location).attr('href','payOK.do');
						}
					});
				}
					
			}
			
		});
	})
</script>
</head>
<body>
<div id="purchase_wrap" style="width: 100%; height: 100%; margin-top: 30px; margin-left: auto; margin-right: auto;">
	<div id="purchase_header">
	주문하기
	</div>
	
	<div id="purchase_status" style="width: 128px; height: 120px; margin-top: 43px; margin-left: auto; margin-right: auto; background: url(images/purchase/card.png)">
	</div>
	
	<div id="purchase_wrap" style="margin-top: 54px; width: 980px; margin-left: auto; margin-right: auto;">
		<div class="purchase_title">
			결제방법
		</div>
		
		<div class="paySelector" style="border-bottom: none; margin-top: 20px">
			<div class="payRadio">
				<input type="radio" name="radio-card/deposit" id="radio-card" value="card">
			</div>
			
			<div class="payTitle">
				카드 결제
			</div>
			
			<span id="defaultNumchk" style="display: none">${cardDefault.card_num_seq}</span>
			<span id="DefaultCardName">
				<c:choose>
					<c:when test="${cardDefault.card_num_seq == null}">
						기본카드 없음
					</c:when>
					<c:otherwise>
						${cardDefault.card_title}
					</c:otherwise>
				</c:choose>				
			</span>
			
			<button class="cardSelector" id="cardSelector" type="button" style="float: right;">
				결제카드 선택
			</button>
		</div>
		
		<div class="bottom-line"></div>
		
		<div class="paySelector" style="border-top: none; clear: both; position: relative; top: -2px;">
			<div class="payRadio">
				<input type="radio" name="radio-card/deposit" id="radio-deposit" value="deposit">
			</div>
			
			<div class="payTitle">
				무통장 결제
			</div>
			
			<div style="display: inline-block; float: right; margin-right: 20px;">
				<span style="line-height: 60px; font-size: 17px; display: inline-block">
					신한은행&nbsp;&nbsp;&nbsp;-&nbsp;
				</span>
				<span style="line-height: 60px; font-weight: bold; font-size: 17px; color: red; display: inline-block">
					&nbsp;110-372-794850
				</span>
				<span style="line-height: 60px; font-size: 17px; display: inline-block">
					&nbsp;&nbsp;&nbsp;예금주&nbsp;&nbsp;&nbsp;-&nbsp; 
				</span>
				<span style="line-height: 60px; font-weight: bold; font-size: 17px; color: blue; display: inline-block">
					&nbsp;김영재
				</span>
			</div>
		</div>
		
		
		<div class="purchase_title" style="margin-top: 40px;">
			적립금
		</div>
		<div class="mileage_box">
			<div style="margin-top: 16px; margin-left: 20px; margin-bottom: 16px;">
				<button type="button" class="mileageSelector">적립금 사용</button>
				<span style="font-size: 15px; line-height: 30px;"><span id="useMileage">0</span> 원 사용</span>
			
				<div style="display: inline-block; line-height: 30px; font-size: 18px; font-weight: bold; float: right; margin-right: 20px;">
					상품 구매 시  <span id="add_mileage">${Math.round(addMileage)}</span>원 적립
				</div>
			</div>
			
			
		</div>
		
		
		<div class="purchase_title" style="margin-top: 40px;">
			주문내역
		</div>
		<div class="purchase-box" style="margin-top: 20px;">
		<c:forEach items="${cartList}" var="cartList" varStatus="i">
			<c:set var='index' value='${i.index}' /> <!-- 인덱스를 받아와야 출력이 가능함 -->
			<div class="payitemList">
				<span class="payitemName">${itemInfo[index].item_title}</span>
				<span class="payitemOption">${optionInfo[index]}</span>
				<span class="payitemPrice">${cartList.cart_price * cartList.cart_amount} 원</span>
				<span class="payitemAmount">${cartList.cart_amount} 팩</span>
				<span class="payitemUnit">1팩당 ${itemInfo[index].item_price} 원</span>
			</div>
		</c:forEach>	
			<div class="payitemSummary">
				<div class="paySummaryPrice" style="margin-left: 185px;">
					<div class="itemPriceTitle">
						상품총합
					</div>
					
					<div class="itemPriceValue" id="total_price">
						${totalPrice}
						<span style="font-size: 13px;">원</span>
					</div>		
				</div>
				
				<div class="itemPlusMinus" style="margin-left: 35px;">
						+
				</div>
				
				<div class="paySummaryPrice" style="margin-left: 35px;">
					<div class="itemPriceTitle">
						배송비
					</div>
					
					<div class="itemPriceValue">
						2500
						<span style="font-size: 13px;">원</span>
					</div>		
				</div>
				
				<div class="itemPlusMinus" style="margin-left: 35px;">
						-
				</div>
				
				<div class="paySummaryPrice" style="margin-left: 35px;">
					<div class="itemPriceTitle">
						적립금
					</div>
					
					<div class="itemPriceValue" id="mileageValueShow"
						style="display: inline-block; position: relative; top: -7px">
						0
					</div>		
					<div style="font-size: 13px; display: inline-block;  position: relative; top: -7px; 
							font-weight: bold;">원</div>
				</div>
				
				<div class="itemPlusMinus" style="margin-left: 35px;">
						=
				</div>
				
				<div class="paySummaryPrice" style="margin-left: 35px;">
					<div class="itemPriceTitle">
						총합가격
					</div>
					
					<div class="itemPriceValue" style="color: red">
						<div id="final_Price" style="display: inline-block;">
						${totalPrice + 2500 - 0}
						</div>
						<div style="display: inline-block; font-size: 13px; color: black">원</div>
					</div>		
				</div>	
			</div>
		</div> <!-- purchase box end -->
		
		<div class="purchase_title" style="margin-top: 40px;">
			배송정보
		</div>
		
		<div class="delivery_box">
			오늘 주문한 상품은 <c:set var="deliveryDay" value = "<%=new Date(new Date().getTime() + 60*60*24*1000*2)%>" />
			<fmt:formatDate value="${deliveryDay}" pattern="yyyy-MM-dd" /> 에 배송 될 예정입니다.
		</div>
		
		<div class="checklist_box" style="margin-top: 43px;">
			<div style="overflow: hidden; margin-left: 20px; margin-top: 20px;">
				<div style="width: 20px; height: 20px; background-color: black; border-radius: 50%; margin-top: 3px;
    						display: block; float: left; color: white; line-height: 20px; text-align: center;
    						font-size: 15px; font-weight: bold;">
    				!
    			</div>
    			
    			<div style="font-size: 16px; line-height: 24px; font-weight: bold; margin-left: 7px; float: left">
    				주문 전 확인사항
    			</div>
    		</div>
    		
    		<div style="margin-left: 20px; margin-top: 13px; font-size: 15px; line-height: 20px;">
    			주문 확정 버튼을 누르면 고객님이 주문하신 상품의 생산이 시작될 예정이며, 생산이 완료되면 결제가 진행됩니다.
				<br/>정상적인 결제가 가능하도록 카드 정보를 한번 더 확인해주세요! (유효기간 만료, 사용한도 초과, 잔액부족, 거래거절, 도난/분실 신청 등)
    		</div>
		</div>
		
		<div style="margin-top: 40px; width: 780px; margin-left: auto; margin-right: auto; height: 177px">
		<button type="button" id="purchase_submitBtn" style="font-size: 20px">
				주문확정
		</button>
	</div>
	</div>
</div>

<!-- 카드 선택 모달 -->
<div class="modal modal-center fade" id="cardModal" role="dialog">
	<div class="modal-dialog modal-center" style="width: 780px" role="document">
		<div class="modal-content" style="height: 650px;  width: 100%;">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="overflow: hidden">
	        <div class="cardModal-content" style="height: 520px;">
	          <div class="cardModal_Title" style="text-align: center;">
	          	<span style="font-size: 20px; font-weight: bold;">카드 선택</span>
	          </div>
	          
	          <div class="cardModal_addBtn" id="cardModal_cards"
	          	style="overflow: auto; width: 130%; height: 500px; margin-right: auto; margin-left: auto;">
	          	<c:forEach items="${cardInfo}" var="cardList">
	          	<div class="cardList ${cardList.card_num_seq}" style="display: inline-block; float: left; margin-left: 65px; margin-top: 42px;">
	          		<div class="card_Active">
	          			<div class="card_ActiveTitle">
	          				<input type="radio" name="cardgroup" value="${cardList.card_num_seq}" />
	          			</div>
	          			<div class="card_ActiveTitle">${cardList.card_title}</div>
	          		</div>
	          	</div>
	      		</c:forEach>
	          	<button class="card_AddBtn" type="button" style="display: inline-block"></button>	          
	          </div>
	          
	        </div>
	        </div>
	        <div class="modal-footer" style="border-top: none; padding: 0px;">
	          <div style="width: 780px; height: 60px;
	          		display: flex; flex-wrap: wrap; border-radius: 3px">
	          	<button class="card_DeleteBtn" type="button">선택제거</button>
	          	<button class="card_SubmitBtn" type="button">선택완료</button>
	          </div>
	        </div>
	    </div>
	</div>
</div>

<!-- 카드 등록 모달 -->
<div class="modal modal-center fade" id="cardModal2" role="dialog">
	<div class="modal-dialog modal-center" style="width: 600px" role="document">
		<div class="modal-content" style="height: 600px;  width: 100%;">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="overflow: hidden">
	        <div class="cardModal-content" style="height: 480px;">
	          <div class="cardModal_Title" style="text-align: center;">
	          	<span style="font-size: 20px; font-weight: bold;">카드 등록</span>
	          </div>
	          <div class="card_RegBox">
	          	<div class="card_titleBox">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">카드별명</span>
	          		</div>
	          		<div>
	          			<input id="card_nickname" type="text" maxlength="20" 
	          				style="width: 300px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"/>
	          		</div>
	          	</div>
	          	
	          	<div class="card_titleBox">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">생년월일 앞 6자리</span>
	          		</div>
	          		<div>
	          			<input id="card_birthday" type="text" maxlength="6" 
	          				style="width: 300px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"/>
	          		</div>
	          	</div>
	          	<div class="card_titleBox">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">카드번호</span>
	          		</div>
	          		<div>
	          			<input id="card_number" type="text" maxlength="16" 
	          				style="width: 300px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"/>
	          		</div>
	          	</div>
	          	<div class="card_titleBox">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">유효기간</span>
	          		</div>
	          		<div>
	          			<input id="card_year" type="text" maxlength="2" 
	          				style="width: 137px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"
	          				 placeholder="년도 입력" />
	          			<input id="card_month" type="text" maxlength="2" 
	          				style="width: 137px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"
	          				 placeholder="월 입력" />
	          		</div>
	          	</div>
	          	<div class="card_titleBox" style="border-bottom: none">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">비밀번호 앞 2자리</span>
	          		</div>
	          		<div>
	          			<input id="card_password" type="password" maxlength="2" 
	          				style="width: 300px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"
	          				 placeholder="비밀번호 앞 2자리 입력"/>
	          		</div>
	          	</div>
	          </div>
	        </div>
	        </div>
	        <div class="modal-footer" style="border-top: none; padding: 0px;">
	          <div style="width: 600px; height: 60px; display: flex; flex-wrap: wrap;">
	          	<button class="card_RegisterBtn" type="button">등록하기</button>
	          </div>
	        </div>
	    </div>
	</div>
</div>


<!-- 카드 등록 오류 시 모달 (잘못 입력한 경우) -->
<div class="modal modal-center fade" id="cardErrorModal1" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">빈 칸이 있거나 잘못 입력하셨습니다. 확인해주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 카드 중복처리..? -->

<!-- 카드 등록 오류 시 모달 (잘못 입력한 경우) -->
<div class="modal modal-center fade" id="cardErrorModal3" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">카드 정보를 하나 선택 후 실행하여 주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 카드 등록 정상 모달 -->
<div class="modal modal-center fade" id="cardinsertSuccess" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">카드가 등록되었습니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 카드 기본값 등록 정상 모달 -->
<div class="modal modal-center fade" id="cardDefaultSuccess" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">기본 카드가 등록되었습니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 적립금 등록 모달 -->
<div class="modal modal-center fade" id="mileageModal" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<div id="modaltext">사용하실 적립금을 입력하여주세요.</div> 
	          	<div>현재 적립금 : <span id="memMileage">${userInfo.member_mileage}</span></div>
	          	<input id="mileageVal" type="text" placeholder="숫자만 입력하세요." 
	          		style="text-align: center; vertical-align: middle; border: 1px solid black; margin-top: 10px;">
	          	<button type="button" id="mileageUsingBtn" style="vertical-align: middle; margin-top: 10px;">사용하기</button>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 적립금을 올바르게 쓰지 않았거나 보유한 적립금보다 더 많이 사용했을 경우 -->
<div class="modal modal-center fade" id="mileageError" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">보유한 적립금을 확인 후 다시 입력해주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 결제 방법을 택하지 않고 활정 버튼을 누른 경우 -->
<div class="modal modal-center fade" id="payMethodError" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">결제 방법을 선택하여 주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>

<!-- 결제방법을 카드를 택하고 기본카드를 택하지 않고 확정 버튼을 누른 경우 -->
<div class="modal modal-center fade" id="cardError" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">먼저 카드를 등록 후 기본 카드로 선택하셔야 합니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	    </div>
	</div>
</div>
</body>
</html>