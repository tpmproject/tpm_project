<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/httpRequest.js"></script>

	<script>
	
		function emailCheck(){
			var user_email = document.memberAddForm.inputEmail.value;
				
			if(!user_email){
				window.alert('이메일을 입력해주세요');
				
			} else{
				var email = 'email='+user_email;
				
				sendRequest('memberIdCheck.do', email, emailCheckResult, 'POST');
			}
		}
		
		function emailCheckResult(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var result = XHR.responseText.trim();
					var email = document.memberAddForm.inputEmail.value;
					
					var resultId = document.getElementById('idCheckResult');
					
					if(result==email){
						resultId.style.color = 'red';
						resultId.innerHTML = '이미 사용중인 이메일입니다';
					} else{
						window.open('memberSendEmail.do?email='+email, 'emailcheck','width=500, height=200');
					}
				}
			}
		}
		
		function passwordCheck(){
			var user_pwd1=document.memberAddForm.member_pwd.value;
			var user_pwd2=document.memberAddForm.member_pwd2.value;
			var pwdCheckMsg = document.getElementById('pwdCheckMsg');
			if(user_pwd1!=user_pwd2){
				pwdCheckMsg.style.color = 'red';
				pwdCheckMsg.innerHTML = '비밀번호가 다릅니다.';
			}else{
				pwdCheckMsg.innerHTML = '';
			}
		}

		 
		 function signAgr(){

	    	var element = document.getElementById("signAgr"); 
			element.style.display = ""; 
			
	    	 
		 }
		
	</script>    
  </head>

<script>
function cancle(){
	location.href='memberLogin.do';
}
</script>
<style type="text/css">
	    .btn-warning {
	    color: #f0ad4e;;
	    background-color: #f0ad4e;
	    border-color: #eea236;
	     
	    }
    </style>  
</head>
<body>
 <div id="signAgr" style="display:none; position:absolute; z-index:3000; background-color: white; width: 100%; height:100px">
 	<%@include file="signAgreement.jsp" %>
 </div>
 <div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><span>TPM</span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
              <a href="#">Home</a>
            </li>
            <li>
              <a href="#">Contacts</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
	<article class="container">
            <div class="col-md-6 col-md-offset-3"></div>
            <div class="col-md-12">
                <div class="page-header">
                    <h1>회원가입
                        <small>horizontal</small>
                    </h1>
                </div>
                <form class="form-horizontal" id="memberAddForm" name="memberAddForm" action="memberAddTendency.do" method="post" enctype="multipart/form-data">
				
				
				
				<div class="form-group">
						<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
						<div class="col-sm-6" id="input_email">
							<input class="form-control" id="inputEmail" type="email"
								name="member_id" placeholder="이메일" required="required">
						</div>
						<div id="email_check_div">
							<button class="btn btn-success" type="button"
								onclick="emailCheck()">이메일 인증 <i class="fa fa-check spaceLeft"></i>
							</button>
						</div>
						<div>
							<p class="col-sm-offset-3 col-sm-8 help-block" id="idCheckResult"></p>
						</div>
					</div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputPassword" type="password" name="member_pwd" placeholder="비밀번호"required="required">
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputPasswordCheck" type="password" name="member_pwd2" onblur="passwordCheck()"placeholder="비밀번호 확인"required="required">
                            <p class="help-block" id="pwdCheckMsg">비밀번호를 한번 더 입력해주세요.</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputName">이름</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputName" type="text" name="member_name" placeholder="이름"required="required">
                        </div>
                    </div>
                    
                    <div class="form-group">
           			 <label class="col-sm-3 control-label" for="inputName">연락처</label>
           			 <div class="col-sm-6">
             		 <input class="form-control" id="inputName" type="text" name="member_tel" placeholder="전화번호"required="required">
           			 </div>
       			    </div>
       			    
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputName">성별</label>
                        <div class="col-sm-6">
                            <select class="form-control" style="width:79px; float:left;" name="member_gender">
                                <option value="남자">남자</option>
                                <option value="여자">여자</option>
                            </select>
                        </div>
                    </div>
                    <!-- 사진이미지 관련  시작-->
				<div class="form-group " style="margin: 5px 220px;">
					<div style="float: left;">
						<label for="image col-sm-3 control-label"
							style="float: left; margin: 10px -15px;">사진첨부</label>
							<input type="file" name="member_img" id="image"
							style="float: left; margin: 6px 40px;" onchange="memberImgAdd()">
					</div>
					<div id="image_preview" style="float: left; display: block;">
						<img 
							src="/tpm_project/img/member/default_p.PNG"
							style="height: 150px; width: 130px;"> <a href="#"
							style="position: absolute; margin: -150px 110px; font-size: x-large; font-weight: 600;">x</a>
					</div>
				</div>
				<!-- 사진이미지 관련 끝 -->
					
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
                       
                          
                                <input id="agr_ch" name="check_agr" type="checkbox" disabled="disabled">
                              
                            <a href="#" onclick="signAgr()">이용약관</a>에 동의 합니다.
                             
                    </div>
                    
			
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button class="btn btn-primary" type="submit">다음
                                <i class="fa fa-check spaceLeft"></i>
                            </button>
                            <button class="btn btn-danger" type="button" onclick="cancle();">가입취소
                                <i class="fa fa-times spaceLeft"></i>
                            </button>
                        </div>
                    </div>
      
                </form>
                <hr>
	          </div>
			
	
		</article>
        
        
        <footer class="section" style="background-color:black; margin-top:170px">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <h1 class="text-muted" style="color:white;">Team Project Manager</h1>
            <p class="text-muted" style="color:white;">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
          </div>
          <div class="col-sm-6">
            <p class="text-muted text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
     <script type="text/javascript">


    /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */

    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
    </script>
    
</body>
</html>