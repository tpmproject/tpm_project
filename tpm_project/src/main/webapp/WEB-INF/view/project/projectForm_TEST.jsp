<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport"
    content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="http://bootstraptaste.com">
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="css/jcarousel.css" rel="stylesheet">
    <link href="css/flexslider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Theme skin -->
    <link href="skins/default.css" rel="stylesheet"><link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.0.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/ajax_extension.js" ></script>

<script type="text/javascript">

window.onload=function(){
	$(main_modal).hide();
	$(smodal).hide();
}

function showf(){
	$(mback).fadeIn('150');
	$(main_modal).fadeIn('150');
	$(f_modal).show();
	$(smodal).hide();
}
//친구리스트
function shows(){
	$(f_modal).fadeOut();
	$(smodal).fadeIn();
	var param = 'member_idx=' + ${sessionScope.s_member_idx};
	sendRequest('projectFriendList.do',param,projectMemberAddResult2,'POST');
	
}

function closem() {
	$(mback).fadeOut('100');
	$(main_modal).fadeOut('100');
}
//검색멤버
function projectMemberAdd() {
	var param = 'member_idx=' + ${sessionScope.s_member_idx};
	param += '&member_id=' + document.newProject.member_id.value;
	
	sendRequest('projectMemberAdd.do', param, projectMemberAddResult,'POST');
	window.alert(param);
}


/**검색 멤버*/
function projectMemberAddResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			
			
			var result = XHR.responseText;

			var json = JSON.parse(result);

			var msg = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];

				msg += '<div class="col-sm-12" id="modal_content">';
				msg += '<div class="col-sm-12"> ';
				msg += '<div class="panel"> ';
				msg += '<div class="panel-body p-t-10" id="member_idx'+member.member_idx+'"> ';
				msg += '<div class="media-main"> ';
				msg += '<a class="pull-left" href="#"> <img height="30" width="30"';
				msg += 				'class="thumb-lg img-circle bx-s" ';
				msg += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';

				msg += '</a> ';
				msg += '<div class="pull-right btn-group-sm"> ';
				msg += '<a href="javascript:goInsert_member(' + member.member_idx
						+ ')" class="btn btn-success tooltips" ';
				msg += 'data-placement="top" data-toggle="tooltip" ';
				msg += 'data-original-title="Add"> <i class="fa fa-user-plus"></i> ';

				msg += '</a> ';
				msg += '</div> ';
				msg += '<div class="info"> ';
				msg += '<input type="hidden" id="add_member_idx_' + i + '" value="' + member.member_idx + '">'
				msg += '<h4>' + member.member_name + '</h4> ';
				msg += '<p class="text-muted">' + member.member_id
						+ '</p> ';
				msg += '</div> ';
				msg += '</div> ';
				msg += '<div class="clearfix"></div> ';
				msg += '<hr> ';

				msg += '</div> ';
				msg += '</div> ';
				msg += '</div> ';
				msg += '</div> ';
			}

			var member_search_content = document
					.getElementById('member_search_content');
			member_search_content.innerHTML = msg;

			if (result != null) {
				/* var bodyNode = document.getElementById('btntest2');
				var divNode = document.createElement('div');
				divNode.innerHTML = result;
				bodyNode.appendChild(divNode); */
			}
			
			
		}
	}
}

function goInsert_member(i){
	var member_idx = ${sessionScope.s_member_idx};
	var myfriend_idx = i;
	
	var param = 'member_idx=' + member_idx + '&myfriend_idx=' + myfriend_idx;
	//sendRequest('myFriendAdd.do', param, 'POST', 'FRIEND_INSERT'); // 해당 페이지로 ajax통신 시작
	sendRequest('myFriendAdd.do', param, friendAddResult,'POST');
	$('#member_idx'+i).remove();
}

function friendAddResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			window.alert(result);
			if(result.trim() == 'true'){
				var param = 'member_idx=' + ${sessionScope.s_member_idx};
				sendRequest('projectFriendList.do',param,projectMemberAddResult2,'POST');
				
			} 
			
		}
	}
}

	/**친구리스트*/
	function projectMemberAddResult2() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var json = JSON.parse(result);
				
				 var msg2 = '';
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];

					msg2 += '<div id="modal_content'+member.member_idx+'">';
					msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg2 +=member.member_name;
					msg2 += '<div style="display:inline-block;width:30px;height:30px;" onclick="insertPM(' +member.member_idx+ ')">';
					msg2 += '<i class="glyphicon glyphicon-plus"></i></div>'; 
					
					msg2 += '<input type="hidden" id="member_img' +member.member_idx  + '" value="' + member.member_img + '">';
					msg2 += '<input type="hidden" id="member_name' +member.member_idx+ '" value="' + member.member_name + '">';
					msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';

					msg2 += '</div> ';
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;
				
			 
			}
		}
	}
	
	var count=0;
	function insertPM(member_idx){
		
		var temp=$('#modal_content'+member_idx);
		
		var divNode=document.createElement('div');
		divNode.setAttribute('id','pm'+member_idx);
		
		temp.fadeOut('100');
			
		var img=$('#member_img' + member_idx).val();
		var name=$('#member_name' +member_idx).val();
		
		var msg='<img height="30" width="30" class="thumb-lg img-circle bx-s" src="/tpm_project/img/member/profile/'+img+'"> ';
		msg+=name+'<a onclick="deletePM('+member_idx+')"><i class="glyphicon glyphicon-remove"></i></a>';
		msg+='<input type="hidden" name="member_idx" value="'+member_idx+'">';
		count++;
		
		divNode.innerHTML=msg;
		
		var param = 'member_idx=' + member_idx;
		
		var pmdiv=document.getElementById('project_Member');
		pmdiv.appendChild(divNode);
		
	}
	function deletePM(member_idx){
		$('#pm'+member_idx).remove();
		$('#modal_content'+member_idx).fadeIn('100');
		count--;
	}
	
	
	
	function projectMemberAddResult3() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				window.alert(result);
				var json = JSON.parse(result);
				
				 var msg2 = '';
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];

					msg2 += '<div class="col-sm-12" id="modal_content">';
					msg2 += '<div class="col-sm-12"> ';
					msg2 += '<div class="panel"> ';
					msg2 += '<div class="panel-body p-t-10"> ';
					msg2 += '<div class="media-main"> ';
					msg2 += '<a class="pull-left" href="#"> <img height="30" width="30"';
					msg2 += 				'class="thumb-lg img-circle bx-s" ';
					msg2 += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';
					
					//그룹원 추가버튼	
					msg2 += '</a> ';
					 msg2 += '<div class="pull-right btn-group-sm"> ';
					msg2 += '<a href="javascript:Insert_project_member(' + member.member_idx
							+ ')" class="btn btn-success tooltips" ';
					msg2 += 'data-placement="top" data-toggle="tooltip" ';
					msg2 += 'data-original-title="Add"> <i class="fa fa-user-plus"></i> '; 

					msg2 += '</a> ';
					msg2 += '</div> ';
					msg2 += '<div class="info"> ';
					msg2 += '<input type="hidden" id="add_project_member_idx_' + i + '" value="' + member.member_idx + '">'
					msg2 += '<h4>' + member.member_name + '</h4> ';
					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';
					msg2 += '</div> ';
					msg2 += '</div> ';
					msg2 += '<div class="clearfix"></div> ';
					msg2 += '<hr> ';

					msg2 += '</div> ';
					msg2 += '</div> ';
					msg2 += '</div> ';
					msg2 += '</div> ';
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;
				
			 
			}
		}
	}
	
</script>

<style>

#mback {
	position: fixed;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
}

#main_modal{
	display: none;
	background: white;
	position: fixed;
	top: 10%;
	left: 10%;
	border: solid 10px white;
	border-radius: 10px;
	width:640px;
	height:700px;
}
.sd{
	display:inline-block;
	background: #f8f8f8;
	height:600px;
	width:48%;
	float: left;
	text-align: center;
	
}
</style>
</head>


<body>
  <header>
      <div class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><span>TEAM</span>.POJECT.MANAGER</a>
          </div>
          <div class="navbar-collapse collapse ">
            <ul class="nav navbar-nav">
              <li class="active">
                <a href="index.html">Home</a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown"
                data-delay="0" data-close-others="false">Features <b class=" icon-angle-down"></b></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="typography.html">Typography</a>
                  </li>
                  <li>
                    <a href="components.html">Components</a>
                  </li>
                  <li>
                    <a href="pricingbox.html">Pricing box</a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="portfolio.html">Portfolio</a>
              </li>
              <li>
                <a href="blog.html">Blog</a>
              </li>
              <li>
                <a href="contact.html">Contact</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <!-- end header -->
    <section id="featured"></section>
    <section class="callaction">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="big-cta">
              <div class="cta-text">
                <h2>
                  <span>TPM</span>.PROJECT</h2>
                <h5>
                  <a onclick="showf()">프로젝트추가</a>
                </h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="row">
              <div class="col-lg-3">
                <div class="box">
                  <div class="box-gray aligncenter">
                    <h4>프로젝트1</h4>
                    <div class="icon">
                      <i class="fa fa-desktop fa-3x"></i>
                    </div>
                    <p>Voluptatem accusantium doloremque laudantium sprea totam rem aperiam.</p>
                  </div>
                  <div class="box-bottom">
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-3">
                <div class="box">
                  <div class="box-gray aligncenter">
                    <h4>프로젝트2</h4>
                    <div class="icon">
                      <i class="fa fa-pagelines fa-3x"></i>
                    </div>
                    <p>Voluptatem accusantium doloremque laudantium sprea totam rem aperiam.</p>
                  </div>
                  <div class="box-bottom">
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-3">
                <div class="box">
                  <div class="box-gray aligncenter">
                    <h4>프로젝트</h4>
                    <div class="icon">
                      <i class="fa fa-edit fa-3x"></i>
                    </div>
                    <p>Voluptatem accusantium doloremque laudantium sprea totam rem aperiam.</p>
                  </div>
                  <div class="box-bottom">
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-3">
                <div class="box">
                  <div class="box-gray aligncenter">
                    <h4>프로젝트4</h4>
                    <div class="icon">
                      <i class="fa fa-code fa-3x"></i>
                    </div>
                    <p>Voluptatem accusantium doloremque laudantium sprea totam rem aperiam.</p>
                  </div>
                  <div class="box-bottom">
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- divider -->
        <!-- end divider -->
        <!-- Portfolio Projects -->
      </div>
    </section>
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Get in touch with us</h5>
              <address>
                <strong>Moderna company Inc</strong>
                <br>Modernbuilding suite V124, AB 01
                <br>Someplace 16425 Earth</address>
              <p>
                <i class="icon-phone"></i>(123) 456-7890 - (123) 555-7891
                <br>
                <i class="icon-envelope-alt"></i>email@domainname.com</p>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Pages</h5>
              <ul class="link-list">
                <li>
                  <a href="#">Press release</a>
                </li>
                <li>
                  <a href="#">Terms and conditions</a>
                </li>
                <li>
                  <a href="#">Privacy policy</a>
                </li>
                <li>
                  <a href="#">Career center</a>
                </li>
                <li>
                  <a href="#">Contact us</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Latest posts</h5>
              <ul class="link-list">
                <li>
                  <a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                </li>
                <li>
                  <a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a>
                </li>
                <li>
                  <a href="#">Natus error sit voluptatem accusantium doloremque</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Flickr photostream</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="https://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="copyright">
                <p>© Moderna Theme. All right reserved.</p>
                <div class="credits">
                  <!-- All the links in the footer should remain intact. You can delete
                  the links only if you purchased the pro version. Licensing information:
                  https://bootstrapmade.com/license/ Purchase the pro version with working
                  PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna -->
                  <a href="https://bootstrapmade.com/">Free Bootstrap Themes</a>by
                  <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="social-network">
                <li>
                  <a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a>
                </li>
                <li>
                  <a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a>
                </li>
                <li>
                  <a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
    <!-- javascript==================================================- ->

<!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.fancybox.pack.js"></script>
    <script src="js/jquery.fancybox-media.js"></script>
    <script src="js/google-code-prettify/prettify.js"></script>
    <script src="js/portfolio/jquery.quicksand.js"></script>
    <script src="js/portfolio/setting.js"></script>
    <script src="js/jquery.flexslider.js"></script>
    <script src="js/animate.js"></script>
    <script src="js/custom.js"></script>
    
    <!-- ajax div -->
	<form name="newProject" action="projectAdd.do" method="post">
		<div id="mback" onclick="closem()"></div>
		<div id="main_modal">
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">프로젝트 생성</h4>
			
			<div id="f_modal">
				<div class="box-gray aligncenter">
                    <h4>프로젝트1</h4>
                    <div id="btntest" class="icon">
                      	<div>프로젝트명: <input type="text" name="project_name"></div>
                      	<p><textarea cols="30" rows="20" name="project_content"></textarea></p>
                    <button type="button" class="btn btn-next" id="btn-next" onclick="shows()">다음</button>
                    </div>
                    
                  </div>	
			</div>

			<div id="smodal">
				
				      
				          
					     <div class="sd">
									<h4>친구목록</h4>
									<div id="myFriend_List"	style="width: 300px; height: 200px; overflow-y: scroll"></div>
									<h4>검색 멤버</h4>
									<div>
										<input type="text" name="member_id" placeholder="Search" size="15">
										<button type="button" class="btn" onclick="projectMemberAdd()">검색</button> 
									</div>
										<div id="member_search_content"	style="width: 300px; height: 200px; overflow-y: scroll"></div>
									
						</div>
				         
				          
			          	<div class="sd">
			         	 <h4>초대 멤버</h4>
							<div id="project_Member" style="width: 95%; height: 480px; overflow-y: scroll">
				
							</div>
							<button type="button" class="btn btn-next" id="btn-workbefore" onclick="showf()">이전</button>
							<input type="submit" class="btn" value="완료">
						</div>
			</div>
		</div>
	</form>
</body>
</html>