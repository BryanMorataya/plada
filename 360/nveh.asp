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
    estapagina = 2
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Plugin Stylesheets first to ease overrides -->
<link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css" media="screen" />
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
                    	<span>Ingreso de nuevos vehiculos</span>
                    </div>
                    <div class="mws-panel-body no-padding">
                    	<form class="mws-form" name="nveh" method="post" action="addveh.asp">
                        	<div class="mws-form-inline">
                                <div class="mws-form-row">
                                    <label class="mws-form-label">Numero de placa</label>
                                    <div class="mws-form-item large">
                                    	<div class="mws-form-cols clearfix">
                                            <div class="mws-form-col-2-8 alpha">
                                                <div class="mws-form-item">
                                                    <input id="codigo" type="text" name="codigo" maxlength="50" />
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
                                        <input id="descrip" type="text" size="300" maxlength="150" name="descrip" value="na"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-3-8 omega">
                                    <label class="mws-form-label">Kilometraje</label>
                                    <div class="mws-form-item large">
                                        <input id="Text4" type="text" size="15" name="kmi" value="0" />
                                    </div>
                                </div>                                
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Numero de motor</label>
                                    <div class="mws-form-item large">
                                        <input id="motor" type="text" size="150" maxlength="75" name="motor" value="na"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Numero de chassis</label>
                                    <div class="mws-form-item large">
                                        <input id="cha" type="text" maxlength="75" name="cha" value="na" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Numero de placa</label>
                                    <div class="mws-form-item large">
                                        <input id="placa" type="text" maxlength="50" name="placa" value="na"/>
                                    </div>
                                </div>
                                 <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Cuenta contable</label>
                                    <div class="mws-form-item large">
                                        <input id="Text3" type="text" size="15" name="ccontable" value="na" />
                                    </div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Tipo de motor</label>
                                    <div class="mws-form-item clearfix">
                    					<select id="tmotor" name="tmotor">
                    						 <%etmotor  %>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Tipo de caja</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="tcaja" name="tcaja">
                    						<%ticaja  %>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Tipo de diferencial</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="tdiferen" name="tdiferen">
                    						<%tidifer  %>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label class="mws-form-label">Tipo de vehiculo</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="tveh" name="tveh">
                    						 <%tipovehiculo%>
                    					</select>
                    				</div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Ultimo servicio</label>
                                    <div class="mws-form-item large">
                                        <input id="uservicio" type="text" maxlength="25" name="uservicio" value = "0" />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Km entre servicios</label>
                                    <div class="mws-form-item large">
                                        <input id="dservicio" type="text" maxlength="25" name="dservicio" value = '0' />
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Marca</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="marca" type="text" maxlength="50" name="marca" value="na">
                    						<%lmarcas %>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label class="mws-form-label">Modelo</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="Text2" type="text" size="15" maxlength="50" name="modelo" value="na" />
                    				</div>
                                </div>
                            </div> 
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Ejes delanteros</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="ejed" name="ejed">
                                            <option value = "0">0</option>
                    						<option value = "1">1</option>
                                            <option value = "2">2</option>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Ejes traseros</label>
                                     <div class="mws-form-item clearfix">
                    					<select id="ejet" name="ejet">
                                            <option value = "0">0</option>
                    						<option value = "1">1</option>
                                            <option value = "2">2</option>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Telefono(Jefe de Apoyo)</label>
                                     <div class="mws-form-item clearfix">
                    					<input type="text" id="patin" name="patin">
                    						 
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Eje o sector</label>
                                    <div class="mws-form-item clearfix">
                    					<select id="sect" name="sect">
                                        <option value = "3">3</option>
                                        <option value = "5">5</option>
                    					</select>
                    				</div>
                                </div>
                            </div> 
                            <div class="mws-form-cols clearfix">
                                <div class="mws-form-col-8-8">
                                    <label class="mws-form-label">Correo de notificacion</label>
                                     <div class="mws-form-item clearfix">
                    					<input id="correon" type="text" size="15" maxlength="50" name="correon" class="tags" />
                    				</div>
                                    
                                </div>
                            </div>
                        	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Departamento Asignado</label>
                                    <div class="mws-form-item clearfix">
                    					<select id="emprep" name="emprep">
                    						<%llenaFlota %>
                    					</select>
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Demarcacion</label>
                                    <div class="mws-form-item clearfix">
                    					<input id="ruta" name="ruta" type="text"/>
                    					
                    				</div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Parqueo Asignado</label>
                                    <div class="mws-form-item clearfix">
                    					<input id="predio" name="predio" type="text">
                                         
                    				</div>
                                </div>
                            </div>    
                    		<div class="mws-button-row">
                    			<input type="submit" value="Grabar" class="btn btn-primary" />
                    			<input type="reset" value="Limpiar" class="btn btn-Yellow" />
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
	<script type="text/javascript" src="js/jquery.tagsinput.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
			$('.tags').tagsInput();
		});
    </script>
</body>
</html>
