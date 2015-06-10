<!--#include file="includes/funciones.asp"-->
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 1
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Plugin Stylesheets first to ease overrides -->
<link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="custom-plugins/wizard/wizard.css" media="screen" />

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/fonts/icomoon/style.css" media="screen" />

<link rel="stylesheet" type="text/css" href="css/mws-style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/icons/icol16.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/icons/icol32.css" media="screen" />

<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css" media="screen" />

<!-- jQuery-UI Stylesheet -->
<link rel="stylesheet" type="text/css" href="jui/css/jquery.ui.all.css" media="screen" />
<link rel="stylesheet" type="text/css" href="jui/jquery-ui.custom.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/mws-theme.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/themer.css" media="screen" />

<title><%tite%></title>

</head>

<body>


	<!-- Header -->
	<div id="mws-header" class="clearfix">
    
    	<!-- Logo Container -->
    	<div id="mws-logo-container">
        
        	<!-- Logo Wrapper, images put within this wrapper will always be vertically centered -->
        	<div id="mws-logo-wrap">
            <%logop%>
			</div>
        </div>
        
        <!-- User Tools (notifications, logout, profile, change password) -->
        <div id="mws-user-tools" class="clearfix">
        
            <!-- User Information and functions section -->
            <div id="mws-user-info" class="mws-inset">
            
            	<!-- User Photo -->
            	<div id="mws-user-photo">
                	<img src="example/profile.jpg" alt="User Photo" />
                </div>
                
                <!-- Username and Functions -->
                <div id="mws-user-functions">
                 <%tituloderecha%>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Start Main Wrapper -->
    <div id="mws-wrapper">
    
    	<!-- Necessary markup, do not remove -->
		<div id="mws-sidebar-stitch"></div>
		<div id="mws-sidebar-bg"></div>
        
        <!-- Sidebar Wrapper -->
        <div id="mws-sidebar">
        
            <!-- Hidden Nav Collapse Button -->
            <div id="mws-nav-collapse">
                <span></span>
                <span></span>
                <span></span>
            </div>

            <!-- Main Navigation -->
            <div id="mws-navigation">
            <%msidebar%>
            </div>         
        </div>
        
        <!-- Main Container Start -->
        <div id="mws-container" class="clearfix">
        
        	<!-- Inner Container Start -->
            <div class="container">
            
            	<!-- Statistics Button Container -->
            	<div class="mws-stat-container clearfix">
                	
                    <!-- Statistic Item -->
                	<a class="mws-stat" href="#">
                    	<!-- Statistic Icon (edit to change icon) -->
                    	<span class="mws-stat-icon icol32-building"></span>
                        
                        <!-- Statistic Content -->
                        <span class="mws-stat-content">
                        	<span class="mws-stat-title">Flotillas</span>
                            <span class="mws-stat-value"> <%conteoempresas%></span>
                        </span>
                    </a>

                	<a class="mws-stat" href="#">
                    	<!-- Statistic Icon (edit to change icon) -->
                    	<span class="mws-stat-icon icol32-lorry"></span>
                        
                        <!-- Statistic Content -->
                        <span class="mws-stat-content">
                        	<span class="mws-stat-title">Eficiencia</span>
                            <span class="mws-stat-value down"><%conteoeficiencia%>%</span>
                        </span>
                    </a>

                	<a class="mws-stat" href="#">
                    	<!-- Statistic Icon (edit to change icon) -->
                    	<span class="mws-stat-icon icol32-walk"></span>
                        
                        <!-- Statistic Content -->
                        <span class="mws-stat-content">
                        	<span class="mws-stat-title">Conexiones</span>
                            <span class="mws-stat-value"><%conteousuarios%></span>
                        </span>
                    </a>
                    
                    
                	<a class="mws-stat" href="#">
                    	<!-- Statistic Icon (edit to change icon) -->
                    	<span class="mws-stat-icon icol32-car"></span>

                        <!-- Statistic Content -->
                        <span class="mws-stat-content">
                        	<span class="mws-stat-title">Unidades</span>
                            <span class="mws-stat-value"><%conteounidades%></span>
                        </span>
                    </a>
                </div>
                
                <!-- Panels Start -->
                
            	<div class="mws-panel grid_5">
                	<div class="mws-panel-header">
                    	<span><i class="icon-graph"></i>Grafica de rendimiento</span>
                    </div>
                    <div class="mws-panel-body">
                        <div id="mws-dashboard-chart" style="height: 222px;"></div>
                    </div>
                </div>
                
            	<div class="mws-panel grid_3">
                	<div class="mws-panel-header">
                    	<span><i class="icon-book"></i> Accesos rapidos</span>
                    </div>
                    <div class="mws-panel-body no-padding">
                        <ul class="mws-summary clearfix">
                            <li>
                                <span class="key"><i class="icon-bus"></i><a href="nveh.asp">Nuevo Vehiculo</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                            <li>
                                <span class="key"><i class="icon-table"></i><a href="km360.asp"> Ingreso de 360</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                            <li>
                                <span class="key"><i class="icon-truck"></i><a href="resumen360.asp">360 por vehiculo</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                            <li>
                                <span class="key"><i class="icon-install"></i><a href="error.asp">Usuarios</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                            <li>
                                <span class="key"><i class="icon-key"></i><a href="npilo.asp">Nuevo Piloto</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                            <li>
                                <span class="key"><i class="icon-list"></i><a href="resumenflotilla360.asp">360 por flotilla</a></span>
                                <span class="val">
                                    <span class="text-nowrap"></span>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
                
     
                <!-- Panels End -->
            </div>
            <!-- Inner Container End -->
                       
            <!-- Footer -->
            <div id="mws-footer">
            	<%fote%>
            </div>
            
        </div>
        <!-- Main Container End -->
        
    </div>

    <!-- JavaScript Plugins -->
    <script type="text/javascript" src="js/libs/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/libs/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="js/libs/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="custom-plugins/fileinput.js"></script>

    <!-- jQuery-UI Dependent Scripts -->
    <script type="text/javascript" src="jui/js/jquery-ui-1.9.0.min.js"></script>
    <script type="text/javascript" src="jui/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="jui/js/jquery.ui.touch-punch.js"></script>

    <!-- Plugin Scripts -->
    <script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/libs/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="plugins/flot/plugins/jquery.flot.tooltip.min.js"></script>
    <script type="text/javascript" src="plugins/flot/plugins/jquery.flot.pie.min.js"></script>
    <script type="text/javascript" src="plugins/flot/plugins/jquery.flot.stack.min.js"></script>
    <script type="text/javascript" src="plugins/flot/plugins/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>
    <script type="text/javascript" src="custom-plugins/wizard/wizard.min.js"></script>

    <!-- Core Script -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/core/mws.js"></script>

    <!-- Themer Script (Remove if not needed) -->
    <script type="text/javascript" src="js/core/themer.js"></script>

    <!-- Demo Scripts (remove if not needed) -->
    <script type="text/javascript" src="js/demo/demo.dashboard.js"></script>

</body>
</html>