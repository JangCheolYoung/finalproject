<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
.order_address_title {
	height: 24px;
	font-size: 18px;
	line-height: 1.33px;
}

.order_address_box {
	width: 978px;
	height: 149px;
	border: 1px solid black;
	margin-top: 18px;
}

.order_boxline {
	height: 49px;
	border-bottom: 1px solid black;
}

.order_boxline:nth-last-child(1) {
	border-bottom: none;
}

.order_customer_title {
	display: inline-block;
	float: left;
	background-color: #f7f7f7;
	width: 179px;
	border-right: 1px solid black;
	height: 100%;
}

.order_boxtext {
	height: 24px;
	font-size: 15px;
	margin-left: 29px;
	margin-top: 14px;
	line-height: 1.25;
	display: inline-block;
}

.order_boxcontent {
	display: inline-block;
	float: left;
}

#order_submitBtn {
	float: left;
	border: none;
	width: 390px;
	height: 60px;
	background-color: black;
	color: white;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	margin-left: 190px;
}

#address_btn {
	float: right;
	margin-top: -3px;
	border: 1px solid gray;
	background-color: white;
	width: 90px;
	height: 32px;
	font-size: 15px;
	cursor: pointer;
}

.adr_title {
	display: inline-block;
	float: left;
	line-height: 40px;
	font-size: 18px;
	font-weight: bold;
}

.adrtable_content {
	width: 100%;
	height: 110px;
	border-bottom: 1px solid black;
}

.adrtable_radio {
	margin-left: 10px;
	margin-top: 40px;
	display: inline-block;
	float: left;
}

.adrtable_info1 {
	display: inline-block;
	float: left;
	margin-left: 7px;
	margin-top: 22px;
}

.adrtable_info1_box {
	margin-left: 35px;
	font-size: 20px;
	line-height: 33px;
}

.adrtable_info2 {
	display: inline-block;
	float: left;
	margin-left: 44px;
	margin-top: 22px;
	width: 270px;
	overflow: hidden;
}

.adrtable_info2_box {
	font-size: 20px;
	line-height: 33px;
}

.adrtable_info2_box:nth-child(1) {
	font-size: 20px;
	line-height: 33px;
	width: 270px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.adrtable_btnline {
	margin-top: 18px;
	margin-right: 20px;
	display: inline-block;
	float: right;
}

.adrtable_btn {
	border: 1px solid black;
	border-radius: 3px;
	background-color: white;
	width: 68px;
	height: 30px;
	font-size: 18px;
	margin-top: 4px;
	display: block;
}
</style>
</head>
<body>
<div id="order_wrap" style="width: 1180px; height: 910px; margin-top: 30px; margin-left: auto; margin-right: auto;">
	<div id="order_header" style="width: 100%; text-align: center; font-size: 38px; line-height: .80;">
	주문하기
	</div>
	
	<div id="order_status" style="width: 1180px; height: 120px; margin-top: 43px; background-color: blue;">
	</div>
	
	<div id="order_address_wrap" style="margin-top: 103px; width: 980px; margin-left: auto; margin-right: auto;">
		<div class="order_address_title">
			보내시는 분
		</div>
		
		<div class="order_address_box">
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이름</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">전화번호</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이메일</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
		</div>
		
		
		<div class="order_address_title" style="margin-top: 54px;">
			받으시는 분
			<button id="address_btn" style="border-radius: 5px;" data-toggle="modal" data-target="#orderModal">
				주소선택
			</button>
		</div>
		
		<div class="order_address_box" style="height: 175px;">
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이름</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">전화번호</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
			
			<div class="order_boxline" style="height: 75px;">
				<div class="order_customer_title">
					<span class="order_boxtext">주소</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">test</span>
				</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 40px; width: 780px; margin-left: auto; margin-right: auto; height: 177px">
		<button id="order_submitBtn">
			다음단계
		</button>
	</div>
</div>

<!-- 모달 설정 -->
	<div class="modal modal-center fade" id="orderModal" role="dialog">
    	<div class="modal-dialog modal-center" role="document">
      		<div class="modal-content">
        		<div class="modal-header" style="border-bottom: none;">
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
        		</div>
        	<div class="modal-body" style="text-align: center; width: 598px; height: 533px;">
          		<div id="ordermodal_title" style="width: 568px; height: 40px; margin-top: 8px;">
          			<span style="font-weight: bold; height: 34px; font-size: 27px; margin-left: 100px;">주소 선택</span>
          			<button id="insert_adr" style="width: 100px; height: 34px; border-radius: 5px;
          				display: inline-block; border: 1px solid gray; background-color: white; font-size: 12px; font-weight: bold;
          					float: right; text-align: center">+ 신규주소 등록</button>
          		</div>
          		
          		<div id="ordermodal_body" style="overflow: hidden; clear: both; width: 568px; height: 350px;">
          			<div id="ordermodal_adrtable" style="width: 568px; height: 350px; border: 1px solid black;">
          				<div id="adrtable_header" style="width: 100%; background-color: #f7f7f7; height: 40px; border-bottom: 1px solid black;">
          					<div class="adr_title" style="margin-left: 65px;">수령인 정보</div>
          					<div class="adr_title" style="margin-left: 145px;">주소지 정보</div>
          				</div>
          				
          				<div id="adrtable_body" style="width:130%; height: 310px; overflow: hidden; overflow-y: scroll; display: inline-block; float: left;">
          					<div class="adrtable_content">
          						<div style="width: 568px; display: inline-block; float: left; height: 110px;">
          							<div class="adrtable_radio">
          								<input type="radio" name="adrtable_radio" style="width:20px; height: 20px; border-radius: -5px;"/>
          							</div>
          							
          							<div class="adrtable_info1">
          								<div class="adrtable_info1_box">
          								어케했노
          								</div>
          								<div class="adrtable_info1_box">
          								ddddd
          								</div>
          							</div>
          							
          							<div class="adrtable_info2">
          								<div class="adrtable_info2_box">
          								어케했노 어어~~~~~~~~~~~~~~케 했ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ노
          								</div>
          								<div class="adrtable_info2_box">
          								ddddd
          								</div>
          							</div>
          							
          							<div class="adrtable_btnline">
          								<button type="button" class="adrtable_btn">
          									변경
          								</button>
          								<button type="button" class="adrtable_btn">
          									삭제
          								</button>
          							</div>
          						</div>
          					</div>
          					<div class="adrtable_content">
          						<div style="width: 568px; display: inline-block; float: left; height: 110px;">
          							<div class="adrtable_radio">
          								<input type="radio" name="adrtable_radio" style="width:20px; height: 20px; border-radius: -5px;"/>
          							</div>
          							
          							<div class="adrtable_info1">
          								<div class="adrtable_info1_box">
          								어케했노
          								</div>
          								<div class="adrtable_info1_box">
          								dddddd
          								</div>
          							</div>
          							
          							<div class="adrtable_info2">
          								<div class="adrtable_info2_box">
          								어케했노 어어~~~~~~~~~~~~~~케 했ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ노
          								</div>
          								<div class="adrtable_info2_box">
          								dddd
          								</div>
          							</div>
          							
          							<div class="adrtable_btnline">
          								<button type="button" class="adrtable_btn">
          									변경
          								</button>
          								<button type="button" class="adrtable_btn">
          									삭제
          								</button>
          							</div>
          						</div>
          					</div>             
          				</div>
          			</div>
          		</div>
        	</div>
        	<div class="modal-footer" style="border-top: none;">
          		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        	</div>
      		</div>
    	</div>
  </div>
</body>
</html>