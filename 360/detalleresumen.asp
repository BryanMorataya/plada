<!--#include file="includes/funciones.asp"-->
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	nunid = request.querystring("nuni")
    qmes  = request.querystring("nmes")
    qanio = request.querystring("nanio")
	DSN = "DBQ=" & Server.Mappath("liteg.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	strds2 = session("conec")
	Conn.Open strds2
    SQL = "select ichequeos.id as id1,ichequeos.unidad,ichequeos.fecha,ichequeosd.descripcion from ichequeos inner join ichequeosd on ichequeos.ncorre = ichequeosd.ncorre where month(fecha) = " & qmes & " and year(fecha) = " & qanio & " and valor = 1 and unidad = " & nunid & ";"
    SQL = "select * from ichequeos inner join ichequeosd on ichequeos.ncorre = ichequeosd.ncorre where month(fecha) = " & qmes & " and year(fecha) = " & qanio & " and valor = 1 and unidad = " & nunid & ";"
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
   
    <!-- Start Main Wrapper -->

    
    	<!-- Necessary markup, do not remove -->
        <!-- Sidebar Wrapper -->
        <!-- Main Container Start -->
        <div id="mws-container" class="clearfix">
        	<!-- Inner Container Start -->
            	<!-- Statistics Button Container -->
                <!-- Panels Start -->
               	 <div class="mws-panel grid_8">
                	<div class="mws-panel-header">
                    	<span><i class="icon-table"></i> Detalle de problemas reportados a travez del 360</span>
                    </div>
                    <div class="mws-panel-body no-padding">
                        <table class="mws-datatable-fn mws-table">
                            <thead>
                                <tr>
                                    <th>Unidad</th>
                                    <th>Fecha</th>
                                    <th>Descripcion</th>
                                </tr>
                            </thead>
                            <tbody>
                             <%
								Do while not RS.EOF
							 %>
                                <tr>
                                    <td><% = RS("unidad")%></td>
                                    <td><% = RS("fecha")%></td>
                                    <td><% = RS("descripcion")%></td>
                                </tr>
								<%
								RS.MoveNext
								loop
								%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Panels End -->
            <!-- Inner Container End -->
            <!-- Footer -->
        </div>
        <!-- Main Container End -->
        

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
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>

    <!-- Core Script -->
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/core/mws.js"></script>

    <!-- Themer Script (Remove if not needed) -->
    <script type="text/javascript" src="js/core/themer.js"></script>

    <!-- Demo Scripts (remove if not needed) -->
    <script type="text/javascript" src="js/demo/demo.table.js"></script>
</body>
</html>
