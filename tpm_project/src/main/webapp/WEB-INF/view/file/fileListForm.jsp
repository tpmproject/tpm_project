<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
 <head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SB Admin 2 - Bootstrap Admin Theme</title>
    <!-- Bootstrap Core CSS -->
    <%@ include file="/WEB-INF/view/file/import.jsp"%>
    
    <link href="/tpm_project/css/file/bootstrap.css?ver=8" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/tpm_project/css/file/metisMenu.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/tpm_project/css/file/dataTables.bootstrap.css?ver=7" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/tpm_project/css/file/dataTables.responsive.css?ver=2"
    rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/tpm_project/css/file/sb-admin.css?ver=3" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/tpm_project/css/file/font-awesome.css" rel="stylesheet"
    type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
    queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file://
    -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/tpm_project/js/ajax_extension.js"></script>

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
	<!-- <script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script> -->

    <script>
    /* 미리보기  */
	function fileContent(filename){
		window.alert(filename);
		window.alert('머냐:${doc.get(0)}');
		var param = "file_name="+filename;
		action_ajax('fileContent.do',param,'POST', 'FILE_CONTENT'); // 해당 페이지로 ajax통신 시작
		
	}
	
    /*선택한 프로젝트에 따라 파일리스트 출력  */
    function project_fileList(project_idx){
    	sessionStorage.setItem("project_idx",project_idx); //프로젝트 idx 세션에올리기
    	
		var project_idx_s=sessionStorage.getItem("project_idx");
    	var param = 'project_idx='+project_idx_s;
		action_ajax('fileList.do',param,'POST', 'FILE_LIST'); // 해당 페이지로 ajax통신 시작
		
	}
 	function file_search(i){
 		var project_idx_s=sessionStorage.getItem("project_idx");
 		
    	var search_text=document.getElementById("search_text").value;
    	
		var param = 'project_idx='+project_idx_s+'&search_text='+search_text;

		action_ajax('fileList.do',param,'POST', 'FILE_LIST'); // 해당 페이지로 ajax통신 시작
		
	}
    /*선택한 제목행에따라 정렬하여 파일리스트 출력  */
    function file_sort(line_name, th){
    	
    	var project_idx_s=sessionStorage.getItem("project_idx");
    	
    	var sort='';
    	
    	if($('#'+th).hasClass('sorting')){
    	}else if($('#'+th).hasClass('sorting_asc')){
    		sort='desc';
    	}else if($('#'+th).hasClass('sorting_desc')){
    		sort='asc';
    	}
    	
    	var param = 'project_idx='+project_idx_s +'&line_name='+line_name+'&sort='+sort;

    	action_ajax('fileList.do',param,'POST', 'FILE_LIST'); // 해당 페이지로 ajax통신 시작
    }
 
	function action_ajax(url, param, method, ctype) {
		sendRequest_extension(url, param, ajax_result, method, ctype);
		return false;
	}
	
    function ajax_result(httpRequest, ctype) {
    	return function() {
    		if(httpRequest.readyState == 4){
    			if(httpRequest.status == 200){
    				if(!httpRequest.responseText.match(null)){
    					var responseText = httpRequest.responseText;
    					result_process(responseText, ctype);
    				
    					
    				}
    			}
    		} else {

    		}
    	}
    }
    function result_process(responseText, ctype) {

		if(ctype == 'FILE_LIST'){
			fileList_setting(responseText);
			
		} else if(ctype == 'FILE_CONTENT'){
			window.alert('result_process들어옴')
			
			fileContent_setting(responseText);
			
		} else if(ctype == ''){
			search_modal_setting(responseText);
		} else {
			window.alert('잘못된 경로');
		}
	}
  /*   function fileContent_setting(responseText){
    	window.alert('fileContent_setting 들어옴');
    	 
    	var msg ='';
    		msg += '${doc}'
    	
        var file_content = document.getElementById('fileContent');
        	
		file_content.innerHTML = '';
		file_content.innerHTML = msg;
    } */
    function fileContent_setting(responseText) {
    	window.alert("setting: "+responseText);
		var json = JSON.parse(responseText);
		
		var msg = '';
		var files = json.files; // 맵 객체로부터 members 값인 배열을 가져온다.
		
		msg += json; 
		
		var file_con = document.getElementById('fileCon');
		
	
		file_con.innerHTML = '';
		file_con.innerHTML = msg;
	
	}
	
	function fileList_setting(responseText) {
		var json = JSON.parse(responseText);
		
		var msg = '';
		var files = json.files; // 맵 객체로부터 members 값인 배열을 가져온다.
		for(var i = 0 ; i < files.length; i++){
			var file = files[i];
			var filename=file.file_name;
			var filetype='';
			if (filename.substring(filename.indexOf('.'))=='.txt') {
				filetype='txt';
			}
			if (filename.substring(filename.indexOf('.'))=='.doc') {
				filetype='doc';
			}
			if (filename.substring(filename.indexOf('.'))=='.jpg') {
				filetype='jpg';
			}
			if (filename.substring(filename.indexOf('.'))=='.pdf') {
				filetype='pdf';
			}
			if (filename.substring(filename.indexOf('.'))=='.png') {
				filetype='png';
			}
			if (filename.substring(filename.indexOf('.'))=='.xls') {
				filetype='xls';
			}
			if (filename.substring(filename.indexOf('.'))=='.rar') {
				filetype='rar';
			}
			if (filename.substring(filename.indexOf('.'))=='.html') {
				filetype='html';
			}
			
			
		    msg+= ''
		    msg+= '<tr class="odd gradeX" style="margin:10px 30px;">'
					msg +='<td><a class="btn btn-default" data-target="#layerpop" data-toggle="modal" onclick="fileContent(\''+file.file_name+'\')"><img style="width:30px; margin:auto 70px;" src="/tpm_project/img/fileicon/filetypeicon/'+filetype+'.PNG"></a></td>'
					msg +='<td><a href="fileDown.do?file_name='+file.file_name+'">'+file.file_name+'</a></td>'
					msg +='<td>'+file.file_size+' byte </td>'
					msg +='<td class="center">'+file.file_date+'</td>'
					msg +='<td class="center">안병민'
					
					msg +='<ul style="width:5px;height:5px; text-align: center; margin-top:auto; margin-right:70px; float:right; list-style:none;">'
					msg += '<li class="dropdown">'
					msg +=    '<a class="dropdown-toggle" data-toggle="dropdown" href="#">'
					msg +=                '<i class="fa fa-gear fa-fw"></i> '
					msg +=    '</a>'
			            
					msg +=    '<ul class="dropdown-menu dropdown-user">'
					msg +=     ' <li>'
					msg +=       ' <a href="fileDown.do?file_name='+file.file_name+'"><i class="fa fa-user fa-fw"></i> 다운로드</a>'
					msg +=      '</li>'
					msg +=      '<li>'
					msg +=        '<a onclick="fileDel('+file.file_idx+', \''+ file.file_name +'\');"><i class="fa fa-user fa-fw"></i> 삭제</a>'
					msg +=      '</li>'
					msg +=    '</ul>'
					msg +=   '</li>'
					msg += '</ul></td>'
			        
			msg += '</tr>'
		
		}
		
		var file_content_list = document.getElementById('file_content_list');
		
	
		file_content_list.innerHTML = '';
		file_content_list.innerHTML = msg;
	
	}
	
	/* 파일 삭제  */
	function fileDel(file_idx,file_name){
		
		location.href="fileDel.do?file_idx="+file_idx+"&file_name="+file_name;  //해당파일 올린사람만 지울수있게 바꿔야함
	}
	
    </script>
    
  </head>
 
  <body class="skin-blue" >
  
  <!-- 모달 시작 -->
  <div class="row">
		<div class="modal fade" id="layerpop">

		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal" style="font-size:30px; color:white;">×</button>
		        <!-- header title -->
		       
		      </div>
		      <!-- body -->
		     	 <div class="modal-body" >
		     	
		     	 <div class="row" id="fileContent">
		     	 	<div class="col-lg-6" id="fileCon">
		      		${json}
		      		</div>
		         </div>
		         
		      </div>
		 </div>
   </div>
	
  <!--모달 끝  -->
  
  <%@ include file="/WEB-INF/view/header.jsp"%>
	
    <div id="wrapper" class="file-list-form">
      <!-- Navigation -->
      <nav class="navbar navbar-default navbar-static-top" role="navigation"
      style="margin-bottom: 0">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.do" style="color:black;">파일 리스트</a>
        </div>
        <!-- /.navbar-header -->
        <ul class="nav navbar-top-links navbar-right"></ul>
        <!-- /.navbar-top-links -->
        <div class="navbar-default sidebar" role="navigation">
          <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
              <li class="sidebar-search">
                <div class="input-group custom-search-form">
                <!-- 프로젝트 리스트 쪽 검색   -->
                  <input type="text" class="form-control" placeholder="Search...">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                      <i class="fa fa-search"></i>
                    </button>
                  </span>
                </div>
                <!-- /input-group -->
              </li>
              <li class="active">
                <a href="#" style="color:black;"><i class="fa fa-bar-chart-o fa-fw"></i> 프로젝트<span class="fa arrow"></span></a>
							<div id="projectList_ul_div">
								<ul class="nav nav-second-level">
									<!--사이드에 프로젝트 리스트명 띄우기  -->
									<c:set var="p_list" value="${pdto}"></c:set>
									<c:forEach var="p_idxs" items="${p_list}">

										<li><a
											onclick="project_fileList('${p_idxs.project_idx}');"
											style="color: black;">${p_idxs.project_name } </a></li>

									</c:forEach>

								</ul>
							</div> <!-- /.nav-second-level -->
              </li>
            </ul>
          </div>
          <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
      </nav>
      <div id="page-wrapper">
        <!-- /.row -->
        <div class="row">
          <div class="col-lg-12">
            <div class="panel panel-default">
              <div class="panel-heading"> 프로젝트 파일 리스트</div>
              <!-- /.panel-heading -->
              <div class="panel-body">
              	<div style="width:300px;">
             	 	<input type="text" style="display:inline; float:left;" class="form-control" id="search_text" placeholder="Search...">
              		<button class="btn btn-default" type="button" onclick="file_search()" style="margin:-30px 300px;float:left; display: inline;">
                      <i class="fa fa-search"></i>
                    </button>
             	</div>
              
                <table width="95%" class="table table-striped table-bordered table-hover"
                id="dataTables-example" style="width:500px">
                
                  <thead>
                    <tr>
                      <th>파일 타입 ${project_idx}</th>
                      <th id="th_file_name" onclick="file_sort('file_name','th_file_name')">파일 이름</th>
                      <th id="th_file_size" onclick="file_sort('file_size','th_file_size')">파일 크기</th>
                      <th id="th_file_date" onclick="file_sort('file_date','th_file_date')">공유한 날짜</th>
                      <th id="th_file_idx" onclick="file_sort('member_idx')">공유한 사람</th>
                    </tr>
                  </thead>

                  <tbody id="file_content_list">
            	
              <%--   <c:set var="fileaa" value="${fileList}"></c:set>
                <c:forEach var="fkey" items="${fileaa}">
            
                  <tr class="odd gradeX">
                      <td></td>
                      <td>Firefox 2.0</td>
                      <td>Win 98+ / OSX.2+</td>
                      <td class="center">1.8</td>
                      <td class="center">A</td>
             	  </tr>
                 
                  
                </c:forEach>
                       --%>
           		    
                
                  </tbody>
                </table>
                <!-- /.table-responsive -->
              </div>
              <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
          </div>
          <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <!-- /.row -->
        <!-- /.row -->
        <!-- /.row -->
      </div>
      <!-- /#page-wrapper -->
    </div>
    
    <!-- /#wrapper -->
    
    <!-- jQuery -->
   <<script src="/tpm_project/js/file/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/tpm_project/js/file/bootstrap.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/tpm_project/js/file/metisMenu.js"></script>
    <!-- DataTables JavaScript -->
    <script src="/tpm_project/js/file/jquery.dataTables.js"></script>
    <script src="/tpm_project/js/file/dataTables.bootstrap.js"></script>
    <script src="/tpm_project/js/file/dataTables.responsive.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/tpm_project/js/file/sb-admin-2.js"></script>
    <!-- jQuery 2.1.3 -->
	<!-- <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script> -->
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
      $(document).ready(function() {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
                
                /* $('#projectList_ul_div').slimScroll({
                    height: '100px' // 스크롤 처리할 div 의 길이
                }).bind('slimscrolling', function(e, pos) {
                	//window.alert("Scroll value: " + pos + "px");
                   // $('#testDivOut2').append("Scroll value: " + pos + "px");
                }); */
            });
     
    </script>
    	<%@ include file="/WEB-INF/view/footer.jsp"%>
  </body>
</html>