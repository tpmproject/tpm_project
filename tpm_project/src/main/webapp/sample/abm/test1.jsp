<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	Title : ��Ƽ���� ���ε�, ���α׷�����
	Author : ���μ�
--%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.2//EN" "http://www.wapforum.org/DTD/xhtml-mobile12.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<title>FileUpload Test Form</title>
<style type="text/css">
body{padding:0;margin:0;font-size:13px;font-family:'�������',NanumGothic,'���� ���','Malgun Gothic','����',Dotum,'����',Gulim,Helvetica,AppleGothic,sans-serif;}
div.fileUploadSection{float:left;width:100%;}
div.fileUploadSection div.fileUpWrapper{text-align:center;margin:6px 0 0 4px;}
div.fileUploadSection div.fileUpWrapper div.uploadPathDiv{float:left;line-height:23px;height:25px;width:70%;border:1px solid #ccc;}

/*���� �߰� ����*/
div.addAttachFileSection{float:left;width:100%;margin:5px 0 0 0;}
div.addAttachFileSection ul.attachFileList{float:left;list-style-type:none;padding:0;margin:0;width:100%;word-break:break-all;word-wrap:break-word;whilte-space:pre-wrap;}
div.addAttachFileSection ul.attachFileList li{float:left;width:100%;border:1px solid #ccc;margin:0 0 2px 0;text-align:left;}
div.addAttachFileSection ul.attachFileList li span.removeAttach{border:1px solid #ccc;line-height:25px;padding:0 7px 0 7px;margin:0 4px 0 4px;}
div.addAttachFileSection ul.attachFileList li span.attachFileName{vertical-align:middle;line-height:25px;}
span.fileUp{font-size:13px;line-height:25px;}

div#viewLoading {text-align:center;padding-top:120px;filter:alpha(opacity=60);opacity: alpha*0.6;background-color:#222222;color:#bcbfc4;}
div#viewLoading div.progressTitle{text-align:left;border:2px solid #111111;border-bottom:1px solid #111111;padding:15px 0 15px 0;width:99.2%;}
div#viewLoading div.progressTitle span{padding-left:3px;padding-bottom:5px;}
div#viewLoading div.progressWrapper{border:1px solid #111111;width:99.2%;text-align:center;}
div#viewLoading div.progressWrapper div.progresspercent{background-color:#1a1a1a;height:40px;border:1px solid #000000;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper{line-height:38px;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgbar{display:block;float:left;background-color:#fecf23;width:90%;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgpercent{position:absolute;left:30%;right:30%;color:#c0c0c0;}
div#viewLoading div.progressWrapper div.progresspercent span.percentwrapper span.pgpercent strong{font-weight:bold;}
div#viewLoading div.progressfilereadsize{margin:0 0 5px 0;height:40px;border:1px solid #111111;}
div#viewLoading div.progressfilereadsize span{line-height:40px;}
div#viewLoading div.progressfilereadsize span.divider strong{font-weight:400;}
div#viewLoading div.progressSpeed{margin:0 0 5px 0;height:40px;border:1px solid #111111;text-align:center;}
div#viewLoading div.progressSpeed span.kbps{line-height:40px;}
div#viewLoading div.progressSpeed span.kbps strong{font-weight:400;}

.pgbarbgcolor{background-color:#fecf23;}
</style>
<script type="text/javascript" src="../js/lib/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/lib/jquery.form.js"></script>
<script type="text/javascript">
//input file�� �ε�����ȣ�� ����(��������)
var fileIndex = 0;	

$(function(){
	var fileUploadElem = $("input.file");
	var fileUploadBtnElem = $("span.sendData");
	var fileUploadFrm = $("#fileform");	
		
	//ajax Progress image view Elem
	var viewLoadingImgElem = $("div#viewLoading");
	$(viewLoadingImgElem).hide();	//�ʱ�ε��ÿ��� �̹����� �����.
	
	var intervalID = 0;
	//ajax ��û���۰� �Ϸ���� ���α׷��� �̹��� element�� ����
	$(viewLoadingImgElem).ajaxStart(function(){
		// �ε��̹����� ��ġ �� ũ������	
		$(viewLoadingImgElem).css('position', 'absolute');
		$(viewLoadingImgElem).css('left', $("body").offset().left);
		$(viewLoadingImgElem).css('top', $("body").offset().top);
		$(viewLoadingImgElem).css('width', $(document).width());
		$(viewLoadingImgElem).css('height', $(document).height());
		
		
		intervalID = setInterval(function(){			
			getFileUploadProgress();	//ajax��û�߿� ���Ͼ��ε� ���¸� �ֱ������� ��û�Ѵ�.	
		},50);
		$(this).fadeIn(250);
	}).ajaxStop(function(){		
		clearInterval(intervalID); //Stop updating		
		$(this).fadeOut(250);
	});					

	$(fileUploadBtnElem).click(function(){
		$(fileUploadFrm).ajaxSubmit({			
			url : '/testproj/fileupload.do',
			type : 'POST',
			data : $(fileUploadFrm).serialize(),
			success : function(data){
				deleteFileListAndFileElems();											
				clearInterval(intervalID); //Stop updating
				//alert("���� �Ϸ� �Ǿ����ϴ�.");
			},error : function(){
				deleteFileListAndFileElems();
				clearInterval(intervalID); //Stop updating	
				//alert("���� ���� �߽��ϴ�.");
			}
		});	
	});
    
	//���Ͼ��ε� ���¸� �ֱ������� Ȯ���ؼ� �����´�.
	var getFileUploadProgress = function(){
		$.ajax({
			url : '/testproj/uploadstatus.do',
			success : function(data){
				var jsonData = eval('('+ data +')');

				$(viewLoadingImgElem).html(										
						"<div class='progressTitle'>" +
						"	<span><strong>���ε� �������</strong></span>" +		
						"</div>" +
						"<div class='progressWrapper'>" +
						"	<div class='progresspercent'>" +
						"		<span class='percentwrapper'>"+
						"			<span class='pgbar'>&nbsp;</span>"+
						"			<span class='pgpercent'><strong>"+ jsonData.percent+"%</strong></span>" +				
						"		</span>" +
						"	</div>"+
						"	<div class='progressfilereadsize'>"+
						"		<span class='readsize'>" + jsonData.bytesread + "<strong> bytes</strong></span>" +
						"		<span class='divider'><strong>/</strong></span>" +
						"		<span class='filelength'>" + jsonData.contentlength + "<strong> bytes</strong></span>" +
						"	</div>" +
						"	<div class='progressSpeed'>" +
						"		<span class='kbps'>" + jsonData.kbps + "<strong> kbps</strong></span>" +
						"	</div>" +								
						"</div>"	);										
				$(viewLoadingImgElem).find("div.progresspercent span.pgbar").width(jsonData.percent+"%").addClass("pgbarbgcolor");				
			}
		});
	};	
});


//���ε� ���� ����
var makeUploadElem = function(fileElemObj){
	fileIndex++;	//global var	
	var addAttachFileSectionElem = $("div").filter(".addAttachFileSection");
	var attachFileListElem = $(addAttachFileSectionElem).find("ul");	
	
	var targetElem=$("div#fileUpBtnWrapper");
	var fileElem=$("<input id='file"+fileIndex+"' class='file' type='file' name='upFile[]' style='position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;outline:none;'/>");
	var fileUpBtnElem = $("<span class='fileUp'>&nbsp;����</span>");
	
	$(fileElem).change(function(){
		makeUploadElem(this);	//recursive				
	});
	
	$(targetElem).append(fileElem);
	$(targetElem).append(fileUpBtnElem);
	$(fileElemObj).hide();	
	
	//���� ��� �߰� / ����
	var fileElemObjVal = $(fileElemObj).val();	
	$(attachFileListElem).append(
		"<li>" +			
			"<span class='removeAttach' onClick='deleteFileList(this,"+fileIndex+");'>x</span>" +
			"<span class='attachFileName'>"+fileElemObjVal+"</span>" +
		"</li>"
	);			
	
	$("div#debug").text($("div.fileUploadSection").html());
};
//���ε� ���� ����Ʈ ����
var deleteFileList = function(fileListElem,fileElemIndex){
	//�⺻���� ��ũ���� input file�� �ε��� ��ȣ�� 0���� ���۵Ǵµ�
	//���������� ���� ��Ų �����̹Ƿ� -1�� ���Ѽ� �ε��� ��ȣ�� �����ش�.
	var fileElemIdx = fileElemIndex - 1;
	var fileUpBtnWrapElem = $("div").filter("#fileUpBtnWrapper");
	
	$(fileUpBtnWrapElem).find("input:file").filter("#file"+fileElemIdx).remove();	
	$(fileListElem).parent().remove();
	
	$("div#debug").text($("div.fileUploadSection").html());
};

//������ �Ϸ�ǰų� ���нÿ��� input file�� li�� ��λ��� �����ְ�
//���������� ���� �ε����� �ʱ�ȭ �����ش�.
var deleteFileListAndFileElems = function(){
	var fileUploadSectionElem = $("div").filter(".fileUpWrapper");
	var addAttachFileSectionElem = $("div").filter(".addAttachFileSection").find("ul");
	$(fileUploadSectionElem).children().remove();
	$(addAttachFileSectionElem).children().remove();
	fileIndex = 0;
};
</script>
</head>
<body>
<div class="fileUploadSectionWrapper">
	<form id="fileform" enctype="multipart/form-data" method="post">
		<!-- ÷������ -->
		<div class="fileUploadSection">			
			<div class="fileUpWrapper">				
				<div id="fileUpBtnWrapper" class="fileUpBtnWrapper" style="position:relative; left: 2px; width:40px;height:25px; overflow:hidden;border:1px solid #ccc;text-align:center;">				 								
					<%-- input�� id�� ���� ���ڸ� �������� ����(�ε��� ��ȣ�� ����) --%>				
					<input id="file0" onchange="makeUploadElem(this)" class='file' type="file" name="upFile[]" style="position: absolute;right:0px;top:0px; opacity:0; filter: alpha(opacity=0);cursor: pointer;outline:none;"/>					 				
					<span class="fileUp">����</span>
				 </div>
			</div>
		</div>		
		<!-- ÷���߰�/���� -->
		<div class="addAttachFileSection">
			<ul class="attachFileList">
			</ul>
		</div>				
	</form>			
</div>

<div style="float:left;width:100%;height:40px;margin-top:30px;border:1px solid #ccc;text-align:center;">
	<span class="sendData" style="border:1px solid #ccc;line-height:40px;vertical-align:middle;padding:4px 15px 4px 15px;">����</span>
</div>
<!-- Ajax Progress Status -->
<div id="viewLoading">
	<!-- 
	<div class='progressTitle'>
		<span><strong>���ε� �������</strong></span>		
	</div>
	<div class='progressWrapper'>
		<div class='progresspercent'>
			<span class='percentwrapper'>
				<span class='pgbar'>&nbsp;</span>
				<span class='pgpercent'><strong> 40% </strong></span>				
			</span>
		</div>
		<div class='progressfilereadsize'>
			<span class='readsize'> 20000000000 <strong> bytes</strong></span>
			<span class='divider'><strong>/</strong></span>
			<span class='filelength'> 3000000000000  <strong> bytes</strong></span>
		</div>
		<div class='progressSpeed'>
			<span class='kbps'> 2000 <strong> kbps</strong></span>
		</div>		
	</div>
 	-->
</div>
<div id="debug" style="float:left;width:100%;border:1px solid red;margin-top:30px;">
</div>
</body>
</html>