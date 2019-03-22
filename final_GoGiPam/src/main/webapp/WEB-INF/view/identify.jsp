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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css);
* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans', 'Sans-serif'; font-weight: 400;}


input::placeholder{
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
		
// 아이디 찾기 이벤트 /////////////////////////////////////////////////////////////////////////////////////////////////		
		$('.findid_btn').on('click', function(){
			console.log('아이디 찾기 이벤트');
			var member_name = $('.findid_name').val();
			var member_tel = $('.findid_tel').val();
			
			$.ajax({
				type:'POST',
				dataType: 'text',
				url: 'findId.do',
				data: {'member_name': member_name, 'member_tel': member_tel},
				success: function(res){
					console.log('success');
					
					// 일치하는 회원이 없을 때 ////////////////////////////////////////////
					if(res == null || res == ""){
						
						// modal창 출력.
						$('#findIDFail').modal("show");
						//$('#modalok').focus();
						
						$(document).on('keydown', function (event) {                  
							  var keycode = (event.keyCode ? event.keyCode : event.which);
							  if(keycode == 13){
							    $('#modalok').click();   
							  }     
							});
					///////////////////////////////////////////////////////////////////////////////	
					
					// 일치하는 회원이 있을 때 아이디 출력..////////////////////////////////////////////
					}else{
						$('.finded_Id').append(res);
						$('#findIDOk').modal("show");
						
						$(document).on('keydown', function (event) {                  
							  var keycode = (event.keyCode ? event.keyCode : event.which);
							  if(keycode == 13){
							    $('#modalok2').click();   
							  }     
							});
						
					}
					///////////////////////////////////////////////////////////////////////////////	
				
				},
				error: function(){
					console.log('errorr');
				}
				
			});
			
			// 포커스를 해제해주어야 중복해서 이벤트 발생하지 않는다.
			$('.findid_btn').blur();
		});
		
		
		$('.findid_tel').on('keydown',function(){
			if(window.event.keyCode == 13){
				document.getElementById('findid_btn').click();
				this.blur();
			}
		});
		
// 아이디 찾기 끝/////////////////////////////////////////////////////////////////////////////////////////////////


// 비밀번호 찾기 이벤트 /////////////////////////////////////////////////////////////////////////////////////////////////
		
		$('.findpw_btn').on('click', function(){
			console.log('비밀번호 찾기 이벤트');
			
			var member_id = $('.findpw_id').val();
			var member_tel = $('.findpw_tel').val();
			
			$.ajax({
				type:'POST',
				dataType: 'text',
				url: 'findPw.do',
				data: {'member_id': member_id, 'member_tel': member_tel},
				success: function(res){
					console.log('success');
					
					// 입력한 아이디,연락처와 일치하는 회원이있을 때.
					if(res == 1){
						// modal창 출력.
						$('#findPWOk').modal("show");
						$('.member_id').empty();
						$('.member_id').append(member_id + " 으로 비밀번호 변경 링크를 전송했습니다.");
						
						$.ajax({
							type:'POST',
							dataType: 'text',
							// 이메일 보내주는 컨트롤러로 보내줌.
							url: 'sendEmail.do',
							data: {'member_id': member_id},
							success: function(res){
								console.log('send email success');
							},
							error: function(){
								alert('error');
							}
							
						});
						
						$(document).on('keydown', function (event) {                  
							  var keycode = (event.keyCode ? event.keyCode : event.which);
							  if(keycode == '13'){
							    $('#modalok4').click();   
							  }     
							});
					// 입력한 아이디,연락처와 일치하는 회원이 없을 때.
					}else if(res == 0){
						// modal창 출력.
						$('#findPWFail').modal("show");
						
						$(document).on('keydown', function (event) {                  
							  var keycode = (event.keyCode ? event.keyCode : event.which);
							  if(keycode == '13'){
							    $('#modalok3').click();   
							  }     
							});
					}else{
						
						alert(res);
					}
					
					
					///////////////////////////////////////////////////////////////////////////////	
				
				},
				error: function(){
					console.log('errorr');
				}
				
			});
			$('.findpw_btn').blur();
		});/// 비밀번호 찾기 버튼 이벤트 끝///////////////////////////////////
		
		$('.findpw_tel').on('keydown',function(){
			if(window.event.keyCode == 13){
				document.getElementById('findpw_btn').click();
				this.blur();
			}
		});
			
///////////////////////////////////////////////////////////////////////////////////////////////////
		
	});// end ready()/////////////////////////////////////////
	
</script>
</head>
<body>	
	<div style="height: 425px; margin-top: 149px;">
		<div style="width: 1000px;height: 344px;margin-left: auto;margin-right: auto; border: 1px solid #e1dedf;">
			<div style="display: inline-block; width: 380px; float: left; margin-left: 70px; margin-top: 56px;">
				<div style="font-size: 21px; text-align: center; line-height: 1.14;">아이디 찾기</div>
				<input type="text" id="findid_name" class="findid_name" placeholder="이름을 입력해주세요." style="padding-left:20px; font-size: 13px; line-height: 1.85; display: block; width: 380px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
				<input type="text" id="findid_tel" class="findid_tel" maxlength="11" placeholder="연락처를 입력해주세요." style="padding-left:20px; font-size: 13px; line-height: 1.85; display: block; width: 380px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
				<input type="button" id="findid_btn" class="findid_btn" style="margin-top: 20px; width: 380px; height: 52px; background-color: black; color: white; font-size: 14px; line-height: 1.86; font-weight: bold; border: none" value="아이디 찾기"/>
			</div>
			
			<div style="display: inline-block; float: left; width: 1px; background-color: #e1dedf; height: 264px; margin-left: 50px; margin-top: 40px;"></div>
			
			<div style="display: inline-block; width: 380px; float: left; margin-left: 50px; margin-top: 56px;">
				<div style="text-align: center; font-size: 21px; line-height: 1.14;">비밀번호 찾기</div>
				<input type="text" id="findpw_id" class="findpw_id" placeholder="아이디를 입력해주세요." style="padding-left: 20px; font-size: 13px; line-height: 1.85; display: block; width: 380px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
				<input type="text" id="findpw_tel" class="findpw_tel" maxlength="11" placeholder="연락처를 입력해주세요." style="padding-left: 20px; font-size: 13px; line-height: 1.85; display: block; width: 380px; height: 38px; border: solid 1px #e1dedf; margin-top: 24px;"/>
				<input type="button" id="findpw_btn" class="findpw_btn" style="margin-top: 20px; width: 380px; height: 52px; background-color: black; border: none; color: white; font-size: 14px; line-height: 1.86; line-height: 52px; font-weight: bold" value="비밀번호 변경 링크 전송">
			</div>
		</div>
	</div>
	
	
			
<!--이름, 연락처와 일치하는 회원정보가 없는 경우.  Modal -->

  <div class="modal fade" id="findIDFail" role="dialog">
    <div class="modal-dialog modal-fullsize">
    
      <!-- Modal content-->
      <div class="modal-content modal-fullsize">
        <div class="modal-header">
          <h4 class="modal-title">가입되지 않은 정보입니다.</h4>
        </div>
        <div class="modal-body">
          <p>이름 또는 연락처 확인 후 다시 입력해주시기 바랍니다.</p>
        </div>
        <br>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal" id="modalok">확인</button>
        </div>
      </div>
      
    </div>
  </div>
  
  		
<!--일치하는 회원정보가 있어서 아이디를 알려줌.  Modal -->

  <div class="modal fade" id="findIDOk" role="dialog">
    <div class="modal-dialog modal-fullsize">
    
      <!-- Modal content-->
      <div class="modal-content modal-fullsize">
        <div class="modal-header">
          <h4 class="modal-title">너의 아이디는...</h4>
        </div>
        <div class="modal-body">
          <span class="finded_Id"></span><br>
        </div>
        <br>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal" id="modalok2">확인</button>
          
        </div>
      </div>
      
    </div>
  </div>
	
	
	<!--아이디,연락처와 일치하는 회원정보가 없음 .  Modal -->

  <div class="modal fade" id="findPWFail" role="dialog">
    <div class="modal-dialog modal-fullsize">
    
      <!-- Modal content-->
      <div class="modal-content modal-fullsize">
        <div class="modal-header">
          <h4 class="modal-title">가입되지 않은 정보입니다.</h4>
        </div>
        <div class="modal-body">
           <p>아이디 또는 연락처 확인 후 다시 입력해주시기 바랍니다.</p>
        </div>
        <br>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal" id="modalok3">확인</button>
          
        </div>
      </div>
      
    </div>
  </div>
	
	
	  		
<!--아이디,연락처와 일치하는 회원정보가 있음. 이메일로 새 비밀번호 변경 링크 보냈다고 알려줌.  Modal -->

  <div class="modal fade" id="findPWOk" role="dialog">
    <div class="modal-dialog modal-fullsize">
    
      <!-- Modal content-->
      <div class="modal-content modal-fullsize">
        <div class="modal-header">
          <h4 class="modal-title">새로운 비밀번호 설정</h4>
        </div>
        <div class="modal-body">
          <span class="member_id"></span><br>
        </div>
        <br>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal" id="modalok4">확인</button>
          
        </div>
      </div>
      
    </div>
  </div>
	
</body>
</html>