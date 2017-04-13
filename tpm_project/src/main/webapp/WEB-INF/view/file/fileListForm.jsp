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
    
    <link href="/tpm_project/css/file/bootstrap.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/tpm_project/css/file/metisMenu.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/tpm_project/css/file/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/tpm_project/css/file/dataTables.responsive.css"
    rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/tpm_project/css/file/sb-admin.css?ver=1" rel="stylesheet">
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
    <script>
    
    /*선택한 프로젝트에 따라 파일리스트 출력  */
    function project_fileList(i){
    	
		var param = 'project_idx=' + i;
		action_ajax('fileList.do',param,'POST', 'FILE_LIST'); // 해당 페이지로 ajax통신 시작
	
	}
    
    /*선택한 제목행에따라 정렬하여 파일리스트 출력  */
    function sizeSort(project_idx, line_name){
    	var param = 'project_idx='+project_idx +'&line_name='+line_name;
    	
    	window.alert(param);
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
		} else if(ctype == ''){
			search_modal_setting(responseText);
		} else {
			window.alert('잘못된 경로');
		}
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
		    
			msg +='<tr class="odd gradeX" style="margin:10px 30px;">'
					msg +='<td><img style="width:30px; margin:auto 70px;" src="/tpm_project/img/fileicon/filetypeicon/'+filetype+'.PNG"></td>'
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
					msg +=       ' <a href=="fileDown.do?file_name='+file.file_name+'"><i class="fa fa-user fa-fw"></i> 다운로드</a>'
					msg +=      '</li>'
					msg +=      '<li>'
					msg +=        '<a onclick="fileDel('+file.file_idx+');"><i class="fa fa-user fa-fw"></i> 삭제</a>'
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
	function fileDel(i){
		location.href="fileDel.do?file_idx="+i;  //해당파일 올린사람만 지울수있게 바꿔야함
	}
	
    </script>
  </head>
 
  <body onload="project_fileList('+${project_idx}+')">
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
                <ul class="nav nav-second-level">
                <!--사이드에 프로젝트 리스트명 띄우기  -->
                <c:set var="p_list" value="${pdto}"></c:set>
                <c:forEach var="p_idxs" items="${p_list}">
                
                  <li >
                    <a onclick="project_fileList(${p_idxs.project_idx});" style="color:black;">${p_idxs.project_name }</a>
                    
                  </li>
                  
                </c:forEach>
                 
                </ul>
                <!-- /.nav-second-level -->
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
              <div class="panel-heading">DataTables Advanced Tables</div>
              <!-- /.panel-heading -->
              <div class="panel-body">
              
                <table width="100%" class="table table-striped table-bordered table-hover"
                id="dataTables-example" style="width:500px">
                
                  <thead>
                    <tr>
                      <th>파일 타입</th>
                      <th onclick="sizeSort(${project_idx},'file_name')">파일 이름</th>
                      <th onclick="sizeSort(${project_idx},'file_size')">파일 크기</th>
                      <th onclick="sizeSort(${project_idx},'file_date')">공유한 날짜</th>
                      <th onclick="sizeSort(${project_idx},'member_idx')">공유한 사람</th>
                    </tr>
                  </thead>

                  <tbody id="file_content_list">
                  
                     
               <!--      <tr class="gradeA">
                      <td>Gecko</td>
                      <td>Firefox 2.0</td>
                      <td>Win 98+ / OSX.2+</td>
                      <td class="center">1.8</td>
                      <td class="center">A</td>
                    </tr>
                     -->
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
    
    <script src="/tpm_project/js/file/jquery.js"></script>
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
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
      $(document).ready(function() {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
     
    </script>
  </body>
</html>