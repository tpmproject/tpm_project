<html>
  
  <head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Fancy Bootstrap Checkboxes - Bootsnipp.com</title>
    <meta name="viewport"
    content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
    rel="stylesheet">
    <style type="text/css">
      .form-group input[type="checkbox"] {
                display: none;
            }
            
            .form-group input[type="checkbox"] + .btn-group > label span {
                width: 20px;
            }
            
            .form-group input[type="checkbox"] + .btn-group > label span:first-child {
                display: none;
            }
            .form-group input[type="checkbox"] + .btn-group > label span:last-child {
                display: inline-block;   
            }
            
            .form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
                display: inline-block;
            }
            .form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
                display: none;   
            }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
      <div class="[ col-xs-12 col-sm-6 ]">
        <h3>Standard Checkboxes</h3>
        <hr>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default"
          autocomplete="on">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-default" class="[ btn btn-default ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-default" class="[ btn btn-default active ]">Default Checkbox</label>
          </div>
        </div>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-primary" id="fancy-checkbox-primary"
          autocomplete="off">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-primary" class="[ btn btn-primary ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-primary" class="[ btn btn-default active ]">Primary Checkbox</label>
          </div>
        </div>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-success" id="fancy-checkbox-success"
          autocomplete="off">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-success" class="[ btn btn-success ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-success" class="[ btn btn-default active ]">Success Checkbox</label>
          </div>
        </div>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-info" id="fancy-checkbox-info"
          autocomplete="off">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-info" class="[ btn btn-info ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-info" class="[ btn btn-default active ]">Info Checkbox</label>
          </div>
        </div>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-warning" id="fancy-checkbox-warning"
          autocomplete="off">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-warning" class="[ btn btn-warning ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-warning" class="[ btn btn-default active ]">Warning Checkbox</label>
          </div>
        </div>
        <div class="[ form-group ]">
          <input type="checkbox" name="fancy-checkbox-danger" id="fancy-checkbox-danger"
          autocomplete="off">
          <div class="[ btn-group ]">
            <label for="fancy-checkbox-danger" class="[ btn btn-danger ]">
              <span class="[ glyphicon glyphicon-ok ]"></span>
              <span>&nbsp;</span>
            </label>
            <label for="fancy-checkbox-danger" class="[ btn btn-default active ]">Danger Checkbox</label>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
</script>
  </body>

</html>