<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->
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

<title>MWS Admin - Table</title>

</head>

<%
Dim count
flota = Request.QueryString("flota")

Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	
	DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	quev = session("empn")
	      if flota >0 then
	     SQL="select veh.id,veh.codigo,veh.descripcion,veh.placa,flo.nombre from _vehiculos veh inner join flotilla flo where veh.empresap=flo.id and  empresap="&flota&" "
		else
		SQL="select veh.id,veh.codigo,veh.descripcion,veh.placa,flo.nombre from _vehiculos veh inner join flotilla flo where veh.empresap=flo.id"
		end if
	RS.Open SQL,Conn,3,1
	count=0
%>
<body style="background-color:transparent;">
    <div id="chartdiv" style="width:100%; height:100%;">	
    <div class="mws-panel-body no-padding">
    	<table  class="mws-table">
        <thead><tr><th>codigo</th><th>Descripcion</th><th>placa</th><th>Comisaria</th></tr></thead>
    	<%While Not Rs.Eof%>
        <tr id="<%=RS("id")%>">
        	<td><%=RS("codigo")%></td>
            <td><%=RS("descripcion")%></td>
            <td><%=RS("placa")%></td>
            <td><%=RS("nombre")%></td>
        </tr>
		<%
        count=count+1
        Rs.MoveNext      
            Wend
            Rs.Close%>
       </table>
       </div>
    </div>
</body>
    <!-- JavaScript Plugins -->
    <script type="text/javascript" src="js/libs/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/funciones.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
			$("tr").click(function(){
				var fecha;
				var bus;
				$("td").each(function(index){
					if(index==0){fecha=$(this).html();}
					if(index==1){bus=$(this).html();}
				});
				//top.location.href="resumen360.asp?bus="+this.id+"&fecha="+fecha+"";
			});
		});
    </script>
</html>