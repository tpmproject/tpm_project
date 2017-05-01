

 	window.onload = function() {
		$(main_modal).hide();
		$(smodal).hide();
		$('.slimdiv').mCustomScrollbar({axis:"yx"});
		$('#pm_div').mCustomScrollbar({axis:"yx"});
		
	switch (skin) {
		case 'white': case 'white-light':skin='#fff'; break;
		case 'blue': case 'blue-light':skin='#3c8dbc'; break;
		case 'green': case 'green-light':skin='#00a65a'; break;
		case 'purple': case 'purple-light':skin='#605ca8'; break;
		case 'red': case 'red-light':skin='#dd4b39'; break;
		case 'yellow': case 'yellow-light':skin='#f39c12'; break;
	}
	
	$('#rightcon').css('color',skin);
	$('#leftcon').css('color',skin);
	$('.cover').css('background',skin);
	}	 
		
 	
 	$(window).resize(function() {
 		var wid=(window.innerWidth/2)-320;
		$('#main_modal').css('left',wid+'px');
		$('#main_modal2').css('left',wid+'px');
 	})
 	
 	function sideBar(){
 		var bNode=document.documentElement.lastChild;
 		$(bNode).toggleClass('skin-blue skin-blue sidebar-collapse sidebar-open');
 	}
 	
 	
	function showf() {
		var wid=(window.innerWidth/2)-320;
		$('#main_modal').css('left',wid+'px');
		$(mback).fadeIn('150');
		$(main_modal).fadeIn('150');
		$(f_modal).show();
		$(smodal).hide();
		document.getElementById('project_Member').innerHTML='';
	}
	function showf2() {
		$(f_modal2).show();
		$(smodal2).hide();
	}
	/**슬림스크롤*/
 	
	
	/**프로젝트 수정*/
	function projectUpdate(idx,name,content){
		var wid=(window.innerWidth/2)-320;
		$('#main_modal2').css('left',wid+'px');
		
		$(mback).fadeIn('150');
		$(main_modal2).fadeIn('150');
		$(f_modal2).show();
		$(smodal2).hide();
		
		document.changeProject.project_idx.value=idx;
		document.changeProject.project_name.value=name;
		document.changeProject.project_content.value=content;
	}
	
	//프로젝트 삭제
	function projectDelete(project_idx){
		var param='project_idx='+project_idx;
		window.alert('param='+param);
		sendRequest('projectDelete.do',param,projectDelResult,'POST');
		
	}
	function projectDelResult(){
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var objData=eval('('+result+')');
				var pson=objData.pson;
				
				if(pson.project_idx==0){
					window.alert('오류 발생!');
				}else{
					
					var delp=$('#project_div'+pson.project_idx).parent();
					if(delp.prev().attr('class')!='item'){
						window.alert('앞이 빔!');
						delp.next().attr('class','item active');
					}else{
						window.alert('앞에 뭐있음');
						delp.prev().attr('class','item active');
					}
					delp.remove();
		
				}
				/* history.go(0);*/
				/*  location.reload(); */
				closem();
			}
		}
				
	}
	//친구리스트
	function shows() {

		var pname = document.newProject.project_name.value;
		var pcontent = document.newProject.project_content.value;
		if (pname == null || pname == "" || pcontent == null || pcontent == "") {
			window.alert('프로젝트 정보 입력 부탁 드립니다!!');
			showf();
			return;
		}

		$(f_modal).fadeOut();
		$(smodal).fadeIn();
		var param = 'member_idx=' + member_idx;
		sendRequest('projectFriendList.do', param, projectMemberAddResult2,	'POST');

	}
	function shows2() {

		var pname = document.changeProject.project_name.value;
		var pcontent = document.changeProject.project_content.value;
		if (pname == null || pname == "" || pcontent == null || pcontent == "") {
			window.alert('프로젝트 정보 입력 부탁 드립니다!!');
			return;
		}

		$(f_modal2).hide();
		$(smodal2).show();
		
		var pidx=document.changeProject.project_idx.value;
		var midx=member_idx;
		sendRequest('projectFriendList.do?member_idx='+midx+'&project_idx='+pidx, null, shows2Result,'GET');

	}
	

	function closem() {
		$(mback).fadeOut('100');
		$(main_modal).fadeOut('100');
		$(main_modal2).fadeOut('100');
		document.newProject.reset();
		document.changeProject.reset();
		document.getElementById('project_Member').innerHTML='';
		document.getElementById('project_Member2').innerHTML='';
	}
	
	//검색멤버
	var addOrUpdate=0;
	function projectMemberAdd(aou) {
		addOrUpdate=aou;
		var param = 'member_idx=' + member_idx;
		param += '&member_id=' + document.newProject.member_id.value;

		sendRequest('projectMemberAdd.do', param, projectMemberAddResult,'POST');
		
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
					var dupli=0;
					
										
					if(addOrUpdate==1){
						var parN=document.getElementById('project_Member');
						var brother=parN.firstChild;
						var youngB=parN.lastChild;
						var repeat=true;
						if(brother!=null){
							do{
								if(brother.nodeName=='DIV'){
									var bro_id=brother.getAttribute('id');
									if(bro_id=='modal_content'+member.member_idx){
										dupli++;
										repeat=false;
									}
								}
								if(brother!=youngB){
									brother=brother.nextSibling;
								}else{
									repeat=false;
								}
								
							}while(repeat);
							
							if(dupli>0){
								continue;
							}
						}	
							msg += '<div id="modal_content';
						
					}else if(addOrUpdate==2){
						var parN=document.getElementById('project_Member2');
						var brother=parN.firstChild;
						var youngB=parN.lastChild;
						var repeat=true;
						do{
							if(brother.nodeName=='DIV'){
								var bro_id=brother.getAttribute('id');
								
								if(bro_id=='modal2_content'+member.member_idx){
									
									dupli++;
									repeat=false;
								}
							}
							if(brother!=youngB){
								brother=brother.nextSibling;
							}else{
								repeat=false;
							}
						}while(repeat);
						
						if(dupli>0){
							continue;
						}
						
						msg += '<div id="modal2_content';
					}
					msg+=member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" >';
					msg += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg += member.member_name;
					msg += '<div id="plus'+member.member_idx+'" style="display:inline-block;width:30px;height:30px;" onclick="goInsert_member('
							+ member.member_idx + ')">';
					msg += '<i class="glyphicon glyphicon-plus"></i></div>';
					msg += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg += '</div> ';
					
					
					
					
					
				}
				
				var member_search_content=member_search_content = document.getElementById('member_search_content');
				if(addOrUpdate==2){
					member_search_content = document.getElementById('member_search_content2');
				}
				
				member_search_content.innerHTML = msg;

			}
		}
	}
	
	var temp='';
	function goInsert_member(i) {
		var myfriend_idx = i;

		var param = 'member_idx=' + member_idx + '&myfriend_idx='
				+ myfriend_idx;
		//sendRequest('myFriendAdd.do', param, 'POST', 'FRIEND_INSERT'); // 해당 페이지로 ajax통신 시작
		sendRequest('myFriendAdd.do', param, friendAddResult, 'POST');
		temp=i;
	}

	
	function friendAddResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				
				if (result.trim() == 'true') {
					if(addOrUpdate==1){
						var chil=document.getElementById('modal_content'+temp);
						var pa=document.getElementById('myFriend_List');
						if(chil.parentNode.getAttribute('id') == 'project_Member'){
							
						}else{
							pa.appendChild(chil);
						}
						$('#plus'+temp).remove();
					}else if(addOrUpdate==2){
						var chil=document.getElementById('modal2_content'+temp);
						var pa=document.getElementById('myFriend_List2');
						if(chil.parentNode.getAttribute('id') == 'project_Member2'){
							
						}else{
							pa.appendChild(chil);
						}
						$('#plus'+temp).remove();
					}
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

					msg2 += '<div id="modal_content'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
					msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg2 += member.member_name;

					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg2 += '</div> ';
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;

			}
		}
	}
	//프로젝트 수정시 프로젝트 멤버 목록
	function shows2Result() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var json = JSON.parse(result);

				var f_List_msg='';
				var pm_List_msg='';
				var msg2 ='';
				pm_List_msg+='<div id="modal2_content'+member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				pm_List_msg += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				pm_List_msg += 'src="/tpm_project/img/member/profile/'+member_img+'">'+member_name;
				pm_List_msg += '<p class="text-muted">'+member_id+'</p> ';	
				pm_List_msg +='<span><select id="select2'+member_idx+'"><option value="1000">읽기만</option>';
				pm_List_msg += '<option value="2000">프로젝트 멤버</option>';
				pm_List_msg += '<option value="3000" selected="selected">프로젝트 책임자</option></select></span></div> ';
				
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];
					
					
					msg2 += '<div id="modal2_content'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
					msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg2 += member.member_name;

					if(member.pm<10){
						msg2 += '<div id="plus'+member.member_idx+'" style="display:inline-block;width:30px;height:30px;" onclick="goInsert_member2('+ member.member_idx + ')">';
						msg2 += '<i class="glyphicon glyphicon-plus"></i></div>';
					}
					
					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';
					if(member.pm%10==1){
						var lev=member.level;
						var sel='selected="selected"';
						msg2 +='<span><select id="select2'+member.member_idx+'"><option value="1000"'+(lev==1000?sel:'')+'>읽기만</option>';
						msg2 += '<option value="2000" '+(lev==2000?sel:'')+'>프로젝트 멤버</option>';
						msg2 += '<option value="3000" '+(lev==3000?sel:'')+'>프로젝트 책임자</option></select></span>';
					}
					msg2 += '</div> ';
					
					if(member.pm%10==1){
						pm_List_msg+=msg2;
					}else{
						f_List_msg+=msg2;	
					}
					msg2='';
				}

				var pm_List = document.getElementById('project_Member2');
				pm_List.innerHTML = pm_List_msg;
				var f_List = document.getElementById('myFriend_List2');
				f_List.innerHTML=f_List_msg;
				var ms_List = document.getElementById('member_search_content2');
				ms_List.innerHTML='';

			}
		}
	}
	

	//프로젝트 멤버에 임시 추가
	function insertPM(member_idx) {

		var temp = $('#modal_content' + member_idx);

		var param = 'member_idx=' + member_idx;

		var pmdiv = document.getElementById('project_Member');
		
		var spanNode=document.createElement('span');
   		var msg='<select id="select'+data.substring(13)+'"><option value="1000">읽기만</option>';
		msg += '<option value="2000">프로젝트 멤버</option>';
		msg += '<option value="3000">프로젝트 책임자</option></select>';
		
		spanNode.innerHTML=msg;
    	temp.appendChild(spanNode);
		
		pmdiv.appendChild(temp);

	}
	function deletePM(member_idx) {
		$('#pm' + member_idx).remove();
		$('#modal_content' + member_idx).fadeIn('100');
	}

	/* function projectMemberAddResult3() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				
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
					msg2 += '<a href="javascript:Insert_project_member('
							+ member.member_idx
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
 */
	function addP() {

		var pname = document.newProject.project_name.value;
		var pcontent = document.newProject.project_content.value;

		var param = 'project_name=' + pname;
			param += '&project_content=' + pcontent;
		var parentD = document.getElementById('project_Member');

		var childD = parentD.firstChild;
		var lastC = parentD.lastChild;
		var msg = '';
		var msg2 = '';
		while (true) {
			
			if(childD.nodeName=='DIV'){
				var idx=childD.getAttribute('id');
				msg+=','+idx.substring(13);
				msg2+=','+$('#select'+idx.substring(13)).val();
			}
			if(childD==lastC)break;
			childD = childD.nextSibling;
		}

		var my_idx = member_idx;
		param += '&project_member=' + my_idx + msg;
		param += '&level=3000' + msg2;
		
		
		sendRequest('projectAdd.do', param, addPResult, 'POST');

	}
	function addPResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				window.alert(result);
				var objData=eval('('+result+')');
				var pson=objData; // projectDTO
				
				if(pson.project_idx==0){
					window.alert('오류 발생!');
				}else{
					var pmarry = pson.project_member_dtos; //project_memberDTO
					var divNode=document.createElement('DIV');
					divNode.setAttribute('class','item ');
					//divNode.setAttribute('style','margin-top: 15px;');
					var cNode = document.getElementById('ptest');
										
					/* var msg='<div class="box">';
					msg+='<div class="box-gray aligncenter" style="height:210px;">';
					msg+='<input type="hidden" id="p_idx'+pson.project_idx+'" value="'+pson.project_idx+'">';
					msg+='<h4 id="pn'+pson.project_idx+'">'+pson.project_name+'<span onclick="projectUpdate('+pson.project_idx+','+pson.project_name+','+pson.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span></h4>';
					msg+='<div class="icon"><i class="fa fa-desktop fa-3x"></i></div>';
					
					msg+='<p id="pc'+pson.project_idx+'">'+pson.project_content+'</p>';
					msg+='<td><input type="button" value="진행중"></td></div>';
					msg+='<div class="box-bottom"><a href="projectContent.do?project_idx='+pson.project_idx+'&member_idx=${s_member_idx}">프로젝트 보기버튼</a></div></div>'; */
					
					/* var pmarry = pson.project_member_dtos;
				    pmarry[i].pro_m */
				  var msg=' <div id="contain" class="container-fluid ">';
				   msg+='<div id="project_div'+pson.project_idx+'" style="margin-top: 15px;">';
					   msg+='<div class="col-sm-10 col-sm-offset-1">';
						   msg+='<div class="col-md-4 col-sm-6" style="width: 500px;">';
							   msg+='<div class="card-container manual-flip">';
								   msg+='<div class="card">';
									msg+='	<div class="front">'; 
										msg+='<div class="cover">';
											//	<!-- <img src="/tpm_project/sample/khj/img/son.jpg" /> -->
											msg+='</div>';
											 msg+='<div class="user">';
												msg+='<img class="img-circle"';
													msg+='	src="/tpm_project/sample/khj/img/cat.png"';
														msg+='	style="width: 140px; height: 140px;" />';
															msg+='</div>'; 

											msg+='<div class="content">';
												msg+='<div class="main">';
													msg+='<input type="hidden" id="p_idx'+pson.project_idx+'"';
														msg+='value="'+pson.project_idx+'">';
															msg+='<h4 id="pn'+pson.project_idx+'">';
																msg+='<span class="hidden-xs">'+pson.project_name+'</span>';
																	msg+='</h4>';
																		msg+='<p class="profession">TPM Project</p>';
																			msg+='<p class="text-center">';
																				msg+='<span id="pc'+pson.project_idx+'">'+pson.project_content+'</span>';
																					msg+='</p>';
																						msg+='</div>';
																							msg+='<div class="footer" rel="tooltip" title="프로젝트 확인">';
																								msg+='<button class="btn btn-simple"';
																									msg+='onclick="rotateCard(this)">';
																										msg+='<i class="fa fa-mail-forward"></i> Manual Rotation';
																											msg+='</button>';

																												msg+='</div>';
																													msg+='</div>';
																														msg+='</div>';
										//<!-- end front panel -->

										// <!-- 뒷화면 -->
										msg+='<div class="back">';
										msg+='<div class="header">';
												
														 for(var i=0;i<pmarry.length;i++){
															if(pmarry[i].project_level==3000){
																if(pmarry[i].member_idx == member_idx){
																	msg+='<div style="float: right;">';
																	msg+='<span rel="tooltip" title="수정"';
																		msg+='onclick="projectUpdate('+pson.project_idx+','+pson.project_name+','+pson.project_content+')">';
																		msg+='<i class="glyphicon glyphicon-cog"';
																			msg+='style="margin-bottom: 0px;"></i>';
																				msg+='</span> <span rel="tooltip" title="삭제"';
																					msg+='onclick="projectDelete('+pson.project_idx+')">';
																				msg+='<i class="glyphicon glyphicon-remove"';
																					msg+='style="margin-bottom: 0px;"></i>';
																						msg+='</span>';
																	msg+='</div>';
																}
															}
														}
																						
												msg+='<h5 class="motto">"프로젝트는 우리의 미래입니다."</h5>';
												msg+='</div>';
											msg+='<div class="content">';
											msg+='<div class="main">';
												msg+='<h4 class="text-center">'+pmarry.project_name+'</h4>';
													msg+='<hr>';
													/*	 for(var i=0;i<dtos.length;i++){
															msg+='<h5 class="text-center">'+dtos[i].member_id+'</h5>';
														}*/ 
													msg+='<hr>';
													msg+='<div class="stats-container">';
														msg+='<div class="stats" align="center" rel="tooltip"';
															msg+='title="업무확인">';
																msg+='<a class="btn btn-link"';
																	msg+='href="projectContent.do?project_idx='+pson.project_idx+'&member_idx='+member_idx+'">';
																	msg+='<i class="fa fa-clone left"></i>업무확인</a>';
																		msg+='</div>';
																		 for(var i=0;i<pmarry.length;i++){
																			 if(pmarry[i].project_level==3000 && pson.project_state==3){
																				 if(pmarry[i].member_idx == member_idx){
																					 msg+='<div class="stats">';
																					 msg+='<span class="print" rel="tooltip" title="완료상태">';
																					 msg+='<a href="#" class="btn btn-link"style="color: green;">';
																					 msg+='<i class="glyphicon glyphicon-ok-circle"></i>완료</a>';
																						 msg+='</span>';
																							 msg+='</div>';
																				 }
																			 }else if(pmarry[i].project_level==3000 && pson.project_state==2){
																				 if(pmarry[i].member_idx == member_idx){
																					 msg+='<div class="stats">';
																						 msg+='평가하기 <span class="print" rel="tooltip" title="평가하기"> ';
																							 msg+='<a class="btn btn-link" onclick="location.href=projectEvaluation.do?project_idx='+pson.project_idx+'&project_level='+pmarry[i].project_level+'&member_idx='+member_idx+'">';
																								 msg+='<i class="glyphicon glyphicon-check"></i>평가하기</a>';
																									 msg+='</span>';
																										 msg+='</div>';
																				 }
																			 }else if(pson.project_state==1){
																				 if(pmarry[i].member_idx == member_idx){
																					 msg+='<div class="stats">';
																						 msg+='<span class="print" rel="tooltip" title="진행중">';
																							 msg+='<a href="#" class="btn btn-link"	style="color: red;">';
																								 msg+='<i class="glyphicon glyphicon-time"></i>진행중</a>';
																									 msg+='</span>';
																										 msg+='</div>';
																				 }
																			 }
																		 }
											
													msg+='</div>';
													msg+='</div>';
													msg+='</div>';
											msg+='<div class="footer">';
											msg+='<button class="btn btn-simple" rel="tooltip"';
												msg+='title="되돌아가기" onclick="rotateCard(this)">';
													msg+='<i class="fa fa-reply"></i> Back';
														msg+='</button>';
											msg+='</div> ';
											
										msg+='뒷화면</div>';
										//<!-- end back panel -->
										
										msg+='</div>';
									//<!-- end card -->
									msg+='</div>';
								//<!-- end card-container -->
								msg+='</div>';
							//<!-- end col sm 3 -->

							msg+='<div class="space-400"></div>';
								msg+='</div>';
									msg+='</div>';
							msg+='</div>';//컨테이너-end
							
					
				
				    
				    
					divNode.innerHTML=msg;
					cNode.appendChild(divNode);
		
				}
				// history.go(0);
				/* location.reload(); */
				closem();
			}
		}
	}
//프로젝트 업데이트
var updateProject_me=0;
var myLevel=0;
function updateP(){
	var pname = document.changeProject.project_name.value;
	var pcontent = document.changeProject.project_content.value;
	var pidx= document.changeProject.project_idx.value;
		
	var param = 'project_name=' + pname;
		param += '&project_content=' + pcontent;
		param +='&project_idx='+pidx;
	var parentD = document.getElementById('project_Member2');

	var childD = parentD.firstChild;
	var lastC = parentD.lastChild;
	var msg = '';
	var msg2 = '';
	
	var count=0;
	var pm_exist=0;
	
	while (true) {
		
		if(childD.nodeName=='DIV'){
			
			var idx=childD.getAttribute('id');
			if(count==0){
				msg+=idx.substring(14);
				msg2+=$('#select2'+idx.substring(14)).val();
				count++;
			}else{
				msg+=','+idx.substring(14);
				msg2+=','+$('#select2'+idx.substring(14)).val();	
			}
			
			if(idx.substring(14)==member_idx){
				updateProject_me++;
				myLevel=$('#select2'+idx.substring(14)).val();
			}
			if($('#select2'+idx.substring(14)).val()==3000){
				pm_exist++;
			}
			
		}
		if(childD==lastC)break;
		childD = childD.nextSibling;
	}

	var my_idx = member_idx;
	param += '&project_member='+ msg;
	param += '&level=' + msg2;
	
	if(pm_exist==0){
		window.alert('프로젝트 책임자가 없습니다.');
	}else{
		sendRequest('projectUpdate.do', param, updatePResult, 'POST');
	}
}
function updatePResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var objData=eval('('+result+')');
			var pson=objData.pson;
			if(pson.project_idx==0){
				window.alert('오류 발생!');
			}else{
				if(updateProject_me==0){
					$('#project_div'+pson.project_idx).remove();
					updateProject_me=0;
					closem();
					return;
				}
				updateProject_me=0;
				var p_name=document.getElementById('pn'+pson.project_idx);
				document.getElementById('pc'+pson.project_idx).innerHTML=pson.project_content;
				if(myLevel!='3000'){
					p_name.innerHTML=pson.project_name;	
				}else{
					p_name.innerHTML=pson.project_name+'<span onclick="projectUpdate('+pson.project_idx+','+pson.project_name+','+pson.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span>';
					
				}
				myLevel=0;
			}
			location.reload();
			closem();
		}
	}
	
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function allowDrop(ev) {
    ev.preventDefault();
}

//프로젝트 생성 시 멤버 추가 드랍
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var comp=document.getElementById(data);
    	
    	var select=document.getElementById('select'+data.substring(13));
    	if(select==null){
    		var spanNode=document.createElement('span');
	   		var msg='<select id="select'+data.substring(13)+'" value="2000"><option value="1000">읽기만</option>';
			msg += '<option value="2000" selected="selected">프로젝트 멤버</option>';
			msg += '<option value="3000">프로젝트 책임자</option></select>';
			
			spanNode.innerHTML=msg;
	    	comp.appendChild(spanNode);
    	}
    	document.getElementById('project_Member').appendChild(comp);
    }
}
//프로젝트 생성 시 멤버 빼기 드랍
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var nofriend=document.getElementById('plus'+data.substring(13));
    	
    	var select=document.getElementById('select'+data.substring(13));
    	var comp=document.getElementById(data);
    	
    	if(select!=null){
    		var select=select.parentNode;	
	    	comp.removeChild(select);
    	}
    	
    	if(nofriend==null){
	    	document.getElementById('myFriend_List').appendChild(comp);
    	}else{
    		document.getElementById('member_search_content').appendChild(comp);
    	}
    }
}
//프로젝트 수정 시 멤버 추가 드랍
function drop3(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal2_content')){
    	var comp=document.getElementById(data);
    	
    	var select=document.getElementById('select2'+data.substring(14));
    	if(select==null){
    		var spanNode=document.createElement('span');
	   		var msg='<select id="select2'+data.substring(14)+'"><option value="1000">읽기만</option>';
			msg += '<option value="2000">프로젝트 멤버</option>';
			msg += '<option value="3000">프로젝트 책임자</option></select>';
			
			spanNode.innerHTML=msg;
	    	comp.appendChild(spanNode);
    	}
    	document.getElementById('project_Member2').appendChild(comp);
    }
}
//프로젝트 수정 시 멤버 빼기 드랍
function drop4(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal2_content')){
    	var nofriend=document.getElementById('plus'+data.substring(14));
    	
    	var select=document.getElementById('select2'+data.substring(14));
    	var comp=document.getElementById(data);
    	
    	if(select!=null){
    		var select=select.parentNode;	
	    	comp.removeChild(select);
    	}
    	
    	if(nofriend==null){
	    	document.getElementById('myFriend_List2').appendChild(comp);
    	}else{
    		document.getElementById('member_search_content2').appendChild(comp);
    	}
    }
}
/**카드회전*/
$().ready(function(){
    $('[rel="tooltip"]').tooltip();

});

function rotateCard(btn){
    var $card = $(btn).closest('.card-container');
    console.log($card);
    if($card.hasClass('hover')){
        $card.removeClass('hover');
    } else {
        $card.addClass('hover');
    }
}