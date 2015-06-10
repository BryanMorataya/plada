<html>
<head>
<meta charset="iso-8859-1/utf-8" />
<%
Dim inicial,final,count
inicial = Request.QueryString("inicial")
final = Request.QueryString("final")

Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	
	DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set RS1 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	
	finicial=split(inicial,"/")
	inicial=finicial(2)&finicial(0)&finicial(1)
	ffinal=split(final,"/")
	final=ffinal(2)&ffinal(0)&ffinal(1)
	
		SQL="select count(id) pilotos from pilotos where  id in(select cheq.piloto from ichequeos cheq where cheq.fecha between '"&inicial&"' and '"&final&"' group by cheq.piloto)"
	
		SQL1="select count(id) pilotos from pilotos where not id in(select cheq.piloto from ichequeos cheq where cheq.fecha between '"&inicial&"' and '"&final&"' group by cheq.piloto)"
	
	RS.Open SQL,Conn,3,1
	RS1.Open SQL1,Conn,3,1
	count=0
%>
<link rel="stylesheet" href="ccs/style.css" type="text/css">
<script src="js/amcharts.js" type="text/javascript"></script>
<script type="text/javascript">
            var chart;
					
            var chartData = [
			<% %>
				<%
				%>{Clasificacion: "Si Han Ingresado 360",
                Cantidad: <%=RS("pilotos")%>,url:"mostrarReporteporpilotos.asp?inicial=<%=inicial%>&final=<%=final%>"}<%
				
				%>,{Clasificacion: "No Han Ingresado 360",
                Cantidad: <%=RS1("pilotos")%>,url:"mostrar360piloto1.asp?inicial=<%=inicial%>&final=<%=final%>"}<%
				%>
			<%
			
				Rs.Close 
			    Rs1.Close %>];


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
			function handleClick(){}
        </script>
</head>
<body style="background-color:transparent;">
    <div id="chartdiv" style="width:100%; height:100%;">	
    </div>
</body>
</html>