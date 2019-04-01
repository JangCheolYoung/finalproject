<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css);
* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans', 'Sans-serif';}

input::placeholder{
	color: #BDBDBD;
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
	
		var returnUrl = $('input[name=returnUrl]').val();
		console.log(returnUrl);
	
		
		$('.input_password').on('keydown',function(){
			if(window.event.keyCode == 13){
				document.getElementById('login_btn').click();
			}
		});
		
		
		$('.login_btn').on('click', function(){
			
			var member_id = $('#member_id').val();
			var member_pwd = $('#member_pwd').val();
			var checkData = {'member_id':member_id, 'member_pwd':member_pwd};			
			$.ajax({
				
				type: 'POST',
				dataType: 'text',
				url: 'memCheck.do',
				data: checkData,
				success: function(res){
					
					if(res == "success"){
						$('form').submit();						
					}else {
						$('#modalok').focus();
						$('#failLoginModal').modal("show");
					}
						
				},
				error: function(){
					alert('error');
				}
			});
			
		});
		
		if($('input[name="returnUrl"]').val() != ''){
			$('#loginModal').modal("show");	
			
		}
		
		$('.identify').on('click', function(){
			location.href="identify.do";
		});
	});// end ready()/////////////////////////////////////////
		
</script>
</head>
<body>
	<div style="width: 780px; height: 503px; margin-left: auto; margin-right: auto; position: relative; margin-top: 100px;">
		<div style="font-size: 32px; line-height: 0.81; text-align: center;">로그인</div>
		<div style="margin-top: 22px; border: solid 1px #e1dedf; height: 372px; width: 100%;">
			<div style="margin-top: 43px;">
				<div style="text-align: center;font-size: 16px;line-height: 1.5;">고기팜에 회원 계정이 있으시면 로그인을 해주세요.</div>
				<div style="margin-top: 46px;margin-left: 127px;height: 94px;">
					<form name="loginForm" method="post" action="logPro.do">
						<div style="display: inline-block;float: left;">
							<input type="text" name="member_id" id="member_id" class="input_id" placeholder="아이디(이메일 주소)를 입력하세요" autocomplete="off" style="outline: 0;font-size: 13px;padding-left: 23px;display: block;width: 375px;height: 38px;border: solid 1px #e1dedf;"/>
							<input type="password" name="member_pwd" id="member_pwd" class="input_password" placeholder="비밀번호를 입력하세요" style="outline: 0; font-size: 13px; padding-left: 23px; display: block; width: 375px; height: 38px; border: solid 1px #e1dedf; margin-top: 18px;">
						</div>
						<input type="hidden" name="returnUrl" value="${param.returnUrl}" />
						<input type="button" class="login_btn" id="login_btn" value="로그인" style="font-weight: bold; font-size: 16px; border: none; color: white; text-align: center; line-height: 94px; float: left; margin-left: 10px; width: 132px; height: 94px; background-color: black; display: inline-block; cursor: pointer; padding: 0px;"/>
					</form>
				</div>
				
				<div style="margin-top: 49px; margin-left: 127px;">
	                <div style="height: 1px; background-color: #e1dedf; width: 516px;"></div>
	                <div class="identify" style="cursor: pointer; font-size: 16px; line-height: 1.5; margin-top: 44px; margin-left: 121px; display: inline-block;">아이디 / 비밀번호 찾기</div>
	                <div style="width: 1px; height: 22px; background-color: black; display: inline-block; position: relative; top: 5px; margin-left: 29px;"></div>
	                <div class="join" style="cursor: pointer; font-size: 16px; line-height: 1.5; margin-left: 28.5px; margin-top: 44px; display: inline-block;">회원가입</div>
            	</div>
			</div>
		</div>
	</div>
	
	
	
<!-- 아이디나 비밀번호 틀렸을 때 보여줄  Modal -->
<div class="modal modal-center fade" id="failLoginModal" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">가입되지 않은 아이디이거나 비밀번호가 잘못되었습니다. 확인하여 주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">

	        </div>
	      </div>
	</div>
</div>
		
<!-- 세션값 확인해서 없으면 인터럽트로 로그인페이지로 이동시켜주고 보여줄  Modal -->
<div class="modal modal-center fade" id="loginModal" role="dialog">
	<div class="modal-dialog modal-center" role="document">
		<div class="modal-content">
	        <div class="modal-header" style="border-bottom: none;">
	          	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="modal-body" style="text-align: center; font-size: 15px;">
	          	<p id="modaltext">고기팜에 회원 계정이 있으시면 로그인을 해주세요.</p>
	        </div>
	        <div class="modal-footer" style="border-top: none;">
	        </div>
	      </div>
	</div>
</div>
  
</body>
</html>