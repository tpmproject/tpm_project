<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
  
  <head>
    <meta charset="utf-8">

    <title>Bootstrap Snippet for Datatable - Bootsnipp.com</title>
    <meta name="viewport"
    content="width=device-width, initial-scale=1">

	
	
  </head>
  
  <body>
    
    
    <div class="container" style="width:100%">
      <div class="row">
        <div class="col-md-12" style="width: 590px; height: 610px; margin: -10px -10px;">
          <div class="table-responsive"></div>
          
				<div class="container1">
					<div class="row">
						<div class="span12" style="width:300px">
							   <form id="custom-search-form" style="width: 300px;"
									class="form-search form-horizontal pull-right">
								    <div class="input-append span12" style="width:300px">
										<input type="text" id="f_search" class="search-query" placeholder="Search" style="width: 540px; height: 35px; margin:5px 20px;">
										<button type="button" class="btn" style="margin: 9px -20px;" onclick="file_search()">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
			 <div style="position:static;">
          	  <%@include file="/WEB-INF/view/file/test1.jsp"%>
   			 </div>	
				<table id="mytable" class="table table-bordred table-striped" style="width:100%;table-layout: fixed; border-spacing: 0;">
            <thead>
              <tr>
                <th style="width:40%">파일 이름</th>
                <th style="width:25%;">공유한 날짜</th>
                <th style="width:20%;">공유한 사람</th>
               	<th style="width:15%;"></th>
              </tr>
            </thead>
            <tbody id="file_tbody">
            
            </tbody>
          </table>
          
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
    
   
    <script type="text/javascript">
      $(document).ready(function(){
            $("#mytable #checkall").click(function () {
                    if ($("#mytable #checkall").is(':checked')) {
                        $("#mytable input[type=checkbox]").each(function () {
                            $(this).prop("checked", true);
                        });
            
                    } else {
                        $("#mytable input[type=checkbox]").each(function () {
                            $(this).prop("checked", false);
                        });
                    }
                });
                
                $("[data-toggle=tooltip]").tooltip();
            });
    </script>
  </body>


</html>