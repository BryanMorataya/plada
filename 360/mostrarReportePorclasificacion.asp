<html>
<head>
<%
Dim inicial,final,count,clasificacion
inicial = Request.QueryString("inicial")
final = Request.QueryString("final")
clasificacion = Request.QueryString("clasificacion")
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
	if flota="0" then
		SQL="select pregd.idpregunta,pregd.descripcionpregunta,count(pregd.idpregunta) errores from ichequeosd icheqd inner join ichequeos icheq inner join preguntad_360 pregd inner join preguntae_360 preg on icheq.fecha between '"&inicial&"' and '"&final&"' and icheq.ncorre=icheqd.ncorre and icheqd.valor>0 and icheqd.idpregunta=pregd.idpregunta and preg.descripcion = (select descripcion from preguntae_360 where posicion="&clasificacion&") and pregd.poscicion_encabezado=preg.posicion group by pregd.descripcionpregunta order by idpregunta;"
	else
		SQL="select pregd.idpregunta, pregd.descripcionpregunta, count(pregd.idpregunta) errores, icheq.unidad from ichequeosd icheqd inner join ichequeos icheq inner join preguntad_360 pregd inner join preguntae_360 preg inner join _vehiculos veh ON icheq.fecha between '"&inicial&"' and '"&final&"' and icheq.ncorre = icheqd.ncorre and icheqd.valor > 0 and icheqd.idpregunta = pregd.idpregunta and preg.descripcion = (select descripcion from preguntae_360 where posicion = "&clasificacion&") and pregd.poscicion_encabezado = preg.posicion and veh.empresap = '"&flota&"' and veh.codigo = icheq.unidad group by pregd.descripcionpregunta order by idpregunta;"
	end if
	RS.Open SQL,Conn,3,1
	count=0
%>
<link rel="stylesheet" href="ccs/style.css" type="text/css">
<script src="js/amcharts.js" type="text/javascript"></script>
<script type="text/javascript">
            var chart;
            var chartData = [
			<%While Not Rs.Eof%>
				<%if count=0 then
				%>{Clasificacion: "<%=RS("descripcionpregunta")%>".match(/.{1,34}/g).join("-\n"),
                Cantidad: <%=RS("errores")%>,url:"mostrarVehiculoConFalla.asp?flota=<%=flota%>&preg=<%=RS("idpregunta")%>&inicial=<%=inicial%>%&final=<%=final%>"}<%
				else
				%>,{Clasificacion: "<%=RS("descripcionpregunta")%>".match(/.{1,34}/g).join("-\n"),
                Cantidad: <%=RS("errores")%>,url:"mostrarVehiculoConFalla.asp?flota=<%=flota%>&preg=<%=RS("idpregunta")%>&inicial=<%=inicial%>%&final=<%=final%>"}<%
				end if%>
			<%
			count=count+1
			Rs.MoveNext      
				Wend
				Rs.Close%>];
            AmCharts.ready(function () {
                // PIE CHART
                chart = new AmCharts.AmPieChart();
                // title of the chart
				chart.addTitle("Fallas por Clasificacion", 16);
                chart.dataProvider = chartData;
                chart.titleField = "Clasificacion";
                chart.valueField = "Cantidad";
				chart.urlField="url";
				chart.urlTarget="_self";
                chart.sequencedAnimation = true;
                chart.startEffect = "elastic";
                chart.innerRadius = "30%";
                chart.startDuration = 2;
                chart.labelRadius = 15;
                // the following two lines makes the chart 3D
                chart.depth3D =10;
                chart.angle = 25;
                // WRITE                                 
                chart.write("chartdiv");
            });
        </script>
</head>
<body>
        <div id="chartdiv" style="width:100%; height:100%; color:#FFF;">
        </div>
    </body>
</html>