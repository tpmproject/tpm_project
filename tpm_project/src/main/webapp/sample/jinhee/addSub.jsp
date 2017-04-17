<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../../js/jquery-1.7.2.min.js"></script>

<style>
* {padding:0px; margin:0px;}
body {
	margin:20px auto;
	padding:0;	
	width:400px;
	font-size:13px;
	font-family:Arial, Helvetica, sans-serif;
}
p{ line-height:1.5; margin-bottom:5px;}

#tip {
	position:absolute;
    width:300px;
     color:#FFF;
	 padding:5px;
	display:none;
	
	background:#05184D;
	               border-radius: 5px;
               -moz-border-radius: 5px;
               -webkit-border-radius: 5px;
}
</style>
</head>

<body>

<div>
<p>
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
</p>
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a <a href="#" title="There are many variations of passages of Lorem Ipsum available passages of Lorem Ipsum available passages of Lorem Ipsum available passages of ">galley</a> of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
</p>
<p>
Contrary to popular belief, <a href="http://www.lipsum.com/" title="img/site.jpg" class="img">Lorem Ipsum</a> is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.
</p>
</div> 

<script>
var tempTitle;
var type;
$("a").hover(function(e){
	tempTitle = $(this).attr("title");
	type = $(this).attr("class");
	console.log(tempTitle)
	$(this).attr("title","");
	
	if(type =="img"){
		tempImg = "<img src='"+tempTitle+"' width='100px' height:'100px'/>"
	}
	
	
	$("body").append("<div id='tip'></div>");
		if(type =="img"){
	     $("#tip").html(tempImg);
		 $("#tip").css("width","100px");
		} else{
		 $("#tip").text(tempTitle);
		}
	     var pageX = $(this).offset().left -20;
		 var pageY = $(this).offset().top - $("#tip").innerHeight();
		 
 
		 
		 $("#tip").css({left:pageX+"px", top:pageY +"px"}).fadeIn(500);
		
	}, function(){
		$(this).attr("title",tempTitle);
		$("#tip").remove();
	});
	
</script>

</body>
</html>