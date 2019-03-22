<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 설정 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css);

* {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans', 'Sans-serif';
	font-weight: 400;
}

input::placeholder {
	color: #BDBDBD;
	font-weight: 400px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		// 현재 페이지의 주소를 받는다. ex) http://localhost:8090/myfaq/D776B64636A66646A64406E617665722E636F6D.do
		var link = document.location.href;
		// 현재 주소에서 마지막 '/' 뒤에서부터 '.do' 앞까지의 문자열을 받는다.
		var str = link.substring(link.lastIndexOf('/')+1).split('.');
		
		// 문자열에서 첫번째 문자를 제외하고 member_id의 헥사코드값을 추출한다.
		var member_id =  str[0].substring(1, str[0].length);
		
		console.log(member_id);
		$('.member_id').append(member_id);

		
		$('#resetPwd_btn').on('click', function(){
			var updatePwd1 = $('#updatePwd1').val();
			var updatePwd2 = $('#updatePwd2').val();
			if(updatePwd1 != updatePwd2){
				alert("비밀번호가 일치하지 않습니다.");
			}
			else{
				
				$.ajax({
					type: 'POST',
					dataType: 'text',
					url: 'updatePwd.do',
					data: {'HEX_member_id' : member_id, 'member_pwd' : updatePwd1},
					success: successMessage,
					error: errorMessage
					
				});
				alert('비밀번호 변경 완료.');
				
			}
			
		});
		
	});// end ready////////////////////////////////
	
	
	function successMessage(res){
		alert('비밀번호가 변경되었습니다.\n새로운 비밀번호로 로그인해주세요.');
		location.href="login.do?returnUrl=";
	};
	function errorMessage(){
		alert('error');
	};
</script>
</head>
<body>
<!-- <div class="member_id"></div> -->
	<div style="width: 300px; height: 270px; border: 1px solid #e1dedf; margin-left: 100px; margin-top: 70px;">
		<div style="width: 298px; height: 50px; padding-top:10px;">
			<div style="width:200px; height: 40px; margin-left: auto; margin-right: auto; ">
				<span style="font-size: 23px; font-weight: 600; padding-left: 10px;">[새 비밀번호 변경]</span>
			</div>
		</div>		
		<div style="width: 298px; height: 140px;">
			<div style="width: 270px; margin-left: auto; margin-right: auto;">
				<input type="password" id="updatePwd1" class="updatePwd1" placeholder="새 비밀번호를 입력해주세요." style="padding-left:20px; font-size: 13px; line-height: 1.85; display: block; width: 270px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
				<input type="password" id="updatePwd2" class="updatePwd2" placeholder="새 비밀번호 한 번 더 입력해주세요." style="padding-left:20px; font-size: 13px; line-height: 1.85; display: block; width: 270px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
			</div>
		</div>
		<div style="width:298px; height: 38px;">
			<button id="resetPwd_btn" style="background-color: black; width:230px; height: 38px; border: none; color: white; margin-left: 34px;">비밀번호 변경</button>
		</div>		
	</div>


</body>
</html>