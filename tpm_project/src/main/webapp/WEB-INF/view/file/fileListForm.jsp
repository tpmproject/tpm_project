<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <link href="/tpm_project/css/file/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/tpm_project/css/file/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/tpm_project/css/file/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/tpm_project/css/file/dataTables.responsive.css"
    rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/tpm_project/css/file/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/tpm_project/css/file/font-awesome.min.css" rel="stylesheet"
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
    function show() {
    sendRequest_extension('fileList.do', null, ajax_result, 'POST', 'FILE_LIST');
	}
    function ajax_result(httpRequest, ctype) {
    	return function() {
    		if(httpRequest.readyState == 4){
    			if(httpRequest.status == 200){
    				if(!httpRequest.responseText.match(null)){
    					var responseText = httpRequest.responseText;
    					var divNotice = document.getElementById('fileList');
    					divNotice.innerHTML = responseText;
    					
    				}
    			}
    		} else {

    		}
    	}
    }
    </script>
  </head>
  
  <body>
    <div id="wrapper">
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
          <a class="navbar-brand" href="index.html">파일 리스트</a>
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
              <li>
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 프로젝트<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                  <li>
                    <a href="#" onclick="show();">myweb 프로젝트</a>
                  </li>
                  <li>
                    <a href="">final 프로젝트</a>
                  </li>
                  <li>
                    <a href="">semi 프로젝트</a>
                  </li>
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
                id="dataTables-example">
                  <thead>
                    <tr>
                      <th>파일 번호</th>
                      <th>파일 이름</th>
                      <th>파일 크기</th>
                      <th>공유한 날짜</th>
                      <th>공유한 사람</th>
                    </tr>
                  </thead>
                  <tbody id="fileList">
                  
                    <tr class="odd gradeX">
						<td>1</td>
						<td>미디어.jsp</td>
						<td>33</td>
						<td class="center">2017-08-22</td>
						<td class="center">안병민</td>
					</tr>
                  
                   
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
    <script src="/tpm_project/js/file/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/tpm_project/js/file/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/tpm_project/js/file/metisMenu.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="/tpm_project/js/file/jquery.dataTables.min.js"></script>
    <script src="/tpm_project/js/file/dataTables.bootstrap.min.js"></script>
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