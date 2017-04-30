<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 제목을 입력하십시오</title>
<link href="/tpm_project/css/hr/hr-text.css?verr=3" rel="stylesheet">


<style>
        article.content {
            margin: -30px 50px;
            width:400px;
            height:200px
        }
        .navbar .navbar-nav {
            display: inline-block;
            float: none;
        }
        .navbar .navbar-collapse {
            text-align: center;
        }
    
        .doc-page-trial{
        	display:none;
        }
      	.pg1-text1{
      	 	display:none;
      	}
      	.pg1-page{
      		margin:auto 500px;
      	    background: white;
      	}

    </style>
<style type="text/css">
    .doc-page-trial{
    display: none;
    }
    #right-side #sidebar-wrapper{
    margin-right: -250px;
    right: 0;
    width: 250px;
	background-color:silver;
    position: fixed;
    height: 90%;

    margin-top: 33px;
    z-index: 1020;
    background-color:white;
    transition: all 0.5s ease-in 0s;
    -webkit-transition: all 0.5s ease-in 0s;
    -moz-transition: all 0.5s ease-in 0s;
    -ms-transition: all 0.5s ease-in 0s;
    -o-transition: all 0.5s ease-in 0s;
    box-shadow: 5px 0px 20px #000808;
  }
  
  #right-side .sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  #right-side .sidebar-nav li {
    line-height: 50px;
    text-indent: 20px;
  }

  #right-side .sidebar-nav li a {
    color: #999999;
    display: block;
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255,255,255,0.2);
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:active, .sidebar-nav li a:focus {
    text-decoration: none;
  }

  #right-side .sidebar-nav > .sidebar-brand {
    height: 55px;
    line-height: 55px;
    font-size: 18px;
  }

  #right-side .sidebar-nav > .sidebar-brand a {
    color: #999999;
  }

  #right-side .sidebar-nav > .sidebar-brand a:hover {
    color: #fff;
    background: none;
  }

  #right-side #menu-toggle {
    top: 0;
    right: 0;
    position: fixed;
    z-index: 1;
  }

  #right-side #sidebar-wrapper.active {
    right: 250px;
    width: 630px;
    margin-top: 33px;
     z-index: 1020;
     background-color:white;
    transition: all 0.5s ease-out 0s;
    -webkit-transition: all 0.5s ease-out 0s;
    -moz-transition: all 0.5s ease-out 0s;
    -ms-transition: all 0.5s ease-out 0s;
    -o-transition: all 0.5s ease-out 0s;
  }

  #right-side .toggle {
    margin: 5px 190px 0 0;
  }
 
 </style>
  <!--   <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"> -->
<style type="text/css">
      /* USER PROFILE PAGE */
     .card {
        margin-top: 20px;
        padding: 30px;
        background-color: rgba(214, 224, 226, 0.2);
        -webkit-border-top-left-radius:5px;
        -moz-border-top-left-radius:5px;
        border-top-left-radius:5px;
        -webkit-border-top-right-radius:5px;
        -moz-border-top-right-radius:5px;
        border-top-right-radius:5px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    .card.hovercard {
        position: relative;
        padding-top: 0;
        overflow: hidden;
        text-align: center;
        background-color: #fff;
        background-color: rgba(255, 255, 255, 1);
    }
    .card.hovercard .card-background {
        height: 130px;
    }
    .card-background img {
        -webkit-filter: blur(25px);
        -moz-filter: blur(25px);
        -o-filter: blur(25px);
        -ms-filter: blur(25px);
        filter: blur(25px);
        margin-left: -100px;
        margin-top: -200px;
        min-width: 130%;
    }
    .card.hovercard .useravatar {
        position: absolute;
        top: 15px;
        left: 0;
        right: 0;
    }
    .card.hovercard .useravatar img {
        width: 100px;
        height: 100px;
        max-width: 100px;
        max-height: 100px;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        border: 5px solid rgba(255, 255, 255, 0.5);
    }
    .card.hovercard .card-info {
        position: absolute;
        bottom: 14px;
        left: 0;
        right: 0;
    }
    .card.hovercard .card-info .card-title {
        padding:0 5px;
        font-size: 20px;
        line-height: 1;
        color: #262626;
        background-color: rgba(255, 255, 255, 0.1);
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        margin-
    }
    .card.hovercard .card-info {
        overflow: hidden;
        font-size: 12px;
        line-height: 20px;
        color: #737373;
        text-overflow: ellipsis;
    }
    .card.hovercard .bottom {
        padding: 0 20px;
        margin-bottom: 17px;
    }
    .btn-pref .btn {
        -webkit-border-radius:0 !important;
    }
    </style>

<style type="text/css">
      #custom-search-form {
        margin:0;
        margin-top: 5px;
        padding: 0;
    }
 
    #custom-search-form .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    #custom-search-form button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }
    </style>
<link href="/tpm_project/css/file/bootstrap-combined.css?ver=1" rel="stylesheet"> 
<script>
function commentAdd(){
	
	var work_idx = document.newComment.work_idx.value;
	var comment_content = document.newComment.inputComment.value;
	
	var param = 'work_idx='+ work_idx + '&comment_content=' + comment_content;
	window.alert(param);
			
		$.ajax({
			url : 'addComment.do',
			type : 'post',
			data : param,
			dataType : 'json',
			success : function(json){
				//window.alert('jason(?):'+json);
				window.alert('json:'+JSON.stringify(json,null,2));
				
				var cdId = document.getElementById('comment_content');
				var member_id = json.mdto.member_id.split('@')[0];
				
				var msg = '';
				
				msg += '<div class="box-body chat" id="chat-box">';
				msg += 		'<div class="item">';
				msg += 			'<img src="/tpm_project/img/member/profile/'+ json.mdto.member_img +'" class="online">';
				msg += 			'<p class="message">';
				msg +=				'<a href="#" class="name"> <small class="text-muted pull-right">';
				msg += 					'<i class="fa fa-clock-o"></i> '+ moment(json.comment_date).format('YYYY-MM-DD h:mm:ss a')+'</small>'+ json.mdto.member_name +'('+ member_id +')';
				msg += 				'</a>';
				msg += 				  json.comment_content;
				msg +=			 '</p>';
				msg += 		'</div>';
				msg += '</div>';
				
				cdId.innerHTML = msg;
			}
		});
		//sendRequest('commentAdd.do', param, commentAddResult, 'POST');
	}
	
	/* var date = new Date();
	
	var year = date.getYear();
		if(year < 2000) year += 1900;
	var month = date.getMonth()+1;
	var day = date.getDate();
	
	var hour = date.getHours();
		if(hour > 12){
			hour = '오후 ' + (hour-12);
		} else if(hour = 12){
			hour = '오후 ' + hour-12;
		} else{
			hour = '오전 ' + hour;
		}
	var minute = date.getMinutes();
	var second = date.getSeconds();
		
	var time = year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second;
	window.alert(time);
	
	var param = 'work_idx='+ work_idx + '&member_idx=' + ${s_member_idx} +
			'&comment_content=' + comment_content + '&comment_date=' + time; */
	
	/* function commentAddResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var result = XHR.responseText;
				window.alert(result);
			}
		}
	} */
	
	function showComment(){
		var param  = 'work_idx='+work_idx;
		window.alert(param);
		
		//sendRequest('commentList.do', param, showCommentResult, 'POST');
		
		$.ajax({
			url : 'commentList.do',
			type : 'post',
			data : param,
			dataType : 'json',
			success : function(json){
				var msg = '';
				
				for(var i=0; i<json.length; i++){
					//var comments = json[0];
					
					var msg = '';
					var cdId = document.getElementById('comment_content');
					
					msg += '<div class="box-body chat" id="chat-box">';
					msg += 		'<div class="item">';
					msg += 			'<img src="/tpm_project/img/member/profile/'+ json[i].mdto.member_img +'" class="online">';
					msg += 			'<p class="message">';
					msg +=				'<a href="#" class="name"> <small class="text-muted pull-right">';
					msg += 					'<i class="fa fa-clock-o"></i> '+ moment(json[i].comment_date).format('YYYY-MM-DD h:mm:ss a')+'</small>'+ json[i].mdto.member_name +'('+ json[i].mdto.member_id +')';
					msg += 				'</a>';
					msg += 				  json[i].comment_content;
					msg +=			 '</p>';
					msg += 		'</div>';
					msg += '</div>';
					
					cdId.innerHTML = msg;
				}
			}
			
		});
	}
	
	/* function showCommentResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var JSONData = XHR.responseText;
				window.alert(JSONData);
				
				var objData = eval('('+JSONData+')');
				window.alert(objData);
				
				var comments = objData.
			}
		}
	} */
	
	/* <div class="box-body chat" id="chat-box">
			<div class="item">
				<img src="/tpm_project/img/member/profile/${comment.member_img}" class="online">
			<p class="message">
				<a href="#" class="name"> <small class="text-muted pull-right">
					<i class="fa fa-clock-o"></i> ${comment.comment_date}</small> ${comment.member_name}(${comment.member_id})
				</a>
				${comment.comment_content}
			</p>
				<div class="attachment">
					<h4>첨부 파일 :</h4>
					<p class="filename">Theme-thumbnail-image.jpg</p>
				</div>
			</div>
		</div> */
	
	/* function makeCommentContent(cdto){
		
		var temp_msg = '';
		
		temp_msg += '<div class="box-body chat" id="chat-box">';
		temp_msg += 		'<div class="item">';
		temp_msg += 			'<img src="/tpm_project/img/member/profile/'+ cdto.mdto.member_ing +'" class="online">';
		temp_msg += 			'<p class="message">';
		temp_msg +=				'<a href="#" class="name"> <small class="text-muted pull-right">';
		temp_msg += 					'<i class="fa fa-clock-o"></i> '+ cdto.comment_date+'</small>'+ cdto.mdto.member_name +'('+ cdto.mdto.member_id +')';
		temp_msg += 				'</a>';
		temp_msg += 				 cdto.comment_content;
		temp_msg +=			 '</p>';
		temp_msg += 		'</div>';
		temp_msg += '</div>';
		
		return temp_msg;
	} */
	/* 처음 들어올때 업무 파일리스트  */
	function project_fileList(work_idx){
		sessionStorage.setItem('s_work_idx',work_idx);
		//window.alert('사이드창쪽 업무 idx: '+work_idx);
		//window.alert('사이드창쪽 프로젝트 idx: ${param.project_idx}');
	
		var param = 'work_idx='+work_idx+'&project_idx='+${param.project_idx};
		action_ajax('workFileList.do',param,'POST', 'WORK_FILELIST'); // 해당 페이지로 ajax통신 시작
		
		
	}
	/*파일 리스트 탭눌럿을때 업무리스트  */
	function project_fileList2(){
		var work_idx=sessionStorage.getItem('s_work_idx');
		//window.alert('사이드창쪽 업무 idx: '+work_idx);
		//window.alert('사이드창쪽 프로젝트 idx: ${param.project_idx}');
	
		var param = 'work_idx='+work_idx+'&project_idx='+${param.project_idx};
		action_ajax('workFileList.do',param,'POST', 'WORK_FILELIST'); // 해당 페이지로 ajax통신 시작
		
		
	}
	/* 파일 검색 */
	function file_search(work_idx){
		var work_idx=sessionStorage.getItem('s_work_idx');
		var f_search=document.getElementById('f_search');
		
		var param = 'work_idx='+work_idx+'&project_idx='+${param.project_idx}+'&search_file_name='+f_search.value;
		action_ajax('workFileList.do',param,'POST', 'WORK_FILELIST'); // 해당 페이지로 ajax통신 시작
	}
	
	/* 미리보기  */
	function fileContent(filename){
		var file_con = document.getElementById('fileCon');
		var f_name = document.getElementById('f_name');
		//window.alert(filename);
		var msg='<img src="/tpm_project/img/fileicon/loading_4.gif" style="width: 200px; position:absolute; margin: 15% 350px;">';
		f_name.innerHTML = filename;
		file_con.innerHTML = msg;
		
		var param = "file_name="+filename;
		action_ajax('fileContent.do',param,'POST', 'FILE_CONTENT'); // 해당 페이지로 ajax통신 시작
		
	}
	/* 파일 삭제 관련 */
	function fileDelParam(file_idx,file_name){
		del_file_idx = file_idx;
	    del_file_name = file_name;
	    var work_del_file_name = document.getElementById('work_del_file_name');
	    work_del_file_name.innerHTML = file_name+'&nbsp; 파일을 삭제 하시겠습니까?';
	}
	function workFileDelete(){
		del_work_idx = sessionStorage.getItem('s_work_idx');
		
		var param = 'file_idx='+del_file_idx+'&file_name='+del_file_name;  //해당파일 올린사람만 지울수있게 바꿔야함
		action_ajax('fileDel.do',param,'POST', 'FILEDEL'); // 해당 페이지로 ajax통신 시작
		
		project_fileList(del_work_idx);
	} 
	/*파일 다운  */
	function fileDown2(file_name){
	
		  location.href="fileDown.do?file_name="+file_name;
	}
	function action_ajax(url, param, method, ctype) {
		sendRequest_extension(url, param, ajax_result, method, ctype);
		return false;
	}
	/* function fileAdd(){
		
		var param = "file_name="+filename;
		action_ajax('fileAdd.do',param,'POST', 'FILE_ADD'); // 해당 페이지로 ajax통신 시작
		
	} */
	
    function ajax_result(httpRequest, ctype) {
    	return function() {
    		if(httpRequest.readyState == 4){
    			if(httpRequest.status == 200){
    					var responseText = httpRequest.responseText;
    					result_process(responseText, ctype);
    			}
    		} else {

    		}
    	}
    	
    }
    function result_process(responseText, ctype) {

		if(ctype == 'WORK_FILELIST'){
			project_fileList_setting(responseText);	
		} else if(ctype == 'FILE_CONTENT'){
		//	window.alert('result_process');
			fileContent_setting(responseText);
		} else if(ctype == ''){
			search_modal_setting(responseText);
		} else {
			window.alert('잘못된 경로');
		}
	}

	
	function project_fileList_setting(responseText) {

		var json = JSON.parse(responseText);
		//window.alert(responseText);
		var files = json; // 맵 객체로부터 members 값인 배열을 가져온다.
		var msg = '';
	    
		var proejct_filelist = document.getElementById('file_tbody');
		var filetype='';
		
		if(files==null || files==''){
		
			msg += '<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">';
			msg += '	<td>검색한 파일이 없습니다.</td></tr>';
		}
		
		for(var i=0; i<files.length; i++){
			var file=files[i];
			
			/* 파일 타입 뽑기 */
			var filename=file.file_name.toLowerCase();
		
			var file_type=filename.substring(filename.lastIndexOf('.')+1);
			
		  
			/* 파일 날짜 뽑기  */
			var date = new Date(files[i].file_date); 
		    
			var file_year = date.getFullYear();
		    var file_month = date.getMonth()+1;
		    var file_date = date.getDate();
		    var file_hour = date.getHours();
		    var file_minute = date.getMinutes();
		    var file_seconde = date.getSeconds();
		    var ampm;
		    var file_now;
		    
		    if(file_hour >= 12){
		    	file_hour = file_hour -12;
		    	ampm = "오후";
		    }else{
		    	ampm = "오전";
		    }
			
		    file_now = file_year+'-'+file_month+'-'+file_date+'<br>'+ampm+' '+file_hour+':'+file_minute;
				
				msg += ' <!-- 시작 -->';
				msg += '<tr style="display: table-row; vertical-align: inherit; border-color: inherit;">';
				msg += '	<td style="width: 43.333333333333336%;" >';
				msg += '		<div class="table-responsive">';
				msg += '		<div class="tw-file-link" data-title="h.jpg" style=" display: flex; align-items: center; justify-content: flex-start;">';
				msg += '		<div class="tw-file-link__thumbnail" style="margin-right: 15px; flex: none;">';
				msg += '         	<a style="font-family: inherit; transition: none; text-decoration: none; outline: 0;">';
				msg += '        <div class="tw-attachment-thumbnail --size_small" style="width: 50px; height: 55px; border-radius: 3px; background: #e6e8ec; border: 1px solid #e6e8ec;">';
				msg += '        <div class="tw-image" style="position: relative; height: 100%;">';
				msg += '        <div class="tw-image__container tw-image" style="width: 100%; height: 100%;">';
				
				if(file_type=='jpg'||file_type=='gif'||file_type=='png'){
										
					msg += '             <a data-target="#layerpop" data-toggle="modal" href="#" onclick="fileContent(\''+file.file_name+'\')"><img src="/tpm_project/upload/'+file.file_name+'" style="max-width: 100%; height: auto; -moz-box-sizing: border-box; box-sizing: border-box; border: 0; vertical-align: middle; width: 100%; height: 100%; display: block; object-fit: cover; border-radius: 3px;"></a>';
				
				}else{
					msg += '             <a data-target="#layerpop" data-toggle="modal" href="#" onclick="fileContent(\''+file.file_name+'\')"><img src="/tpm_project/img/fileicon/filetypeicon/'+file_type+'.PNG"';
					msg += '                  style="max-width: 100%; height: auto; -moz-box-sizing: border-box; box-sizing: border-box; border: 0; vertical-align: middle; width: 100%; height: 100%; display: block; object-fit: cover; border-radius: 3px;"></a>';
				}
				
				
				
				msg += '        </div>';
				msg += '        </div>';
				msg += '        </div>';
				msg += '       		</a>';
				msg += '      	</div>';
				
				msg += '      <div class="tw-file-link__title">';
				msg += '    	 <a href="https://us-backend.taskworld.com/api/upload/20170422%2F54e0a0dc-d029-4841-aba7-f4bec16af98f%2Fh.jpg?message=58fb0a1c12b364f35ac8be3e&amp;title=h.jpg&amp;download=1"';
				msg += '        		 class="tw-link" download="" target="_blank" style="font-family: inherit; transition: none; text-decoration: none; outline:0;">';
				msg += ' 	 	<span class="tw-file-link__name">'+file.file_name+'</span></a>';
				msg += '       <div class="tw-file-link__location" style="margin-top: 7px; margin-right: 1em; ';
				msg += '                                 text-overflow: ellipsis; overflow:hidden; white-space: nowrap; ">'+file.file_size+'kB</div>';
                msg += '      </div>';
                msg += '      </div>';
                msg += '      </div>';
                msg += '     </td>';
                msg += '    <td style="width: 20%; display: table-cell;vertical-align: inherit; font-family: sans-serif; font-size:12px">'+file_now+'</td>';
                msg += '    <td style="display: table-cell;vertical-align: inherit;">'+file.memberdto.member_name+'</td>';
                msg += '    <td style="display: table-cell;vertical-align: inherit;">';
                msg += '  	<button type="button" onclick="fileDown2(\''+file.file_name+'\')" class="btn btn-success btn-xs" title="Approved"';
                msg += '				  style="padding: 3px 5px; font-size: 15px; line-height: 1.5; border-radius: 3px;">';
                msg += '		<span class="glyphicon glyphicon-ok"></span>';
                msg += '  	</button>&nbsp;';
              
				if('${s_member_idx}'==file.member_idx){
					
					 msg += '<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" onclick="fileDelParam('+file.file_idx+',\''+file.file_name+'\')"';
		             msg += ' 		 		data-target="#delete" style="padding: 3px 5px;font-size: 15px;line-height: 1.5; border-radius: 3px;">';
		             msg += '        <span class="glyphicon glyphicon-trash"></span>';
		             msg += '</button>';
		             
				}
               
               	msg += '</td>';
             
               	msg += ' </tr>';
             
 
               	
		}
		proejct_filelist.innerHTML = '';
		proejct_filelist.innerHTML = msg;


	}
	//미리보기 관련
	function fileContent_setting(responseText) {
		//window.alert('미리보기 setting ');
		var msg ='';
		msg +=responseText;	
		var file_con2 = document.getElementById('fileCon');
		

  		msg+= '<nav class="navbar navbar-inverse navbar-fixed-bottom">';
  		msg+= '<div id="navbar" class="collapse navbar-collapse">';
  		msg+=    '<ul class="nav navbar-nav">';
  		msg+=         '<li><a href="#" onclick="">First</a></li>';
  		msg+=         '<li><a href="#" onclick="">Previous</a></li>';
  		msg+=         '<li><a href="#" onclick="">Next</a></li>';
        msg+=         '<li><a href=""> Last</a></li>';
  		msg+=     '</ul>';
  		msg+= '</div>';
  		msg+= '</nav>';
		
		
	
  		file_con2.innerHTML = '';
		file_con2.innerHTML = msg;
		
	}
	
	
    </script>
    
<!-- 임시) 여기까지 첨부파일   -->
<style>

</style>
</head>
<body>


<div class="work-right-side">
	<div style="position:absolute; z-index:1;  ">
		<a id="menu-close" href="#"
			class="btn btn-default btn-lg pull-right toggle"><i
			class="glyphicon glyphicon-remove"></i></a>
	</div>
	<div style="width:100%">
      <div class="card hovercard">
        <div class="card-background">
          <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
          <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
          <img alt="" src="http://lorempixel.com/100/100/people/9/">
        </div>
        <div class="card-info">
          <span class="card-title">Pamela Anderson</span>
        </div>
      </div>
      <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group"
      aria-label="...">
        
        <div class="btn-group" role="group">
          <button type="button" id="favorites" class="btn btn-default" href="#tab2"
          data-toggle="tab">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <div class="hidden-xs">코멘트</div>
          </button>
        </div>
        <div class="btn-group" role="group">
          <button type="button" id="following" class="btn btn-default" href="#tab3"
          data-toggle="tab" onclick="project_fileList2()">
            <span class="glyphicon glyphicon glyphicon-folder-open" aria-hidden="true"></span>
            <div class="hidden-xs">파일 리스트</div>
          </button>
        </div>
     <!--     <div class="btn-group" role="group">
          <button type="button" id="fileUpload" class="btn btn-default" href="#tab4"
          data-toggle="tab">
            <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
            <div class="hidden-xs">파일 업로드</div>
          </button>
        </div>
           <div class="btn-group" role="group">
          <button type="button" id="fileUpload" class="btn btn-default" href="#tab5"
          data-toggle="tab">
            <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
            <div class="hidden-xs">파일 업로드</div>
          </button>
        </div> -->
      </div>
      <div class="well">
        <div class="tab-content" style="width:600px">
        
          <div class="tab-pane fade in" id="tab2">
            <%@include file="/WEB-INF/view/comment/comment.jsp"%>
          </div>
          
          <div class="tab-pane fade in" id="tab3">
          	<div style="position:static;">
          	  <%@include file="/WEB-INF/view/file/test1.jsp"%>
          	</div>
         	<div style="position:static;">
   			 <%@include file="/WEB-INF/view/project/projectFileList.jsp"%>
   			</div>
          </div>
          
          <%-- <div class="tab-pane fade in" id="tab4">
             
          </div>
          
          <div class="tab-pane fade in" id="tab5">
             <%@include file="/WEB-INF/view/file/fileUploadForm.jsp"%>
          </div> --%>
          
        </div>
      </div>
    </div>
    
</div>	 
	<script type="text/javascript">


	  $(document).ready(function() {
          $(".btn-pref .btn").click(function () {
              $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
              // $(".tab").addClass("active"); // instead of this do the below 
              $(this).removeClass("btn-default").addClass("btn-primary");   
          });
          });
</script>
	
</body>
</html>