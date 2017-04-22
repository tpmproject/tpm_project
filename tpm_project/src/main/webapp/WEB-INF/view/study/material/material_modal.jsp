<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<!-- Material Design Bootstrap -->
<link href="/tpm_project/css/material/mdb.min.css" rel="stylesheet">

<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/tpm_project/js/material/tether.min.js"></script>



</head>
<body>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
            </div>
            <!--Body-->
            <div class="modal-body">
                ...
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- /.Live preview-->

<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-subscription">
Subscription form
</button>
                                
<!-- Modal Subscription -->
<div class="modal fade modal-ext" id="modal-subscription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title w-100" id="myModalLabel">Subscription form</h4>
            </div>
            <!--Body-->
            <div class="modal-body">
                <p>We'll write rarely, but only the best content.</p>
                <br>
                <div class="md-form">
                    <i class="fa fa-user prefix"></i>
                    <input type="text" id="form22" class="form-control">
                    <label for="form22">Your name</label>
                </div>

                <div class="md-form">
                    <i class="fa fa-envelope prefix"></i>
                    <input type="text" id="form32" class="form-control">
                    <label for="form32">Your email</label>
                </div>

                <div class="text-center">
                    <button class="btn btn-primary">Submit</button>
                </div>
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>

<!-- MDB core JavaScript -->
<script type="text/javascript" src="/tpm_project/js/material/mdb.min.js"></script>
</body>
</html>