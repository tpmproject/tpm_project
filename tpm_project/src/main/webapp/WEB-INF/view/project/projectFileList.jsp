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
          <table id="mytable" class="table table-bordred table-striped" style="width: 100%;table-layout: fixed; border-spacing: 0;">
            <thead>
              <tr>
                <th>파일 이름</th>
                <th style="width:25%;">공유한 날짜</th>
                <th style="width:20%;">공유한 사람</th>
               	<th style="width:15%;"></th>
              </tr>
            </thead>
            <tbody>
             <!-- 시작 -->
              <tr style="display: table-row; vertical-align: inherit; border-color: inherit;">
               
                <td style="width: 43.333333333333336%;">
                  <div class="table-responsive">
                    <div class="tw-file-link" data-title="h.jpg" style=" display: flex; align-items: center; justify-content: flex-start;">
                      <div class="tw-file-link__thumbnail" style="margin-right: 15px; flex: none;">
                        <a style="font-family: inherit; transition: none; text-decoration: none; outline: 0;">
                          <div class="tw-attachment-thumbnail --size_small" style="width: 40px; height: 40px; border-radius: 3px; background: #e6e8ec; border: 1px solid #e6e8ec;">
                              <div class="tw-image" style="position: relative; height: 100%;">
                                  <div class="tw-image__container tw-image" style="width: 100%; height: 100%;">
                                      <img src="https://us-backend.taskworld.com/api/upload/20170422%2F02386618-d709-40c7-a4e1-9743dd61846b%2FthumbH.jpg" style="max-width: 100%; height: auto; -moz-box-sizing: border-box; box-sizing: border-box; border: 0; vertical-align: middle; width: 100%; height: 100%; display: block; object-fit: cover; border-radius: 3px;
">
                                  </div>
                              </div>
                          </div>
                      </a>
                      </div>
                      <div class="tw-file-link__title">
                        <a href="https://us-backend.taskworld.com/api/upload/20170422%2F54e0a0dc-d029-4841-aba7-f4bec16af98f%2Fh.jpg?message=58fb0a1c12b364f35ac8be3e&amp;title=h.jpg&amp;download=1"
                        class="tw-link" download="" target="_blank" style="font-family: inherit; transition: none; text-decoration: none; outline:0;">
                        <span class="tw-file-link__name">h.jpg</span></a>
                        <div class="tw-file-link__location" style="margin-top: 7px; margin-right: 1em; 
                                                               text-overflow: ellipsis; overflow:hidden; white-space: nowrap; ">161.65kB</div>
                      </div>
                    </div>
                  </div>
                </td>
                <td style="width: 20%; display: table-cell;vertical-align: inherit;">2017-04-20</td>
                <td style="display: table-cell;vertical-align: inherit;">안병민</td>
                <td style="display: table-cell;vertical-align: inherit;">
                  <button type="button" class="btn btn-success btn-xs" title="Approved"
									style="padding: 3px 5px; font-size: 15px; line-height: 1.5; border-radius: 3px;">
						<span class="glyphicon glyphicon-ok"></span>
				  </button>

				  <button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal"
                 		 		data-target="#delete" style="padding: 3px 5px;font-size: 15px;line-height: 1.5; border-radius: 3px;">
                        <span class="glyphicon glyphicon-trash"></span>
                  </button>
                </td>
             
              </tr>
                 <!-- 끝 -->
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