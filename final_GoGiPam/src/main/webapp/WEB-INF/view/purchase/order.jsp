<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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

.ordermodal_title {
	width: 568px; 
	height: 40px; 
	margin-top: 8px;
}

.ordermodal_body {
	overflow: hidden; 
	clear: both; 
	width: 568px; 
	height: 350px;
}

.ordermodal_table {
	width: 568px; 
	height: 350px; 
	border: 1px solid black;
}

.ordertable_header {
	width: 100%; 
	background-color: #f7f7f7; 
	height: 40px; 
	border-bottom: 1px solid black;
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
	height: 108px;
	border-bottom: 1px solid black;
}

.adrtable_radio {
	margin-left: 15px;
	margin-top: 40px;
	display: inline-block;
	float: left;
}

.adrtable_info1 {
	display: inline-block;
	text-overflow: ellipsis;
	float: left;
	margin-left: 7px;
	margin-top: 22px;
}

.adrtable_info1_box {
	margin-left: 35px;
	font-size: 15px;
	line-height: 33px;
}

.adrtable_info2 {
	display: inline-block;
	float: left;
	margin-left: 30px;
	margin-top: 22px;
	width: 240px;
	overflow: hidden;
}

.adrtable_info2_box {
	font-size: 15px;
	line-height: 33px;
	width: 240px;
	float: left;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

/* .adrtable_info2_box:nth-child(1) {
	font-size: 20px;
	line-height: 33px;
	width: 270px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
} */

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
	height: 30px;
	font-size: 18px;
	margin-top: 4px;
	display: block;
}

.ordermodal_btn {
	width: 100px; 
	height: 34px; 
	border-radius: 5px;
    display: inline-block; 
    border: 1px solid gray; 
    background-color: white; 
    font-size: 12px; 
    font-weight: bold;
    float: right;
    text-align: center
}

.ordermodal_btn2 {
	width: 400px; 
	border: 1px solid black; 
	background-color: black; 
	color: white; 
	font-size: 20px; 
	height: 70px;
	font-weight: bold;
}

.ordermodal_submit {
	margin-left: auto;
	margin-right: auto; 
	margin-top: 30px;
}

.adrinputtable_box {
	height: 87.5px; border-bottom: 1px solid black;
}

.adrinputtable_box:nth-last-child(1) {
	height: 175px; border-bottom: none;
}

.adrinput_title {
	background-color: #f7f7f7; 
	width: 178px; 
	border-right: 1px solid black; 
	height: 86.5px; 
	display: inline-block; 
	float: left; 
	font-size: 15px; 
	text-align: center; 
	line-height: 86.5px;
}

.order_textinputbox {
	font-size: 13px;
	line-height: 1.85;
	display: inline-block;
	width: 379px;
	height: 38px;
	border: 1px solid gray;
	margin-top: 24px;
	padding-left: 14px;
}

button:focus {
	outline: none;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('daum'); // 입력하기 시 주소찾기 화면
	var element_wrap2 = document.getElementById('daum2'); // 수정하기 시 주소찾기 화면
	var telchk = /^(010|011|016|017|019|02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064)([0-9]{3,4})([0-9]{4})/;
	// 전화번호 입력 유효성 검사
	
	$('#search_postnumbtn').on('click', function() {
		execDaumPostcode();
	});
	
	$('#alter_search_postnumbtn').on('click', function() {
		execDaumPostcode2();
	});
	
	$('#btnFoldWrap').on('click', function() {
		foldDaumPostcode();
	});
	
	$('#btnFoldWrap2').on('click', function() {
		foldDaumPostcode2();
	});
	
	function foldDaumPostcode() {
	    // iframe을 넣은 element를 안보이게 한다.
	    element_wrap.style.display = 'none';
	}
	
	function foldDaumPostcode2() {
	    // iframe을 넣은 element를 안보이게 한다.
	    element_wrap2.style.display = 'none';
	}
	function execDaumPostcode() { 		
	    // 현재 scroll 위치를 저장해놓는다.
	    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {	         
	                    addr += " (" + data.bname + ") ";
	                }
	                // 건물명이 있으면 추가한다.
	                if(data.buildingName !== ''/*  && data.apartment === 'N' */){
	                    addr += (addr !== '' ? ' (' + data.buildingName : data.buildingName) + ') ';
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(addr !== ''){
	                    addr;
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("address").value = addr;
	            
	            } else {
	                document.getElementById("address").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('post_num').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("address_detail").focus();

	            // iframe을 넣은 element를 안보이게 한다.
	            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	            element_wrap.style.display = 'none';

	            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	            document.body.scrollTop = currentScroll;
	        },
	        width : '570px',
	        height : '470px'
	    }).embed(element_wrap);

	    // iframe을 넣은 element를 보이게 한다.
	    element_wrap.style.display = 'block';
	}
	/// 주소 입력하기
	
	function execDaumPostcode2() { 		
	    // 현재 scroll 위치를 저장해놓는다.
	    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {	         
	                    addr += " (" + data.bname + ") ";
	                }
	                // 건물명이 있으면 추가한다.
	                if(data.buildingName !== ''/*  && data.apartment === 'N' */){
	                    addr += (addr !== '' ? ' (' + data.buildingName : data.buildingName) + ') ';
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(addr !== ''){
	                    addr;
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("alter_address").value = addr;
	            
	            } else {
	                document.getElementById("alter_address").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('alter_post_num').value = data.zonecode;
	            document.getElementById("alter_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("alter_address_detail").focus();

	            // iframe을 넣은 element를 안보이게 한다.
	            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	            element_wrap2.style.display = 'none';

	            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	            document.body.scrollTop = currentScroll;
	        },
	        width : '570px',
	        height : '470px'
	    }).embed(element_wrap2);

	    // iframe을 넣은 element를 보이게 한다.
	    element_wrap2.style.display = 'block';
	}
	/// 주소 입력하기
	
	 $("#receiver_tel").keyup(function(event) { // 키다운의 경우 앞 한글자를 못받음
         if (!(event.keyCode >=37 && event.keyCode<=40)) { // del, backspace 허용하기 위해
             var inputVal = $(this).val();
             $(this).val(inputVal.replace(/[^0-9]/gi,''));
         }
     });
	
	 $("#alter_receiver_tel").keyup(function(event) { // 키다운의 경우 앞 한글자를 못받음
         if (!(event.keyCode >=37 && event.keyCode<=40)) { // del, backspace 허용하기 위해
             var inputVal = $(this).val();
             $(this).val(inputVal.replace(/[^0-9]/gi,''));
         }
     });
	/// 연락처 입력 받는 곳 숫자만 받을 수 있도록 처리
	
	$('input').on(('input'), $(this), function () {
		if($('#receiver_name').val() != '' &&
		   $('#receiver_tel').val() != '' &&
		   $('#post_num').val() != '' &&
		   $('#address').val() != '' &&
		   $('#address_detail').val() != '') {
				$('#recipient_offBtn').css('display', "none");
				$('#recipient_submitBtn').css('display', "inline-block");
		} else {
				$('#recipient_offBtn').css('display', "inline-block");
				$('#recipient_submitBtn').css('display', "none");
		}
	});
	
	$('input').on(('input'), $(this), function () {
		if($('#alter_receiver_name').val() != '' &&
		   $('#alter_receiver_tel').val() != '' &&
		   $('#alter_post_num').val() != '' &&
		   $('#alter_address').val() != '' &&
		   $('#alter_address_detail').val() != '') {
				$('#alter_recipient_offBtn').css('display', "none");
				$('#recipient_updateBtn').css('display', "inline-block");
		} else {
				$('#alter_recipient_offBtn').css('display', "inline-block");
				$('#recipient_updateBtn').css('display', "none");
		}
	});
	/// 모든 인풋값을 입력하기 전까지는 등록하기 버튼 비활성화
	
	$('#address_btn').on('click', function() {
		$('#orderModal').modal('show');
	});
	
	$('#insert_adrbtn').on('click', function() {
		$('#orderModal2').modal('show');
		$('#orderModal').modal('hide');
	});
	
	$('#recipient_submitBtn').on('click', function() {
		var member_id = $('#member_id').val();
		var post_num = $('#post_num').val();
		var address = $('#address').val();
		var address_detail = $('#address_detail').val();
		var receiver_name = $('#receiver_name').val();
		var receiver_tel = $('#receiver_tel').val();
		
		if(telchk.test($('#receiver_tel').val()) == false) {
			$('#error2Modal').modal('show');
			//$('#orderModal').modal('show');
		} else {
			$('#orderModal').modal('toggle');
			$('#orderModal2').modal('hide');
			
			$.ajax({
				type: "POST",
				url: "adr_insert.do",
				data: {
					'member_id' : member_id,
					'post_num' : post_num,
					'address' : address,
					'address_detail' : address_detail,
					'receiver_name' : receiver_name,
					'receiver_tel' : receiver_tel
				},
				success : addressList
			});
			
		}
	});
	//////////////////////////////////////////////////////////////////////////주소 등록하기
	
	$(document).on('click','#adrAlterBtn', function() { // 동적으로 받을 때.. 클릭 이벤트가 일어난 버튼에서 기능을 수행해라
		$('#orderModal3').modal('show');
		$('#orderModal').modal('hide');
	
		var num = $(this).attr('class').split(' ')[1]; // num을 받아옴
		
		var member_id = '<%= (String) session.getAttribute("member_id")%>';
		var receiver_name = $('.adrtable_info1_box.receiver_name_'+num).text().trim();
		var receiver_tel = $('.adrtable_info1_box.receiver_tel_'+num).text().trim();
		var post_num = $('.adrtable_info2_box.post_num_'+num).text().trim();
		var address_num = $('.adrtable_info1_box.address_num_'+num).text().trim();
		var address = $('.adrtable_info2_box.address_'+num).text().trim();
		var address_detail = $('.adrtable_info2_box.address_detail_'+num).text().trim();
		
		$('#recipient_updateBtn').css('display', 'inline-block');
		$('#alter_recipient_offBtn').css('display', 'none');
		
		$('#alter_address_num').val(address_num);
		$('#alter_post_num').val(post_num);
		$('#alter_address').val(address);
		$('#alter_address_detail').val(address_detail);
		$('#alter_receiver_name').val(receiver_name);
		$('#alter_receiver_tel').val(receiver_tel);
		
	});
	
	$('#recipient_updateBtn').on('click', function() {
		var member_id = $('#alter_member_id').val();
		var post_num = $('#alter_post_num').val();
		var address = $('#alter_address').val();
		var address_detail = $('#alter_address_detail').val();
		var address_default = $('#alter_address_default').val();
		var receiver_name = $('#alter_receiver_name').val();
		var receiver_tel = $('#alter_receiver_tel').val();
		var address_num = $('#alter_address_num').val();
		
		if(telchk.test($('#alter_receiver_tel').val()) == false) {
			$('#error2Modal').modal('show');
			//$('#orderModal').modal('show');
		} else {		
			$('#orderModal').modal('show');
			$('#orderModal3').modal('hide');

			$.ajax({
				type: "POST",
				url: "adr_update.do",
				data: {
					'address_num' : address_num,
					'member_id' : member_id,
					'post_num' : post_num,
					'address' : address,
					'address_detail' : address_detail,
					'receiver_name' : receiver_name,
					'receiver_tel' : receiver_tel,
				},
				success : addressList
			});			
		}
	});
	///////////////////////////////////////////////////////////////////// 수정하기
	
	$(document).on('click','#adrDeleteBtn', function() { // 동적으로 받을 때.. 클릭 이벤트가 일어난 버튼에서 기능을 수행해라
		var member_id = '<%= (String) session.getAttribute("member_id")%>';
		var num = parseInt($(this).attr('class').split(' ')[1]);
		
			$.ajax({
				type: "POST",
				url: "adr_delete.do",
				data: {
					'address_num' : num,
					'member_id' : member_id
				},
				beforeSend : function() { // ajax가 요청되기 전 처리 될 때 삭제가 되버려서 기본값으로 설정한 주소가 보이는 부분만 지워짐
						$('#orderBox_receiver_name').text('');
						$('#orderBox_receiver_tel').text('');
						$('#orderBox_address').text('');
						$('#orderBox_address_detail').text('');
				},
				success: addressList
			});
	});
	///////////////////////////////////////////////////////////////////// 삭제하기
	
	function addressList(res) {
		$('.adrtable_content').remove();
		
			$.each(res, function(index, value) {
				var source ='<div class="adrtable_content">'
						+ '<div style="width: 568px; display: inline-block; float: left; height: 108px;">'
						+ '<div class="adrtable_radio">'
						+ '<input type="radio" class="radio_{{address_num}}" id="adrSelect" name="adrtable_radio" value="{{address_num}}" style="width:20px; height: 20px; border-radius: -5px;"/>'
						+ '</div>'
						+	'<div class="adrtable_info1">'
						+'<div class="adrtable_info1_box address_num_{{address_num}}" id="address_num" style="display: none">'
						+'{{address_num}}'
						+'</div>'
						+'<div class="adrtable_info1_box receiver_name_{{address_num}}" id="receiver_namebox">'
						+'{{receiver_name}}'
						+'</div>'
						+'<div class="adrtable_info1_box receiver_tel_{{address_num}}" id="receiver_telbox">'
						+'{{receiver_tel}}'
						+'</div>'
						+'</div>'
						+'<div class="adrtable_info2">'
						+	'<div class="adrtable_info2_box post_num_{{address_num}}" id="post_numbox" style="display: none">{{post_num}}</div>'
						+	'<div class="adrtable_info2_box address_{{address_num}}" id="address_box">'
						+	'{{address}}'
						+	'</div>'
						+	'<div class="adrtable_info2_box address_detail_{{address_num}}" id="address_detailbox">'
						+	'{{address_detail}}'
						+'	</div>'
						+'</div>'
						+'<div class="adrtable_btnline">'
						+	'<button type="button" id="adrAlterBtn" class="adrtable_btn {{address_num}}">'
						+		'변경'
						+ '</button>'
						+	'<button type="button" id="adrDeleteBtn" class="adrtable_btn {{address_num}}">'
						+		'삭제'
						+	'</button>'
						+'</div>'
						+'</div>'
						+'</div>'
					
				var template = Handlebars.compile(source);
				$('#adrtable_body').append(template(value));
			
			});
			
			$('#post_num').val('');
			$('#address').val('');
			$('#address_detail').val('');
			$('#receiver_name').val('');
			$('#receiver_tel').val('');
			
			for(var i in res) {
				if(res[i].address_default == 1) {
					$('#receiver_box').remove();
					
					var source2 = '<div id="receiver_box">'
					+'<div class="order_address_box" style="height: 175px;" id="receiver_box">'
					+'<div class="order_boxline">'
					+	'<div class="order_customer_title">'
					+		'<span class="order_boxtext">이름</span>'
					+	'</div>'
					+	'<div class="order_boxcontent">'
					+		'<span class="order_boxtext" id="orderBox_receiver_name">'+res[i].receiver_name+'</span>'
					+	'</div>'
					+'</div>'
					+'<div class="order_boxline">'
					+	'<div class="order_customer_title">'
					+		'<span class="order_boxtext">전화번호</span>'
					+	'</div>'
					+	'<div class="order_boxcontent">'
					+		'<span class="order_boxtext" id="orderBox_receiver_tel">'+res[i].receiver_tel+'</span>'
					+	'</div>'
					+'</div>'		
					+'<div class="order_boxline" style="height: 75px;">'
					+	'<div class="order_customer_title">'
					+		'<span class="order_boxtext">주소</span>'
					+	'</div>'	
					+	'<div class="order_boxcontent">'
					+		'<div class="order_boxtext" style="display: block" id="orderBox_address">'+res[i].address+'</div>'
					+		'<div class="order_boxtext" style="display: block; margin-top: 5px;" id="orderBox_address_detail">'+res[i].address_detail+'</div>'
					+	'</div>'
					+'</div>'
					+'</div>'
					+'</div>'
					
					$('#order_address_wrap').append(source2);	
				}
			}
	}
	//////////////////////////////////////////////////////////// 주소 등록, 삭제, 변경시 실시간 반영을 위한 메소드
	
	$('#adrselect_submitBtn').on('click', function() {
		var num = $('input:radio[name="adrtable_radio"]:checked').val();
		var member_id= '<%= (String) session.getAttribute("member_id") %>';

		if(typeof num === "undefined")
			$("#errorModal").modal();
		else
			$.ajax({
				type: "POST",
				url: "adr_select.do",
				data: {
					'address_num' : Number(num),
					'member_id' : member_id,
				},
				success: defaultAdrset,
				error: function() {
					 $("#errorModal").modal();
				}
			});		
	});
	
	function defaultAdrset(res) {
		$('#orderBox_receiver_name').text(res.receiver_name);
		$('#orderBox_receiver_tel').text(res.receiver_tel);
		$('#orderBox_address').text(res.address);
		$('#orderBox_address_detail').text(res.address_detail);
	}
	///////////////////////////////////////////////////////////// 선택하기

	$('#order_submitBtn').on('click', function() {
		if($('#orderBox_receiver_name').text().trim() != "" &&
				$('#orderBox_receiver_tel').text().trim() != "" &&
					$('#orderBox_address').text().trim != "" &&
						$('#orderBox_address_detail').text().trim() != "" && ${countCart > 0}) {
			$(location).attr('href', 'purchase.do');
		} else if (${countCart <= 0}) {
			$('#SubmiterrModal2').modal();
		} else {
			$('#SubmiterrModal').modal();
		}
	});
})


</script>

</head>
<body>
<div id="order_wrap" style="width: 1180px; height: 910px; margin-top: 30px; margin-left: auto; margin-right: auto;">
	<div id="order_header" style="text-align: center; font-size: 38px; line-height: .80;">
	주문하기
	</div>
	
	<div id="order_status" style="width: 128px; height: 120px; margin-top: 43px; background: url(images/purchase/moving.png); margin-left: auto; margin-right: auto">
	</div>
	
	<div id="order_address_wrap" style="margin-top: 43px; width: 980px; margin-left: auto; margin-right: auto;">
		<div class="order_address_title">
			보내시는 분
		</div>
		
		<div class="order_address_box">
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이름</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">${infoUser.member_name}</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">전화번호</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">${infoUser.member_tel}</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이메일</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext">${infoUser.member_id}</span>
				</div>
			</div>
		</div>
		
		
		<div class="order_address_title" style="margin-top: 54px;">
			받으시는 분
			<button id="address_btn" style="border-radius: 5px;" type="button">
				주소선택
			</button>
		</div>
		
		<div id="receiver_box">
		<div class="order_address_box" style="height: 175px;" id="receiver_box">
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">이름</span>
				</div>
			
				<div class="order_boxcontent">
					<span class="order_boxtext" id="orderBox_receiver_name">${defaultAdr.receiver_name}</span>
				</div>
			</div>
			
			<div class="order_boxline">
				<div class="order_customer_title">
					<span class="order_boxtext">전화번호</span>
				</div>
				
				<div class="order_boxcontent">
					<span class="order_boxtext" id="orderBox_receiver_tel">${defaultAdr.receiver_tel}</span>
				</div>
			</div>
			
			<div class="order_boxline" style="height: 75px;">
				<div class="order_customer_title">
					<span class="order_boxtext">주소</span>
				</div>
				
				<div class="order_boxcontent">
					<div class="order_boxtext" style="display: block" id="orderBox_address">${defaultAdr.address}</div>
					<div class="order_boxtext" style="display: block; margin-top: 5px;" id="orderBox_address_detail">${defaultAdr.address_detail}</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 40px; width: 780px; margin-left: auto; margin-right: auto; height: 177px">
		<button id="order_submitBtn" type="button">
			다음단계
		</button>
	</div>
</div>

<!-- 주소 선택 모달 설정 -->
<div class="modal modal-center fade" id="orderModal" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
        			<button type="button" class="close" data-dismiss="modal">&times;</button>
      		</div>
      	<div class="modal-body" style="text-align: center; width: 598px; height: 533px;">
        		<div class="ordermodal_title">
        			<span style="font-weight: bold; height: 34px; font-size: 20px; margin-left: 100px;">주소 선택</span>
        			<button id="insert_adrbtn" class="ordermodal_btn"> <!-- data-target="#orderModal2" data-toggle="modal" data-dismiss="modal" -->
        				+ 신규주소 등록
        			</button>
        		</div>
        		
        		<div class="ordermodal_body">
        			<div class="ordermodal_table">
        				<div class="ordertable_header">
        					<div class="adr_title" style="margin-left: 85px;">수령인 정보</div>
        					<div class="adr_title" style="margin-left: 115px;">주소지 정보</div>
        				</div>
        				
        				<div id="adrtable_body" style="width:130%; height: 310px; overflow: hidden; overflow-y: scroll; display: inline-block; float: left;">
        					<c:forEach items='${adrList}' var="adrList">
         					<div class="adrtable_content">
         						<div style="width: 568px; display: inline-block; float: left; height: 108px;">
         							<div class="adrtable_radio">
         								<input type="radio" class="radio_${adrList.address_num}" id="adrSelect" name="adrtable_radio" value="${adrList.address_num}" style="width:20px; height: 20px; border-radius: -5px;"/>
         							</div>
         							<div class="adrtable_info1">
         								<div class="adrtable_info1_box address_num_${adrList.address_num}" id="address_num" style="display: none">
         								${adrList.address_num}
         								</div>
         							
         								<div class="adrtable_info1_box receiver_name_${adrList.address_num}" id="receiver_namebox">
         								${adrList.receiver_name}
         								</div>
         								
         								<div class="adrtable_info1_box receiver_tel_${adrList.address_num}" id="receiver_telbox">
         								${adrList.receiver_tel}
         								</div>
         							</div>
         							
         							<div class="adrtable_info2">
         								<div id="post_numbox"  class="adrtable_info2_box post_num_${adrList.address_num}" style="display: none">${adrList.post_num}</div>
         								<div class="adrtable_info2_box address_${adrList.address_num}" id="address_box">
         								${adrList.address}
         								</div>
         								<div class="adrtable_info2_box address_detail_${adrList.address_num}" id="address_detailbox">
         								${adrList.address_detail}		
         								</div>
         							</div>
         							
         							<div class="adrtable_btnline">
         								<button type="button" id="adrAlterBtn" class="adrtable_btn ${adrList.address_num}"> <!-- data-target="#orderModal3" data-toggle="modal" data-dismiss="modal"> -->
         									변경
         								</button>
         								<button type="button" id="adrDeleteBtn" class="adrtable_btn ${adrList.address_num}">
         									삭제
         								</button>
         							</div>
         						</div>
         					</div>
        					</c:forEach>
        				</div>
        			</div>
        		</div>
        		
        		<div class="ordermodal_submit">
      			<button id="adrselect_submitBtn" class="ordermodal_btn2" data-dismiss="modal">
      				선택하기
      			</button> 
      		</div>
        		
      	</div>
      	<div class="modal-footer" style="border-top: none;">
      	</div>
    		</div>
  	</div>
</div>
  
<!-- 주소 신규 등록 모달 설정 -->
<div class="modal modal-center fade" id="orderModal2" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
        			<button type="button" class="close" id="modal2Close" data-dismiss="modal">&times;</button>
      		</div>
      	<div class="modal-body" style="text-align: center; width: 598px; height: 533px">
        		<div class="ordermodal_title" style="margin-left: auto; margin-right: auto;">
        			<span style="font-size: 20px; font-weight: bold">주소 입력</span>
        		</div>
        		
        		<div id="daum" style="display:none; border:1px solid; width:572px; height:472px; left: 2.2%; position:absolute; z-index: 1">
        			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer; position:absolute; right:0px; top:-1px; 
        						z-index:1" alt="접기 버튼">
        		</div>
        			
        		<div class="ordermodal_table">
        			<div class="adrinputtable_box">
        				<div class="adrinput_title">
        					받으시는 분 이름
        				</div>
        				<input id="receiver_name" name="receiver_name" 
        					type="text" class="order_textinputbox" autocomplete="off" placeholder="이름을 입력해주세요">
        			</div>
        			
        			<div class="adrinputtable_box">
        				<div class="adrinput_title">
        					연락처
        				</div>
        				<input id="receiver_tel" name="receiver_tel" maxlength="11"
        					type="text" class="order_textinputbox" autocomplete="off" placeholder="-를 제외하고 숫자만 입력해주세요">
        			</div>
        			
        			<div class="adrinputtable_box">
        				<div class="adrinput_title" style="height: 173px; line-height: 173px;">
        					주소
        				</div>
        				<input id="post_num" name="post_num" readonly="readonly" 
        					type="text" class="order_textinputbox" style="text-overflow: ellipsis; margin-left: 5px; margin-top: 24px; width:280px; float: left;" autocomplete="off">
        				<button id="search_postnumbtn" class="ordermodal_btn" type="button"
        					style="width: 90px; border: 1px solid gray; font-size: 12px;
        					margin-top: 24px; margin-right: 7px;">우편번호 찾기</button>	
        				<input id="address" name="address" readonly="readonly" 
        					type="text" class="order_textinputbox" style="margin-top: 6px" autocomplete="off">
        				<input id="address_detail" name="address_detail" 
        					type="text" class="order_textinputbox" style="margin-top: 6px" autocomplete="off" placeholder="상세주소를 입력해주세요">
        				
        				<input id='member_id' name="member_id" style="display: none" value="${infoUser.member_id}">
        			</div>	 	 	          				
        		</div>
      		
      		<div class="ordermodal_submit">
      			<button class="ordermodal_btn2" id="recipient_offBtn" disabled="disabled" style="background-color: gray">
      				등록하기
      			</button>
      			
      			<button class="ordermodal_btn2" id="recipient_submitBtn" type="button"
      					style="display: none">
      				등록하기
      			</button>
      			
      		</div>
      	</div>
      	<div class="modal-footer" style="border-top: none;">
      	</div>
    		</div>
  	</div>
</div>
  
<!-- 수정하기 모달 -->
<div class="modal modal-center fade" id="orderModal3" role="dialog">
  	<div class="modal-dialog modal-center" role="document">
    		<div class="modal-content">
      		<div class="modal-header" style="border-bottom: none;">
        			<button type="button" class="close" data-dismiss="modal">&times;</button>
      		</div>
      	<div class="modal-body" style="text-align: center; width: 598px; height: 533px">
        		<div class="ordermodal_title" style="margin-left: auto; margin-right: auto;">
        			<span style="font-size: 20px; font-weight: bold">주소 입력</span>
        		</div>
        		
        		<div id="daum2" style="display:none; border:1px solid; width:572px; height:472px; left: 2.2%; position:absolute; z-index: 1">
        			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap2" style="cursor:pointer; position:absolute; right:0px; top:-1px; 
        						z-index:1" alt="접기 버튼">
        		</div>
        			
        		<div class="ordermodal_table">
        			<div class="adrinputtable_box">
        				<div id="alter_address_num" style="display: none"></div>
        				<div class="adrinput_title">
        					받으시는 분 이름
        				</div>
        				<input id="alter_receiver_name" name="receiver_name" 
        					type="text" class="order_textinputbox" autocomplete="off" placeholder="이름을 입력해주세요">
        			</div>
        			
        			<div class="adrinputtable_box">
        				<div class="adrinput_title">
        					연락처
        				</div>
        				<input id="alter_receiver_tel" name="receiver_tel" maxlength="11"
        					type="text" class="order_textinputbox" autocomplete="off" placeholder="-를 제외하고 숫자만 입력해주세요">
        			</div>
        			
        			<div class="adrinputtable_box">
        				<div class="adrinput_title" style="height: 173px; line-height: 173px;">
        					주소
        				</div>
        				<input id="alter_post_num" name="post_num" readonly="readonly" 
        					type="text" class="order_textinputbox" style="text-overflow: ellipsis; margin-left: 5px; margin-top: 24px; width:280px; float: left;" autocomplete="off">
        				<button id="alter_search_postnumbtn" class="ordermodal_btn" type="button"
        					style="width: 90px; border: 1px solid gray; font-size: 12px;
        					margin-top: 24px; margin-right: 7px;">우편번호 찾기</button>	
        				<input id="alter_address" name="address" readonly="readonly" 
        					type="text" class="order_textinputbox" style="margin-top: 6px" autocomplete="off">
        				<input id="alter_address_detail" name="address_detail" 
        					type="text" class="order_textinputbox" style="margin-top: 6px" autocomplete="off" placeholder="상세주소를 입력해주세요">
        				
        				<input id='alter_member_id' name="member_id" style="display: none" value="${infoUser.member_id}">
        					
        			</div>	 	 	          				
        		</div>
      		
      		<div class="ordermodal_submit">
      			<button class="ordermodal_btn2" id="alter_recipient_offBtn" disabled="disabled" style="background-color: gray">
      				등록하기
      			</button>
      			
      			<button class="ordermodal_btn2" id="recipient_updateBtn" type="button"
      					style="display: none">
      				등록하기
      			</button>
      			
      		</div>
      	</div>
      	<div class="modal-footer" style="border-top: none;">
      	</div>
    		</div>
  	</div> 	
</div>

<!-- 에러 모달 설정 -->
<div class="modal modal-center fade" id="errorModal" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
         			<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
       	<div class="modal-body" style="text-align: center; font-size: 15px;">
         		<p>주소지를 하나 선택하신 후 하셔야 합니다.</p>
       	</div>
       	<div class="modal-footer" style="border-top: none;">
       	</div>
     		</div>
   	</div>
</div>

<!-- 전화번호 모달 -->
<div class="modal modal-center fade" id="error2Modal" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
         			<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
       	<div class="modal-body" style="text-align: center; font-size: 15px;">
         		<p>전화번호를 제대로 입력해 주셔야 합니다.</p>
       	</div>
       	<div class="modal-footer" style="border-top: none;">
       	</div>
     		</div>
   	</div>
</div>

<!-- 기본 주소지가 없는데 눌렀을 경우 -->
<div class="modal modal-center fade" id="SubmiterrModal" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
         			<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
       	<div class="modal-body" style="text-align: center; font-size: 15px;">
         		<p>기본 주소지를 등록하지 않으셨습니다.</p>
       	</div>
       	<div class="modal-footer" style="border-top: none;">
       	</div>
     		</div>
   	</div>
</div>

<!-- 장바구니가 없는데 눌렀을 경우 -->
<div class="modal modal-center fade" id="SubmiterrModal2" role="dialog">
   	<div class="modal-dialog modal-center" role="document">
     		<div class="modal-content">
       		<div class="modal-header" style="border-bottom: none;">
         			<button type="button" class="close" data-dismiss="modal">&times;</button>
       		</div>
       	<div class="modal-body" style="text-align: center; font-size: 15px;">
         		<p>장바구니가 비었습니다.</p>
       	</div>
       	<div class="modal-footer" style="border-top: none;">
       	</div>
     		</div>
   	</div>
</div>
</body>
</html>