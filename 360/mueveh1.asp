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
    estapagina = 3
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
	Dim StrParam 
	StrParam = Request.querystring("vehID")
	DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	SQL = "SELECT *, nom.nombre empsaNombre FROM _vehiculos veh, empresas nom WHERE veh.ID='"&StrParam&"' and veh.empresas=nom.id"
	SQL = "SELECT * FROM _vehiculos WHERE codigo='"&StrParam&"'"
    RS.Open SQL,Conn,3,1
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
                    	<span>Busqueda de Vehiculos</span>
                        
                    </div>
                    <div class="mws-panel-body no-padding">
                    	<form class="mws-form" name="nveh" method="post" action="bveh.asp">
                        	<div class="mws-form-inline">
                                <div class="mws-form-row">
                                    <label class="mws-form-label">Codigo del vehiculo</label>
                                    <div class="mws-form-item large">
                                    	<div class="mws-form-cols clearfix">
                                            <div class="mws-form-col-2-8 alpha">
                                                <div class="mws-form-item">
                                                    <input id="codigo" type="text" name="codigo" maxlength="50" readonly="readonly" value = "<%=rs("codigo") %>"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-5-8 alpha">
                                    <label class="mws-form-label">Descripcion</label>
                                    <div class="mws-form-item large">
                                        <input id="descrip" type="text" size="300" maxlength="150" name="descrip" readonly="readonly" value = "<%=rs("descripcion") %>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-3-8 omega">
                                    <label class="mws-form-label">Kilometraje</label>
                                    <div class="mws-form-item large">
                                        <input id="Text4" type="text" size="15" name="kmi" readonly="readonly" value = "<%=rs("kma") %>" />
                                    </div>
                                </div>                                
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Numero de motor</label>
                                    <div class="mws-form-item large">
                                        <input id="motor" type="text" size="150" maxlength="75" name="motor" readonly="readonly" value = "<%=rs("motor") %>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Numero de chassis</label>
                                    <div class="mws-form-item large">
                                        <input id="cha" type="text" maxlength="75" name="cha" readonly="readonly" value = "<%=rs("cha") %>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Numero de placa</label>
                                    <div class="mws-form-item large">
                                        <input id="placa" type="text" maxlength="50" name="placa" readonly="readonly" value = "<%=rs("placa") %>"/>
                                    </div>
                                </div>
                                 <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Cuenta contable</label>
                                    <div class="mws-form-item large">
                                        <input id="Text3" type="text" size="15" name="ccontable" readonly="readonly" value = "<%=rs("ccontable") %>" />
                                    </div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Tipo de motor</label>
                                    <div class="mws-form-item clearfix">
                    					 <input id="tmotor0" type="text" size="15" readonly="readonly" maxlength="75" name="tmotor0" value = "<%=rs("tmotor") %>" />
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Tipo de caja</label>
                                     <div class="mws-form-item clearfix">
                    					 <input id="tcaja" type="text" maxlength="75" readonly="readonly" name="tcaja" value = "<%=rs("tcaj") %>" />
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Tipo de diferencial</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="tdiferen" type="text" maxlength="75" readonly="readonly" name="tdiferen" value = "<%=rs("tdiferen")%>" size="15"/>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label class="mws-form-label">Tipo de vehiculo</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="tvehic" type="text" maxlength="75" readonly="readonly" name="tvehic" value = "<%tipovehd rs("tveh")%>" size="15"/>
                    				</div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Ultimo servicio</label>
                                    <div class="mws-form-item large">
                                        <input id="uservicio" type="text" maxlength="25" name="uservicio" readonly="readonly" value = "<%=rs("uservicio")%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Km entre servicios</label>
                                    <div class="mws-form-item large">
                                        <input id="dservicio" type="text" maxlength="25" name="dservicio" readonly="readonly" value = "<%=rs("xservicio")%>" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Marca</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="marca" type="text" maxlength="50" readonly="readonly" name="marca" value = "<%=rs("marca") %>"/>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label class="mws-form-label">Modelo</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="Text2" type="text" size="15" maxlength="50" name="modelo" readonly="readonly" value = "<%=rs("modelo") %>"  />
                    				</div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Ejes delanteros</label>
                                     <div class="mws-form-item clearfix">
                                       <input id="ejed" type="text" size="15" maxlength="50" name="ejed" readonly="readonly" value = "<%=rs("cejed") %>"  />
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Ejes traseros</label>
                                     <div class="mws-form-item clearfix">
                    					  <input id="ejet" type="text" size="15" maxlength="50" name="ejet" readonly="readonly" value = "<%=rs("cejet") %>"  />
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Correo de notificacion</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="correon" type="text" size="15" readonly="readonly" maxlength="50" name="correon" value = "<%=rs("nparte1") %>" />
                    				</div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Departamento</label>
                                    <div class="mws-form-item clearfix">
                    				  <input id="emprep" type="text" size="15" readonly="readonly" maxlength="50" name="emprep" value = "<%llenaFlotad rs("empresap") %>" />
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Predio asignado</label>
                                    <div class="mws-form-item clearfix">
                    					 <input id="predioa" type="text" size="15" readonly="readonly" maxlength="50" name="predioa" value = "<%=rs("predio") %>" />
                    				</div>
                                </div>
                            </div>    
                    		<div class="mws-button-row">
                    			<input type="submit" value="Buscar otro" class="btn btn-info" />
                                <!--<a href="editveh.asp?vehID=<%= RS("codigo")%>" class="btn btn-danger">Editar</a>-->
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
