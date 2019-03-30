<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>GoGiPam</title>

<style type="text/css">
#join_wrap {
	width: 1180px;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
}

#join_header {
	width: 1180px;
	font-size: 38px;
	text-align: center;
	height: 40px;
}

#join_header_img {
	width: 120px;
	height: 120px;
	margin-left: auto;
	margin-right: auto;
	background: url(images/join.png);
	margin-top: 43px;
}

.join_input {
	margin-left: 20px;
	padding-left: 22px;
	font-size : 13px;
	display: block;
	width: 456px;
	height: 38px;
	border: 1px solid #e1dedf;
	margin-top: 18px;
}

#join_submitBtn {
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

button:focus {
	outline: none;
}

#memjoinForm label {
	font-size: 20px;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
	
<script type="text/javascript">
$(document).ready(function() {
	var idchk = /^[0-9a-zA-Z]{5,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,4}$/;
	var pwdchk = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&_*])[a-zA-Z0-9!@#$%^&*_]{8,20}$/;
	var namechk = /^[가-힣]{2,10}$/;
	var telchk = /^(010|011|016|017|019|02|031|032|033|041|042|043|044|051|052|053|054|055|061|062|063|064)([0-9]{3,4})([0-9]{4})/;

	/* $('#joinsubmitBtn').on('click', function() {
		var idtest = idchk.test($('#member_id').val());
		if (idtest == false) {
			alert("이메일 양식에 맞게 입력하여야 합니다.");
			return false;
		}

		var pwdtest = pwdchk.test($('#member_pwd').val());
		if (pwdtest == false) {
			alert("영문, 숫자, 특수문자 1글자 이상 포함하여 8~20글자여야 합니다.");
			return false;
		}

		var nametest = namechk.test($('#member_name').val());
		if (nametest == false) {
			alert("한글 2~10글자 여야합니다.");
			return false;
		}

		var teltest = telchk.test($('#member_tel').val());
		if (teltest == false) {
			alert("- 를 뻬거나 형식에 맞게 입력하여야합니다.");
			return false;
		}
	}); */
		
	$("#member_name").blur(function() {
		if(namechk.test($('#member_name').val()) != true){
		    $('#name_status').text('2~10글자의 한글만 가능합니다.');
		    $('#name_status').css('color', 'red');
		} else {
			$('#name_status').text('');
		}   		            
	});
	
	$("#member_id").blur(function() {
		if(idchk.test($('#member_id').val()) != true){
		    $('#id_status').text('이메일 양식에 맞게 입력하여야 합니다.');
		    $('#id_status').css('color', 'red');
		} else {
			$('#id_status').text('');
		}   		            
	});
	
	$("#member_pwd").blur(function() {
		if(pwdchk.test($('#member_pwd').val()) != true){
		    $('#pwd_status').text('영문, 숫자, 특수문자 1글자 이상 포함하여 8~20글자여야 합니다.');
		    $('#pwd_status').css('color', 'red');
		} else if($('#member_pwd').val() != $('#member_pwd_chk').val()) {
			 $('#pwd_status').text('비밀번호 확인값과 동일하지 않습니다.');
			 $('#pwd_status').css('color', 'red');
		} else if($('#member_pwd').val() == '') {
			 $('#pwd_status').text('');
		} else {
			$('#pwd_status').text('');
		}   		            
	});
	
	$("#member_pwd_chk").blur(function() {
		if($('#member_pwd').val() != $('#member_pwd_chk').val()) {
			 $('#pwd_status').text('비밀번호 확인값과 동일하지 않습니다.');
			 $('#pwd_status').css('color', 'red');
		} else if($('#member_pwd_chk').val() == '') {
			 $('#pwd_status').text('');
		} else {
			$('#pwd_status').text('');
		}   		            
	});
	
	$("#member_tel").blur(function() {
		if(telchk.test($('#member_tel').val()) != true){
		    $('#tel_status').text('- 를 빼거나 형식에 맞게 입력하여야합니다.');
		    $('#tel_status').css('color', 'red');
		} else {
			$('#tel_status').text('');
		}   		            
	});	
	
	$("#member_tel").keyup(function(event) { // 키다운의 경우 앞 한글자를 못받음
        if (!(event.keyCode >=37 && event.keyCode<=40)) { // del, backspace 허용하기 위해
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,'')); // 정규식으로 오직 한글만, 나머지는 공백으로 대체
        }
    }); // 처음부터 숫자만 받도록 설정
	
	var hasidChk = 0; /* 중복검사를 실행했는지 여부 파악 */
	$('#dupIdchkBtn').on('click', function() {
		var member_id = $('#member_id').val();
		$.ajax({
			type: 'POST',
			dataType: 'text',
			url: 'dupidchk.do',
			data: {'member_id' : member_id},
			success: function(res) {
				/* alert(res); */
				 if(res == 'f') {
					if(idchk.test($('#member_id').val()) == true) {
						$("#modal2text").text('회원가입 가능합니다.');
						memjoinForm.member_id.readOnly = true; /* 회원가입 가능시 읽기전용으로 처리해버려 더 이상 수정 불가 */
						hasidChk = 1;
					} else {
						if(idchk.test($('#member_id').val()) == false)
						$("#modal2text").text('양식에 맞게 아이디를 입력해주셔야 합니다.');
						hasidChk = 0;
					}
				 }
				 
				if(res == 't') {
					if(idchk.test($('#member_id').val()) == true) {
						hasidChk = 0;
					} else {
						if(idchk.test($('#member_id').val()) == false)
						$("#modal2text").text('양식에 맞게 아이디를 입력해주셔야 합니다.');
						hasidChk = 0;
					}
				}	
			},
			error: function(){
				$("#modal2text").text('예기치 못한 오류가 일어났습니다. 관리자에게 문의하세요.');	
			}
		});
	});
	
	var hasTelChk = 0; /* 중복검사를 실행했는지 여부 파악 */
	$('#dupTelchkBtn').on('click', function() {
		var member_tel = $('#member_tel').val();
		$.ajax({
			type: 'POST',
			dataType: 'text',
			url: 'duptelchk.do',
			data: {'member_tel' : member_tel},
			success: function(res) {
				/* alert(res); */
				 if(res == 'f') {
					if(telchk.test($('#member_tel').val()) == true) {
						$("#modal3text").text('회원가입 가능합니다.');
						memjoinForm.member_tel.readOnly = true; /* 회원가입 가능시 읽기전용으로 처리해버려 더 이상 수정 불가 */
						hasTelChk = 1;
					} else {
						if(telchk.test($('#member_tel').val()) == false)
						$("#modal3text").text('양식에 맞게 전화번호를 입력해주셔야 합니다.');
						hasTelChk = 0;
					}
				 }
				 
				if(res == 't') {
					if(telchk.test($('#member_tel').val()) == true) {
						hasTelChk = 0;
					} else {
						if(telchk.test($('#member_tel').val()) == false)
						$("#modal3text").text('양식에 맞게 전화번호를 입력해주셔야 합니다.');
						hasTelChk = 0;
					}
				}	
			},
			error: function(){
				$("#modal3text").text('예기치 못한 오류가 일어났습니다. 관리자에게 문의하세요.');	
			}
		});
	});
	
	$('#join_submitBtn').on('click', function() {	
		if($('#member_name').val() != '' && namechk.test($('#member_name').val()) == true &&
		   $('#member_id').val() != '' && idchk.test($('#member_id').val()) == true  &&
		   $('#member_pwd').val() != '' && pwdchk.test($('#member_pwd').val()) == true &&
		   $('#member_pwd_chk').val() != '' && $('#member_pwd').val() == $('#member_pwd_chk').val() &&
		   $('#member_tel').val() != '' && telchk.test($('#member_tel').val()) == true && hasidChk == 1 && hasTelChk == 1) {
			$('#memjoinForm').submit();
		} else {
			$('#join_submitBtn').attr('data-toggle',"modal");
			$('#join_submitBtn').attr('data-target',"#myModal");
		}		
	});	
});

</script>
</head>
<body>

<div id="join_wrap">
	<div id="join_header">
		회원가입
	</div>
	
	<div id="join_header_img">
	</div>
	
	<div style="margin-top: 46px; margin-left:200px;">
		<span style="font-size: 15px; display: inline-block; height: 24px;">가입정보 입력</span>
	</div>
	
<form id="memjoinForm" method="post" role="form" action="memjoin.do" autocomplete="off">
	<div style="margin-top: 16px; width: 778px; height: 403px; border: 2px solid #e1dedf; margin-left: auto; margin-right: auto;">
		<div style="height: 80px; border-bottom: 1px solid #e1dedf">
			<div style="float: left; display: inline-block; width: 179px; line-height: 79px; border-right:1px solid #e1dedf; background-color: #f7f7f7; font-size: 13px;">
				<span style="margin-left: 29px;">아이디 (E-mail)</span>
			</div>
			<div style="float: left; display: inline-block;">
				<input id="member_id" name="member_id" type="email" class="join_input" autocomplete="off" placeholder="아이디로 이용하실 이메일 주소를 입력해주세요">
				<div id="id_status" style="margin-left: 20px;"></div>
			</div>
			<div>
				<button type="button" id="dupIdchkBtn" data-toggle="modal" data-target="#myModal2"
					style="width: 100px; background-color: black; border-color: black; font-size: 18px;
					color: white; float: right; margin-top: 20px; margin-right: 10px;">
						중복확인
						<!-- Modal 전용 버튼으로 선언하기 위해 그냥 데이타 토글, 데이타 타겟을 모달로 -->
				</button>	
			</div>
		</div>
		<div style="height: 80px; border-bottom: 1px solid #e1dedf">
			<div style="float: left; display: inline-block; width: 179px; line-height: 79px; border-right:1px solid #e1dedf; background-color: #f7f7f7; font-size: 13px;">
				<span style="margin-left: 29px;">비밀번호</span>
			</div>
			<div style="float: left; display: inline-block;">
				<input id="member_pwd" name="member_pwd" type="password" class="join_input" autocomplete="off" placeholder="8~20자의 영문,숫자,특수문자를 포함한 비밀번호를 입력해주세요">
				<div id="pwd_status" style="margin-left: 20px;"></div>
			</div>
		</div>
		<div style="height: 80px; border-bottom: 1px solid #e1dedf">
			<div style="float: left; display: inline-block; width: 179px; line-height: 79px; border-right:1px solid #e1dedf; background-color: #f7f7f7; font-size: 13px;">
				<span style="margin-left: 29px;">비밀번호 확인</span>
			</div>
			<div style="float: left; display: inline-block;">
				<input id="member_pwd_chk" type="password" class="join_input" autocomplete="off" placeholder="입력한 비밀번호와 같은 비밀번호를 입력해주세요">
			</div>
		</div>
		<div style="height: 80px; border-bottom: 1px solid #e1dedf">
			<div style="float: left; display: inline-block; width: 179px; line-height: 79px; border-right:1px solid #e1dedf; background-color: #f7f7f7; font-size: 13px;">
				<span style="margin-left: 29px;">이름</span>
			</div>
			<div style="float: left; display: inline-block;">
				<input id="member_name" name="member_name" type="text" class="join_input" autocomplete="off" placeholder="2~10글자 사이의 한글 이름을 입력해주세요">
				<div id="name_status" style="margin-left: 20px;"></div>
			</div>
		</div>
		<div style="height: 80px;">
			<div style="float: left; display: inline-block; width: 179px; line-height: 79px; border-right:1px solid #e1dedf; background-color: #f7f7f7; font-size: 13px;">
				<span style="margin-left: 29px;">전화번호</span>
			</div>
			<div style="float: left; display: inline-block;">
				<input id="member_tel" name="member_tel" type="text" class="join_input" autocomplete="off" placeholder="-를 제외하고 숫자만 입력해주세요">
				<div id="tel_status" style="margin-left: 20px;"></div>
			</div>
			<div>
				<button type="button" id="dupTelchkBtn" data-toggle="modal" data-target="#myModal3"
					style="width: 100px; background-color: black; border-color: black; font-size: 18px;
					color: white; float: right; margin-top: 20px; margin-right: 10px;">
						중복확인
						<!-- Modal 전용 버튼으로 선언하기 위해 그냥 데이타 토글, 데이타 타겟을 모달로 -->
				</button>	
			</div>
		</div>
	</div>
	
	<div style="margin-top: 40px; width: 780px; margin-left: auto; margin-right: auto; height: 177px">
		<button type="button" id="join_submitBtn" style="font-size: 20px">
				회원가입
		</button>
	</div>		
</form>		
</div>
	
<!-- 모달 설정 -->
<div class="modal modal-center fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">중복검사를 하지 않으셨거나, 빈 정보, 틀린 사항이 있습니다. 확인해주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	</div>
</div>
	  	
<div class="modal modal-center fade" id="myModal2" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modal2text">아이디가 중복 되었습니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	    </div>
	</div>
</div>

<div class="modal modal-center fade" id="myModal3" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modal3text">이미 가입하신 계정이 있습니다.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>