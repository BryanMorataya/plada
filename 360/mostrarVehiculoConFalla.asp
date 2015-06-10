<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="es"><!--<![endif]-->
<head>
<meta charset="utf-8" />

<!-- Viewport Metatag -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<!-- Plugin Stylesheets first to ease overrides -->
<link rel="stylesheet" type="text/css" href="plugins/colorpicker/colorpicker.css" media="screen" />
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
<link rel="stylesheet" type="text/css" href="jui/jquery-ui.custom.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/mws-theme.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/themer.css" media="screen" />
<title></title>
<!-- JavaScript Plugins -->
    <script type="text/javascript" src="js/libs/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/funciones.js"></script>
	<script type="text/javascript" src="js/libs/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="js/libs/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="custom-plugins/fileinput.js"></script>

    <!-- jQuery-UI Dependent Scripts -->
    <script type="text/javascript" src="jui/js/jquery-ui-1.9.0.js"></script>
    <script type="text/javascript" src="jui/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="jui/js/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="jui/js/timepicker/jquery-ui-timepicker.min.js"></script>

    <!-- Plugin Scripts -->
    <script type="text/javascript" src="plugins/imgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="plugins/jgrowl/jquery.jgrowl-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>
    <script type="text/javascript" src="plugins/colorpicker/colorpicker-min.js"></script>
    <script type="text/javascript" src="plugins/validate/jquery.validate-min.js"></script>
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
	 <!-- Demo Scripts (remove if not needed) -->
    <script type="text/javascript" src="js/demo/demo.formelements.js"></script>
</head>

<%
Dim inicial,final,count
inicial = Request.QueryString("inicial")
final = Request.QueryString("final")
flota = request.QueryString("flota")
idpreg= request.QueryString("preg")

Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	
	DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set RS1 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	quev = session("empn")
	SQL1="select descripcionpregunta from preguntad_360 where idpregunta='"&idpreg&"';"
	RS1.Open SQL1,Conn,3,1
	descripcionpreg=rs1("descripcionpregunta")
	if flota="0" then
		SQL="select icheqd.ncorre,icheqd.imagen,preg.descripcionpregunta,icheq.fecha,icheq.unidad,icheqd.idpregunta,icheqd.descripcion ,preg.descripcionpregunta,pil.nombre from ichequeos icheq  inner join ichequeosd icheqd inner join pilotos pil inner join _vehiculos veh on icheq.fecha between '"&inicial&"' and '"&final&"' and icheq.ncorre=icheqd.ncorre and icheq.piloto=pil.id and icheqd.valor>0 and veh.codigo=icheq.unidad inner join preguntad_360 preg on  preg.idpregunta=icheqd.idpregunta where preg.descripcionpregunta='"&descripcionpreg&"' order by icheqd.ncorre desc"
		'response.write(SQL)
		'SQL = "select icheq.fecha,icheq.unidad,icheqd.idpregunta,icheqd.descripcion from ichequeos icheq inner join ichequeosd icheqd inner join _vehiculos veh on icheq.fecha between '"&inicial&"' and '"&final&"' and icheqd.idpregunta='"&idpreg&"' and icheq.ncorre=icheqd.ncorre and icheqd.valor>0 and veh.codigo=icheq.unidad order by icheqd.ncorre desc;"
	else
		SQL = "select icheqd.ncorre,icheqd.imagen,preg.descripcionpregunta,icheq.fecha,icheq.unidad,icheqd.idpregunta,icheqd.descripcion ,preg.descripcionpregunta,pil.nombre from ichequeos icheq  inner join ichequeosd icheqd inner join pilotos pil inner join _vehiculos veh on icheq.fecha between '"&inicial&"' and '"&final&"' and icheq.ncorre=icheqd.ncorre and icheq.piloto=pil.id and icheqd.valor>0 and veh.codigo=icheq.unidad and veh.empresap='"&flota&"' inner join preguntad_360 preg on  preg.idpregunta=icheqd.idpregunta where preg.descripcionpregunta='"&descripcionpreg&"' order by icheqd.ncorre desc"
	end if
	'response.write(SQL)
	RS.Open SQL,Conn,3,1
	count=0
%>
<body style="background-color:transparent; display:none;">
    <div id="chartdiv" style="width:100%; height:100%;">	
    <div class="mws-panel-body no-padding">
    	<table  class="mws-table">
        <thead><tr><th>Fecha</th><th>Unidad</th><th>Piloto</th><th>Descripcion</th><th>Accion</th></tr></thead>
    	<%While Not Rs.Eof%>
        <tr id="<%=RS("unidad")%>">
        	<td><%=month(RS("fecha"))&"/"&day(RS("fecha"))&"/"&year(RS("fecha"))%></td>
            <td><%=RS("unidad")%></td>
			<td><%=RS("nombre")%></td>
            <%if RS("descripcion")<>"" then%>
            	<td><%=RS("descripcion")%></td>
            <%else%>
            	<td>No se Ingreso Descripci&oacute;n</td>
            <%end if%>
			<td><!--<i class="icol-arrow-right check" style="cursor:pointer; margin-left:5px;"></i>-->
			<div class="mws-panel-content">
			<i class="icol-email email" id="mws-form-dialog-<%=RS("ncorre")%>-mdl-btn" style="cursor:pointer; margin-left:5px;"></i>
                            <div id="mws-form-dialog-<%=RS("ncorre")%>">
                                <form id="mws-validate-<%=RS("ncorre")%>" class="mws-form">
                                    <div id="mws-validate-<%=RS("ncorre")%>-error" class="mws-form-message error" style="display:none;"></div>
                                    <div class="mws-form-inline">
                                        <div class="mws-form-row">
                                            <label class="mws-form-label">Para:</label>
                                            <div class="mws-form-item large">
                                                <input type="text" name="TxtPara" class="TxtPara required email" />
                                            </div>
                                        </div>
                                        <div class="mws-form-row">
                                            <label class="mws-form-label">Asunto:</label>
                                            <div class="mws-form-item large">
                                                <input type="text" name="TxtAsunto" class="required TxtAsunto" disabled value="Indicador de Falla 360 / <%=RS("unidad")%>" />
                                            </div>
                                        </div>
                                        <div class="mws-form-row">
                                            <label class="mws-form-label">Mensaje</label>
                                        </div>
										<div class="mws-form-row">
                                                <textarea name="TxtMensaje" id="cleditor-<%=RS("ncorre")%>" class="TxtMensaje " >
												<strong><em>Se Ha Reportado una Falla:</em></strong><br/><br/>
												<table>
													<thead><tr style="background-color:#1a93d0; color:#FFFFFF;"><th>Fecha</th><th>Unidad</th><th>Pregunta</th><th>Descripci&oacute;n</th><th>Piloto Asignado</th></tr></thead>
													<tbody><tr style="background-color:#eeeeee;">
													<td><%=day(RS("fecha"))&"/"&month(RS("fecha"))&"/"&year(RS("fecha"))%></td>
													<td><%=RS("unidad")%></td>
													<td><%=RS("descripcionpregunta")%></td>
													<td><%if RS("descripcion")<>"" then%><%=RS("descripcion")%><%else%>No se Ingreso Descripci&oacute;n<%end if%></td>
													<td><%=RS("nombre")%></td>
													</tr></tbody>
												</table>
												<br/><br/>
												<% if not isnull(RS("imagen")) and rs("imagen")<>"" then%>
												<img src="http://gentrac.usflota.com/360/fallas/<%=RS("imagen")%>" width=450; />
												<%end if%>
												</textarea>
										</div>
                                    </div>
                                </form>
                            </div>
                        </div> 
				<script>
				$(document).ready(function(){
				
					 $("#mws-form-dialog-<%=RS("ncorre")%>").dialog({
						autoOpen: false,
						title: "Enviar Correo",
						modal: true,
						width: "640",
						buttons: [{
							text: "Enviar",
							click: function () {
								$(this).find('form#mws-validate-<%=RS("ncorre")%>');
								$.post("webservices/emailFalla360.asp",{para: $(this).find('form#mws-validate-<%=RS("ncorre")%> .TxtPara').val(), asunto: $(this).find('form#mws-validate-<%=RS("ncorre")%> .TxtAsunto').val(),mensaje:$(this).find('form#mws-validate-<%=RS("ncorre")%> iframe').contents().find('body').html()},function(data){
									$.each(data.datos,function(index,item){
										if(item.error=="0"){
											$("#mws-form-dialog-<%=RS("ncorre")%>").dialog("close");
										}else{
											alert(item.error);
										}
									});
								},"json");
							}
						}]
					});
					$("#mws-form-dialog-<%=RS("ncorre")%>-mdl-btn").bind("click", function (event) {
						$("#mws-form-dialog-<%=RS("ncorre")%>").dialog("option", {
							modal: true
						}).dialog("open");
						event.preventDefault();
					});
					$( '#cleditor-<%=RS("ncorre")%>').cleditor();
				});
				</script>
			
			</td>
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
    <script type="text/javascript">
	
    	$(document).ready(function(){
		$("body").show();
			$("tr").not("td").click(function(){
				//var fecha;
				//var bus;
				//$("td").each(function(index){
				//	if(index==0){fecha=$(this).html();}
				//	if(index==1){bus=$(this).html();}
				//});
				//top.location.href="resumen360.asp?bus="+this.id+"&fecha="+fecha+"";
			});
		});
    </script>
</html>