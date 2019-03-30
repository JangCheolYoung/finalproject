<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	button:focus {
		outline: 0
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//카드 선택 버튼 누를시 선택 모달 출력
		$('#cardSelector').on('click', function() {
			$('#cardModal').modal();
		});
		
		//선택 모달에서 등록 모달 누를시 기존 모달 닫고 등록 모달 출력
		$('.card_AddBtn').on('click', function() {
			$('#cardModal2').modal();
			$('#cardModal').modal('hide');
		});
		
		//등록모달 내에 카드별명 이외 란에 문자입력 차단
		 $("#card_password, #card_month, #card_year, #card_number, #card_birthday").keyup(function(event) { // 키다운의 경우 앞 한글자를 못받음
	         if (!(event.keyCode >=37 && event.keyCode<=40)) { // del, backspace 허용하기 위해
	             var inputVal = $(this).val();
	             $(this).val(inputVal.replace(/[^0-9]/gi,''));
	         }
	     });
		
		//강제로 문자 입력 후 등록 누를시 차단하기 위한 정규식 (오직 숫자만)
		var cardchk = /[^0-9]/g;
		 
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
				<input type="radio" name="radio-card/deposit" id="radio-card">
			</div>
			
			<div class="payTitle">
				카드 결제
			</div>
			
			<button class="cardSelector" id="cardSelector" type="button" style="float: right;">
				결제카드 선택
			</button>
		</div>
		
		<div class="bottom-line"></div>
		
		<div class="paySelector" style="border-top: none; clear: both; position: relative; top: -2px;">
			<div class="payRadio">
				<input type="radio" name="radio-card/deposit" id="radio-deposit">
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
				<span style="font-size: 15px; line-height: 30px;">기2222모리 원 사용</span>
			
				<div style="display: inline-block; line-height: 30px; font-size: 18px; font-weight: bold; float: right; margin-right: 20px;">
					상품 구매 시 200 원 적립
				</div>
			</div>
			
			
		</div>
		
		
		<div class="purchase_title" style="margin-top: 40px;">
			주문내역
		</div>
		<div class="purchase-box" style="margin-top: 20px;">
			<div class="payitemList">
				<span class="payitemName">기모허누</span>
				<span class="payitemOption">기이모</span>
				<span class="payitemPrice">기2모</span>
				<span class="payitemAmount">ki모</span>
			</div>
			
			<div class="payitemSummary">
				<div class="paySummaryPrice" style="margin-left: 95px;">
					<div class="itemPriceTitle">
						상품총합
					</div>
					
					<div class="itemPriceValue">
						기리모리
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
						기2리모리
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
					
					<div class="itemPriceValue">
						기2..리모리
						<span style="font-size: 13px;">원</span>
					</div>		
				</div>
				
				<div class="itemPlusMinus" style="margin-left: 35px;">
						=
				</div>
				
				<div class="paySummaryPrice" style="margin-left: 35px;">
					<div class="itemPriceTitle">
						총합가격
					</div>
					
					<div class="itemPriceValue" style="color: red">
						기2..리모리
						<span style="font-size: 13px; color: black">원</span>
					</div>		
				</div>	
			</div>
		</div>
		
		<div class="purchase_title" style="margin-top: 40px;">
			배송정보
		</div>
		
		<div class="delivery_box">
			기...이..모
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
	          
	          <div class="cardModal_addBtn" 
	          	style="overflow: auto; width: 130%; height: 500px; margin-right: auto; margin-left: auto;">
	          	<div style="display: inline-block; float: left; margin-left: 65px; margin-top: 42px;">
	          		<div class="card_Active">
	          			<div class="card_ActiveTitle">
	          				<input type="radio" name="cardgroup" />
	          			</div>
	          			<div class="card_ActiveTitle">시발죽자</div>
	          		</div>
	          		
	     
	          	</div>	
	          	<button class="card_AddBtn" type="button"></button>
	          	<button class="card_AddBtn" type="button"></button>
	          	<button class="card_AddBtn" type="button"></button>
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
	          				 placeholder="년도 입력">
	          			<input id="card_month" type="text" maxlength="2" 
	          				style="width: 137px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"
	          				 placeholder="월 입력"/>
	          		</div>
	          	</div>
	          	<div class="card_titleBox" style="border-bottom: none">
	          		<div class="card_titleinnerBox" style="line-height: 85.8px">
	          			<span style="margin-left: 30px; font-size: 18px">비밀번호 앞 2자리</span>
	          		</div>
	          		<div>
	          			<input id="card_password" type="password" maxlength="2" 
	          				style="width: 300px; height: 38px; padding-left: 15px; font-size: 15px;
	          				 border: 1px solid black; margin-left: 23px; margin-top: 25px;"/
	          				 placeholder="비밀번호 앞 2자리 입력">
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
</body>
</html>