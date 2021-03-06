<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/fonts/icomoon/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/mws-theme.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/login.css" media="screen" />

<title>360 - Iniciar Sesi&oacute;n</title>

</head>

<body>

    <div id="mws-login-wrapper">
        <div id="mws-login">
            <h1>Iniciar Sesión</h1>
            <div class="mws-login-lock"><i class="icon-lock"></i></div>
            <div id="mws-login-form">
                <form class="mws-form" action="process.asp" method="post" autocomplete="off" >
                    <div class="mws-form-row">
                        <div class="mws-form-item large">
                            <input type="text" name="username" class="mws-login-username required" placeholder="Usuario" />
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <div class="mws-form-item large">
                            <input type="password" name="password" class="mws-login-password required" placeholder="Contraseña" />
                        </div>
                    </div>
                    <div class="mws-form-row">
                        <input type="submit" value="Ingresar" class="btn btn-primary mws-login-button" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="mws-banner-wrapper">
    	<img src="images/logo.png" width="375" height="100">
    </div>

    <!-- JavaScript Plugins -->
    <script type="text/javascript" src="js/libs/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="custom-plugins/fileinput.js"></script>
    <!-- jQuery-UI Dependent Scripts -->
    <script type="text/javascript" src="jui/js/jquery-ui-effects.min.js"></script>

    <!-- Plugin Scripts -->
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>

    <!-- Login Script -->
    <script type="text/javascript" src="js/core/login.js"></script>

</body>
</html>
