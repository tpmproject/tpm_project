window.onload=function(){
	
	$('[data-toggle="popover"]').popover();
	$(btnwork2).hide();
	$(btnwork4).hide();
	$('.content').mCustomScrollbar({axis:"yx"});
	
	connect(project_idx);
	var hei=window.innerHeight-130;
	$('.content.mCustomScrollbar._mCS_1').css('height',hei+'px');
}

$(window).resize(function() {
	var wid=(window.innerWidth/2)-320;
	$('#work_modal').css('left',wid+'px');
	$('#work_modal2').css('left',wid+'px');
	
	var hei=window.innerHeight-130;
	$('.content.mCustomScrollbar._mCS_1').css('height',hei+'px');
})

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
		wid=parseInt(wid)+210;
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
		wid=parseInt(wid)-210;
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
		
		var innerH='<div class="category_head" id ="c'+idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';			
		innerH+='<form name="cateUp" action="javascript:categoryUpdate('+idx+')">';
		innerH+='<div id="cate'+idx+'" class="cateName">';
		innerH+='<input id="cateIn'+idx+'" type="text" value="'+name+'" size="16px">&nbsp;&nbsp;';
		innerH+='<i class="glyphicon glyphicon-remove" onclick="cateNameRe('+idx+')"></i></div>';
		innerH+='<div id="a_cate'+idx+'"><a id="aa_cate'+idx+'" href="javascript:cateName('+idx+')">'+name+'</a>&nbsp;&nbsp;';
		innerH+='<i class="glyphicon glyphicon-plus" onclick="showf('+idx+')"></i></div></form></div>';
		
		dNode.innerHTML=innerH;
		cbodyNode.insertBefore(dNode,cateNode);
		cbodyNode.style.width = parseInt(cbodyNode.style.width)+210+"px";
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
		document.changeWork.work_confirm.setAttribute('checked','checked');
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
				msg2 += '<div id="work_member'+member.member_idx+'"onmouseover="showTen('+member.member_idx+')" onmouseleave="hideTen('+member.member_idx+')" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
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
				
				msg2 += '<div id="work2_member'+member.member_idx+'"onmouseover="showTen('+member.member_idx+')" onmouseleave="hideTen('+member.member_idx+')" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
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
				window.alert(result);
				var work=eval('('+result+')');
		
				var cNode = document.getElementById('cp'+work.category_idx);
				var dNode = document.createElement('div');
			
				var msg='<div id="wdiv'+work.work_idx+'" class="wdiv" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';		
				msg+='<i id="showWork'+work.work_idx+'"></i>';
				msg+='&nbsp;<span onclick="showWorkTable('+work.work_idx+')">'+work.work_title+'</span>';
				msg+='<c:set var="wstart"><f:formatDate value="'+work.work_start+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
				msg+='<c:set var="wend"><f:formatDate value="'+work.work_end+'" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>';
				msg+='<span onclick="workUpdate(${wdto.work_idx},'+work.work_start+','+work.work_end+','+work.work_confirm+')"><i class="glyphicon glyphicon-cog"></i></span></div>';
				msg+='<table id="workTable${wdto.work_idx}" class="cate_table">';
				msg+='<tbody><tr><td colspan="2"><div class="table_i glyphicon glyphicon-calendar"></div>&nbsp;'+work.work_start+'<br>';
				msg+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				msg+='~'+work.work_end+'</td></tr>';
				msg+='<tr><td colspan="2"><div class="table_i glyphicon glyphicon-user"></div>';
				msg+='<c:forEach var="mdto" items="${marr}"><c:if test="${mdto.work_idx eq '+work.work_idx+'">';
				msg+='<span>${mdto.member_name}</span></c:if></c:forEach></td></tr>';
				msg+='<tr><td colspan="2"><form action="javascript:addCheck('+work.work_idx+')">';
				msg+='<div class="table_i glyphicon glyphicon-check" onclick="showChecklist('+work.work_idx+')"></div>';
				msg+='<input type="text" id="content'+work.work_idx+'" placeholder="체크리스트" style="width: 60%;" required="required">';
				msg+='&nbsp;<i class="glyphicon glyphicon-plus" onclick="addCheck('+work.work_idx+')"></i>';
				msg+='</form></td></tr><tr><td colspan="2"><div class="scr">';
				msg+='<div class="check_div" id="check_div'+work.work_idx+'">';
				msg+='</div></div></td></tr><tr>';
				msg+='<td colspan="2" align="right"><a id="aCheck'+work.work_idx+'"href="javascript:showCheck('+work.work_idx+')">완료한 체크리스트보기</a>&nbsp;</td>';
				msg+='</tr><tr><td colspan="2"><div class="progress" style="margin-bottom: 2px; height: 12px;">';
				msg+='<div id="chBar${wdto.work_idx}" class="progress-bar progress-bar-primary " style="width: ${chChecked/chTotal * 100}%;"></div></div>';
				msg+='</td></tr><tr><td><div class="work_btn" id="workState'+work.work_idx+'">';
				msg+='<i name="1" class="glyphicon glyphicon-play-circle" style="color:#367fa9;" data-toggle="tooltip" data-placement="bottom" title="업무 진행 중"></i>';
				msg+='<c:if test="{'+work.work_confirm+'==10}"><i name="2" class="glyphicon glyphicon-record" onclick="workDone('+work.work_idx+',2)"></i></c:if>';
				msg+='<i name="3" class="glyphicon glyphicon-ok-circle" style="color:green;" data-toggle="tooltip" data-placement="bottom" title="완료된 업무" onclick="workDone(${wdto.work_idx},3)"></i></div></td>';
				msg+='<td align="right"><a href="#" class="menu-toggle">코멘트</a>/ <a href="#" class="menu-toggle">첨부파일</a>	</td>';
				msg+='</tr></tbody></table></div></div>';
				
				dNode.innerHTML = msg;
				cNode.appendChild(dNode);
				closem();
				hideTen();	
				document.newWork.reset();
				checkResult()
			}	
		}
	}
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

	var param = 'work_idx=' + document.changeWork.work_idx.value
	+'&work_title=' + document.changeWork.work_title.value
	+'&workdateup=' + document.changeWork.workdateup.value 
	+'&work_confirm=' + document.changeWork.work_confirm.value 
	+'&member_idx=' + msg;
	window.alert(param);
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');
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
			var wi=wData.work.work_idx;
			
			if(wi==0){
				window.alert('권한이 없습니다.');
				return;
			}
			
			var ws=wData.work.work_state;
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
			result=parsInt(result);
			$('#wdiv'+result).remove();
		}
		location.reload();
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
function fileUp(work_idx){
	sessionStorage.setItem('con_project_idx', project_idx);
	sessionStorage.setItem('con_work_idx', work_idx);
}
/* 업무 오른쪽 사이드창  */
function workSide(work_idx){
	//window.alert('컨텐트폼쪽 업무 idx: '+work_idx);
	
	project_fileList(work_idx);
	fileUpload(work_idx);
	comment(work_idx);
	return work_idx;
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
	var tenT=$('#work_member'+member_idx).offset().top;
	var tenL=$('#work_member'+member_idx).offset().left+120;
	$('#tendency_pop').css('top',tenT+'px');
	$('#tendency_pop').css('left',tenL+'px');
	$('#tendency_pop').fadeIn();
	sendRequest('recommand.do',param,tendencyListResult,'POST');
}
function showTen2(member_idx){
	var param = 'member_idx='+member_idx;
	var tenT=$('#work2_member'+member_idx).offset().top;
	var tenL=$('#work2_member'+member_idx).offset().left+120;
	$('#tendency_pop').css('top',tenT+'px');
	$('#tendency_pop').css('left',tenL+'px');
	$('#tendency_pop').fadeIn();
	sendRequest('recommand.do',param,tendencyListResult,'POST');
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
function hideTen(){
	$('#tendency_pop').hide();
}