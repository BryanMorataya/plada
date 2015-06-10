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
    estapagina = 12
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
	StrParam = Request.QueryString("UserID")
	DSN = "DBQ=" & Server.Mappath("liteg.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
     DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	strds2 = session("conec")
    strds2 = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
     strds2 = session("conec")
	Conn.Open strds2
	SQL = "SELECT * FROM userw WHERE ID="&StrParam
	RS.Open SQL,Conn,3,1
	if Request.Form("Update") = "Actualizar" Then
		if Request.Form("FirstName") = "" Then
			Response.Redirect("error.asp?Error=First name can't be blank")
		End if
		if Request.Form("username") = "" Then
			Response.Redirect("error.asp?Error=user name can't be blank")
		End if
		if Request.Form("LastName") = "" Then
			Response.Redirect("error.asp?Error=First name can't be blank")
		End if
		if Request.Form("password") = "" Then
			Response.Redirect("error.asp?Error=Password can't be blank")
		End if
		FirstName =	Request.Form("FirstName")
		LastName = Request.Form("LastName")
		username = Request.Form("username")
		password = Request.Form("password")
		SQLUpdate = "UPDATE userw SET "
		SQLUpdate = SQLUpdate & "FirstName='"&Firstname 
		SQLUpdate = SQLUpdate & "', LastName='" & LastName
		SQLUpdate = SQLUpdate & "',username='" & username
		SQLUpdate = SQLUpdate & "',password='" & password
		SQLUpdate = SQLUpdate & "' WHERE ID=" & StrParam
        response.write sqlupdate
		Conn.execute SQLUpdate
		response.Redirect("dashboard.asp")
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
<link rel="stylesheet" type="text/css" href="plugins/ibutton/jquery.ibutton.css" media="screen" />

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
                    	<span>Edicion de usuarios</span>
                    </div>
                    <div class="mws-panel-body no-padding">
                    	<form class="mws-form" name="nveh" method="post" action="#">
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-5-8 alpha">
                                    <label class="mws-form-label">Nombre</label>
                                    <div class="mws-form-item large">
                                        <input id="FirstName" type="text" size="300" maxlength="150" name="FirstName" value="<% = RS("FirstName")%>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-3-8 omega">
                                    <label class="mws-form-label">Apellido</label>
                                    <div class="mws-form-item large">
                                       <input name="LastName" type="text" class="navlink10bl" id="LastName" value="<% = RS("LastName")%>">
                                    </div>
                                </div>                                
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">usuario</label>
                                    <div class="mws-form-item large">
                                        <input name="username" type="text" class="navlink10bl" id="username" value="<% = RS("username")%>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Contraseña</label>
                                    <div class="mws-form-item large">
                                        <input name="password" type="password" class="navlink10bl" id="password" value="<%  = RS("password")%>">
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Confirmar Contraseña</label>
                                    <div class="mws-form-item large">
                                    	<input name="confirmarPassword" type="password" class="navlink10bl" id="confirmarPassword" value="<%  = RS("password")%>">
                                   	</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">&nbsp;</label>
                                    <div class="mws-form-inline">
                                        <ul class="mws-form-list inline">
                                        	<li><input type="checkbox" id="mostrarPass" /> Mostrar Contraseña</li>
                                        </ul>
                                   	</div>
                                </div>
                            </div>                 
                    		<div class="mws-button-row">
                    			<input type="submit" name="Update" id="Update" value="Actualizar" class="btn btn-danger" />
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
    <script type="text/javascript" src="js/funciones.js"></script>
    <script type="text/javascript" src="js/libs/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="js/libs/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="custom-plugins/fileinput.js"></script>

    <!-- jQuery-UI Dependent Scripts -->
    <script type="text/javascript" src="jui/js/jquery-ui-1.9.0.min.js"></script>
    <script type="text/javascript" src="jui/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="jui/js/jquery.ui.touch-punch.js"></script>

    <script type="text/javascript" src="jui/js/globalize/globalize.js"></script>
    <script type="text/javascript" src="jui/js/globalize/cultures/globalize.culture.en-US.js"></script>

    <!-- Plugin Scripts -->
    <script type="text/javascript" src="custom-plugins/picklist/picklist.min.js"></script>
    <script type="text/javascript" src="plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>
    <script type="text/javascript" src="plugins/ibutton/jquery.ibutton.min.js"></script>
    <!-- Core Script -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/core/mws.js"></script>

    <!-- Themer Script (Remove if not needed) -->
    <script type="text/javascript" src="js/core/themer.js"></script>

    <!-- Demo Scripts (remove if not needed) -->
    <script type="text/javascript" src="js/demo/demo.formelements.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
			$("#confirmarPassword, #password").change(function(){
				if($("#confirmarPassword").val()==$("#password").val()){
					$("#confirmarPassword, #password").css("background-color","#FFF"); 
					$("#Update").fadeIn();
				}else{
					$("#confirmarPassword, #password").css("background-color","#ff9797"); 
					$("#Update").fadeOut();
				}
			});
		});
    </script>
</body>
<%End if%>
</html>
