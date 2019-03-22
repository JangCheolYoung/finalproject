<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css);

* {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans', 'Sans-serif';
	margin: 0;
	padding: 0;
	outline: 0;
}

/* 아래는 모달과 관련된 css */
.modal-content.modal-80size {
	min-height: 550px;
	min-width: 620px;
}

.modal.modal-center {
	text-align: center;
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal-dialog {
	width: 620px;
	margin: 100px auto;
}

.modal-header {
	border: 0;
}

.btn.btn-default {
	height: 60px;
	width: 100%;
	color: white;
	background-color: black;
	font-size: 20px;
	font-weight: 600;
	border-radius: 0px;
	border: 0px;
}

.q.box {
	margin: 0 auto 0 auto;
	width: 540px;
	height: 440px;
}

.question {
	font-size: 14px;
}

.q.pan {
	width: 540px;
	height: 350px;
	margin-top: 12px;
	border: 1px solid #e1dedf;
}

.titleBox {
	height: 68px;
	border-bottom: 1px solid #e1dedf;
}

.contentBox {
	height: 212px;
	border-bottom: 1px solid #e1dedf;
}

.uploadBox {
	height: 68px;
}

.title {
	background-color: #f7f7f7;
	border-right: 1px solid #e1dedf;
	float: left;
	width: 110px;
	height: 100%;
	padding-left: 22px;
	font-size: 12px;
}

.input {
	width: 428px;
	height: 100%;
	float: left;
}

#question_title {
	font-size: 12px;
	width: 400px;
	height: 37px;
	margin-top: 15px;
	margin-left: 14px;
	border: 1px solid #e1dedf;
	padding-left: 15px;
}

#question_content {
	font-size: 12px;
	width: 400px;
	height: 182px;
	margin-top: 15px;
	margin-left: 14px;
	border: 1px solid #e1dedf;
	padding-left: 15px;
	padding-top: 8px;
	resize: none;
}

input::placeholder {
	color: #a4a4a4;
}

textarea::placeholder {
	color: #a4a4a4;
}

#upload{
	font-size: 12px;
	width: 320px;
	height: 37px;
	margin-top: 15px;
	margin-left: 14px;
	border: 1px solid #e1dedf;
    float: left;
}

#file_btn{
	font-size: 13px;
    float: left;
    width: 65px;
    height: 37px;
    border: 1px solid #e1dedf;
    display: inline-block;
    text-align: center;
    line-height: 37px;
    margin-top: 15px;
    background-color: #f7f7f7;
    margin-left: 14px;
    font-weight: 700;
    cursor: pointer;
}


#upload_icon{
	width: 19px;
    height: 22px;
    display: inline-block;
    float: left;
    margin-top:7px;
    margin-left: 10px;
}

#question_file{
	color: #4a90e2;
    font-size: 13px;
    font-weight: 700;
    display: inline-block;
    height: 100%;
    line-height: 38px;
    margin-left: 11px;
}


/* ////위로는 모달.///////////////////////////////////////////////////////////////////////////////////////////// */
/* ////////////////////////////////////////////////////////////////////////////////////////////////////// */
/* ////////////////////////////////////////////////////////////////////////////////////////////////////// */
/* ///아래는 jsp/////////////////////////////////////////////////////////////////////////////////////////// */
.qna {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
	overflow: auto;
}

.pageTitle {
	font-size: 32px;
	text-align: center;
}

.write_btn {
	text-align: center;
	font-size: 13px;
	width: 108px;
	border: 1px solid #e1dedf;
	float: right;
	height: 40px;
	line-height: 40px;
	margin-top: -41px;
	font-weight: 700;
	cursor: pointer;
}

.question_list_titleBox {
	height: 52px;
	background-color: #e1dedf;
	border: 1px solid #e1dedf;
	font-weight: 700;
	font-size: 15px;
}

.question_list_title {
	float: left;
	line-height: 50px;
	text-align: center;
}

.question_list_contentBox {
	height: 50px;
	border: 1px solid #e1dedf;
	border-top: 0px;
	cursor: pointer;
}

.question_list_contentBox:hover {
	background-color: black;
	color: white;
}

.question_list_content {
	float: left;
	line-height: 50px;
	text-align: center;
}

.arrow_box {
	width: 215px;
	height: 40px;
	overflow: auto;
	margin: 19px auto 100px;
	margin-top: 50px;
}

#currentPage {
	float: left;
	font-size: 20px;
}

#prev_btn {
	float: left;
	margin-right: 52px;
	font-size: 20px;
	width: 30px;
	text-align: center;
	cursor: pointer;
}

#next_btn {
	float: right;
	margin-left: 52px;
	font-size: 20px;
	text-align: center;
	width: 30px;
	cursor: pointer;
}

#totalPage {
	float: left;
	margin-left: 10px;
	font-size: 20px;
	color: #e1dedf;
}




</style>


<script type="text/javascript">
	var currentPage;
	var totalPage;
	
	var fileList = '';
	
	
	$(document).ready(function() {
		currentPage = $('#currentPage').text();
		totalPage = $('#totalPage').text();
		$(document).on('click', '.write_btn', function() {
			if(currentPage == '')
				currentPage = 1;
// 			console.log(currentPage + ", " + totalPage)
			
			$('#myCenterModal').modal('show');

		});
		
		
		

		$('.btn.btn-default').on('click', function() {
			var question_title = $('#question_title').val();
			var question_content = $('#question_content').val();

			if (question_title == '' || question_content == '') {
				alert('잘 입력하자.');
				// 해야 할 일 : ' ' 띄어쓰기만 작성한 경우에도 적용 안되도록,, 처리하고 싶다..
				$('#question_title').val('');
				$('#question_content').val('');
			} else {
				 var form_data = new FormData(); //form_data라는 객체 생성, https://www.javascripture.com/FormData 에 사용방법이 나와 있음
				    
				//첨부파일의 경우 여기에서 넘겨주어야 함, form_data.append('이름', 값); <-이름은 dto에 있는 멤버변수와 맞춰줌
				//form으로 감싸져 있는 형태의 경우 하나씩 말고 한꺼번에 넘길 수 있음
				
					console.log(question_title);
					console.log(question_content);
					console.log(currentPage);
					console.log(fileList);
				
					form_data.append('question_title', question_title);
					form_data.append('question_content', question_content);
					form_data.append('currentPage', currentPage);
				    
				    //첨부파일의 경우 배열로 처리가 됨, 첨부파일이 선택이 되지 않는 경우도 있으므로 확인해주어야 한다.
				    //https://www.javascripture.com/File <- files api 사용방법이 나와 있다.
				    /* if($('#filename')[0].files[0]!=undefined){ //$('#filename')[0]에서 files가 리턴이 됨 
				       //첨부파일이 정의가 되어 있으면 = 선택이 되어 있으면
				       form_data.append('filename', $('#filename')[0].files[0]);
				    } */
				    if(fileList !=''){
				    	form_data.append('filename', fileList);
				    }        
				    console.log(form_data);

				$.ajax({
					type : 'post',
					dataType : 'json',
					url : 'insertQuestion.do',
					data : form_data,
					 enctype : 'multipart/form-data',
				       contentType:false,
				       processData:false,
					success : successMessage,
					error : errorMessage
				});

				$('#question_title').val('');
				$('#question_content').val('');
				$('#question_file').text('');
			}

		});

		
		// 자신이 한 문의 중 한개를 누르면 해당 문의의 상세보기 페이지로 이동한다.
		$(document).on('click', '.question_list_contentBox', function() {
			alert($(this).attr('id') + "  답변페이지로 이동.");

		});

		$(document).on('click', '#next_btn', function() {
// 			console.log('다음');
// 			console.log('currentPage:'+currentPage +', totalPage:'+totalPage);
			if(currentPage < totalPage){
				currentPage = Number(currentPage) + 1;
// 				console.log('currentPage:' + currentPage);
				
				$.ajax({
					type : 'post',
					dataType : 'json',
					url : 'changeQuestion.do',
					data : {
						'currentPage' : currentPage,
					},
					success : successMessage,
					error : errorMessage
				});
				
			}
		});

		$(document).on('click', '#prev_btn', function() {
// 			console.log('이전');
// 			console.log('currentPage:'+currentPage +', totalPage:'+totalPage);
			if(currentPage > 1){
				currentPage = Number(currentPage) - 1;
// 				console.log('currentPage:' + currentPage);
				
				$.ajax({
					type : 'post',
					dataType : 'json',
					url : 'changeQuestion.do',
					data : {
						'currentPage' : currentPage,
					},
					success : successMessage,
					error : errorMessage
				});
				
			}
		});
		
		var file = '';
		$('#file_btn').on('click', function(){
			file = $('#file');
			$(file).click();
			$(file).change(function() {						
				console.log(file.val());
				var partname = file.val().substring(file.val().lastIndexOf("\\")+1);
// 			    console.log("partname:" + partname);
// 				var str = '<p><input type="checkbox" />' + partname + '</p>';
				$('#question_file').empty(); //초기화  -> 단일첨부파일 할때는 기존에 있던 한개를 지우고 추가. 
				$('#question_file').append(partname); // 다중첨부파일은 계속해서 추가.
				
				
				
				fileList = file[0].files[0];
				console.log(fileList);
				//fileList = fileList + userfile[0].files[0];
// 				fileList.push(file[0].files[0]);  
				// 다중첨부파일은 여러개의 파일을 fileList 배열에 push()를 사용해서 서버로 보낸다.
				
				//console.log(fileList);	
				});
		});	
		
		

	});// end ready()/////////////////////////////////////////

	function successMessage(res) {

		$('.content_pan').empty();
		$('.content_pan').attr('style',
				'border-top: 0px; border-bottom: 0px;margin-top: 50px;');

		$('.content_pan')
				.append(
						'<div class="question_list_titleBox">'
								+ '<div class="question_list_title" style="width: 220px;">날짜</div>'
								+ '<div class="question_list_title" style="width: 546px;">제목</div>'
								+ '<div class="question_list_title" style="width: 212px;">답변여부</div></div>');

		$.each(res.list,function(index, value) {
				var source = '<div class="question_list_contentBox" id="'+ value.question_num +'">'
									+ '<div class="question_list_content" style="width: 220px;">'
									+ formatDate(value.question_date)
									+ '</div>'
									+ '<div class="question_list_content" style="width: 546px;">'
									+ value.question_title
									+ '</div>'
									+ '<div class="question_list_content" style="width: 212px;">'
									+ value.hasAnswer + '</div>' + '</div>';

							$('.content_pan').append(source);
						});
		//console.log(res.pdto.totalPage);
		$('.content_pan')
				.append(
						'<div class="arrow_box" style="margin-left: auto; margin-right: auto; font-weight: 700;">'
								+ '<div id="prev_btn">&lt;</div>'
								+ '<div id="currentPage">'+ res.pdto.currentPage +'</div>'
								+ '<div style="float:left; margin-left: 10px; font-size: 20px; color: #e1dedf; font-weight: normal;">|</div>'
								+ '<div id="totalPage">'+ res.pdto.totalPage +'</div>'
								+ '<div id="next_btn">&gt;</div>'
								+ '</div>');
		
		totalPage = res.pdto.totalPage;
	};
	function errorMessage(request, status, error) {
		alert('errorMessage');
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
	};

	function formatDate(dateValue) {
		var d = new Date(dateValue);
		var date_format_str = d.getFullYear().toString()
				+ "-"
				+ ((d.getMonth() + 1).toString().length == 2 ? (d.getMonth() + 1)
						.toString()
						: "0" + (d.getMonth() + 1).toString())
				+ "-"
				+ (d.getDate().toString().length == 2 ? d.getDate().toString()
						: "0" + d.getDate().toString());
		//console.log(date_format_str);
		return date_format_str;
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty list}">
			<!-- 문의한 내역이 없을때  -->
			<div class="qna">
				<div class="pageTitle">1:1 문의하기</div>
				<div class="write_btn">+ 문의하기</div>

				<div class="content_pan"
					style="margin-top: 50px; overflow: auto; border-top: 2px solid black;">
					<div
						style="text-align: center; font-size: 40px; line-height: 400px; height: 400px; color: #e1dedf;">문의하신
						내용이 없습니다.</div>

					<div class="bottom_line" style="border-bottom: 1px solid #e1dedf;"></div>
				</div>
			</div>
		</c:when>

		<c:when test="${!empty list}">
			<!-- 문의한 내역이 있을때  -->
			<div class="qna">
				<div class="pageTitle">1:1 문의하기</div>
				<div class="write_btn">+ 문의하기</div>

				<div class="content_pan"
					style="margin-top: 50px; overflow: auto; border-bottom: 0px;">
					<div class="question_list_titleBox">
						<div class="question_list_title" style="width: 220px;">날짜</div>
						<div class="question_list_title" style="width: 546px;">제목</div>
						<div class="question_list_title" style="width: 212px;">답변여부</div>
					</div>
					<!--  -->
					<c:forEach items="${list}" var="dto">
						<div class="question_list_contentBox" id="${dto.question_num}">
							<div class="question_list_content" style="width: 220px;">
								<fmt:formatDate value="${dto.question_date}"
									pattern="yyyy-MM-dd" />
							</div>
							<div class="question_list_content" style="width: 546px;">${dto.question_title}</div>
							<div class="question_list_content" style="width: 212px;">${dto.hasAnswer}</div>
						</div>
					</c:forEach>
					<!-- <div class="bottom_line" style="border-bottom: 1px solid #e1dedf;"></div> -->

					<!--  -->
					<div class="arrow_box"
						style="margin-left: auto; margin-right: auto; font-weight: 700;">
						<div id="prev_btn">&lt;</div>
						<div id="currentPage">${pdto.currentPage}</div>
						<div
							style="float: left; margin-left: 10px; font-size: 20px; color: #e1dedf; font-weight: 700;">|</div>
						<div id="totalPage">${pdto.totalPage}</div>
						<div id="next_btn">&gt;</div>
					</div>
				</div>
			</div>






		</c:when>

	</c:choose>



	<div class="modal modal-center fade" id="myCenterModal"
		tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" style="padding: 0px;">
					<div class="q box">
						<span class="question">문의작성</span>
						<!-- 제목, 내용, 다중사진업로드 부분. -->
						<div class="q pan">
							<!-- 문의 제목 -->
							<div class="titleBox">
								<div class="title" style="line-height: 68px;">제목</div>
								<div class="input">
									<input type="text" id="question_title" placeholder="문의 제목" />
								</div>
							</div>
							<!-- 문의 내용 -->
							<div class="contentBox">
								<div class="title" style="line-height: 212px;">내용</div>
								<div class="input">
									<textarea id="question_content" placeholder="문의 내용"></textarea>
								</div>
							</div>
							<!-- 문의 다중사진. -->
							<div class="uploadBox">
								<div class="title" style="line-height: 68px;">파일 업로드</div>
								<div class="input">
									<div id="upload">
										<img src="images/icon_53.svg" id="upload_icon">
										<div id="question_file"></div>
									</div>
									<input type="file" id="file" style="display: none;"/>
									<div id="file_btn">찾기</div> 
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer" style="padding: 0px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">문의
						등록</button>
				</div>
			</div>
		</div>
	</div>
	
	
	

</body>
</html>