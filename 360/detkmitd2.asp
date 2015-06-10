<!DOCTYPE html>
<!--#include file="includes/funciones.asp"-->
<!--#include file="includes/freeASPUpload.asp"-->
<head>
<meta charset="utf-8" />
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="es"><!--<![endif]-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 8
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
usuario=session("Username")
%>



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
<script type="text/javascript">
    function setcolor(idtd, apli) {
        if (apli == 1) {
            document.getElementById(idtd).style.background = "#fecfcf";
			document.getElementById(idtd).focus();
        } else {
            document.getElementById(idtd).style.background = "#FFF";
        }
    }
</script>

<title><%tite%></title>

</head>
<%
Dim uploadsDirVar
  uploadsDirVar = request.servervariables("APPL_PHYSICAL_PATH")&"pnc/360/fallas" 
function OutputForm()
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
    Dim RS1   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
    Set RS1 = Server.CreateObject("ADODB.Recordset")
    Set RS4 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
    nunit = request.querystring ("uhid")
	SQL = "SELECT * FROM _vehiculos where codigo = '"& nunit &"' order by codigo asc"
	RS.Open SQL,Conn,3,1
    'sql2 = "SELECT * FROM preguntae_360 inner join preguntad_360 on preguntae_360.id = preguntad_360.idpreguntae AND preguntae_360.tipo_vehiculo="" order by preguntae_360.id,preguntad_360.idpreguntae;"
    sql2 = "select id, descripcion,identificador from preguntae_360 where sisEstado='H' AND tipo_vehiculo=" & request.querystring("tipv") & ";"
	RS1.Open SQL2,Conn,3,1
%>
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
                <%
				if request.querystring("tipv")<>"" then%>
            	<div class="mws-panel grid_8">
                	<div class="mws-panel-header">
                    	<span>Hoja de control de estado fisico de unidades</span>
                    </div>  
                     <div class="mws-form-col-1-8">
                     	<label class="mws-form-label"><div class="mws-panel grid_8 frente"><img alt="lizq" src="images/<%=request.querystring("tipv")%>/frente.png" /></div></label>
                            
                     </div>
                     <div class="mws-form-col-3-8">
                            <label class="mws-form-label"><div class="mws-panel grid_8 izquierdo"><img alt="lizq" src="images/<%=request.querystring("tipv")%>/laizquierdo.png" /></div></label>
                     </div>

                     <div class="mws-form-col-3-8">
                            <label class="mws-form-label"><div class="mws-panel grid_8 derecho"><img alt="lizq" src="images/<%=request.querystring("tipv")%>/laderecho.png"  /></div></label>
                     </div>
                     <div class="mws-form-col-1-8">
                            <label class="mws-form-label"><div class="mws-panel grid_8 atras"><img alt="lizq" src="images/<%=request.querystring("tipv")%>/atras.png"  /></div></label>
                     </div>
                </div>
                <%end if%>

                <form class="mws-form" name="frmSend" method="POST" enctype="multipart/form-data" accept-charset="utf-8" action="detkmitd2.asp?uhid=<%=request.QueryString("uhid")%>&tipv=<%=request.QueryString("tipv")%>" onSubmit="return onSubmitForm();" id="frmSend">
                  <div class="mws-panel-body no-padding">
                    	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label"><span >Unidad</span></label>
                                    <div class="mws-form-item large">
                                        <input id="nuvehi" type="text" size="300" maxlength="150" name="nuvehi" readonly value = "<% = rs("codigo") %>"/>
                                        <input id="nunidad" type="hidden" size="300" maxlength="150" name="nunidad" readonly value = "<% = rs("codigo") %>"/>
                                    </div>
                                </div>
                                
								<div class="mws-form-col-2-8">
                                    <label class="mws-form-label"><span >Tipo de servicio</span>  </label>
                                    <div class="mws-form-item large">
                                       <select id="tipos" name="tipos">
                                         <option value = "1">patrullar</option>
                                         <option value = "2">Vacio</option>
                                       </select>
                                    </div>
                                </div>                                
                                 <%
							
							Set RS2 = Server.CreateObject("ADODB.Recordset")
							''(session("username"))
							
							SqlQuery="select flotilla from userw where username='"&usuario&"'"
							
							RS2.open SqlQuery, conn,3,3
							flo=rs2("flotilla")
								%>
								<div class="mws-form-col-2-8">
                                    <label class="mws-form-label"><span >Nombre de piloto</span></label>
                                    <div class="mws-form-item large">
                                      <select id="piloto" name="piloto">
                                       <% bpilotos rs2("flotilla")%>
                                      </select>
                                    </div>
                                </div>
								
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label"><span >Fecha de ingreso</span></label>
                                    <div class="mws-form-item large">
                                       <input type='text' class="mws-datepicker"  name='fecha' id='fecha'/>
                                    </div>
                                </div>
<script>
$(document).ready(function(e) {
    $("#fecha").datepicker({
                    numberOfMonths: 1,
                    dateFormat: "mm/dd/yy",
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    closeOnSelect:true,
                    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
                }).datepicker("setDate", new Date());
});
</script>
                                <div class="mws-form-col-7-8">
                                    <label class="mws-form-label"><span >Observaciones</span></label>
                                    <div class="mws-form-item large">
                                         <input id="obs1" type="text" name="obs1" size = "60" maxlength="75" value="na"/>
                                    </div>
                                </div>
                            </div>                    
                  </div>

                 <%do while not rs1.eof 
                    varpregunta = rs1("id")
                    sql3 = "select id idPregunta, descripcionpregunta from preguntad_360 where sisEstado='H' AND idPreguntae='" & varpregunta & "';"
	                RS4.Open sql3,Conn,3,1
                     %>
                        <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                            <div class="mws-panel-header">
                                <span><%= rs1("descripcion")%></span>
                            </div>
                            <table style="border-style: outset; width: 100%;" border="1">
                                <%
                                    if rs1("identificador") = 1 then
                                        while not RS4.eof
                                            ident = rs4("idPregunta")
                                            %>
                                                <tr>
                                                    <td class="style8">
                                                    <span ><%= rs4("descripcionpregunta")%></span>
                                                    </td>
                                                    <td class="style5" style="min-width:57px;">
                                                        <span >✓</span><input id="ok<%= ident%>" type="radio" checked="checked" name="<%= ident%>" onclick="setcolor('txt_<%= ident%>', 0)" value="0"/>
                                                        <span >X</span> <input id="nok<%= ident%>" type="radio" name="<%= ident%>" onclick="setcolor('txt_<%= ident%>', 1)" value="1" />
                                                    </td>
                                                    <td colspan="2" id="td<%= ident%>" >
                                                        <input id="txt_<%= ident%>" type="text" size="30" name="t<%= ident%>" maxlength="75" style="float:left; z-index:999" />
                              
                                                        <input type="file" size=1 style="border:0;"  style="float:left;zz-index:-1" id="image_<%= ident%>" name="image_<%= ident%>" />
                                                        <div style=" clear:both; height:15px;"></div>
                                                    </td>
                                                    </tr>
                                            <%
                                            RS4.movenext
                                        wend
                                    else
                                        %>
                                        <tr>
                                            <td class="style7">
                                            Descripcion
                                            </td>
                                            <td>
                                            Bien
                                            </td>
                                            <td>
                                            Regular
                                            </td>
                                            <td>
                                            Mal
                                            </td>
                                            <td>
                                            Detalle
                                            </td>
                                            </tr>
                                        <%
                                        while not RS4.eof
                                            ident = rs4("idPregunta")
                                            %>
                                                <tr>
                                                   <td class="style8">
                                                    <%= rs4("descripcionpregunta")%>
                                                   </td>
                                                   <td align="center">
                                                     <input id="r1<%= ident%>" type="radio" checked="checked" name="<%= ident%>" onclick="setcolor('txt_<%= ident%>', 0)"  value="0"/> 
                                                   </td>
                                                   <td align="center">
                                                     <input id="r2<%= ident%>" type="radio" name="<%= ident%>" onclick="setcolor('txt_<%= ident%>', 1)" value="1"/> 
                                                   </td>
                                                   <td align="center">
                                                     <input id="r3<%= ident%>" type="radio" name="<%= ident%>" onclick="setcolor('txt_<%= ident%>', 1)" value="2"/> 
                                                   </td>
                                                   <td colspan="2"  id="td<%= ident%>" style="min-height:40px;">
                                                     <input id="txt_<%= ident%>" type="text" name="d<%= ident%>" style="width:97%; margin-left:3px; float:left; z-index:999" maxlength="75"/>
                             
                                                     <input type="file" style="border:0; z-index:-1;" size=1 id="image_<%= ident%>" name="image_<%= ident%>" /> 
                                                     <div style=" clear:both; height:15px;"></div>
                                                   </td>
                                                 </tr>
                                            <%
                                            RS4.movenext
                                        wend
                                      
                                    end if
                                %>
                            </table>
                        </div>
                    <%
                     RS4.close
                     rs1.MoveNext
                 loop%>

                <div class="clear"></div>
                 <div class="mws-button-row">
                    <input type="submit" id="grabar" value="Grabar" class="btn btn-primary">
                 </div>
               </form>
  
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
    <script type="text/javascript" src="js/jquery.annotate.js"></script>
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
       <script type="text/javascript">
           $(document).ready(function () {
               $("td .fileinput-preview").each(function (index, element) {
                   $(this).css('background', 'transparent');
                   $(this).css('border', '0px');
                   $(this).css('height', '20px');
                   $(this).css('width', '110px');
                   $(this).css('left', '70%');
                   $(this).css('position', 'absolute');
                   $(this).css('margin-top', '25px');
                   $(this).css('vertical-align', 'text-top');
               });
               $("td .fileinput-preview").change(function () {
                   alert(this.id);
               });
               function blackNote() {
                   return $(document.createElement('span')).addClass('icol-cross');
               }
               $('.frente').annotatableImage(blackNote);
               $('.izquierdo').annotatableImage(blackNote);
               $('.derecho').annotatableImage(blackNote);
               $('.atras').annotatableImage(blackNote);
               $(".icol-cross").live('click', function () {
                   $(this).remove();
               });
           });
           $("#frmSend").submit(function (event) {
               if ($("#fecha").val() != "") {
                   var datos = "";
                   $(".mws-collapsible input:text, .mws-collapsible input:checked").each(function () {
                       var value = $(this).val().toString().replace(/\,/i, ' ');
                       if (this.type == "text") {
                           datos = datos + "," + this.id.replace("txt_", "") + "," + value;
                       } else {
                           datos = datos + "@" + value;
                       }
                   });
                   console.log(datos);
                   var fechas = $("#fecha").val().split("/");
                   var fecha = fechas[2] + "" + fechas[0] + "" + fechas[1];
                   var piloto = $('#piloto option:selected').val();
                   var desc = $("#obs1").val().replace(/\,/i, ' ');
                   $.ajaxSetup({ async: false });
                   $.getJSON("act360.asp", { datos: datos, tipos: $("#tipos").val(), piloto: piloto, obs1: desc, fecha: fecha, nunidad: $("#nuvehi").val() }, function (data) {
                       $.each(data.datos, function (i, item) {
                           if (item.error == 0) {
                               $.jGrowl("EL 360 se ha ingresado correctamente!!", {
                                   header: "Importante!",
                                   position: "top-right"
                               });
                               settimeout(location.href = "km360.asp", 2000);
                           } else {
                               event.preventDefault();
                               $.jGrowl("Ref. " + item.error, { header: "Error!", position: "top-right" });
                           };
                       });
                   }, 'json');

               } else {
                   event.preventDefault();
                   $.jGrowl("Se debe Ingresar Fecha de 360!!", { header: "Importante!" });
               }
           });

       </script>
</body>
       <%
End Function
	   	function TestEnvironment()
    Dim fso, fileName, testFile, streamTest
    TestEnvironment = ""
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    if not fso.FolderExists(uploadsDirVar) then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " No Existe.</B><br>El valor de su ubicacion es incorrecta. Modificar la ruta de un directorio con permisos de escritura."
        exit function
    end if
	
    fileName = uploadsDirVar & "\test.txt"
    on error resume next
	
    Set testFile = fso.CreateTextFile(fileName, true)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have write permissions.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    Err.Clear
    testFile.Close
    fso.DeleteFile(fileName)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have delete permissions</B>, although it does have write permissions.<br>Change the permissions for IUSR_<I>computername</I> on this folder."
        exit function
    end if
    Err.Clear
    Set streamTest = Server.CreateObject("ADODB.Stream")
    If Err.Number<>0 then
        TestEnvironment = "<B>The ADODB object <I>Stream</I> is not available in your server.</B><br>Check the Requirements page for information about upgrading your ADODB libraries."
        exit function
    end if
    Set streamTest = Nothing
end function

function SaveFiles ()
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)
	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    if (UBound(ks) <> -1) then
        SaveFiles = "<B>Files uploaded:</B> "
		dim extencion,numero
		Dim id
		Dim RSBusqueda
		Dim Conn1
		Set RSBusqueda = Server.CreateObject("ADODB.Recordset")
		Set Conn1 = Server.CreateObject("ADODB.Connection")
		Conn1.Open session("conec")
		SQL ="select id from ichequeos where usuario='"&session("Username")&"' order by id desc limit 1;"
		RSBusqueda.Open SQL,Conn1,3,3
		if Not RSBusqueda.Eof then
			id = RSBusqueda("id")
		
        for each fileKey in Upload.UploadedFiles.keys
		 		Dim fso
   				Set fso = CreateObject("Scripting.FileSystemObject")
				extencion = split(Upload.UploadedFiles(fileKey).FileName, ".")
				numero= ubound(extencion)
				Nombre= fileKey&"_"&id&"_"&GenerarPassword(5)&"."&extencion(numero)
   				fso.MoveFile uploadsDirVar&"\"&Upload.UploadedFiles(fileKey).FileName, uploadsDirVar&"\"&Nombre
            SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName & " (" & Upload.UploadedFiles(fileKey).Length & "B) "
			pregunta = split(fileKey, "_")
			
			Sqldelete = "UPDATE ichequeosd set imagen='"&Nombre&"' WHERE idpregunta= '"&pregunta(1)&"' and idIchequeos="&id
			conn1.execute Sqldelete
        next
		end if
    else
		
        SaveFiles = "No file selected for upload or the file name specified in the upload form does not correspond to a valid file in the system."
    end if
	SaveFiles = SaveFiles & "<br>Enter a number = " & Upload.Form("enter_a_number") & "<br>"
	SaveFiles = SaveFiles & "Checkbox values = " & Upload.Form("checkbox_values") & "<br>"
	SaveFiles = SaveFiles & "List values = " & Upload.Form("list_values") & "<br>"
	SaveFiles = SaveFiles & "Text area = " & Upload.Form("t_area") & "<br>"
end function
Function GenerarPassword(largo)
    Dim Resultado, Caracter, Password
 
    caracter = Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
   
    Randomize()
    Do While Len(Resultado) < largo
        Resultado = Resultado & Caracter(Int(36 * Rnd()))
    Loop
    GenerarPassword = Resultado
End Function
'Function BorrarDatos()
'	Dim id
'	Set RS1 = Server.CreateObject("ADODB.Recordset")
'	Set Conn1 = Server.CreateObject("ADODB.Connection")
	''Conn1.Open session("conec")
	''SQL ="select id from ichequeos where usuario='"&session("Username")&"' order by id desc limit 1;"
	
	'RS1.Open SQL,Conn,3,1
	'	if Not RS1.Eof then
	'		id = RS1("id")
	'	end if
	'Sqldelete = "DELETE FROM ichequeos WHERE id="&id
	'conn.execute Sqldelete
	
	'Sqldelete = "DELETE FROM ichequeosd WHERE ncorre="&id
	'conn.execute Sqldelete
	
'End Function
	   %>
       <%
Dim diagnostics
if Request.ServerVariables("REQUEST_METHOD") <> "POST" then
    diagnostics = TestEnvironment()
    if diagnostics<>"" then
        response.write "<div style=""margin-left:20; margin-top:30; margin-right:30; margin-bottom:30;"">"
        response.write diagnostics
        response.write "<p>After you correct this problem, reload the page."
        response.write "</div>"
    else
        response.write "<div style=""margin-left:150"">"
        OutputForm()
        response.write "</div>"
    end if
else
   'response.write "<div style=""margin-left:150"">"
	OutputForm()
    'response.write 
	SaveFiles()
    'response.write "<br><br></div>"
end if

%>
</html>
