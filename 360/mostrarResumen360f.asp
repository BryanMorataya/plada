<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--#include file="includes/funciones.asp"-->
<!--#include file="includes/clsTreeView.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
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

Dim Conn 
Dim RS   
Dim SQL  
Dim SQL2
Dim DSN  
dim bus
dim mes
dim year
DSN = session("conec")
Set RS = Server.CreateObject("ADODB.Recordset")
Set RS2 = Server.CreateObject("ADODB.Recordset")
Set Conn = Server.CreateObject("ADODB.Connection")
mes = Request.QueryString("mes")
anio = Request.QueryString("year")
Conn.Open DSN
SQL = "select ichequeos.id as id1,ichequeos.unidad,ichequeos.fecha,ichequeosd.descripcion from ichequeos inner join ichequeosd on ichequeos.ncorre = ichequeosd.ncorre where month(fecha) = " & mes & " and year(fecha) = " & anio & " and valor = 1 group by unidad;"
RS.Open SQL,Conn,3,1
%>

<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Reporte de Bus 360</title>
<link rel="stylesheet" type="text/css" href="includes/android.css">
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="includes/descripcion.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery/jquery.gallerax-0.2.js"></script>
<link href="includes/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="jquery/jquery.min.js"></script>
<script src="jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.min.js"></script>
<script type="text/javascript" src="jQuery/glDatePicker.js"></script>
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

<style type="text/css">
@import "gallery.css";
    .style1{
        width: 196px;
    }
    .style2{
        width: 164px;
    }
    .tabla{
        border-collapse: collapse;
    }
    .tabla tr{
        
    }
    .tabla tr td{
        padding-left:3px;
        padding-right:3px;
       /*background-color:#424242;
        background-image:url(images/grd_head.png);*/
        background-repeat:repeat-x;
        border:1px solid #000;
        font-size:0.700em;
        /*olor:#fff;*/
        font-weight:bold;
        text-align:center;
    }
	div#TreeView1 a{color:blue;font-family:verdana;font-size:10pt;}
	div#TreeView1 a:link{text-decoration:none;}
	div#TreeView1 a:hover{text-decoration:underline;}
	div#TreeView1 a:visited{text-decoration:none;}
	td{
    height:19px;
    width:16px;
    }
</style>
<style type="text/css">
		.tooltip {
			border-bottom: 1px dotted #000000; color: #000000; outline: none;
			cursor: help; text-decoration: none;
			position: relative;
			border:none;
		}
		.tooltip .ver {
			margin-left: -999em;
			position: absolute;
		}
		.tooltip:hover .ver {
			border-radius: 5px 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; 
			box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1); -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1); -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
			font-family: Calibri, Tahoma, Geneva, sans-serif;
			position: absolute; left: 1em; top: 2em; z-index: 99;
			margin-left: 15px; width: 200px;
			margin-top:-5px;
		}
		.tooltip .ver1 {
			margin-left: -999em;
			position: absolute;
		}
		.tooltip:hover .ver1 {
			border-radius: 5px 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; 
			box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1); -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1); -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);
			font-family: Calibri, Tahoma, Geneva, sans-serif;
			position: absolute; left: 1em; top: 2em; z-index: 99;
			margin-left: -240px; width: 200px;
			margin-top:-10px;
		}
		.tooltip:hover .img {
			border: 0; margin: -10px 0 0 -55px;
			float: left; position: absolute;
			
		}
		.tooltip:hover em {
			font-family: Candara, Tahoma, Geneva, sans-serif; font-size: 1.2em; font-weight: bold;
			display: block; padding: 0.2em 0 0.6em 0;
		}
		.classic { padding: 0.8em 1em; }
		.custom { padding: 0.5em 0.8em 0.8em 2em; }
		* html a:hover { background: transparent; }
		.classic {background: #FFFFAA; border: 1px solid #FFAD33; }
		.critical { background: #FFCCAA; border: 1px solid #FF3334;	}
		.help { background: #9FDAEE; border: 1px solid #2BB0D7;	}
		.info { background: #9FDAEE; border: 1px solid #2BB0D7;	}
		.warning { background: #FFFFAA; border: 1px solid #FFAD33; }
		</style>
</head>
<body>
    <div class="mws-stat-container clearfix">
    <%
            While Not RS.eof
                  SQL2 = "select id,codigo from vehiculos where id = " & rs("unidad") & ""
                  RS2.Open SQL2,Conn,3,1
            
    %>
        <a class="mws-stat" href="detalleresumen2.asp?nuni=<%= rs("unidad")%>&nmes=<%= mes%>&nanio=<%= anio%>">
                    	<!-- Statistic Icon (edit to change icon) -->
                    	<span class="mws-stat-icon icol32-lorry"></span>
                        
                        <!-- Statistic Content -->
                        <span class="mws-stat-content">
                        	<span class="mws-stat-title">Unidad con fallas</span>
                            <span class="mws-stat-value"> <%= RS2("codigo")%> </span>
                        </span>
         </a>
	<%
        RS2.CLOSE
        RS.Movenext
        Wend
    %>
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
 <script type="text/javascript">
     $(document).ready(function () {
         $("#accordion").accordion();

     });
    <%
            While Not RS.eof
    %>
    //alert('<%=RS("td")%>'+' - ' +'<%=RS("valor")%>');
	contenedor= document.getElementById('<%=RS("td")%>');
	if(contenedor != null) {
   var valor ='<%=RS("valor")%>';
       
            if(valor==1){
            if('<%=RS("dia")%>'>22){
                if('<%= RS("descripcion")%>'==""){
                    document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/close.png'/>";
                }else{
                    document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/close.png'/> <span class='custom critical ver1'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                }
            }else{
                if('<%= RS("descripcion")%>'==""){
                    document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/close.png'/>";
                }else{
                    document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/close.png'/> <span class='custom critical ver'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                }  
            }
            }
            if(valor==0){document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/check.png'/>";}
            if(valor==0 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){
                if('<%=RS("dia")%>'>22){ 
                    if('<%= RS("descripcion")%>'==""){
                        document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/mal.png' width='16' height='16'/>";
                    }else{
                        document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/mal.png' width='16' height='16'/> <span class='custom critical ver1'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                    }            
                }else{
                    if('<%= RS("descripcion")%>'==""){
                        document.getElementById('<%=RS("td")%>').innerHTML = "<img src='images/mal.png' width='16' height='16'/>";
                    }else{
                        document.getElementById('<%=RS("td")%>').innerHTML = "<a class='tooltip' href='#'><img src='images/mal.png' width='16' height='16'/> <span class='custom critical ver'><img src='images/Critical.png' alt='Error' height='48' width='48' class='img' /><em>Descripcion</em>"+'<%= RS("descripcion")%>'+"</span></a>";
                    }
                }
             }  
             if(valor==1 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){document.getElementById('<%= RS("td")%>').innerHTML = "<img src='images/normal.png' height=16 width=16/>";}  
             if(valor==2 && ('<%= RS("idpregunta")%>'=='pi1' || '<%= RS("idpregunta")%>'=='pi2' || '<%= RS("idpregunta")%>'=='pi3' || '<%= RS("idpregunta")%>'=='pi4' || '<%= RS("idpregunta")%>'=='pi5' || '<%= RS("idpregunta")%>'=='pi6' || '<%= RS("idpregunta")%>'=='pi7' || '<%= RS("idpregunta")%>'=='pi8')){document.getElementById('<%= RS("td")%>').innerHTML = "<img src='images/bien.png' height=16 width=16/>";}
    }
	<%
        RS.Movenext
        Wend
    %>
    document.getElementById('accordion').style.display = '';
</script>
</html>
