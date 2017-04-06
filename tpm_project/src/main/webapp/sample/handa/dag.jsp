<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "/tpm_project/js/drag/ajax.js"></script>
<script type = "text/javascript" src = "/tpm_project/js/drag/dnd.js"></script>
<style type = "text/css">
      #inventory 
      {
            position: absolute;
            border: 1px solid blue;
            left: 30px; top: 30px;
            width: 250px; height: 330px;
      }
 
      #cart
      {
            position: absolute;
            border: 1px solid red;.
            left: 500px; top: 30px;
            width: 250px; height: 330px;
      }
 
      div.dragsource 
      {
            background-color: #ddd;
            padding-top: 5px; padding-bottom: 5px;
            margin-top: 1px; margin-bottom: 1px;
            width: 250px;
            font-size: 12px;
      }
 
      div.title 
      {
            font-weight: bold;
            border-bottom: 1px solid #333;
      }
</style>
<script type = "text/javascript">
      var dndMgr = new ajax.dnd.DNDManager();
 
      window.onload = function() 
      {
            var product1 = new ajax.dnd.DragSource("product1");
            var product2 = new ajax.dnd.DragSource("product2");
            var product3 = new ajax.dnd.DragSource("product3");
  
            var inventory = new ajax.dnd.DropTarget("inventory");
            var cart = new ajax.dnd.DropTarget("cart");
  
            dndMgr.addDropTarget(inventory);
            dndMgr.addDropTarget(cart);
  
            dndMgr.addDragSource(product1);
            dndMgr.addDragSource(product2);
            dndMgr.addDragSource(product3);
 }
</script>
</head>
<body>
<div id = "inventory">
      <div class = "title">상품목록</div>
      <div id = "product1" class = "dragsource">
            <img src = "#" />삼성 센스 Q35</div>
      <div id = "product2" class = "dragsource">
            <img src = "#" />LG XNOTE S1-J214</div>
      <div id = "product3" class = "dragsource">
            <img src = "#" />SONY 바이오 VGN-FE15LP</div>
     </div>
<div id = "cart">
      <div class = "title">장바구니</div>
</div>
</body>
</html>