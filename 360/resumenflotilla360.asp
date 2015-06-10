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
    estapagina = 10
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
if Session("Good") = False or IsNull (Session("Good")) = True then
Response.Redirect("login.asp")
end if
Dim Conn 
Dim RS   
Dim SQL  
Dim DSN  
 dim miBus

DSN = session("conec")
Set RS = Server.CreateObject("ADODB.Recordset")
Set Conn = Server.CreateObject("ADODB.Connection")
%>
<script type="text/javascript" language="javascript">
    function buscarBus() {
        var fecha = document.getElementById('date').value;
        var dia = fecha.split("/");
        //location.href = "?bus=" + document.getElementById('bus').value + "&dia="+ dia[0] +"&mes="+ dia[1]+"&anio="+ dia[2]+"";
        //
        document.getElementById('ifreme').innerHTML = "";
        var contenedor = document.getElementById('ifreme');
        var ifremenew = document.createElement('div');
        ifremenew.innerHTML = "<iframe src='mostrarResumen360f.asp?mes=" + dia[1] + "&year=" + dia[2] + "' style='width:925px; height:1025px; border: none;'></iframe>";
        contenedor.appendChild(ifremenew);
    }
</script>
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Plugin Stylesheets first to ease overrides -->
<link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="plugins/imgareaselect/css/imgareaselect-default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css" href="custom-plugins/picklist/picklist.css" media="screen" />
<link rel="stylesheet" type="text/css" href="plugins/select2/select2.css" media="screen" />
<link rel="stylesheet" type="text/css" href="plugins/ibutton/jquery.ibutton.css" media="screen" />
<link rel="stylesheet" type="text/css" href="plugins/cleditor/jquery.cleditor.css" media="screen" />

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
<link rel="stylesheet" type="text/css" href="jui/css/jquery.ui.timepicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="jui/jquery-ui.custom.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/mws-theme.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/themer.css" media="screen" />

<link href="includes/descripcion.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery/jquery.gallerax-0.2.js"></script>
<link href="includes/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.min.js"></script>
<script src="jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.js"></script>
<script type="text/javascript">
    function setcolor(idtd, apli) {
        if (apli == 1) {
            document.getElementById(idtd).style.background = "RED"
        } else {
            document.getElementById(idtd).style.background = "Green"
        }
    }
</script>
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
                  <div class="mws-panel-body no-padding">
                    	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Fecha del reporte</label>
                                    <div class="mws-form-item large">
                                       <input type='text' class="mws-datepicker" readonly="readonly" name='fecha' id='date' value="<%=date %>"/>
                                    </div>
                                </div>
                        </div>                    
                  </div> 
                                
                  <div class="mws-panel grid_8 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header" >
                    	<span>Reporte de 360 por flotilla</span>
                    </div>
                     <div class="mws-panel-body" id="ifreme">
                     </div>
                  </div>  
                  <div class="clear"></div>
                 <div class="mws-button-row">
                    <input type="button" id="BtnBuscarBus" value="Buscar" onclick="buscarBus();" class="btn btn-danger" />
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
    <script type="text/javascript" src="jui/js/jquery-ui-1.9.0.js"></script>
    <script type="text/javascript" src="jui/js/timepicker/jquery-ui-timepicker.min.js"></script>
    <script type="text/javascript" src="jui/js/globalize/globalize.js"></script>
    <script type="text/javascript" src="jui/js/globalize/cultures/globalize.culture.en-US.js"></script>

    <!-- Plugin Scripts -->
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>
    <script type="text/javascript" src="plugins/imgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="plugins/jgrowl/jquery.jgrowl-min.js"></script>
    <script type="text/javascript" src="custom-plugins/picklist/picklist.min.js"></script>
    <script type="text/javascript" src="plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="plugins/ibutton/jquery.ibutton.min.js"></script>
    <script type="text/javascript" src="plugins/cleditor/jquery.cleditor.min.js"></script>
    <script type="text/javascript" src="plugins/cleditor/jquery.cleditor.table.min.js"></script>
    <script type="text/javascript" src="plugins/cleditor/jquery.cleditor.xhtml.min.js"></script>
    <script type="text/javascript" src="plugins/cleditor/jquery.cleditor.icon.min.js"></script>

    <!-- Core Script -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/core/mws.js"></script>

    <!-- Themer Script (Remove if not needed) -->
    <script type="text/javascript" src="js/core/themer.js"></script>

    <!-- Demo Scripts (remove if not needed) -->
   <script type="text/javascript" src="js/demo/demo.widget.js"></script>
       <script type="text/javascript" src="js/demo/demo.formelements.js"></script>
</body>
 <script type="text/javascript">
     $(document).ready(function () {
         $("#accordion").accordion();

     });
  </script>
<script languaje="text/javascript">
    var date = new Date()
    var year = date.getFullYear();
    var month = date.getMonth();
    var date = date.getDate();
    if (month == 0) { var mes = "1" }
    if (month == 1) { var mes = "2" }
    if (month == 2) { var mes = "3" }
    if (month == 3) { var mes = "4" }
    if (month == 4) { var mes = "5" }
    if (month == 5) { var mes = "6" }
    if (month == 6) { var mes = "7" }
    if (month == 7) { var mes = "8" }
    if (month == 8) { var mes = "9" }
    if (month == 9) { var mes = "10" }
    if (month == 10) { var mes = "11" }
    if (month == 11) { var mes = "12" }
    var fecha = date + "/" + mes + "/" + year
    document.getElementById('date').value = fecha
</script>
</html>
