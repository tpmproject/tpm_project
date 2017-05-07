

 	window.onload = function() {
		$(main_modal).hide();
		$(smodal).hide();
		$('.slimdiv').mCustomScrollbar({axis:"yx"});
		$('.pm_scroll').mCustomScrollbar({axis:"yx"});
		
	switch (skin) {
		case 'black': case 'black-light':skin='#fff'; break;
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
 	
 	function car(i){
 		
 		$('#carousel-example-generic').carousel(i);
 		
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
	function projectUpdate(idx){
		var name=$('#pn'+idx).html();
		var content=$('#pc'+idx).html();
		
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
					//캐러셀 이전 페이지로 이동
					$('#carousel-example-generic').carousel('prev');
					var delp=$('#project_div'+pson.project_idx).parent();
					//1초뒤 삭제
					setTimeout(function(){delp.remove();},1000);
					
				}
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
		if(aou==1){
			param += '&member_id=' + document.newProject.member_id.value;
		}else{
			param += '&member_id=' + document.changeProject.member_id.value;
		}
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
			if(childD==null)break;
			
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
					
					var msg='<div id="project_div'+pson.project_idx+'" align="center" style="margin-top: 15px;">';
					msg+='<div class="card-container manual-flip" style="max-width: 500px;">';
					msg+='<div class="card"><div class="front"><div class="cover" style="background:'+skin+';"></div>';
					msg+='<div class="content"><div class="main"><input type="hidden" id="p_idx'+pson.project_idx+'" value="'+pson.project_idx+'">';
					msg+='<h3><a id="pn'+pson.project_idx+'" style="text-align: center;color:black; ">';
					msg+=pson.project_name+'</a><i id="ps'+pson.project_idx+'" class="glyphicon glyphicon-flag" style="color:#3c8dbc;"></i></h3>';
					msg+='<p class="profession">TPM Project</p><p class="text-center">';
					msg+='<span id="pc'+pson.project_idx+'">'+pson.project_content+'</span></p></div>';
					msg+='<div class="footer"><button class="btn btn-simple" onclick="rotateCard(this)"><i class="fa fa-mail-forward"></i>&nbsp; 프로젝트 확인</button>';
					msg+='</div></div></div>';

					msg+='<div class="back"><div class="header">';
					msg+='<div style="float: right;"><span rel="tooltip" title="수정" onclick="projectUpdate('+pson.project_idx+')">';
					msg+='<i class="glyphicon glyphicon-cog" style="margin-bottom: 0px;"></i></span>';
					msg+='<span rel="tooltip" title="삭제" onclick="projectDelete('+pson.project_idx+')">';
					msg+='<i class="glyphicon glyphicon-remove" style="margin-bottom: 0px;"></i></span></div>';
					msg+='<h5 class="motto">"프로젝트는 우리의 미래입니다."</h5><h4 class="text-center" id="apn'+pson.project_idx+'">'+pson.project_name+'</h4></div>';
					msg+='<div class="content"><div class="main"><div id="pm_div'+pson.project_idx+'" style="height: 180px;">';
													
//					<c:forEach var="pm_dto"	items="${i.project_member_dtos}">
					for(var i=0;i<pson.member_dtos.length;i++){
						var temp=pson.member_dtos[i];
					msg+='<h5 class="text-center" id="pmlist">'+temp.member_id+'</h5>';
					}
					msg+='</div><hr>';
					msg+='<div class="stats-container"><div class="stats" align="center" rel="tooltip" title="업무확인">';
					msg+='<a class="btn btn-link" href="projectContent.do?project_idx='+pson.project_idx+'&member_idx='+member_idx+'">';
					msg+='<i class="fa fa-clone left"></i>업무확인</a></div>';
					msg+='<div class="stats" id="stats'+pson.project_idx+'"><span class="print" rel="tooltip" title="평가를 원하시면 클릭하세요!">';
					msg+='<a onclick="proState('+pson.project_idx+',3000)" class="btn btn-link" style="color: #3c8dbc;"><i class="glyphicon glyphicon-time"></i>진행중</a></span>';
					msg+='</div></div><div class="stats" style="padding-top: 6px;">';
					msg+='<span><a rel="tooltip" title="되돌아가기" onclick="rotateCard(this)" style="color: gray;font-size: large;">';
					msg+='<i class="fa fa-reply"></i> Back</a></span></div></div></div></div></div></div></div><div class="space-400"></div></div></div>';
					 
					divNode.innerHTML=msg;
					var pit=document.getElementById('pitem');
					cNode.insertBefore(divNode,pit);
		
				}
				// history.go(0);
				/* location.reload(); */
				$('#carousel-example-generic').carousel('prev');
				/*setTimeout(function(){$('#pitem').remove();},1000);*/
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
	var msg3='';
	var count=0;
	var pm_exist=0;
	
	while (true) {
		
		if(childD.nodeName=='DIV'){
			
			var idx=childD.getAttribute('id');
			if(count==0){
				msg+=idx.substring(14);
				msg2+=$('#select2'+idx.substring(14)).val();
				msg3+=$('#modal2_content'+idx.substring(14)).children(":contains('@')").html();
				count++;
			}else{
				msg+=','+idx.substring(14);
				msg2+=','+$('#select2'+idx.substring(14)).val();
				msg3+=','+$('#modal2_content'+idx.substring(14)).children(":contains('@')").html();	
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
	param += '&member_id='+msg3;
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
				
				updateProject_me=0;
				$('#pn'+pson.project_idx).html(pson.project_name);
				$('#apn'+pson.project_idx).html(pson.project_name);
				$('#pc'+pson.project_idx).html(pson.project_content);
				/**멤버리스트*/
				var p_mlist=pson.member_id.split(',');
				var msg='';
				for(var i=0;i<p_mlist.length;i++){
					
					msg+='<h5 class="text-center" id="pmlst">'+p_mlist[i]+"</h5>";
				}
				
				$('#pm_div'+pson.project_idx).html(msg);
				$('#pm_div'+pson.project_idx).mCustomScrollbar({axis:"yx"});
				
				myLevel=0;
			}
			
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

function proState(p_idx,p_level){
	p_level=parseInt(p_level);
	if(p_level==3000){
		var param='project_idx='+p_idx;
		sendRequest('projectStateUp.do',param,proStateResult,'POST');
	}
}
function proStateResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText;
			var p_idx=eval('('+result+')');
			if(p_idx<=0){
				window.alert('오류 발생');
			}else{
				$('#ps'+p_idx).css('color','#f39c12');
				
				var msg='<span class="print" rel="tooltip" title="평가하기">';
				msg+='<a onclick="location.href=\'projectEvaluation.do?project_idx='+p_idx+'&project_level=3000&member_idx='+member_idx+'\'"';
				msg+='class="btn btn-link" style="color: #f39c12"><i class="glyphicon glyphicon-check"></i>평가하기</a></span>';
				$('#stats'+p_idx).html(msg);
				
			}
		}
	}
	
}