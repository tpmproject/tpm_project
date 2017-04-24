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
        <div class="col-md-12" style="width: 590px; margin: -10px -10px;">
          <div class="table-responsive"></div>
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
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit"
    aria-hidden="true">
      <div class="modal-dialog" style="margin: 70px auto; width: 450px;">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <h4 class="modal-title custom_align" id="Heading" style="text-align:left; margin:auto 10px">파일 삭제</h4>
          </div>
          
          <div class="modal-body">
            <div class="alert alert-danger" style="text-align: left;">
              <span class="glyphicon glyphicon-warning-sign" >&nbsp;</span> h.jpg 파일을 정말 삭제 하시겠습니까?</div>
          </div>
          <div class="modal-footer ">
            <button type="button" class="btn btn-success">
              <span class="glyphicon glyphicon-ok-sign"></span>&nbsp;Yes</button>
            <button type="button" class="btn btn-default"
            data-dismiss="modal">
              <span class="glyphicon glyphicon-remove"></span>&nbsp;No</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
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