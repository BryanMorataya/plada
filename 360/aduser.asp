<!--#include file="includes/funciones.asp"-->
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 14
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	Dim StrParam '
	if Request.Form("Update") = "agregar" Then
      	if Request.Form("FirstName") = "" Then
			Response.Redirect("error.asp?Error=nombre no puede estar en blanco")
		End if
		if Request.Form("username") = "" Then
			Response.Redirect("error.asp?Error=usuario no puede estar en blanco")
		End if
		if Request.Form("LastName") = "" Then
			Response.Redirect("error.asp?Error=nombre no puede estar en blanco")
		End if
		if Request.Form("password") = "" Then
			Response.Redirect("error.asp?Error=Password no puede estar en blanco")
		End if
		vFirstName =	Request.Form("FirstName")
		vLastName = Request.Form("LastName")
		vusername = Request.Form("username")
		vpassword = Request.Form("password")
        vknivel   = request.form("catniv")
        vagencia = request.form("sect")
        vempresa = request.form("empresa")  
        vlprov = request.form("lprov")
		flota = request.Form("flotilla")
        vknivel   = 1
 '       vagencia = 1
        vempresa = 23
        vrol = request.form("rol")
        Set RS = Server.CreateObject("ADODB.Recordset")
	    Set Conn = Server.CreateObject("ADODB.Connection")
	    strds2 = session("conec")
        strds2 = session("conec")
	    Conn.Open strds2
        vfe2 = year(date())&"-"&month(date())&"-"&day(date())
        sqladd = "insert into userw (username,password,firstname,lastname,nnivel,idagencia,nempresa,nrol,lprov,flotilla) "
        sqladd = sqladd & "values ('"&vusername&"','"&vpassword&"','"&vFirstName&"','"&vLastName&"',"&vknivel&","&vagencia&","&vempresa&","&vrol&","&vlprov&","&flota&")"
		RESPONSE.WRITE SQLADD
	   Conn.execute sqladd
		response.Redirect("viewuser.asp")
	 Else 
%>
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Plugin Stylesheets first to ease overrides -->
<link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />

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
          
                
                <!-- Panels Start -->
             	<div class="mws-panel grid_8">
                	<div class="mws-panel-header">
                    	<span>Ingreso de nuevos Usuarios</span>
                    </div>
                    <div class="mws-panel-body no-padding">
                    	<form class="mws-form" name="nveh" method="post" action="#">
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-4-8 alpha">
                                    <label class="mws-form-label">Nombre</label>
                                    <div class="mws-form-item large">
                                        <input name="FirstName" type="text" class="navlink10bl" id="FirstName" />
                                    </div>
                                </div>
                            </div>
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-4-8 alpha">
                                    <label class="mws-form-label">Apellido</label>
                                    <div class="mws-form-item large">
                                        <input name="LastName" type="text" class="navlink10bl" id="LastName" />
                                    </div>
                                </div>
                            </div>  
                         	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Usuario</label>
                                    <div class="mws-form-item large">
                                        <input name="username" type="text" class="navlink10bl" id="username" />
                                    </div>
                                </div>
                            </div>                             
                         	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Password</label>
                                    <div class="mws-form-item large">
                                        <input name="password" type="password" class="navlink10bl" id="password" />
                                    </div>
                                </div>
                            </div>  
                          	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Rol</label>
                                    <div class="mws-form-item large">
                                        <select id="rol" name="rol">
                                            <%roles%>
                                        </select>
                                    </div>
                                </div>
                            </div> 
                          	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Nit</label>
                                    <div class="mws-form-item large">
                                              <select id="lprov" name="lprov">
                                                 <option selected="selected" value = "0">No aplica</option>
                                                  <%lproves%>
                                              </select>
                                    </div>
                                </div>
                            </div>                             
                         	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Sector</label>
                                    <div class="mws-form-item large">
                                       <select id="sect" name="sect">
                                                 <option value = "1">Multieje</option>
                                                 <option value = "3">3</option>
                                                 <option value = "5">5</option>
                                       </select>
                                    </div>
                                </div>
                            </div>  
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-col-3-8 alpha">
                                    <label class="mws-form-label">Flotilla</label>
                                    <div class="mws-form-item large">
                                       <select id="flotilla" name="flotilla">
                                        <%llenaFlota%>
                                       </select>
                                    </div>
                                </div>
                            </div>                           
                                                                                                                                 
                    		<div class="mws-button-row">
                    			<input name="Update" type="submit" class="btn btn-danger" id="Update" value="agregar"> 
                    		</div>
                        </form>
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
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>

    <!-- Core Script -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/core/mws.js"></script>

    <!-- Themer Script (Remove if not needed) -->
    <script type="text/javascript" src="js/core/themer.js"></script>

    <!-- Demo Scripts (remove if not needed) -->

</body>
</html>
<%End if%>