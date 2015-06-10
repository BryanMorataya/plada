<html>
<head>
<meta charset="iso-8859-1/utf-8" />
<%
Dim inicial,final,count
inicial = Request.QueryString("inicial")
final = Request.QueryString("final")
flota = request.QueryString("flota")
Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	
	DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	quev = session("empn")
	finicial=split(inicial,"/")
	inicial=finicial(2)&finicial(0)&finicial(1)
	ffinal=split(final,"/")
	final=ffinal(2)&ffinal(0)&ffinal(1)
	if flota="0" then
		SQL="select preg.id,preg.descripcion,count(preg.id) errores from ichequeosd icheqd inner join (select id,fecha from ichequeos where fecha between '"&inicial&"' and '"&final&"') icheq inner join preguntad_360 pregd inner join preguntae_360 preg on icheq.id=icheqd.idIchequeos and icheqd.valor>0 and icheqd.idPregunta=pregd.id and pregd.idPreguntae=preg.id group by preg.descripcion order by id;"
	else
		SQL="select preg.id, preg.descripcion, count(preg.id) errores from ichequeosd icheqd inner join (select id, fecha, unidad from ichequeos where fecha between '"&inicial&"' and '"&final&"') icheq inner join preguntad_360 pregd inner join preguntae_360 preg inner join _vehiculos veh ON icheq.id = icheqd.idIchequeos and icheqd.valor > 0 and icheqd.idPregunta = pregd.id and pregd.idPreguntae = preg.id and veh.empresap = '"&flota&"' and veh.codigo = icheq.unidad group by preg.descripcion order by id;"
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
				%>{Clasificacion: "<%=RS("descripcion")%>".match(/.{1,34}/g).join("-\n"),
                Cantidad: <%=RS("errores")%>,url:"mostrarReportePorclasificacion.asp?clasificacion=<%=RS("id")%>&inicial=<%=inicial%>&final=<%=final%>&flota=<%=flota%>"}<%
				else
				%>,{Clasificacion: "<%=RS("descripcion")%>".match(/.{1,34}/g).join("-\n"),
                Cantidad: <%=RS("errores")%>,url:"mostrarReportePorclasificacion.asp?clasificacion=<%=RS("id")%>&inicial=<%=inicial%>&final=<%=final%>&flota=<%=flota%>"}<%
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
				chart.addTitle("Clasificacion de Fallas", 16);
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
			function handleClick(){}
        </script>
</head>
<body style="background-color:transparent;">
    <div id="chartdiv" style="width:100%; height:100%;">	
    </div>
</body>
</html>