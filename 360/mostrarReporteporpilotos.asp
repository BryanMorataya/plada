<html>
<head>
<%
Dim inicial,final,count,clasificacion
inicial = Request.QueryString("inicial")
final = Request.QueryString("final")
Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	
	DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	quev = session("empn")
	
		SQL="select pil.id,pil.nombre, (count(cheq.id))Total from pilotos pil inner join ichequeos cheq on pil.id=cheq.piloto and cheq.fecha between '"&inicial&"' and '"&final&"' group by pil.nombre"
	
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
				%>{Clasificacion: "<%=RS("nombre")%>",
                Cantidad: <%=RS("Total")%>,url:"mostrar360piloto.asp?inicial=<%=inicial%>%&final=<%=final%>&piloto=<%=RS("id")%>"}<%
				else
				%>,{Clasificacion: "<%=RS("nombre")%>",
                Cantidad: <%=RS("Total")%>,url:"mostrar360piloto.asp?inicial=<%=inicial%>%&final=<%=final%>&piloto=<%=RS("id")%>"}<%
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
				chart.addTitle("Reporte Pilotos", 16);
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