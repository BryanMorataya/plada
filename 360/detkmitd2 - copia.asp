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
    estapagina = 8
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
    Dim RS1   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
    Set RS1 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
    nunit = request.form ("uhid")
	SQL = "SELECT * FROM vehiculos where id = "& nunit &" order by ID asc"
	RS.Open SQL,Conn,3,1
    sql2 = "SELECT * FROM preguntae_360 inner join preguntad_360 on preguntae_360.posicion = preguntad_360.poscicion_encabezado order by posicion,idpregunta"
   	RS1.Open SQL2,Conn,3,1
%>
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
<link rel="stylesheet" type="text/css" href="plugins/cleditor/jquery.cleditor.css" media="screen" /

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
            	<div class="mws-panel grid_8">
                	<div class="mws-panel-header">
                    	<span>Hoja de control de estado fisico de buses</span>
                    </div>  
                     <div class="mws-form-col-1-8">
                     <%if rs("tveh") = 2 then %>
                            <label class="mws-form-label"><img alt="lizq" src="images/frente1.png" /></label>
                     <%else %>
                            <label class="mws-form-label"><img alt="lizq" src="images/frente.png" /></label>
                     <%end if %>
                     </div>
                     <div class="mws-form-col-3-8">
                     <%if rs("tveh") = 2 then %>
                            <label class="mws-form-label"><img alt="lizq" src="images/ladoizquierdo1.png" /></label>
                     <%else %>
                            <label class="mws-form-label"><img alt="lizq" src="images/laizquierdo.png" /></label>
                     <%end if %>
                     </div>

                     <div class="mws-form-col-3-8">
                     <%if rs("tveh") = 2 then %>
                            <label class="mws-form-label"><img alt="lizq" src="images/ladoderecho1.png"  /></label>
                     <%else %>
                            <label class="mws-form-label"><img alt="lizq" src="images/laderecho.png"  /></label>
                     <%end if %>
                     </div>
                     <div class="mws-form-col-1-8">
                     <%if rs("tveh") = 2 then %>
                            <label class="mws-form-label"><img alt="lizq" src="images/atras1.png"  /></label>
                     <%else %>
                            <label class="mws-form-label"><img alt="lizq" src="images/atras.png"  /></label>
                     <%end if %>
                     </div>
                </div>

                <form class="mws-form" name="nveh" method="post" action="act360.asp">
                  <div class="mws-panel-body no-padding">
                    	<div class="mws-form-cols clearfix">
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">No unidad</label>
                                    <div class="mws-form-item large">
                                        <input id="nuvehi" type="text" size="300" maxlength="150" name="nuvehi" readonly="readonly" value = "<% = rs("codigo") %>"/>
                                        <input id="nunidad" type="hidden" size="300" maxlength="150" name="nunidad" readonly="readonly" value = "<% = rs("id") %>"/>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8 omega">
                                    <label class="mws-form-label">Tipo de servicio  </label>
                                    <div class="mws-form-item large">
                                       <select id="tipos" name="tipos">
                                         <option value = "1">Especial</option>
                                         <option value = "2">Plus</option>
                                         <option value = "3">Clase</option>
                                       </select>
                                    </div>
                                </div>                                
                                <div class="mws-form-col-2-8 alpha">
                                    <label class="mws-form-label">Nombre de piloto</label>
                                    <div class="mws-form-item large">
                                      <select id="piloto" name="piloto">
                                       <% bpilotos %>
                                      </select>
                                    </div>
                                </div>
                                <div class="mws-form-col-2-8">
                                    <label class="mws-form-label">Fecha de ingreso</label>
                                    <div class="mws-form-item large">
                                       <input type='text' class="mws-datepicker"  name='fecha' id='fecha' value="<%=date %>"/>
                                    </div>
                                </div>

                                <div class="mws-form-col-7-8">
                                    <label class="mws-form-label">Observaciones</label>
                                    <div class="mws-form-item large">
                                         <input id="obs1" type="text" name="obs1" size = "60" maxlength="250" value="na"/>
                                    </div>
                                </div>
                            </div>                    
                  </div>

                 <%do while not rs1.eof 
                  varpregunta = rs1("posicion")
                  %>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span><%= rs1("descripcion")%></span>
                    </div>
                    <table style="border-style: outset; width: 100%;" border="1">
                    <%
                      do while not rs1.eof 
                      if varpregunta = rs1("posicion") then
                         ident = rs1("idpregunta")
                    %> 
                         <tr>
                           <td class="style8">
                            <%= rs1("descripcionpregunta")%>
                           </td>
                           <td class="style5">
                              ✓<input id="ok<%= ident%>" type="radio" checked="checked" name="<%= ident%>" onclick="setcolor('td<%= ident%>',0)" value="0"/>
                              X <input id="nok<%= ident%>" type="radio" name="<%= ident%>" onclick="setcolor('td<%= ident%>',1)" value="1" />
                           </td>
                           <td colspan="2" bgcolor="Green" id="td<%= ident%>">
                              <input id="t<%= ident%>" type="text" size="30" name="pbrisasp" />
                           </td>
                         </tr>
                    <%
                      rs1.movenext
                      else
                        exit do
                      end if
                      loop
                    %>
                     </table>
                  </div>  
  
                   <%
                      if not rs1.eof then
                       rs1.movenext
                      end if
                   loop
                 %>

                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Frente</span>
                    </div>
 
                    <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style8">
                            Parabrisas
                           </td>
                           <td class="style5">
                              ✓<input id="radio1" type="radio" 
                                   checked="checked" name="p1" onclick="setcolor('tparabrisas',0)" value="0"/>
                              X <input id="radio2" type="radio" name="p1" onclick="setcolor('tparabrisas',1)" 
                                   value="1" />
                           </td>
                           <td colspan="2" bgcolor="Green" id="tparabrisas">
                              <input id="pbrisas" type="text" size="30" name="pbrisas" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style8">
                            Limpiadores
                           </td>
                           <td class="style5">
                              ✓<input id="radio3" type="radio" checked="checked" name="p2" onclick="setcolor('tlimpiadores',0)" value="0"/> 
                               X<input id="radio4" type="radio" name="p2" onclick="setcolor('tlimpiadores',1)" value="1" />
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlimpiadores">
                              <input id="Limpiadores" type="text" size="30" name="Limpiadores" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style8">
                            Cuernos
                           </td>
                           <td class="style5">
                              ✓<input id="Radio5" type="radio" checked="checked" name="p3" onclick="setcolor('tcuernos',0)" value="0"/>
                              x<input id="Radio6" type="radio" name="p3" onclick="setcolor('tcuernos',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tcuernos">
                              <input id="Cuernos" type="text" size="30" name="Cuernos" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style8">
                            Luces
                           </td>
                           <td class="style5">
                               ✓<input id="Radio7" type="radio" checked="checked" name="p4" onclick="setcolor('tluces',0)" value="0"/> 
                               X<input id="Radio8" type="radio" name="p4" onclick="setcolor('tluces',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tluces">
                              <input id="Luces" type="text" size="30" name="Luces" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style8">
                            Espejos laterales
                           </td>
                           <td class="style5">
                               ✓<input id="Radio9" type="radio" checked="checked" name="p5" onclick="setcolor('tespejos',0)" value="0"/> 
                               X<input id="Radio10" type="radio" name="p5" onclick="setcolor('tespejos',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tespejos">
                              <input id="Espejosl" type="text" size="30" name="Espejosl" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style8">
                            Calcomania (No de bus)
                           </td>
                           <td class="style5">
                               ✓<input id="Radio11" type="radio" checked="checked" name="p6" onclick="setcolor('tcalcomania',0)" value="0"/> 
                               X<input id="Radio12" type="radio" name="p6" onclick="setcolor('tcalcomania',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tcalcomania">
                              <input id="Calcomania" type="text" size="30" name="Calcomania" />
                           </td>
                         </tr>
                     </table>
                  </div>  
            	  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">
                	<div class="mws-panel-header">
                    	<span>Interior</span>
                    </div>
                       <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style4">
                            Video / DVD
                           </td>
                           <td>
                              ✓<input id="radio15" type="radio" checked="checked" 
                                   name="i1" onclick="setcolor('tvideodvd',0)" value="0"/> 
                               X<input id="radio16" type="radio" name="i1" onclick="setcolor('tvideodvd',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tvideodvd">
                              <input id="videodvd" type="text" size="30" name="videodvd" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4" >
                            Monitores/pantallas
                           </td>
                           <td>
                              ✓<input id="radio17" type="radio" checked="checked" name="i2" onclick="setcolor('tMonitores',0)" value="0"/> 
                               X<input id="radio18" type="radio" name="i2" onclick="setcolor('tMonitores',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tMonitores">
                              <input id="Monitores" type="text" size="30" name="Monitores" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Stereo/microfonos
                           </td>
                           <td>
                              ✓<input id="Radio19" type="radio" checked="checked" name="i3" onclick="setcolor('tstereo',0)" value="0"/> 
                               X<input id="Radio20" type="radio" name="i3" onclick="setcolor('tstereo',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tstereo">
                              <input id="Stereo" type="text" size="30" name="Stereo" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Butacas
                           </td>
                           <td>
                              ✓<input id="Radio21" type="radio" checked="checked" name="i4" onclick="setcolor('tbutacas',0)" value="0"/> 
                               X<input id="Radio22" type="radio" name="i4" onclick="setcolor('tbutacas',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tbutacas">
                              <input id="Butacas" type="text" size="30" name="Butacas" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Aire acondicionado
                           </td>
                           <td>
                              ✓<input id="Radio23" type="radio" checked="checked" name="i5" onclick="setcolor('tairec',0)" value="0"/> 
                               X<input id="Radio24" type="radio" name="i5" onclick="setcolor('tairec',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tairec">
                              <input id="Airec" type="text" size="30" name="Airec" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Luces
                           </td>
                           <td>
                              ✓<input id="Radio25" type="radio" checked="checked" name="i6" onclick="setcolor('tlucesi',0)" value="0"/> 
                               X<input id="Radio26" type="radio" name="i6" onclick="setcolor('tlucesi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlucesi">
                              <input id="Lucesi" type="text" size="30" name="Lucesi" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Fundas y cortinas
                           </td>
                           <td>
                              ✓<input id="Radio27" type="radio" checked="checked" name="i7" onclick="setcolor('tfundas',0)" value="0"/> 
                               X<input id="Radio28" type="radio" name="i7" onclick="setcolor('tfundas',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tfundas">
                              <input id="Fundas" type="text" size="30" name="Fundas" />
                           </td>
                         </tr>
                      <tr>
                           <td class="style4">
                            Baño
                           </td>
                           <td>
                              ✓<input id="Radio29" type="radio" checked="checked" name="i8" onclick="setcolor('tbano',0)" value="0"/> 
                               X<input id="Radio30" type="radio" name="i8" onclick="setcolor('tbano',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tbano">
                              <input id="bano" type="text" size="30" name="bano" />
                           </td>
                         </tr>
                     </table>
                </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Lado derecho</span>
                    </div> 
                      <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style3">
                            Ventanillas
                           </td>
                           <td>
                              ✓<input id="radio13" type="radio" checked="checked" 
                                   name="ld1" onclick="setcolor('tventanillasd',0)" value="0"/> 
                               X<input id="radio14" type="radio" name="ld1" onclick="setcolor('tventanillasd',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tventanillasd">
                              <input id="Ventanillasd" type="text" size="30" name="Ventanillasd" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style3">
                            Puerta de servicio
                           </td>
                           <td>
                              ✓<input id="radio31" type="radio" checked="checked" name="ld2" onclick="setcolor('tpserviciod',0)" value="0"/> 
                               X<input id="radio32" type="radio" name="ld2" onclick="setcolor('tpserviciod',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpserviciod">
                              <input id="pserviciod" type="text" size="30" name="pserviciod" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style3">
                            Baules
                           </td>
                           <td>
                              ✓<input id="Radio33" type="radio" checked="checked" name="ld3" onclick="setcolor('tbauld',0)" value="0"/> 
                               X<input id="Radio34" type="radio" name="ld3" onclick="setcolor('tbauld',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tbauld">
                              <input id="bauld" type="text" size="30" name="bauld" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style3">
                            Compuerta lateral motor
                           </td>
                           <td>
                              ✓<input id="Radio35" type="radio" checked="checked" name="ld4" onclick="setcolor('tclateralmd',0)" value="0"/> 
                               X<input id="Radio36" type="radio" name="ld4" onclick="setcolor('tclateralmd',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tclateralmd">
                              <input id="clateralmd" type="text" size="30" name="clateralmd" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style3">
                            Compuerta lateral de bateria
                           </td>
                           <td>
                              ✓<input id="Radio37" type="radio" checked="checked" name="ld5" onclick="setcolor('tlcalteralbd',0)" value="0"/> 
                               X<input id="Radio38" type="radio" name="ld5" onclick="setcolor('tlcalteralbd',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlcalteralbd">
                              <input id="lcalteralbd" type="text" size="30" name="lcalteralbd" />
                           </td>
                         </tr>
                     </table>
                </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Lado izquierdo</span>
                    </div> 
                        <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style4">
                            Ventanillas
                           </td>
                           <td>
                              ✓<input id="radio39" type="radio" checked="checked" 
                                   name="li1" onclick="setcolor('tventanillasi',0)" value="0"/> 
                               X<input id="radio40" type="radio" name="li1" onclick="setcolor('tventanillasi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tventanillasi">
                              <input id="Ventanillasi" type="text" size="30" name="Ventanillasi" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Puerta de servicio
                           </td>
                           <td>
                              ✓<input id="radio41" type="radio" checked="checked" name="li2" onclick="setcolor('tpservicioi',0)" value="0"/> 
                               X<input id="radio42" type="radio" name="li2" onclick="setcolor('tpservicioi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpservicioi">
                              <input id="pservicioi" type="text" size="30" name="pservicioi" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Baules
                           </td>
                           <td>
                              ✓<input id="Radio43" type="radio" checked="checked" name="li3" onclick="setcolor('tbauli',0)" value="0"/> 
                               X<input id="Radio44" type="radio" name="li3" onclick="setcolor('tbauli',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tbauli">
                              <input id="bauli" type="text" size="30" name="bauli" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Compuerta lateral motor
                           </td>
                           <td>
                              ✓<input id="Radio45" type="radio" checked="checked" name="li4" onclick="setcolor('tclateralmi',0)" value="0"/> 
                               X<input id="Radio46" type="radio" name="li4" onclick="setcolor('tclateralmi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tclateralmi">
                              <input id="clateralmi" type="text" size="30" name="clateralmi" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Compuerta lateral de bateria
                           </td>
                           <td>
                              ✓<input id="Radio47" type="radio" checked="checked" name="li5" onclick="setcolor('tlcalteralbi',0)" value="0"/> 
                               X<input id="Radio48" type="radio" name="li5" onclick="setcolor('tlcalteralbi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlcalteralbi">
                              <input id="lcalteralbi" type="text" size="30" name="lcalteralbi" />
                           </td>
                         </tr>
                     </table>
                </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Parte posterior</span>
                    </div> 
                      <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style9">
                            Defensa
                           </td>
                           <td class="style11">
                              ✓<input id="radio49" type="radio" checked="checked" 
                                   name="po1" onclick="setcolor('tdefensa',0)" value="0"/> 
                               X<input id="radio50" type="radio" name="po1" onclick="setcolor('tdefensa',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tdefensa">
                              <input id="defensa" type="text" size="30" name="defensa" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style9">
                            Luces
                           </td>
                           <td class="style11">
                              ✓<input id="radio51" type="radio" checked="checked" name="po2" onclick="setcolor('tpluces',0)" value="0"/> 
                               X<input id="radio52" type="radio" name="po2" onclick="setcolor('tpluces',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpluces">
                              <input id="pluces" type="text" size="30" name="pluces" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style9">
                            Postes
                           </td>
                           <td class="style11">
                              ✓<input id="Radio53" type="radio" checked="checked" name="po3" onclick="setcolor('tpostes',0)" value="0"/> 
                               X<input id="Radio54" type="radio" name="po3" onclick="setcolor('tpostes',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpostes">
                              <input id="postes" type="text" size="30" name="postes" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style9">
                            Ventanilla
                           </td>
                           <td class="style11">
                              ✓<input id="Radio55" type="radio" checked="checked" name="po4" onclick="setcolor('tpventanilla',0)" value="0"/> 
                               X<input id="Radio56" type="radio" name="po4" onclick="setcolor('tpventanilla',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpventanilla">
                              <input id="pventanilla" type="text" size="30" name="pventanilla" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style9">
                            Calcomania publicitaria
                           </td>
                           <td class="style11">
                              ✓<input id="Radio57" type="radio" checked="checked" name="po5" onclick="setcolor('tpcalcomania',0)" value="0"/> 
                               X<input id="Radio58" type="radio" name="po5" onclick="setcolor('tpcalcomania',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpcalcomania">
                              <input id="pcalcomania" type="text" size="30" name="pcalcomania" />
                           </td>
                         </tr>
                       <tr>
                           <td class="style9">
                            Tapa Motor
                           </td>
                           <td class="style11">
                              ✓<input id="Radio147" type="radio" checked="checked" name="po6" onclick="setcolor('tpmotor',0)" value="0"/> 
                               X<input id="Radio148" type="radio" name="po6" onclick="setcolor('tpmotor',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpmotor">
                              <input id="pmotor" type="text" size="30" name="pmotor" />
                           </td>
                         </tr>
                     </table>
                 </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Equipo de seguridad</span>
                    </div> 
                      <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style4">
                            Botiquin
                           </td>
                           <td>
                              ✓<input id="radio59" type="radio" checked="checked" 
                                   name="es1" onclick="setcolor('tbotiquin',0)" value="0"/> 
                               X<input id="radio60" type="radio" name="es1" onclick="setcolor('tbotiquin',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tbotiquin">
                              <input id="botiquin" type="text" size="30" name="botiquin" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Extinguidor
                           </td>
                           <td>
                              ✓<input id="radio61" type="radio" checked="checked" name="es2" onclick="setcolor('textinguidor',0)" value="0"/> 
                               X<input id="radio62" type="radio" name="es2" onclick="setcolor('textinguidor',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="textinguidor">
                              <input id="extinguidor" type="text" size="30" name="extinguidor" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Reflejantes
                           </td>
                           <td>
                              ✓<input id="Radio63" type="radio" checked="checked" name="es3" onclick="setcolor('treflejantes',0)" value="0"/> 
                               X<input id="Radio64" type="radio" name="es3" onclick="setcolor('treflejantes',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="treflejantes">
                              <input id="reflejantes" type="text" size="30" name="reflejantes" />
                           </td>
                         </tr>
                     </table>
                 </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Documentacion</span>
                    </div>
                     <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style10">
                            Tarjeta de circulacion y placa
                           </td>
                           <td>
                              ✓<input id="radio65" type="radio" checked="checked" 
                                   name="do1" onclick="setcolor('tcirpla',0)" value="0"/> 
                               X<input id="radio66" type="radio" name="do1" onclick="setcolor('tcirpla',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tcirpla">
                              <input id="ciryplaca" type="text" size="30" name="ciryplaca" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style10">
                            Calcomania
                           </td>
                           <td>
                              ✓<input id="radio67" type="radio" checked="checked" name="do2" onclick="setcolor('tdcalcomania',0)" value="0"/> 
                               X<input id="radio68" type="radio" name="do2" onclick="setcolor('tdcalcomania',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tdcalcomania">
                              <input id="dcalcomania" type="text" size="30" name="dcalcomania" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style10">
                            Tarj de operacion o temporal
                           </td>
                           <td>
                              ✓<input id="Radio69" type="radio" checked="checked" name="do3" onclick="setcolor('toperacion',0)" value="0"/> 
                               X<input id="Radio70" type="radio" name="do3" onclick="setcolor('toperacion',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="toperacion">
                              <input id="operacion" type="text" size="30" name="operacion" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style10">
                            Tarjeta de rodaje
                           </td>
                           <td>
                              ✓<input id="Radio71" type="radio" checked="checked" name="do4" onclick="setcolor('trodaje',0)" value="0"/> 
                               X<input id="Radio72" type="radio" name="do4" onclick="setcolor('trodaje',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="trodaje">
                              <input id="rodaje" type="text" size="30" name="rodaje" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style10">
                            Poliza de seguro
                           </td>
                           <td>
                              ✓<input id="Radio73" type="radio" checked="checked" name="do5" onclick="setcolor('tpseguro',0)" value="0"/> 
                               X<input id="Radio74" type="radio" name="do5" onclick="setcolor('tpseguro',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpseguro">
                              <input id="pseguro" type="text" size="30" name="pseguro" />
                           </td>
                         </tr>
                        <tr>
                           <td class="style10">
                            Licencia de piloto
                           </td>
                           <td>
                              ✓<input id="Radio75" type="radio" checked="checked" name="do6" onclick="setcolor('tlicencia',0)" value="0"/> 
                               X<input id="Radio76" type="radio" name="do6" onclick="setcolor('tlicencia',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlicencia">
                              <input id="licencia" type="text" size="30" name="licencia" />
                           </td>
                         </tr>
                     </table>                     
                  </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Herramienta</span>
                    </div> 
                     <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style4">
                            Tricket
                           </td>
                           <td class="style6">
                              ✓<input id="radio77" type="radio" checked="checked" 
                                   name="he1" onclick="setcolor('ttricket',0)" value="0"/> 
                               X<input id="radio78" type="radio" name="he1" onclick="setcolor('ttricket',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="ttricket">
                              <input id="tricket" type="text" size="30" name="tricket" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Llave de chuchos
                           </td>
                           <td class="style6">
                              ✓<input id="radio79" type="radio" checked="checked" name="he2" onclick="setcolor('tlchuchos',0)" value="0"/> 
                               X<input id="radio80" type="radio" name="he2" onclick="setcolor('tlchuchos',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlchuchos">
                              <input id="lchuchos" type="text" size="30" name="lchuchos" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Llanta de repuesto
                           </td>
                           <td class="style6">
                              ✓<input id="Radio81" type="radio" checked="checked" name="he3" onclick="setcolor('tlrepuesto',0)" value="0"/> 
                               X<input id="Radio82" type="radio" name="he3" onclick="setcolor('tlrepuesto',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tlrepuesto">
                              <input id="lrepuesto" type="text" size="30" name="lrepuesto" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Conos o triangulos
                           </td>
                           <td class="style6">
                              ✓<input id="Radio83" type="radio" checked="checked" name="he4" onclick="setcolor('tconost',0)" value="0"/> 
                               X<input id="Radio84" type="radio" name="he4" onclick="setcolor('tconost',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tconost">
                              <input id="conost" type="text" size="30" name="conost" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Equipo vigia
                           </td>
                           <td class="style6">
                              ✓<input id="Radio85" type="radio" checked="checked" name="he5" onclick="setcolor('tevigia',0)" value="0"/> 
                               X<input id="Radio86" type="radio" name="he5" onclick="setcolor('tevigia',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tevigia">
                              <input id="evigia" type="text" size="30" name="evigia" />
                           </td>
                         </tr>
                        <tr>
                           <td class="style4">
                            Suministros de limpieza
                           </td>
                           <td class="style6">
                              ✓<input id="Radio87" type="radio" checked="checked" name="he6" onclick="setcolor('tslimpieza',0)" value="0"/> 
                               X<input id="Radio88" type="radio" name="he6" onclick="setcolor('tslimpieza',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tslimpieza">
                              <input id="slimpieza" type="text" size="30" name="slimpieza" />
                           </td>
                         </tr>
                     </table>
                  </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Operacion de la unidad y desempeño</span>
                    </div>
                     <table style="border-style: outset; width: 100%;" border="1">
                         <tr>
                           <td class="style4">
                            Motor
                           </td>
                           <td>
                              ✓<input id="radio89" type="radio" checked="checked" 
                                   name="od1" onclick="setcolor('tmotor',0)" value="0"/> 
                               X<input id="radio90" type="radio" name="od1" onclick="setcolor('tmotor',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tmotor">
                              <input id="motor" type="text" size="30" name="motor" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Consumo de combustible
                           </td>
                           <td>
                              ✓<input id="radio91" type="radio" checked="checked" name="od2" onclick="setcolor('tccomb',0)" value="0"/> 
                               X<input id="radio92" type="radio" name="od2" onclick="setcolor('tccomb',1)"value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tccomb">
                              <input id="ccomb" type="text" size="30" name="ccomb" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Caja
                           </td>
                           <td>
                              ✓<input id="Radio93" type="radio" checked="checked" name="od3" onclick="setcolor('tcaja',0)" value="0"/> 
                               X<input id="Radio94" type="radio" name="od3" onclick="setcolor('tcaja',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tcaja">
                              <input id="caja" type="text" size="30" name="caja" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Estado de eje trasero
                           </td>
                           <td>
                              ✓<input id="Radio95" type="radio" checked="checked" name="od4" onclick="setcolor('tejetras',0)" value="0"/> 
                               X<input id="Radio96" type="radio" name="od4" onclick="setcolor('tejetras',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tejetras">
                              <input id="ejetras" type="text" size="30" name="ejetras" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Estado de eje Cardan
                           </td>
                           <td>
                              ✓<input id="Radio97" type="radio" checked="checked" name="od5" onclick="setcolor('tejecar',0)" value="0"/> 
                               X<input id="Radio98" type="radio" name="od5" onclick="setcolor('tejecar',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tejecar">
                              <input id="ejecar" type="text" size="30" name="ejecar" />
                           </td>
                         </tr>
                        <tr>
                           <td class="style4">
                            Frenos
                           </td>
                           <td>
                              ✓<input id="Radio99" type="radio" checked="checked" name="od6" onclick="setcolor('tfrenos',0)" value="0"/> 
                               X<input id="Radio100" type="radio" name="od6" onclick="setcolor('tfrenos',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tfrenos">
                              <input id="frenos" type="text" size="30" name="frenos" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Sistema electrico
                           </td>
                           <td>
                              ✓<input id="Radio101" type="radio" checked="checked" name="od7" onclick="setcolor('tselectrico',0)" value="0"/> 
                               X<input id="Radio102" type="radio" name="od7" onclick="setcolor('tselectrico',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tselectrico">
                              <input id="selectrico" type="text" size="30" name="selectrico" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Caja de timon
                           </td>
                           <td>
                              ✓<input id="Radio103" type="radio" checked="checked" name="od8" onclick="setcolor('tctimon',0)" value="0"/> 
                               X<input id="Radio104" type="radio" name="od8" onclick="setcolor('tctimon',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tctimon">
                              <input id="ctimon" type="text" size="30" name="ctimon" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Retardador
                           </td>
                           <td>
                              ✓<input id="Radio105" type="radio" checked="checked" name="od9" onclick="setcolor('tretardador',0)" value="0"/> 
                               X<input id="Radio106" type="radio" name="od9" onclick="setcolor('tretardador',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tretardador">
                              <input id="retardador" type="text" size="30" name="retardador" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Llantas
                           </td>
                           <td>
                              ✓<input id="Radio107" type="radio" checked="checked" name="od10" onclick="setcolor('tllantas',0)" value="0"/> 
                               X<input id="Radio108" type="radio" name="od10" onclick="setcolor('tllantas',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tllantas">
                              <input id="llantas" type="text" size="30" name="llantas" />
                           </td>
                         </tr>
                         <tr>
                           <td class="style4">
                            Indicadores del tablero
                           </td>
                           <td>
                              ✓<input id="Radio109" type="radio" checked="checked" name="od11" onclick="setcolor('titabl',0)" value="0"/> 
                               X<input id="Radio110" type="radio" name="od11" onclick="setcolor('titabl',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="titabl">
                              <input id="itabl" type="text" size="30" name="itabl" />
                           </td>
                         </tr> 
                         <tr>
                           <td class="style4">
                            Presion de aceite
                           </td>
                           <td>
                              ✓<input id="Radio111" type="radio" checked="checked" name="od12" onclick="setcolor('tpaceite',0)" value="0"/> 
                               X<input id="Radio112" type="radio" name="od12" onclick="setcolor('tpaceite',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="tpaceite">
                              <input id="paceite" type="text" size="30" name="paceite" />
                           </td>
                         </tr>   
                         <tr>
                           <td class="style4">
                            Reloj temperatura/chicharra
                           </td>
                           <td>
                              ✓<input id="Radio113" type="radio" checked="checked" name="od13" onclick="setcolor('rrtemp',0)" value="0"/> 
                               X<input id="Radio114" type="radio" name="od13" onclick="setcolor('rrtemp',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="rrtemp">
                              <input id="rtemp" type="text" size="30" name="rtemp" />
                           </td>
                         </tr>   
                         <tr>
                           <td class="style4">
                            Reloj de PSI
                           </td>
                           <td>
                              ✓<input id="Radio115" type="radio" checked="checked" name="od14" onclick="setcolor('trpsi',0)" value="0"/> 
                               X<input id="Radio116" type="radio" name="od14" onclick="setcolor('trpsi',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="trpsi">
                              <input id="rpsi" type="text" size="30" name="rpsi" />
                           </td>
                         </tr>   
                         <tr>
                           <td class="style4">
                            Aspirometro
                           </td>
                           <td>
                              ✓<input id="Radio117" type="radio" checked="checked" name="od15" onclick="setcolor('taspiro',0)"value="0"/> 
                               X<input id="Radio118" type="radio" name="od15" onclick="setcolor('taspiro',1)" value="1"/>
                           </td>
                           <td colspan="2" bgcolor="Green" id="taspiro">
                              <input id="aspiro" type="text" size="30" name="aspiro" />
                           </td>
                         </tr> 
                     </table>                     
                  </div>
                  <div class="mws-panel grid_4 mws-collapsible mws-collapsed">     
                   <div class="mws-panel-header">
                    	<span>Informacion del piloto</span>
                    </div> 
                     <table style="border-style: outset; width: 100%;" border="1">
                          <tr>
                           <td class="style7">
                           Estado fisico y animico del piloto
                           </td>
                           <td>
                            Mal
                           </td>
                            <td>
                            Normal
                           </td>
                            <td>
                            Bien
                           </td>
                            <td>
                            Detalle
                           </td>
                         </tr>
                         <tr>
                           <td class="style7">
                            El horario de trabajo me permite atender mis asuntos personales
                           </td>
                           <td align="center">
                             <input id="radio119" type="radio" checked="checked" name="pi1" onclick="setcolor('divPi1',1)"  value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio120" type="radio" checked="checked" name="pi1" onclick="setcolor('divPi1',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio131" type="radio" checked="checked" name="pi1" onclick="setcolor('divPi1',0)" value="2"/> 
                           </td>
                           <td colspan="2" bgcolor="Green" id="divPi1">
                             <input id="detaHorario" type="text" name="detaHorario" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                         <tr>
                           <td class="style7">
                            Cual es su estado de salud?
                           </td>
                          <td align="center">
                             <input id="radio121" type="radio" checked="checked" name="pi2" onclick="setcolor('divPi2',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio122" type="radio" checked="checked" name="pi2" onclick="setcolor('divPi2',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio133" type="radio" checked="checked" name="pi2" onclick="setcolor('divPi2',0)" value="2"/> 
                           </td>
                           <td colspan="2" bgcolor="Green" id="divPi2">
                             <input id="detaSalud" type="text" name="detaSalud" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                         <tr>
                           <td class="style7">
                            Animicamente como se siente?
                           </td>
                          <td align="center">
                             <input id="radio123" type="radio" checked="checked" name="pi3" onclick="setcolor('divPi3',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio124" type="radio" checked="checked" name="pi3" onclick="setcolor('divPi3',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio135" type="radio" checked="checked" name="pi3" onclick="setcolor('divPi3',0)" value="2"/> 
                           </td>
                           <td colspan="2" bgcolor="Green" id="divPi3">
                             <input id="detaAnimi" type="text" name="detaAnimi" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                         <tr>
                           <td class="style7">
                            Se apoyan mis iniciativas en el trabajo?
                           </td>
                           <td align="center">
                             <input id="radio125" type="radio" checked="checked" name="pi4" onclick="setcolor('divPi4',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio126" type="radio" checked="checked" name="pi4" onclick="setcolor('divPi4',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio137" type="radio" checked="checked" name="pi4" onclick="setcolor('divPi4',0)" value="2"/> 
                           </td>
                           <td colspan="2" bgcolor="Green" id="divPi4">
                             <input id="detaApoyo" type="text" name="detaApoyo" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                         <tr>
                           <td class="style7">
                            Como es el trato que recibo del jefe y compañeros de trabajo?
                           </td>
                            <td align="center">
                             <input id="radio127" type="radio" checked="checked" name="pi5" onclick="setcolor('divPi5',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio128" type="radio" checked="checked" name="pi5" onclick="setcolor('divPi5',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio139" type="radio" checked="checked" name="pi5" onclick="setcolor('divPi5',0)" value="2"/> 
                           </td> 
                           <td colspan="2" bgcolor="Green" id="divPi5">
                             <input id="detaTrato" type="text" name="detaTrato" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                        <tr>
                           <td class="style7">
                            Como es el trato humano y la armonia en mi equipo de trabajo?
                           </td>
                           <td align="center">
                             <input id="radio129" type="radio" checked="checked" name="pi6" onclick="setcolor('divPi6',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio130" type="radio" checked="checked" name="pi6" onclick="setcolor('divPi6',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio141" type="radio" checked="checked" name="pi6" onclick="setcolor('divPi6',0)" value="2"/> 
                           </td>
                           <td colspan="2"  bgcolor="Green"  id="divPi6">
                             <input id="detaArmonia" type="text" name="detaArmonia" style="width:97%; margin-left:3px;"/> 
                           </td>
                         </tr>
                        <tr>
                           <td class="style7">
                            La capacidad de mis comapañeros para colaborar y trabajar en equipo?
                           </td>
                           <td align="center">
                             <input id="radio143" type="radio" checked="checked" name="pi7" onclick="setcolor('divPi7',1)" value="0"/> 
                           </td>
                           <td align="center">
                             <input id="radio144" type="radio" checked="checked" name="pi7" onclick="setcolor('divPi7',0)" value="1"/> 
                           </td>
                           <td align="center">
                             <input id="radio145" type="radio" checked="checked" name="pi7" onclick="setcolor('divPi7',0)" value="2"/> 
                           </td>
                           <td colspan="2" bgcolor="Green"  id="divPi7">
                             <input id="detaCapacidades" type="text" name="detaCapacidades" style="width:97%; margin-left:3px;" /> 
                           </td>
                         </tr>
                     </table>
                  </div>

                <div class="clear"></div>
                 <div class="mws-button-row">
                    <input type="submit" value="Grabar" class="btn btn-danger" />
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
</html>
