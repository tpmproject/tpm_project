<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <!-- Force latest IE rendering engine or ChromeFrame if installed -->
    <!--[if IE]>
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <meta charset="utf-8">
    <title>jQuery File Upload Demo</title>
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <!-- Generic page styles -->
    <!-- blueimp Gallery styles -->
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap
    progress bars -->
    <link rel="stylesheet" href="/tpm_project/css/file/upload/jquery.fileupload.css">
    <link rel="stylesheet" href="/tpm_project/css/file/upload/jquery.fileupload-ui.css">
    <!-- CSS adjustments for browsers with JavaScript disabled -->
    <noscript>
      <link rel="stylesheet" href="/tpm_project/css/file/upload/jquery.fileupload-noscript.css">
    </noscript>
    <noscript>
      <link rel="stylesheet" href="/tpm_project/css/file/upload/jquery.fileupload-ui-noscript.css">
    </noscript>
    
<script>
//projectContent.js 상위
function fileUpload(work_idx){
	$('input[name=work_idx]').attr('value',work_idx); 
	$('input[name=project_idx]').attr('value',project_idx); 
}

$(function(){
    $("#uploadbutton").click(function(){
    //window.alert('실행됨');
        var form = $('form')[0];
        var formData = new FormData(form);
            $.ajax({
               url: 'fileAdd.do',
               processData: false,
               contentType: false,
               data: formData,
               type: 'POST',
               success: function(result){
               alert("업로드 성공!!");
                } 
           	
               
           });
            
            
            setTimeout("project_fileList2()", 500);
            setTimeout("project_fileList2()", 8000);
        }); 
    
})  


function show(){
	var uploadbutton = document.getElementById("uploadbutton"); 
	var resetbutton = document.getElementById("resetbutton"); 
	uploadbutton.style.display = ""; //동의 페이지 none 
	resetbutton.style.display = ""; 
}
function bu_close(){
	var uploadbutton = document.getElementById("uploadbutton"); 
	
	
	var resetbutton = document.getElementById("resetbutton"); 
	uploadbutton.style.display = "none"; //동의 페이지 none 
	resetbutton.style.display = "none"; 
	
}

function oneClose(){
	//window.alert('들어옴')
	var uploadbutton = document.getElementById("uploadbutton"); 
	var resetbutton = document.getElementById("resetbutton"); 
	uploadbutton.style.display = "none"; //동의 페이지 none 
	resetbutton.style.display = "none"; 
}

</script>
  </head>
  
  <body>
    <div class="navbar navbar-default navbar-fixed-top" >
    </div>
    <div class="container" style="width: 570px;">
  
      
      <form id="fileupload" style="width: 550px; margin: auto -10px;" enctype="multipart/form-data">
		<input type="hidden" name="work_idx" id="id_work_idx" >
		<input type="hidden" name="project_idx" id="id_project_idx">
		
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
        <noscript>
          <input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/">
        </noscript>
        <!-- The fileupload-buttonbar contains buttons to add/delete files and
        start/cancel the upload -->
        <div class="row fileupload-buttonbar">
          <div class="col-lg-7" style="width:580px;">
            <!-- The fileinput-button span is used to style the file input field as
            button -->
            <span class="btn btn-success fileinput-button">
              <i class="glyphicon glyphicon-plus"></i>
              <span>첨부파일</span>
              <input type="file" name="file_upload" multiple="multiple" onchange="show()">
            </span>
            
            <button type="button" id="uploadbutton" class="btn btn-primary start" onclick="bu_close()" style="display:none">
              <i class="glyphicon glyphicon-upload"></i>
              <span>모두 올리기</span>
            </button>
            <button type="reset"  id="resetbutton" class="btn btn-warning cancel" onclick="bu_close()" style="display:none">
              <i class="glyphicon glyphicon-ban-circle"></i>
              <span>모두 취소</span>
            </button>
            
          </div>
          <!-- The global progress state -->
          
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped" style="width: 100%;">
          <tbody class="files"></tbody>
        </table>
      </form>
      
     
    </div>
    
    <!-- The template to display files available for upload -->
    <script id="template-upload" type="text/x-tmpl">

      {% for (var i=0, file; file=o.files[i]; i++) { 
						var filename1=file.name.toLowerCase(); 
						var filetype=filename1.substring(filename1.lastIndexOf('.')+1);
						
					
	   %}
			
                <tr class="template-upload fade" >
                    <td>
                        <span class="preview">

						{% if(!(filetype=='jpg' || filetype=='png' || filetype=='gif')){ %}
					    <img src="/tpm_project/img/fileicon/filetypeicon/{%=filetype%}.PNG" style="width: 50px;margin: auto 15px;">
						{% } %}

						</span>
                    </td>
                    <td>
                        <p class="name">{%=file.name%}</p>
                        <strong class="error text-danger"></strong>
                    </td>
                    <td>
                        <p class="size">Processing...</p>
                        <div onunload="show()" class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
                    </td>
                    <td>
                        {% if (!i && !o.options.autoUpload) { %}
                            <button onclick="oneClose()" id="but_cl" class="btn btn-primary start" disabled style="display:none">
                                <i class="glyphicon glyphicon-upload"></i>
                                <span>확인</span>
                            </button>
                        {% } %}
                        {% if (!i) { %}
                            <button class="btn btn-warning cancel">
                                <i class="glyphicon glyphicon-ban-circle"></i>
                                <span>취소</span>
                            </button>
                        {% } %}
                    </td>
                </tr>
            {% } %}
    </script>
    <!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
     
    </script>
    <!-- The jQuery UI widget factory, can be omitted if jQuery UI
    is already included -->
    <script src="/tpm_project/js/file/upload/vendor/jquery.ui.widget.js"></script>
    <!-- The Templates plugin is included to render the upload/download
    listings -->
    <script src="//blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
    <!-- The Load Image plugin is included for the preview images
    and image resizing functionality -->
    <script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
    <!-- The Canvas to Blob plugin is included for image resizing
    functionality -->
    <script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
    <!-- Bootstrap JS is not required, but included for the responsive
    demo navigation -->
    <!-- blueimp Gallery script -->
    <script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <!-- The Iframe Transport is required for browsers without support
    for XHR file uploads -->
    <script src="/tpm_project/js/file/upload/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-process.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-image.js"></script>
    <!-- The File Upload audio preview plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-audio.js"></script>
    <!-- The File Upload video preview plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-video.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-validate.js"></script>
    <!-- The File Upload user interface plugin -->
    <script src="/tpm_project/js/file/upload/jquery.fileupload-ui.js"></script>
    <!-- The main application script -->
    <script src="/tpm_project/js/file/upload/main.js?ver=1"></script>
    <!-- The XDomainRequest Transport is included for cross-domain
    file deletion for IE 8 and IE 9 -->
    <!--[if (gte IE 8)&(lt IE 10)]>
      <script src="js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
  </body>

</html>