<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카아아아트</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css);
* {	
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans', 'Sans-serif';
	margin: 0;
	padding: 0;
	outline: 0;
}

.has_items{
width: 1180px; 
margin-left: auto;
margin-right: auto; 
margin-top: 100px; 
overflow: auto;
}

.item.thumbnail{
float: left; 
width:109px; 
height: 109px; 
border: 1px solid #e1dedf; 
margin: 19px 0 0 24px;  
cursor: pointer;

}

.cart_amount{
float: left; 
width: 124px; 
height: 43px; 
margin: 50px 0 0 10px; 
line-height: 45px; 
border: 1px solid #e1dedf;
}

.price{
float: left; width: 100px; height: 45px; margin: 50px 0 0 10px; line-height: 45px; text-align: right;
}


.order_btn{
width: 220px; height: 50px; margin-right: auto; margin-left: auto; text-align: center; margin-top:10px; background-color: #d0021b; color: white; line-height: 50px; font-weight: 700; cursor: pointer;
}

.back_btn{
width: 220px; height: 50px; margin-right: auto; margin-left: auto; text-align: center; margin-top:10px; background-color: #acacac; margin-bottom: 12px; color: white; line-height: 50px; font-weight: 700; cursor: pointer;
}

</style>

<script type="text/javascript">
	// 장바구니 레코드 넘버
	var cart_num;
	
	$(document).ready(function() {
		
		// 상품 이미지, 이름 눌렀을 때.
		$('.item').on('click', function(){
			alert('해당 상품 상세 페이지로 이동.');
			
			// 해야 할 일 : 선택한 장바구니 상품의 cart_num 레코드가 지니고 있는 item_num detail 페이지로 넘어가게 이벤트.
			
			
		});
		// -, + 눌렀을 때 수량 체인지 이벤트 발생.
		$(document).on('click','.op', function(){
			// 눌린 객체가 -인지 +인지 확인.
			var operation = $(this).attr('class').split(' ')[1];
			//alert(operation);
			cart_num = $(this).attr('class').split(' ')[2];
			//console.log(cart_num);
			
			// 수량이 1개일때 -를 누르면 삭제 되도록 설정한다.
			
			cart_amount = $('div[class="'+ cart_num +'"]').text();
			
			if(cart_amount == 1 && operation == '-1'){
				$.ajax({
					type:		'POST',
					dataType:	'json',
					url:		'deleteCart.do',
					data:		{'cart_num':cart_num},
					success:	paintList,	
					error:		errorMessage
				}); 
			}
			else{
				$.ajax({
					type:		'POST',
					dataType:	'json',
					url:		'amountChange.do',
					data:		{'cart_num':cart_num, 'operation':operation},
					success:	successMethod,	
					error:		errorMessage
				}); 
			}
		});
		
		// class = "delete" 누르면.
		$(document).on('click','.delete', function(){
			
			cart_num = $(this).attr('class').split(' ')[1];
			
			
			//console.log("plz delete cart_num : "+cart_num);
			
			// 해야 할 일 1: cart 테이블에서  cart_num에 해당하는 레코드를 지운다. 
			// 해야 할 일 1: 세션 member_id에 해당하는 레코드를 List<CartDTO> 담아서 모두 보내준다.
			// 해야 할 일 1: 기존 장바구니 테이블을 지우고. 가져온 장바구니 상품 리스트를 가지고 다시 형식에 맞추어 뿌려준다.
			
			// 해야 할 일 2: 리스트가 비어있으면 <  장바구니에 아무것도 없습니다. > 를 보여주게 이벤트 추가.
			
			
			$.ajax({
				type:		'POST',
				dataType:	'json',
				url:		'deleteCart.do',
				data:		{'cart_num':cart_num},
				success:	paintList,	
				error:		function(){
					console.log('delete error');
				}
				
			});
			
			
		});

		$('.order_btn').on('click', function(){
			alert('주문 페이지로 이동.');
			// 해야 할 일 : 주문 페이지로 이동하도록 경로 추가.
		});
		$('.back_btn').on('click', function(){
			alert('쇼핑 페이지로 이동.');
			// 해야 할 일 : 쇼핑 페이지로 이동하도록 경로 추가.
		});
		
		
	});// end ready()/////////////////////////////////////////
	
 	function paintList(res){
	// cart 테이블에서 cart_num에 해당하는 레코드 지워주고.
	// member_id에 해당하는 레코드 리스트 가져와서 뿌려주는 함수
	var total_price = 0;
	if(res.length != 0){
		$('.cart').empty();
		$.each(res, function(index, value){
			var source = 	'<div style="height: 147px; border-bottom: 1.5px solid #f8f8f8; ">'
						  + 	'<div class="item thumbnail">상품사진1</div>'
						  + 	'<div style="float: left; width:350px; height: 45px; margin: 50px 0 0 53px;">'
						  + 		'<p class="item name" style="font-size: 16px; cursor: pointer; display: inline-block;">수신선 무항생제 한우 등심(1+등급)'+value.cart_num + '</p>'
						  + 		'<p style="font-size: 13px; color: #e1dedf;">옵션</p>'
						  +		'</div>'
						  + 	'<div class="cart_amount">'
						  + 		'<div class="op -1 '+ value.cart_num +'" style="float: left; width: 40px; height: 43px; cursor: pointer; font-size: 40px; color: #e1dedf; text-align: center; line-height: 43px; user-select: none;">-</div>'
						  + 		'<div class="'+ value.cart_num +'" style="float: left; width: 40px; height: 43px; font-size: 16px; text-align: center; line-height: 43px; user-select: none;">' + value.cart_amount + '</div>'
						  + 		'<div class="op 1 '+ value.cart_num +'" style="float: left; width: 40px; height: 43px; cursor: pointer; font-size: 35px; color: #e1dedf; text-align: center; line-height: 43px; user-select: none;">+</div>' 
						  +		'</div>'
						  + 	'<div class="price"><span class="'+ value.cart_num +'">'+ addComma(value.cart_price * value.cart_amount) +'</span>원</div>'
						  + 	'<img class="delete '+ value.cart_num +'" src="images/x.png" style="width: 35px; height: 35px; margin: 55px 0 0 28px; float: right; cursor: pointer;"/>'
						  + '</div>';
			$('.cart').append(source);
			
			total_price += value.cart_price * value.cart_amount;
			$('#total_price').empty();
			$('#total_price').text(addComma(total_price));
			

			// 임의로 준 배송료 2500원
			var delivery = 2500;
			
			$('#expectedAmount').empty();
			$('#expectedAmount').text(addComma(total_price + delivery));
			
		});
			
	}else{
		
		$('.has_items').remove();
		
		
		var no_items = '<div class="no_items" style="width: 1180px; margin-left: auto; margin-right: auto; margin-top: 100px; overflow: auto;">'
					+  '<div style="height: 30px; font-size: 32px; text-align: center;">장바구니</div>'
					+  '<div style="margin-top: 50px; overflow: auto; border-top: 1px solid black;">'
					+  '<div style="text-align: center; font-size: 40px; margin-top: 80px; height: 30px; color:#e1dedf;">장바구니에 담은 상품이 없습니다.</div>'
					+  '<div class="continueShopping" style="cursor: pointer; width:260px; height: 70px; background-color: black; margin-left: auto; margin-right: auto; margin-top: 60px;">'
					+  '<span style="font-size: 16px; font-weight: 700; line-height: 1.5; color: white; margin-top: 23px; position: relative; margin-left: 30px; float: left; cursor: pointer;">쇼핑계속하기</span>'
					+  '<img src="images/arrow.png" style="background-repeat: no-repeat; display: inline-block; width: 23px; height: 22px; margin-left: 90px; margin-top: 25px; float: left;"/>'
					+  '</div><div style="border-bottom: 1px solid #e1dedf; margin-top: 50px;"></div></div></div>';
					
		$('body').append(no_items);
		
		
	
	}
		
	} 
	
	
	function successMethod(res){
		
		//console.log(cart_num);
				
		var price = res[0].cart_amount * res[0].cart_price;
		var total_price = res[1];
		//console.log(addComma(price));
		
		// 기존의 수량을 지워주고 가져온 수량을 넣어줌.
		$('div[class="'+ cart_num +'"]').empty();;
		$('div[class="'+ cart_num +'"]').text(res[0].cart_amount);
		
		$('span[class="'+ cart_num +'"]').empty();
		$('span[class="'+ cart_num +'"]').text(addComma(price));
		
		$('#total_price').empty();
		$('#total_price').text(addComma(total_price));
		
		
		// 임의로 준 배송료 2500원
		var delivery = 2500;
		
		$('#expectedAmount').empty();
		$('#expectedAmount').text(addComma(total_price + delivery));
		
	
	};
	
	function errorMessage(){
		console.log('error!!');
	};
	
	function addComma(value){
		return Number(value).toLocaleString('en');
	};
</script>
</head>
<body>
	<c:choose>
		<c:when test="${!empty list}">
		<!-- 장바구니에 1개 이상 들어있을 때 생성해준다.-->
			<div class="has_items">
				<!-- 장바구니 텍스트. -->
				<div style="height: 30px; font-size: 32px; text-align: center;">장바구니</div>
				
				<!-- 장바구니에 들어있는 상품과 총 결제 예정 금액과 그 외 다른 버튼과 정보들을 보여주는 창이 함께 포함된 레이아웃 -->
				<div style="margin-top: 50px; overflow: auto;">
					<!-- 장바구니에 들어있는 상품을 보여주기 위한 레이아웃 -->
					<div style="width: 860px;  display: inline-block; float: left; ">
					
						<!-- 상품정보, 수량, 가격등 컬럼을 알려주는 텍스트 레이아웃 -->
						<div style="height: 50px; border-top: 1px solid black; border-bottom: 1px solid #e1dedf;">
							<span style="margin-left: 250px; float:left; font-size: 13px; margin-top: 18px;">상품정보</span>
							<span style="margin-left: 300px; float:left; font-size: 13px; margin-top: 18px;">수량</span>
							<span style="margin-left: 120px; float:left; font-size: 13px; margin-top: 18px;">가격</span>
						</div>
						
						<div class="cart">
							<!-- 장바구니에 담긴 상품 list가져와서 foreach를 사용해서 출력해준다. -->
							<c:forEach items="${list}" var="dto" varStatus="i">
								<!-- 회색 선. -->
								<div style="height: 147px; border-bottom: 1.5px solid #f8f8f8; ">
								<!-- 상품 사진 ////////////////////////////////////////////////////////////////////////////////////////-->
									<div class="item thumbnail">상품사진1</div>
								<!-- 상품 이름 ////////////////////////////////////////////////////////////////////////////////////////-->
									<div style="float: left; width:350px; height: 45px; margin: 50px 0 0 53px;">
										<p class="item name" style="font-size: 16px; cursor: pointer; display: inline-block;">수신선 무항생제 한우 등심(1+등급)${dto.cart_num}</p>
										<p style="font-size: 13px; color: #e1dedf;">옵션</p>
									</div>	
								<!-- 상품 수량////////////////////////////////////////////////////////////////////////////////////////-->
									<div class="cart_amount">
										<div class="op -1 ${dto.cart_num}" style="float: left; width: 40px; height: 43px; cursor: pointer; font-size: 40px; color: #e1dedf; text-align: center; line-height: 43px; user-select: none;">-</div>
										<div class="${dto.cart_num}" style="float: left; width: 40px; height: 43px; font-size: 16px; text-align: center; line-height: 43px; user-select: none;">${dto.cart_amount}</div>
										<div class="op 1 ${dto.cart_num}" style="float: left; width: 40px; height: 43px; cursor: pointer; font-size: 35px; color: #e1dedf; text-align: center; line-height: 43px; user-select: none;">+</div>
										
									</div>
								<!-- 상품 가격 ////////////////////////////////////////////////////////////////////////////////////////-->
									<div class="price"><span class="${dto.cart_num}"><fmt:formatNumber pattern="#,###">${dto.cart_price * dto.cart_amount}</fmt:formatNumber></span>원</div>
								<!-- 상품 제거 ////////////////////////////////////////////////////////////////////////////////////////-->
									<!-- 장바구니 상품 삭제 버튼 X 표시의 class로 cart_num을 넣어준다. -->
									<img class="delete ${dto.cart_num}" src="images/x.png" style="width: 35px; height: 35px; margin: 55px 0 0 28px; float: right; cursor: pointer;"/>
								</div>
							</c:forEach>
						</div>
					</div>
					
					<div style="width: 280px; height:400px; float:right; border-top: 1px solid black; background-color: #f8f8f8">
						
						<div style="width:220px; height: 80px; margin-left: auto; margin-right: auto; line-height: 90px;">
							<span style="float: left; font-size: 15px; height: 80px;">총 상품 금액</span>
							<span style="float: right; font-size: 15px; height: 80px;"><span id=total_price><fmt:formatNumber value="${total_price}" pattern="#,###"/></span>원</span>
						</div>
						
						<div style="width:220px; margin-left: auto; margin-right: auto; border-top: 1px solid #e1dedf;"></div>
						
						<div style="width:220px; height: 110px; margin-left: auto; margin-right: auto; line-height: 90px;">
							<div style="height: 40px; line-height: 40px; margin-top: 10px;">
								<span style="float: left; font-size: 15px;">총 배송비</span>
								<span style="float: right; font-size: 15px;"><span>2,500</span>원</span>
							</div>
							<div style="float: right; margin-left: 80px; font-size: 13px; height: 24px; line-height: 1.9; color:#9b9b9b;">
								<span style="text-align: right; margin-right: 15px; ">기본 배송비</span>
								<span style="display: inline-block; text-align: right; width: 50px;"><fmt:formatNumber value="2500" pattern="#,###"/><span>원</span></span>
							</div>
							<div style="float: right; margin-left: 80px; font-size: 13px; height: 24px; line-height: 1.9; color: #4a90e2;">
								<span style="text-align: right; margin-right: 15px;">신선할인</span>
								<span style=" display: inline-block; text-align: right; width: 50px;">-0%</span>
							</div>
						</div>
						
						<div style="width:220px; margin-left: auto; margin-right: auto; border-top: 1px solid #e1dedf;"></div>
						
						<div style="width:220px; height: 50px; margin-left: auto; margin-right: auto; margin-top: 15px;">
							<div style="float: right; margin-left: 140px; font-size: 13px; height: 24px; font-weight: 700; line-height: 1.9;">예상 결제 금액</div>
							<div style="float: right; font-size: 24px; font-weight: 700; color: #d0021b; line-height: 1;"><span id="expectedAmount"><fmt:formatNumber value="${total_price+2500}" pattern="#,###"/></span>원</div>
						</div>
						
						<div class="order_btn">상품주문하기</div>
						<div class="back_btn" style="">쇼핑계속하기</div>
		
					</div>
					
				</div>
			</div>
		</c:when>
		
		
		
		
		
		
		
		
		
		
		
		
		
		<c:when test="${empty list}">
					<!-- 장바구니 비어있을때  -->
			<div class="no_items" style="width: 1180px; margin-left: auto; margin-right: auto; margin-top: 100px; overflow: auto;">
				<div style="height: 30px; font-size: 32px; text-align: center;">장바구니</div>
				<div style="margin-top: 50px; overflow: auto; border-top: 1px solid black;">
					<div style="text-align: center; font-size: 40px; margin-top: 80px; height: 30px; color:#e1dedf;">장바구니에 담은 상품이 없습니다.</div>
					<div class="continueShopping" style="cursor: pointer; width:260px; height: 70px; background-color: black; margin-left: auto; margin-right: auto; margin-top: 60px;">
						<span style="font-size: 16px; font-weight: 700; line-height: 1.5; color: white; margin-top: 23px; position: relative; margin-left: 30px; float: left; cursor: pointer;">쇼핑계속하기</span>
						<img src="images/arrow.png" style="background-repeat: no-repeat; display: inline-block; width: 23px; height: 22px; margin-left: 90px; margin-top: 25px; float: left;"/>
					</div>
					<div style="border-bottom: 1px solid #e1dedf; margin-top: 50px;"></div>
				</div>
			</div>
			
		</c:when>
	</c:choose>


</body>
</html>