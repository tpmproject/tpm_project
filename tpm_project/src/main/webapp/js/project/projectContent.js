window.onload=function(){
	
	$('[data-toggle="popover"]').popover();
	$('.content').mCustomScrollbar({axis:"yx"});
	
	connect(project_idx);
	var hei=window.innerHeight-130;
	$('.content.mCustomScrollbar._mCS_1').css('height',hei+'px');
	
	$('#loading_div').hide();
	categoryHead(skin);
	$('#load_s').hide();
}

function categoryHead(skin){
	switch (skin) {
		case 'white': case 'white-light':skin_color='#fff'; break;
		case 'blue': case 'blue-light':skin_color='#3c8dbc'; break;
		case 'green': case 'green-light':skin_color='#00a65a'; break;
		case 'purple': case 'purple-light':skin_color='#605ca8'; break;
		case 'red': case 'red-light':skin_color='#dd4b39'; break;
		case 'yellow': case 'yellow-light':skin_color='#f39c12'; break;
	}
	$('.category_head').css('background',skin_color);
}
function tenChart(e,s,t,j,i,n,f,p){
	var chart = AmCharts.makeChart( "chartdiv", {
	    "type": "radar",
	    "theme": "light",
	    "dataProvider": [ 
	     	{ "tendency": "외향적", "point": e },
	        { "tendency": "감각적", "point": s },
	        { "tendency": "사고적", "point": t },
	        { "tendency": "판단적", "point": j },
	        { "tendency": "내향적", "point": i },
	        { "tendency": "직관적", "point": n },
	        { "tendency": "감정적", "point": f },
	        { "tendency": "인식적", "point": p } ],
	    "valueAxes": [
	    	{ "axisTitleOffset": 20, "minimum": 0, "axisAlpha": 0.15 } ],
	    "startDuration": 2,
	    "graphs": [
	    	{ "balloonText": "[[value]]",
	      	  "bullet": "round",
	      	  "lineThickness": 2,
	      	  "valueField": "point" } ] ,
 			  "categoryField": "tendency" }) ;
}
function utenChart(e,s,t,j,i,n,f,p){
	var chart = AmCharts.makeChart( "chartdiv2", {
	    "type": "radar",
	    "theme": "light",
	    "dataProvider": [ 
	     	{ "tendency": "외향적", "point": e },
	        { "tendency": "감각적", "point": s },
	        { "tendency": "사고적", "point": t },
	        { "tendency": "판단적", "point": j },
	        { "tendency": "내향적", "point": i },
	        { "tendency": "직관적", "point": n },
	        { "tendency": "감정적", "point": f },
	        { "tendency": "인식적", "point": p } ],
	    "valueAxes": [
	    	{ "axisTitleOffset": 20, "minimum": 0, "axisAlpha": 0.15 } ],
	    "startDuration": 2,
	    "graphs": [
	    	{ "balloonText": "[[value]]",
	      	  "bullet": "round",
	      	  "lineThickness": 2,
	      	  "valueField": "point" } ] ,
 			  "categoryField": "tendency" }) ;
}
//ws 응답시 @overriding
function onMessage(evt) {
	var unsplit_data = evt.data;
	var data=unsplit_data.split(',');
	//work_state 변경시
	if(data[0]=='work'){
		var work_idx=data[1];
		if(data[2]=='work_state'){
			var ws=data[3];
			ws=parseInt(ws);
			
			changeWorkState(work_idx,ws);
		}
		return;
	}
	//카테고리 더할 때
	if(data[0]=='categoryAdd'){
		var idx=data[1];
		var name=data[2];
		ws_categoryAdd(idx,name);
		
		var wid=$('#mCSB_1_container').css('width');
		wid=parseInt(wid)+220;
		$('#mCSB_1_container').css('width',wid+'px');
		return;
	}
	//카테고리 이름 수정
	if(data[0]=='categoryName'){
		var idx=data[1];
		var name=data[2];
		ws_categoryUpdate(idx,name);
		return;
	}
	//카테고리 삭제
	if(data[0]=='categoryDel'){
		var idx=data[1];
		
		$('#cp'+idx).remove();
		var wid=$('#mCSB_1_container').css('width');
		wid=parseInt(wid)-220;
		$('#mCSB_1_container').css('width',wid+'px');
		return;
	}
	//checklist add
	if(data[0]=='checkAdd'){
		var wi=data[1];
		var chc=data[2];
		var chi=data[3];
		
		ws_addCheckResult(wi,chc,chi);
	}
	//checklist check
	if(data[0]=='check'){
		var idx=data[1];
		ws_checkResult(idx);
	}
	//checklist del
	if(data[0]=='checkDel'){
		ws_checkDel(data[1]);
	}
	//업무 생성
	if(data[0]=='workAdd'){
		var work_idx=data[1];
		var category_idx=data[2];
//		var project_idx=date[3]
		var work_title=data[3];
		var work_start=data[4];
		var work_end=data[5];
		var work_confirm=data[6];
		var work_state=data[7];
		var member=data[8];	
		ws_workAdd(work_idx, category_idx, work_title, work_start, work_end, work_confirm, work_state, member);
	}
	//업무 수정
	if(data[0]=='wUpdate'){
		var work_idx=data[1];
		var category_idx=data[2];
		var work_title=data[3];
		var work_start=data[4];
		var work_end=data[5];
		var work_confirm=data[6];
		var work_state=data[7];
		var member=data[8];	
		ws_workUpdate(work_idx, category_idx, work_title, work_start, work_end, work_confirm, work_state, member);
		return
	}
	//업무 삭제
	if(data[0]=='workDel'){
		var idx=data[1];
		
		$('#w'+idx).remove();
	//	$('#w'+idx).style.display='none';
		return;
	}
	//코멘트 추가
	if(data[0]=='commentAdd'){
		var member_img = data[1];
		var comment_date = data[2];
		var member_name = data[3];
		var member_id = data[4];
		var comment_idx = data[5];
		var comment_content = data[6];
		
		ws_commentAdd(member_img, comment_date, member_name, member_id, comment_idx, comment_content);
	}
	
	//코멘트 수정
	if(data[0]=='commentUpdate'){
		var comment_idx = data[1];
		var comment_content = data[2];
		//var comment_date = data[3];
		
		ws_commentUpdate(comment_idx, comment_content);
	}
	
	//코멘트 삭제
	if(data[0]=='commentDel'){
		var comment_idx = data[1];
		
		ws_commentDel(comment_idx);
	}
}

function cateName(idx){
	$('#cate'+idx).show();
	$('#a_cate'+idx).hide();
}
function cateNameRe(idx){
	$('#cate'+idx).hide();
	$('#a_cate'+idx).show();
	var ac=document.getElementById('aa_cate'+idx);
	$('#cateIn'+idx).val(ac.innerHTML);
	
}
function categoryUpdate(idx){
	
	var param='project_idx='+project_idx+'&category_idx='+idx;
	var di=$('#cateIn'+idx).val();

	document.getElementById('cateIn'+idx).value=di;
	param+='&category_name='+di;
	sendRequest('categoryUpdate.do', param, categoryUpdateResult, 'POST');
}
function categoryUpdateResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result); //cate_idx
			
			var catename=$('#cateIn'+result).val();
			
			updateWS('categoryName,'+result+','+catename);
			
		}
	}
}
function ws_categoryUpdate(idx,name){
	
	document.getElementById('aa_cate'+idx).innerHTML=name;
	$('#cateIn'+idx).val(name);
	$('#cate'+idx).hide();
	$('#a_cate'+idx).show();
}
function categoryAdd() {
	var param = 'project_idx=' + project_idx
	+'&category_name=' + document.newCategory.category_name.value;
	sendRequest('categoryAdd.do', param, categoryAddResult, 'POST');
}
function categoryAddResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			if (result != null) {
				var chData=eval('('+result+')');
				var cate=chData.category;
				var idx=cate.category_idx;
				var name=cate.category_name;
				
				updateWS('categoryAdd,'+idx+','+name);
			}
		}
	}
}

function ws_categoryAdd(idx,name){
	
		var cbodyNode = document.getElementById('cbody');
		var cateNode = document.getElementById('addCate');
		var dNode = document.createElement('div');

		dNode.setAttribute('class','category');
		dNode.setAttribute('id','cp'+idx);
		
		var innerH='<div class="category_head" style="background:'+skin_color+';" id ="c'+idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';			
		innerH+='<form name="cateUp" action="javascript:categoryUpdate('+idx+')">';
		innerH+='<div id="cate'+idx+'" class="cateName">';
		innerH+='<input id="cateIn'+idx+'" type="text" value="'+name+'" size="16px">&nbsp;&nbsp;';
		innerH+='<i class="glyphicon glyphicon-remove" onclick="cateNameRe('+idx+')"></i></div>';
		innerH+='<div id="a_cate'+idx+'"><a id="aa_cate'+idx+'" href="javascript:cateName('+idx+')">'+name+'</a>&nbsp;&nbsp;';
		innerH+='<i class="glyphicon glyphicon-plus" onclick="showf('+idx+')"></i></div></form></div>';
		
		dNode.innerHTML=innerH;
		cbodyNode.insertBefore(dNode,cateNode);
		cbodyNode.style.width = parseInt(cbodyNode.style.width)+220+"px";
		document.newCategory.category_name.value='';
	
}
//업무추가
function showf(category_idx){
	var wid=(window.innerWidth/2)-320;
	$('#work_modal').css('left',wid+'px');
	$('#workdate').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
	
	$(workback).fadeIn('150');
	$(work_modal).fadeIn('150');
	$(w_modal).show();
	$(btnwork2).hide();
	document.getElementById('work_m').innerHTML='';
	document.newWork.category_idx.value=category_idx;
}
function showf2() {
	$(w_modal2).show();
	$(btnwork4).hide();
}
function workUpdate(work_idx,work_start,work_end,work_confirm){
	/*$('div').remove('.daterangepicker.dropdown-menu.opensleft');*/
	
	var startDate = work_start.split(' ',3);
	var endDate = work_end.split(' ',3);
	
	$('#workdateup').daterangepicker({
		timePicker: true
		, timePickerIncrement: 30
		, format: 'YYYY/MM/DD h:mm A'
		, "startDate"  : startDate[0]
		, "endDate" : endDate[0]
	});
	
	var wid=(window.innerWidth/2)-320;
	$('#work_modal2').css('left',wid+'px');
	
	$(workback2).fadeIn('150');
	$(work_modal2).fadeIn('150');
	$(w_modal2).show();
	$(btnwork4).hide();
	
	var wdiv=document.getElementById('wdiv'+work_idx);
	var fc=wdiv.firstChild;
	while(fc.nodeName!='SPAN'){
		fc=fc.nextSibling;
	}
	work_title=fc.innerHTML;
	document.changeWork.work_idx.value=work_idx;
	document.changeWork.work_title.value=work_title;
	document.changeWork.workdateup.value=work_start+"-"+work_end;
	if(work_confirm==10){
		$("#wf").attr('checked', 'checked') ;
		//document.changeWork.work_confirm.setAttribute('checked','checked');
	}else if(work_confirm==20){
		$("#wf").removeAttr('checked') ;
		//document.changeWork.work_confirm.setAttribute('checked','');
	}
}
function shows(){
	var wtit=document.newWork.work_title.value;
	var wsta=document.newWork.workdate.value;
	
	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		showf();
		return;
	}
	
	$(w_modal).fadeOut();
	$(btnwork2).fadeIn();
	hideTen();	
	sendRequest('workAdd.do?project_idx='+project_idx,null,showsResult,'GET');
	
}
function shows2(){
	var wtit=document.changeWork.work_title.value;
	var wsta=document.changeWork.workdateup.value;
	
 	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		return;
	}
	
	$(w_modal2).hide();
	$(btnwork4).show();
	hideTen();	
	var w=document.changeWork.work_idx.value;
	sendRequest('workUpdate.do?project_idx='+project_idx+'&work_idx='+w+'&member_idx='+member_idx,null,shows2Result,'GET');
	
}
function showsResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				msg2 += '<div id="work_member'+member.member_idx+'"onmouseover="showTen('+member.member_idx+')" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
			}
			var project_m = document.getElementById('project_m');
			project_m.innerHTML = msg2;		
		}
	}
}
function shows2Result(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var json = JSON.parse(result);	
			var w_msg='';
			var p_msg='';
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				
				msg2 += '<div id="work2_member'+member.member_idx+'"onmouseover="showTen2('+member.member_idx+')" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
				
				if(member.pm==1){
					w_msg+=msg2;
				}else{
					p_msg+=msg2;
				}
				msg2='';
			}
			
			var w_List=document.getElementById('work_m2');
			w_List.innerHTML = w_msg;
			var p_List=document.getElementById('project_m2');
			p_List.innerHTML=p_msg;	
		}
	}
}
function closem() {
	$(workback).fadeOut('100');
	$(workback2).fadeOut('100');
	$(work_modal).fadeOut('100');
	$(work_modal2).fadeOut('100');
	hideTen();	
	document.newWork.reset();
	document.changeWork.reset();
	document.getElementById('work_m').innerHTML='';
}
function addWork(){

 	var work_member=document.getElementById('work_m');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.newWork.work_confirm.checked==true){
		document.newWork.work_confirm.value='10';
	}else{
		document.newWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(11);
				count++;
			}else{
			msg+=','+idx.substring(11);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}

	var param = 'category_idx=' + document.newWork.category_idx.value
	+'&work_title=' + document.newWork.work_title.value
	+'&workdate=' + document.newWork.workdate.value 
	+'&work_confirm=' + document.newWork.work_confirm.value
	+'&member_idx=' + msg;
	
	sendRequest('workAdd.do', param, addWorkResult, 'POST');

}
function addWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			if (result != null) {
				var work=eval('('+result+')');
				var work_idx=work.work_idx;
				var category_idx=work.category_idx;
//				var project_idx=project_idx;
				var work_title=work.work_title;
				var seDate=work.project_name.split("&");
				var work_start=seDate[0];
				var work_end=seDate[1];
				var work_confirm=work.work_confirm;
				var work_state=1;
				var member="";
				for(var i = 0; i < work.workmember_wdto.length; i++){
					member+=work.workmember_wdto[i].member_name+'&nbsp';
				}
				updateWS('workAdd,'+work_idx+','+category_idx+','+work_title+','+work_start+','+work_end+','+work_confirm+','+work_state+','+member);
			}	
		}
	}
}
function ws_workAdd(work_idx, category_idx, work_title, work_start, work_end, work_confirm, work_state, member){
		
	var cNode = document.getElementById('cp'+category_idx);
	var dNode = document.createElement('div');
/*	var msg='<div id="w'+work_idx+'"class="panel panel-info">';
	msg+='<div id="wdiv'+work_idx+'" class="wdiv panel-heading" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';		
	msg+='<i id="showWork'+work_idx+'"></i>';
	msg+='&nbsp;<span id="wt'+work_idx+'" onclick="showWorkTable('+work_idx+')">'+work_title+'</span>';
	msg+='<c:set var="wstart"><f:formatDate value="'+work_start+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
	msg+='<c:set var="wend"><f:formatDate value="'+work_end+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
	msg+='<span onclick="workUpdate('+work_idx+','+work_start+','+work_end+','+work_confirm+')"><i class="glyphicon glyphicon-cog"></i></span></div>';
	msg+='<table id="workTable${wdto.work_idx}" class="cate_table">';
	msg+='<tbody><tr><td id="wd'+work_idx+'" colspan="2"><div class="table_i glyphicon glyphicon-calendar"></div>&nbsp;'+work_start+'<br>';
	msg+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	msg+='~'+work_end+'</td></tr>';
	msg+='<tr><td id="wm'+work_idx+'"colspan="2"><div class="table_i glyphicon glyphicon-user"></div>';
	msg+='<span>'+member+'</span>&nbsp';
	msg+='</td></tr>';
	msg+='<tr><td colspan="2"><form action="javascript:addCheck('+work_idx+')">';
	msg+='<div class="table_i glyphicon glyphicon-check" onclick="showChecklist('+work_idx+')"></div>';
	msg+='<input type="text" id="content'+work_idx+'" placeholder="체크리스트" style="width: 60%;" required="required">';
	msg+='&nbsp;<i class="glyphicon glyphicon-plus" onclick="addCheck('+work_idx+')"></i>';
	msg+='</form></td></tr><tr><td colspan="2"><div class="scr">';
	msg+='<div class="check_div" id="check_div'+work_idx+'">';
	msg+='</div></div></td></tr><tr>';
	msg+='<td colspan="2" align="right"><a id="aCheck'+work_idx+'"href="javascript:showCheck('+work_idx+')">완료한 체크리스트보기</a>&nbsp;</td>';
	msg+='</tr><tr><td colspan="2"><div class="progress" style="margin-bottom: 2px; height: 12px;">';
	msg+='<div id="chBar${wdto.work_idx}" class="progress-bar progress-bar-primary " style="width: ${chChecked/chTotal * 100}%;"></div></div>';
	msg+='</td></tr><tr><td><div class="work_btn" id="workState'+work_idx+'">';
	msg+='<i name="1" class="glyphicon glyphicon-play-circle" style="color:#367fa9;" data-toggle="tooltip" data-placement="bottom" title="업무 진행 중" onclick="workDone('+work_idx+',1)"></i>';
	if(work_confirm==10){
		msg+='<i name="2" class="glyphicon glyphicon-record" data-toggle="tooltip" data-placement="bottom" title="결재 대기"} onclick="workDone('+work_idx+',2)"></i>';
	}
	msg+='<i name="3" class="glyphicon glyphicon-ok-circle" data-toggle="tooltip" data-placement="bottom" title="완료된 업무" onclick="workDone('+work_idx+',3)"></i></div></td>';
	msg+='<td align="right"><a href="#" onclick="workSide('+work_idx+','+work_title+')" class="menu-toggle">코멘트/파일</a></td>';
	msg+='</tr></tbody></table></div></div></div>';*/
	var msg='';
	if(work_state==1){
		msg+='<div id="w'+work_idx+'" class="panel panel-info">';
	}else if(work_state==2){
		msg+='<div id="w'+work_idx+'" class="panel panel-warning">';
	}else if(work_state==3){
		msg+='<div id="w'+work_idx+'" class="panel panel-success">';
	}
	msg+='	<div id="wdiv'+work_idx+'" class="wdiv panel-heading"';
	msg+='		draggable="true" ondragover="allowDrop(event)"';
	msg+='		ondragstart="drag(event)">';
	msg+='		<i id="showWork'+work_idx+'"';
	if(work_state==3){
		msg+='			class="glyphicon glyphicon-menu-right"></i>';
	}else{
		msg+='			class="glyphicon glyphicon-menu-down"></i>';
	}
	msg+='		&nbsp;<span id="wt'+work_idx+'"';
	msg+='			onclick="showWorkTable('+work_idx+')">'+work_title+'</span>';
	msg+='		<c:set var="wstart"><f:formatDate value="'+work_start+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
	msg+='		<c:set var="wend"><f:formatDate value="'+work_end+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
//	if(project_level!=1000){
		msg+='			<span';
		msg+='				onclick="workUpdate('+work_idx+',\''+work_start+'\',\''+work_end+'\',\''+work_confirm+'\')">';
		msg+='				<i class="glyphicon glyphicon-cog"></i>';
		msg+='			</span>';
//	}
	msg+='	</div>';
	msg+='	<div class="panel-body" style="padding: 0px;">';
	msg+='		<table id="workTable'+work_idx+'" class="cate_table"';
	if(work_state==3){
		msg+='			style="display:none;">';
	}
	msg+='			<tbody>';
	msg+='				<tr>';
	msg+='					<td id="wd'+work_idx+'" colspan="2">';
	msg+='						<div class="table_i glyphicon glyphicon-calendar"></div>&nbsp;';
	msg+='						<span>'+work_start+'<br>';
	msg+='						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	msg+='						~'+work_end+'</span>';
	msg+='					</td>';
	msg+='				</tr>';
	msg+='				<tr>';
	msg+='					<td colspan="2">';
	msg+='						<div class="table_i glyphicon glyphicon-user"></div>';
	msg+='						<span id="wm'+work_idx+'">'+member+'</span>&nbsp';
	msg+='					</td>';
	msg+='				</tr>';
	msg+='				<tr>';
	msg+='					<td colspan="2">';
	msg+='						<form action="javascript:addCheck('+work_idx+')">';
	msg+='							<div class="table_i glyphicon glyphicon-check"';
	msg+='								onclick="showChecklist('+work_idx+')"></div>';
//	if(project_level!=1000){
		msg+='									<input type="text" id="content'+work_idx+'"';
		msg+='										placeholder="체크리스트" style="width: 60%;" required="required">';
		msg+='															&nbsp;<i class="glyphicon glyphicon-plus"';
		msg+='										onclick="addCheck('+work_idx+')"></i>';
//	}else{
//		msg+='									<span>체크리스트</span>';
//	}
	msg+='						</form>';
	msg+='					</td>';
	msg+='				</tr>';
	msg+='				<tr>';
	msg+='					<td colspan="2">';
	msg+='						<div class="scr">';
	msg+='							<div class="check_div" id="check_div'+work_idx+'">';
//	msg+='								<c:set var="chTotal" value="0"></c:set>';
//	msg+='								<c:set var="chChecked" value="0"></c:set>';
//	msg+='								<c:forEach var="chdto" items="${wdto.checklist_dtos}"';
//	msg+='									varStatus="status">';
//	msg+='									<div id="div_ch${chdto.checklist_idx }"';
//	msg+='										style="display:${chdto.checklist_state eq '1' ? 'none' : 'block' }"';
//	msg+='										draggable="true" ondragover="allowDrop(event)"';
//	msg+='										ondragstart="drag(event)">';
//	msg+='										<c:choose>';
//	msg+='											<c:when test="${pdto.project_level != 1000 }">';
//	msg+='												<a onclick="javascript:check(${chdto.checklist_idx })">';
//	msg+='											</c:when>';
//	msg+='											<c:otherwise>';
//	msg+='												<a>';
//	msg+='											</c:otherwise>';
//	msg+='										</c:choose>';
//	msg+='										<i id="ch${chdto.checklist_idx }"';
//	msg+='											class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">';
//	msg+='										</i> ${chdto.checklist_content} </a> <input type="hidden"';
//	msg+='											id="ch_state${chdto.checklist_idx}"';
//	msg+='											value="${chdto.checklist_state}">';
//	msg+='									</div>';
//	msg+='									<c:if test="${status.last}">';
//	msg+='										<c:set var="chTotal" value="${status.count}"></c:set>';
//	msg+='									</c:if>';
//	msg+='									<c:if test="${chdto.checklist_state eq '1'}">';
//	msg+='										<c:set var="chChecked" value="${chChecked+1}"></c:set>';
//	msg+='									</c:if>';
//	msg+='								</c:forEach>';
	msg+='								<input type="hidden" id="checkHide'+work_idx+'" value="0">';
	msg+='							</div>';
	msg+='						</div>';
	msg+='					</td>';
	msg+='				</tr>';
	msg+='				<tr>';
	msg+='					<td colspan="2" align="right"><a id="aCheck'+work_idx+'"';
	msg+='						href="javascript:showCheck('+work_idx+')">완료한 체크리스트 보기</a>&nbsp;</td>';
	msg+='				</tr>';
	msg+='				<tr>';
	msg+='					<td colspan="2">';
	msg+='						<div class="progress" style="margin-bottom: 2px; height: 12px;">';
	msg+='							<div id="chBar'+work_idx+'"';
	msg+='								class="progress-bar progress-bar-primary "';
	msg+='								style="width: ${chChecked/chTotal * 100}%;"></div>';
	msg+='						</div> <input type="hidden" id="chTotal'+work_idx+'"';
	msg+='						value="0"> <input type="hidden"';
	msg+='						id="chChecked'+work_idx+'" value="0">';
	msg+='					</td>';
	msg+='				</tr>';
//	msg+='				<c:remove var="chTotal" />';
//	msg+='				<c:remove var="chChecked" />;
	msg+='				<tr>';
	msg+='					<td id="wstate'+work_idx+'"><div class="work_btn" id="workState'+work_idx+'">';
	msg+='							<i name="1" class="glyphicon glyphicon-play-circle"';
	if(work_state==1){
		msg+='style="color:#367fa9;"';
	}
	msg+='								data-toggle="tooltip" data-placement="bottom" title="업무 진행 중"';
	msg+='								onclick="workDone('+work_idx+',1)"></i>';
	if(work_confirm==10){
		msg+='								<i name="2" class="glyphicon glyphicon-record"';
		if(work_state==2){
			msg+='style="color:#f0ad4e;" data-toggle="tooltip" data-placement="bottom" title="결재 대기"';
		}else{
			msg+='data-toggle="tooltip" data-placement="bottom" title="결재 요청"';
		}
		msg+='									onclick="workDone('+work_idx+',2)"></i>';
	}
	msg+='							<i name="3" class="glyphicon glyphicon-ok-circle"';
	if(work_state==3){
		msg+='style="color:green;"';
	}
	msg+='								data-toggle="tooltip" data-placement="bottom" title="완료된 업무"';
	msg+='								onclick="workDone('+work_idx+',3)"></i>';
	msg+='						</div></td>';
	msg+='					<td align="right">';
	msg+=' 						<a href="#" onclick="workSide('+work_idx+',\''+work_title+'\')" class="menu-toggle">코멘트/파일</a>';
	msg+=' 					</td>';
	msg+='				</tr>';
	msg+='			</tbody>';
	msg+='		</table>';
	msg+='	</div>';
	msg+='</div>';
	
	dNode.innerHTML = msg;
	cNode.appendChild(dNode);
	closem();
	document.newWork.reset();
	

	$(".menu-toggle").click(function(e) {
	  e.preventDefault();
	  $("#sidebar-wrapper").toggleClass("active");
	});
}
function updateWork(){
 	var work_member=document.getElementById('work_m2');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.changeWork.work_confirm.checked==true){
		document.changeWork.work_confirm.value='10';
	}else{
		document.changeWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(12);
				count++;
			}else{
			msg+=','+idx.substring(12);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}
	
 	if (msg == null || msg == "") {
		window.alert('업무 멤버가 없습니다.');
		return;
	}

	var param = 'work_idx=' + document.changeWork.work_idx.value
	+'&project_idx=' + project_idx
	+'&work_title=' + document.changeWork.work_title.value
	+'&workdateup=' + document.changeWork.workdateup.value 
	+'&work_confirm=' + document.changeWork.work_confirm.value 
	+'&member_idx=' + msg;
	
	sendRequest('workUpdate.do', param, uWorkResult, 'POST');
}
function uWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			if (result != null) {
				var work=eval('('+result+')');
				var work_idx=work.work_idx;
				var category_idx=work.category_idx;
				var work_title=work.work_title;
				var seDate=work.project_name.split("&");
				var work_start=seDate[0];
				var work_end=seDate[1];
				var work_confirm=work.work_confirm;
				var work_state=work.work_state;
				var member="";
				for(var i = 0; i < work.workmember_wdto.length; i++){
					member+=work.workmember_wdto[i].member_name+'&nbsp';
				}
				updateWS('wUpdate,'+work_idx+','+category_idx+','+work_title+','+work_start+','+work_end+','+work_confirm+','+work_state+','+member);
			}	
		}	
	}
}
function ws_workUpdate(work_idx,category_idx,work_title,work_start,work_end,work_confirm,work_state,member){
	document.getElementById('wt'+work_idx).innerHTML=work_title;
	document.getElementById('wd'+work_idx).innerHTML=work_start+'~'+work_end;
	document.getElementById('wm'+work_idx).innerHTML=member;
	work_state=1;
	if(work_confirm==10){
		var cNode = document.getElementById('wstate'+work_idx);

		var msg='					<div class="work_btn" id="workState'+work_idx+'">';
		msg+='							<i name="1" class="glyphicon glyphicon-play-circle"';
		if(work_state==1){
			msg+='style="color:#367fa9;"';
		}
		msg+='								data-toggle="tooltip" data-placement="bottom" title="업무 진행 중"';
		msg+='								onclick="workDone('+work_idx+',1)"></i>';
		msg+='								<i name="2" class="glyphicon glyphicon-record"';
		if(work_state==2){
			msg+='style="color:#f0ad4e;" data-toggle="tooltip" data-placement="bottom" title="결재 대기"';
		}else{
			msg+='data-toggle="tooltip" data-placement="bottom" title="결재 요청"';
		}
		msg+='									onclick="workDone('+work_idx+',2)"></i>';
		msg+='							<i name="3" class="glyphicon glyphicon-ok-circle"';
		if(work_state==3){
			msg+='style="color:green;"';
		}
		msg+='								data-toggle="tooltip" data-placement="bottom" title="완료된 업무"';
		msg+='								onclick="workDone('+work_idx+',3)"></i>';
		msg+='						</div>';
		cNode.innerHTML = msg;

		//document.changeWork.work_confirm.setAttribute('checked','checked');
	}else if(work_confirm==20){

		$('#wf').removeAttr('checked');
		var cNode = document.getElementById('wstate'+work_idx);

		var msg='					<div class="work_btn" id="workState'+work_idx+'">';
		msg+='							<i name="1" class="glyphicon glyphicon-play-circle"';
		if(work_state==1){
			msg+='style="color:#367fa9;"';
		}
		msg+='								data-toggle="tooltip" data-placement="bottom" title="업무 진행 중"';
		msg+='								onclick="workDone('+work_idx+',1)"></i>';
		msg+='							<i name="3" class="glyphicon glyphicon-ok-circle"';
		if(work_state==3){
			msg+='style="color:green;"';
		}
		msg+='								data-toggle="tooltip" data-placement="bottom" title="완료된 업무"';
		msg+='								onclick="workDone('+work_idx+',3)"></i>';
		msg+='						</div>';
		cNode.innerHTML = msg;
		//document.changeWork.work_confirm.setAttribute('checked','');
	}
	closem();
}

function workDone(work_idx,work_state){
	var param="project_idx="+project_idx+"&work_idx="+work_idx+"&work_state="+work_state;
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');	
}
function updateWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			var wData=eval('('+result+')');
			var wi=wData.work_idx;
			
			if(wi==0){
				window.alert('권한이 없습니다.');
				return;
			}
			
			var ws=wData.work_state;
			ws=parseInt(ws);
			
			//ws
			msg=['work',wi,'work_state',ws];
			updateWS(msg);
			
		}
	}
}
function changeWorkState(wi,ws){
	var firstC=document.getElementById('workState'+wi).firstChild;
	var lastC=document.getElementById('workState'+wi).lastChild;
	do{
		if(firstC.nodeName=='I'){
			var wsColor='black';
			
			if(firstC.getAttribute('name')==ws){
				switch(ws){
					case 1:wsColor='#367fa9';break;
					case 2:wsColor='#f0ad4e';break;
					case 3:wsColor='green';				
				}					
			}
			firstC.style.color=wsColor;
		}
		firstC=firstC.nextSibling;
	}while(firstC!=lastC);
	var pc=document.getElementById('wdiv'+wi).parentNode;

	switch(ws){
	case 1 : pc.setAttribute('class','panel panel-info');break;
	case 2 : pc.setAttribute('class','panel panel-warning');break;
	case 3 : pc.setAttribute('class','panel panel-success');
	}
	
}

function check(ch){
	var param='checklist_idx='+ch;
	sendRequest('checkUpdate.do', param, checkResult, 'POST');
}
function checkResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result); //checklist_idx
			
			updateWS('check,'+result);

		}
	}
}
function ws_checkResult(result){
	var ch=document.getElementById('ch'+result);
	var ch_s=document.getElementById('ch_state'+result);
	var ch_sv=document.getElementById('ch_state'+result).value;
	
	var div_ch=document.getElementById('div_ch'+result);
	var work_idx=div_ch.parentNode.getAttribute('id').substring(9);
	var chTotal=$('#chTotal'+work_idx).val();
	var chChecked=$('#chChecked'+work_idx);
	
	div_ch=div_ch.parentNode.lastChild.previousSibling;
	
	if(ch_sv=='1'){
		$(ch).hide();
		ch.className='glyphicon glyphicon-unchecked';
		$(ch).fadeIn('50');
		ch_s.value='0';
		$('#div_ch'+result).show();
		chChecked.val(chChecked.val()-1);
	}else if(ch_sv=='0'){
		var check_hide=$('#checkHide'+work_idx).val();
		if(check_hide=='0'){
			ch.className='glyphicon glyphicon-ok';
			$('#div_ch'+result).hide('100');
		}else{
			$(ch).hide();
			ch.className='glyphicon glyphicon-ok';
			$(ch).fadeIn('50');
		}
		ch_s.value='1';
		
		chChecked.val(parseInt(chChecked.val())+1);
	}
	
	document.getElementById('chBar'+work_idx).style.width=chChecked.val()/chTotal *100+'%';
	
}

function addCheck(work_idx){
	
	var cont=$('#content'+work_idx).val();
	var param='work_idx='+work_idx+'&checklist_content='+cont;
	if(cont==null ||cont==''){
		window.alert('체크리스트를 작성해주세요.');
	}else{
		sendRequest('checkAdd.do', param, addCheckResult, 'POST');
	}
}
function addCheckResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			
			var strData=XHR.responseText;
			var chData=eval('('+strData+')');
	
			var wi=chData.checklist.work_idx;
			var chc=chData.checklist.checklist_content;
			var chi=chData.checklist.checklist_idx;
			
			updateWS('checkAdd,'+wi+','+chc+','+chi);
		}
	}
}
function ws_addCheckResult(wi,chc,chi){
	var chAdd="<a onclick='javascript:check("+chi+")'>"
	+"<i id='ch"+chi+"' class='glyphicon glyphicon-unchecked'>"
	+"</i>&nbsp;"+chc+"</a>"
	+"<input type='hidden' id='ch_state"+chi+"' value='0'>";
	
	var dNode = document.createElement('div');
	dNode.setAttribute('id','div_ch'+chi);
	dNode.setAttribute('draggable','true');
	dNode.setAttribute('ondragover','allowDrop(event)');
	dNode.setAttribute('ondragstart','drag(event)');
	
	dNode.innerHTML = chAdd;
	
	document.getElementById('content'+wi).value='';
	
	var div=document.getElementById('check_div'+wi);
	var in_ch=div.lastChild.previousSibling;
	div.insertBefore(dNode,in_ch);
	
	var cht=$('#chTotal'+wi).val();
	cht=parseInt(cht)+1;
	$('#chTotal'+wi).val(cht);
	
	var chTotal=$('#chTotal'+wi).val();
	var chChecked=$('#chChecked'+wi);
	document.getElementById('chBar'+wi).style.width=chChecked.val()/chTotal *100+'%';
}
/*완료한 체크리스트 목록 보기 */
function showCheck(work_idx){
	
	var div=document.getElementById('check_div'+work_idx);
	
	var in_ch=document.getElementById('checkHide'+work_idx);
	
	var fc=div.firstChild;
	
	if(in_ch.value=='1'){
		in_ch.value='0';
		
		while(fc!=in_ch){
			
			if(fc.nodeName == 'DIV'){
				var ch_state=fc.lastChild.previousSibling.value;
				var nch_state=fc.lastChild.value;
				if(ch_state=='1'||nch_state=='1'){
					$(fc).hide('100');
				}
			}
			fc=fc.nextSibling;
		}
		
		document.getElementById('aCheck'+work_idx).innerHTML='완료한 체크리스트 보기';
		
	}else if(in_ch.value=='0'){
		in_ch.value='1';
		
		while(fc!=in_ch){
			if(fc.nodeName == 'DIV'){
				$(fc).show('100');
			}
				fc=fc.nextSibling;
		}
		
		document.getElementById('aCheck'+work_idx).innerHTML='완료한 체크리스트 숨기기';
	}
}
//ondragstart 드래그할 때 id값 가져오기!
function drag(ev) {
	hideTen();
    ev.dataTransfer.setData("text", ev.target.id);
}
//ondragover
function allowDrop(ev) {
    ev.preventDefault();
}
function trashColor(){
	document.getElementById('trash_i').style.color='red';
}
function trashColorReturn(){
	document.getElementById('trash_i').style.color='black';
}
//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
//휴지통
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    document.getElementById('trash_i').style.color='black';
    
    //유효성 검사
    if(document.getElementById(data)==null){
    	window.alert('잘못된 접근입니다.');
    	return;
    }
    
    if(data.startsWith('div_ch')){
    	data=data.substring(6);
    	var param='checklist_idx='+data;
    	sendRequest('checkDelete.do', param, delResult, 'POST');    
    }else if(data.startsWith('wdiv')){
    	data=data.substring(4);
    	var param='work_idx='+data;
    	sendRequest('workDelete.do', param, workDelResult, 'POST');
    }else if(data.startsWith('c')){
		data=data.substring(1);
    	var param='category_idx='+data;
    	sendRequest('categoryDel.do', param, cateDelResult, 'POST');
    }
}
//업무 생성 시 멤버 추가 드랍
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m').appendChild(comp);
    }
}
//업무 생성 시 멤버 빼기 드랍
function drop3(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m').appendChild(comp);
    }
}
//업무 수정 멤버 추가 드랍
function drop4(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m2').appendChild(comp);
    }
}
//업무 수정 멤버 빼기 드랍
function drop5(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m2').appendChild(comp);
    }
}
//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
function workDrop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    
    
}
//checklist 삭제 콜백 함수
function delResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText; //지운 idx
			result=parseInt(result);
			updateWS('checkDel,'+result);
		}
	}
}
function ws_checkDel(result){
	var div_ch=document.getElementById('div_ch'+result);
	var wi=div_ch.parentNode.getAttribute('id').substring(9);
	
	var cht=$('#chTotal'+wi).val();
	cht=parseInt(cht)-1;
	$('#chTotal'+wi).val(cht);
	
	var chState=$('#ch_state'+result).val();
	
	var chTotal=$('#chTotal'+wi).val();
	var chChecked=$('#chChecked'+wi);
	var chChecked_v=chChecked.val();
	if(chState=='1'){
		var chch=chChecked.val();
		chch=parseInt(chch);
		chch=chch-1;
		$('#chChecked'+wi).val(chch);
		chChecked_v=chch;
	}
	if(chTotal==0){
		document.getElementById('chBar'+wi).style.width='0%';
	}else{
		document.getElementById('chBar'+wi).style.width=chChecked_v/chTotal *100+'%';
	}
	$('#div_ch'+result).remove();
}
//work 삭제 콜백 함수
function workDelResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText;
			result=parseInt(result);		

			updateWS('workDel,'+result);
		}
	}
}
//카테고리 삭제 콜백 함수
function cateDelResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText; //지운 idx
			result=parseInt(result);
			updateWS('categoryDel,'+result);
		}
	}
}

/* 첨부파일 업로드 */
/*function fileUp(work_idx){
	sessionStorage.setItem('con_project_idx', project_idx);
	sessionStorage.setItem('con_work_idx', work_idx);
}*/

/* 업무 오른쪽 사이드창  */
function workSide(work_idx,work_title){
	
	window.alert(work_idx);
	
	var id_work_title=document.getElementById('work_title_id'); //업무 사이트 창에 업무제목 띄우기
	id_work_title.innerHTML = '<i class="glyphicon glyphicon-chevron-right"></i>'+work_title;
	
	project_fileList(work_idx,work_title);
	fileUpload(work_idx);
	comment(work_idx);
	//showComment(work_idx);
}

function showWorkTable(work_idx){

	var show=document.getElementById('showWork'+work_idx).getAttribute('class');
	if(show=='glyphicon glyphicon-menu-down'){
		$('#showWork'+work_idx).attr('class','glyphicon glyphicon-menu-right');
		$('#workTable'+work_idx).fadeOut();
	}else{
		$('#showWork'+work_idx).attr('class','glyphicon glyphicon-menu-down');
		$('#workTable'+work_idx).fadeIn();
	}
	
}
function showChecklist(work_idx){
	$('#check_div'+work_idx).toggle('show');
}
function showTen(member_idx){
	var param = 'member_idx='+member_idx;
/*	var tenT=$('#work_member'+member_idx).offset().top;
	var tenL=$('#work_member'+member_idx).offset().left+220;
	$('#tendency_pop').css('top',tenT+'px');
	$('#tendency_pop').css('left',tenL+'px');
	$('#tendency_pop').fadeIn();*/
	sendRequest('recommand.do',param,tendencyListResult,'POST');
}
function showTen2(member_idx){
	var param = 'member_idx='+member_idx;
/*	var tenT=$('#work2_member'+member_idx).offset().top;
	var tenL=$('#work2_member'+member_idx).offset().left+200;
	$('#tendency_pop').css('top',tenT+'px');
	$('#tendency_pop').css('left',tenL+'px');
	$('#tendency_pop').fadeIn();*/
	sendRequest('recommand.do',param,utendencyListResult,'POST');
}
function tendencyListResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var json = JSON.parse(result);	
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				$('#ten').html(member.member_name);
				var e=member.member_te;
				var s=member.member_ts;
				var t=member.member_tt;
				var j=member.member_tj;
				var i=member.member_ti;
				var n=member.member_tn;
				var f=member.member_tf;
				var p=member.member_tp;
				
				tenChart(e,s,t,j,i,n,f,p);
			}
			
		}
	}
}
function utendencyListResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var json = JSON.parse(result);	
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				$('#ten').html(member.member_name);
				var e=member.member_te;
				var s=member.member_ts;
				var t=member.member_tt;
				var j=member.member_tj;
				var i=member.member_ti;
				var n=member.member_tn;
				var f=member.member_tf;
				var p=member.member_tp;
				
				utenChart(e,s,t,j,i,n,f,p);
			}
			
		}
	}
}
function hideTen(){
	$('#tendency_pop').hide();
}