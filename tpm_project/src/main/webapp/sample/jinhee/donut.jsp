<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="sample/cho/main/plugins/morris/morris.css">
<title>Insert title here</title>
</head>
<body>

<div class="box box-danger">
  <div class="box-header with-border">
    <h3 class="box-title">Donut Chart</h3>

    <div class="box-tools pull-right">
      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
      </button>
      <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
    </div>
  </div>
  <div class="box-body chart-responsive">
    <div class="chart" id="tendency-chart" style="height: 300px; position: relative;"></div>
  </div>
  <!-- /.box-body -->
</div>
<script src="sample/cho/main/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="sample/cho/main/plugins/morris/morris.min.js"></script>
<script>
$(function () {
    "use strict";
var donut = new Morris.Donut({
  element: 'tendency-chart',
  resize: true,
  colors: ["#f56954", "#00a65a"],
  data: [
    {label: "남은 업무", value: 30},
    {label: "완료된 업무", value: 20}
  ],
  hideHover: 'auto'
})
});
</script>
</body>
</html>