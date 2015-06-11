<%
response.Write("<script type='text/javascript' src='js/libs/jquery-1.8.2.min.js'></script>")
response.write ("<script type='text/javascript' src='js/funciones.js'></script>") 
sub msidebar()
%>
	      <ul>
                    <li ><a href="dashboard.asp"><i class="icon-home"></i> Dashboard</a></li>
                    <li><a href="#"><i class="icon-graph"></i>Vehiculos</a>
                       <ul class = "closed">
                            <li><a href="nveh.asp">Nuevo vehiculo</a></li>
                            <li><a href="bveh.asp">Busqueda y edicion de vehiculos</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icon-calendar"></i>Pilotos</a>
                    <ul class = "closed">
                            <li><a href="npilo.asp">Nuevo Piloto</a></li>
                            <!--<li><a href="bpilo.asp">Busqueda y edicion de Pilotos</a></li>-->
                        </ul>
                    </li>
                    <li><a href="#"><i class="icon-folder-closed"></i>Clasificaciones</a>
                       <ul class = "closed">
                            <li><a href="tiposerv.asp">Tipo de Servicio</a></li>
                            <li><a href="tipomoto.asp">Tipo de Motor</a></li>
                            <li><a href="tipocaja.asp">Tipo de Caja</a></li>
                            <li><a href="tipodife.asp">Tipo de Diferencial</a></li>
                            <li><a href="marcaveh.asp">Marcas de vehiculo</a></li>
                            <!--<li><a href="lisempre.asp">Empresas</a></li>-->
                            <li><a href="lisrutas.asp">Rutas</a></li>
                            <li><a href="lispredios.asp">Predios</a></li>
                            <li><a href="lisejes.asp">Ejes</a></li>
							<li><a href="combustible.asp">TiPo De Combustible</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icon-archive"></i>Cuestionario</a>
                        <ul class = "closed">
                            <li><a href="cuestionario.asp">Preguntas</a></li>
                        </ul>
                    </li>
                    <li><a href="km360.asp"><i class="icon-table"></i>Ingreso de 360</a></li>
                    <li><a href="#"><i class="icon-list"></i>Reportes</a>
                        <ul class = "closed">
                            <li><a href="resumen360.asp">360 por vehiculo</a></li>
                            <!--<li><a href="resumenflotilla360.asp">360 por flotilla</a></li>-->
                            <li><a href="reportefalla.asp">Reporte por Falla</a></li>
							 <li><a href="reportepilotos.asp">Reporte por Pilotos</a></li>
							  <li><a href="reportefechas.asp">Reporte por Fecha</a></li>
							  <li><a href="reportecomisarias.asp">Reporte por Comisaria Vehiculos</a></li>
							   <li><a href="reportecomisariasp.asp">Reporte por Comisaria Pilotos</a></li>
                        </ul>
                    </li>
                    <!--<li><a href="#"><i class="icon-cogs"></i>Seguridad</a>
                     <ul class = "closed">
                            <li><a href="viewuser.asp">Usuarios</a></li>
                            <li><a href="viewrol.asp">Roles</a></li>
                        </ul>
                    </li>-->
                </ul>
<%
end sub

sub logop()
%>
	<a href="dashboard.asp"><img src="images/logos/logop.png" alt="mws admin" /></a>
<%
end sub
sub tituloderecha()
%>
                    <div id="mws-username">
                        Bienvenido, <%= session("Username") %>
                    </div>
                    <ul>
                        <li><a href="cambiarPass.asp?UserID=<%=session("ID")%>">Cambiar password</a></li>
                        <li><a href="logout.asp">Logout</a></li>
                    </ul>
<%
end sub
sub titulo11()
%>
Litegua Gflota
<%
end sub
sub tite()
%>
Flota Admin
<%
end sub
sub fote()
%>
Copyright Union systems,s.a. 2013. All Rights Reserved.
<%
end sub

Sub conteoempresas()
'set Conn = Server.CreateObject("ADODB.Connection")
'DSN = session("conec")
'conn.Open DSN
'Set Rsx = Server.CreateObject("ADODB.Recordset")
'Rsx.Open "SELECT count(id) as total from flotilla",Conn, 1,3
'response.write  Rsx("total") 
response.write "1"
'set Rsx = nothing
'set Conn = nothing
End Sub

Sub conteousuarios()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "show processlist",Conn, 1,3
dim cont
cont=0
do while not Rsx.eof
cont=cont+1
Rsx.movenext
loop
response.write cont
set Rsx = nothing
set Conn = nothing
End Sub

Sub conteounidades()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
if session("flotilla")= 1 then
	Rsx.Open "SELECT count(codigo) as total from _vehiculos",Conn, 1,3
else
	Rsx.Open "SELECT count(codigo) as total from _vehiculos where empresap="&session("flotilla"),Conn, 1,3
end if
response.write Rsx("total") 
set Rsx = nothing
set Conn = nothing
End Sub

Sub conteoeficiencia()
  'set Conn = Server.CreateObject("ADODB.Connection")
  'DSN = session("conec")
  'conn.Open DSN
  'Set Rsx = Server.CreateObject("ADODB.Recordset")
  'Set Rsx2 = Server.CreateObject("ADODB.Recordset")
  'elmes = month(date)
  'elano = year(date)
  'Rsx.Open "select count(unidad) as totalg from ichequeos inner join ichequeosd on ichequeos.ncorre = ichequeosd.ncorre where month(fecha) =" &  elmes & " and year(fecha) =" & elano,Conn, 1,3
  'Rsx2.Open "select count(unidad) as totalb from ichequeos inner join ichequeosd on ichequeos.ncorre = ichequeosd.ncorre where month(fecha) =" &  elmes & " and year(fecha) =" & elano & " and valor = 0",Conn, 1,3
  'va1 =  cdbl(Rsx("totalg")) 
  'va2 =  cdbl(Rsx2("totalb"))
  'if va1 > 0 and va2 >0 then
  '   totalefic = round((va2/va1)*100,2)
  'else
  ''   totalefic = 0
  'end if
  'response.write totalefic
  'set Rsx = nothing
  'set Rsx2 = nothing
  'set Conn = nothing
  response.write 100
End Sub

Sub codigos()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario order by codigo",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub tposic(tipo)
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT max(posicion) posicion from preguntae_360 where tipo_vehiculo="&tipo,Conn, 1,3
varia = RS("posicion")+1
if isnull(varia) then
varia=1
end if
for i = varia to varia+5
    Response.Write("<OPTION value= '" & i & "'>" & i & "</OPTION>")
next 
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaBus()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
if session("flotilla")=1 then
	Rs.Open "SELECT codigo from _vehiculos where codigo!='' order by codigo ",Conn, 1,3
else
	Rs.Open "SELECT codigo from _vehiculos where empresap="&session("flotilla")&" and codigo!=''order by codigo",Conn, 1,3
end if
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("codigo") & "'>" & rs("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("codigo") & "'>" & rs("codigo") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub dmarcas()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from marcas order by dmarca",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("dmarca") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("dmarca") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub dpredio(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from predios order by id",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = cint(Rsx("id")) then
      Response.Write("<OPTION selected value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   end if
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

sub dprediod(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from predios where id =" & varia,Conn, 1,3
if not Rsx.eof then
   Response.Write( Rsx("tipomotor"))
end if
set Rsx = nothing
set Conn = nothing
End Sub

sub dsectorl(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from ejes order by ideje",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = cint(Rsx("ideje")) then
      Response.Write("<OPTION selected value= '" & Rsx("ideje") & "'>" & Rsx("eje") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("ideje") & "'>" & Rsx("eje") & "</OPTION>")
   end if
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

sub dsectorld(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from ejes where ideje="&varia,Conn, 1,3
if not Rsx.eof then
   Response.Write(Rsx("eje"))
end if
set Rsx = nothing
set Conn = nothing
End Sub

sub drutas()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from rutas order by id",Conn, 1,3
varia = 1
do while not Rst.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rst.movenext
loop
set Rst = nothing
set Conn = nothing
End Sub

Sub drutasi()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs2a = Server.CreateObject("ADODB.Recordset")
rs2.Open "SELECT * from mrutas order by idsalida,iddestino",Conn, 1,3
varia = 1
do while not rs2.eof
   Rs2a.Open "SELECT id,destino from destinos where id = " & rs2("idsalida") & "",Conn, 1,3
   if not Rs2a.EOF then
      nomsa = rs2a("destino")
   else
      nomsa = ""
   end if
   Rs2a.close
   Rs2a.Open "SELECT id,destino from destinos where id = " & rs2("iddestino") & "",Conn, 1,3
   if not Rs2a.EOF then
      nomde = rs2a("destino")
   else
      nomde = ""
   end if
   Rs2a.close
   if (varia) = 1 then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & nomsa & "  -  " & nomde & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & nomsa & "  -  " & nomde & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set rs2= nothing
set Conn = nothing
End Sub


sub dpaises()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from paises order by id",Conn, 1,3
varia = 1
do while not Rst.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rst.movenext
loop
set Rst = nothing
set Conn = nothing
End Sub

sub dpaises2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from paises where id = " & varia & " order by id",Conn, 1,3
if rst.recordcount > 0 then
      response.write rst("nombre")
else
     response.write "No ingresada"
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub llenatkm2r(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
If varia = "8" then
desc = "Rutas"
Response.Write("<OPTION selected value= '" & varia & "'>" & desc & "</OPTION>")
else
conn.Open DSN
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.Open "SELECT * from tkms where id = " & varia & " order by id",Conn, 1,3
Response.Write("<OPTION selected value= '" & rs3("id") & "'>" & rs3("tipokm") & "</OPTION>")
set Rs2 = nothing
set Rs3 = nothing
set Conn = nothing
end if
End Sub


sub drutas2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
response.write varia
if isnull(varia) = true then
   varia = 0
end if
Rst.Open "SELECT * from rutas where id = " & varia & "",Conn, 1,3
if rst.recordcount > 0 then
      response.write rst("descripcion")
else
     response.write "No ingresada"
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub dcombustibles()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventario where clasifi = 5 and subclasi = 502 order by codigo,descripcion",Conn, 1,3
do while not Rs2.eof
'   if rs("nombre") = dx2 then
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigo") & "  -  " & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("codigo") & "  -  " & rs2("descripcion") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

sub drutas3(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from rutas order by id",Conn, 1,3
do while not Rst.eof
  'if cint(rst("id")) = cint(varia) then
'   if varia = 1 then
     ' Response.Write("<OPTION selected value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   'else
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   'end if
   rst.movenext
loop
set Rst = nothing
set Conn = nothing
End Sub

sub drutas3d(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from rutas where id="&varia,Conn, 1,3
if not Rst.eof then
   Response.Write(rst("descripcion"))
end if
set Rst = nothing
set Conn = nothing
End Sub

sub qnitprov()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from proveedores order by nit",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nit") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nit") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub qnomprov()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from proveedores order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub estante(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsxa = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rsxa.Open "SELECT * from inventariod where idcodigo = '" & varia & "' and idbodega = " & nbode & " order by id",Conn, 1,3
'Rsxa.Open "SELECT * from inventariod ",Conn, 1,3
if Rsxa.recordcount > 0 then
      Response.Write Rsxa("estante")
      else
      response.write "0"
end if
set Rsxa = nothing
set Conn = nothing
End Sub

sub fila(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsxa = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rsxa.Open "SELECT * from inventariod where idcodigo = '" & varia & "' and idbodega = " & nbode & " order by id",Conn, 1,3
'Rsxa.Open "SELECT * from inventariod ",Conn, 1,3
if Rsxa.recordcount > 0 then
      Response.Write Rsxa("fila")
else
      response.write "0"
end if
set Rsxa = nothing
set Conn = nothing
End Sub

sub colum(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsxa = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rsxa.Open "SELECT * from inventariod where idcodigo = '" & varia & "' and idbodega = " & nbode & " order by id",Conn, 1,3
'Rsxa.Open "SELECT * from inventariod ",Conn, 1,3
if Rsxa.recordcount > 0 then
      Response.Write Rsxa("columna")
else
      response.write "0"
end if
set Rsxa = nothing
set Conn = nothing
End Sub

sub roles()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from roles order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("rol") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("rol") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub lproves()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from proveedores order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nit") & "</OPTION>")
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub roles2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from roles order by rol",Conn, 1,3
do while not Rs.eof
   if cint(varia) = cint(rs("id")) then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("rol") & "</OPTION>")
    else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("rol") & "</OPTION>")
   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub verrol(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from roles where id = " & varia & "",Conn, 1,3
if rst.recordcount > 0 then
   response.write rst("rol")
end if
set Rst = nothing
set Conn = nothing
End Sub

sub llenaestaciones()
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT * from estacionesgas order by nombre",Conn, 1,3
varia = 1
do while not Rsba.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   Rsba.movenext
loop
set Rsba = nothing
set Conn = nothing
End Sub

sub llenabomba()
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT * from bomba order by nombre",Conn, 1,3
varia = 1
do while not Rsba.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   Rsba.movenext
loop
set Rsba = nothing
set Conn = nothing
End Sub
sub lestac(varia)
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT * from estacionesgas where id = " & varia & "",Conn, 1,3
if Rsba.recordcount > 0 then
    response.write Rsba("nombre")
else
   response.write "No Existe"
end if
set Rsba = nothing
set Conn = nothing
End Sub

sub rolesde()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from rolesd order by rol",Conn, 1,3
varia = 1
do while not Rsx.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & rsx("idpag") & "'>" & rsx("rol") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rsx("idpag") & "'>" & rsx("rol") & "</OPTION>")
   end if
   varia = varia + 1
   rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub colores(colo)
varia = colo
for i = 1 to 3
   if i = 1  then
    if colo = "Verde" then
      Response.Write("<OPTION selected value= 'Verde'>Verde</OPTION>")
    else
      Response.Write("<OPTION  value= 'Verde'>Verde</OPTION>")
    end if
   end if
   if i = 2 then
       if colo = "Amarrillo" then
         Response.Write("<OPTION selected value= 'Amarrillo'>Amarrillo</OPTION>")
       else
         Response.Write("<OPTION  value= 'Amarrillo'>Amarrillo</OPTION>")
       end if
   end if
   if i = 3 then
       if colo = "Rojo" then
         Response.Write("<OPTION selected value= 'Rojo'>Rojo</OPTION>")
       else
         Response.Write("<OPTION  value= 'Rojo'>Rojo</OPTION>")
       end if
   end if
next
set Rs = nothing
set Conn = nothing
End Sub

Sub dtecnicos()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from ttecnicos order by nombre",Conn, 1,3

do while not Rs2.eof
'   if rs("nombre") = dx2 then
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub ltecnicos(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from ttecnicos where id = "&varia&" order by id",Conn, 1,3
if rs2.recordcount > 0 then
   response.Write rs2("nombre")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub desgas(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if rs2.recordcount > 0 then
   response.Write rs2("desgaste")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

function desgasa(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   'response.Write rs2("desgaste")
   valor = rs2("desgaste")
end if
set Rs2 = nothing
set Conn = nothing 
desgasa = valor
End function

function qacc(varia,varia2)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
valor = 0
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "select * from userw where username = '"&varia&"' order by id",Conn, 1,3
''Rs2.Open "SELECT * FROM userw",Conn, 3,1
if NOT RS2.EOF then
 '  valor = rs2("desgaste")
    nud = rs2("nrol")
    Set Rs3 = Server.CreateObject("ADODB.Recordset")
    Rs3.Open "SELECT * FROM userd WHERE idrol = "&nud&" and idacce = "&varia2&" order by id",Conn, 1,3
    if NOT RS3.EOF  then
       valor = rs3("acceso")
    else  
       valor = 0
    end if
else
  valor = 0
end if
set Rs2 = nothing
set Rs3 = nothing
set Conn = nothing 
qacc = valor
End function

Sub desgas2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   estapagina = 29
   resula = qacc(session("username"),estapagina)
  for i = 0 to 32
   if (i) <= cint(rs2("desgaste")) or resula <> 1 then
     if i = cint(rs2("desgaste")) then
        Response.Write("<OPTION selected value= '" & i & "'>" & i & "</OPTION>")
     else 
        Response.Write("<OPTION value= '" & i & "'>" & i & "</OPTION>")
     end if
   end if
  next
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub edades()
for i = 18 to 75
   if i = 1 then
      Response.Write("<OPTION selected value= '" & i & "'>" & i & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & i & "'>" & i & "</OPTION>")
   end if
next 
End Sub

Sub desgas3()
for i = 1 to 22
   if i = 1 then
      Response.Write("<OPTION selected value= '" & i & "'>" & i & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & i & "'>" & i & "</OPTION>")
   end if
next 
End Sub

Sub deslla(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("id_llanta")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub kilom(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("kmi")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub vfech(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * FROM inventarioll WHERE id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("fechamov")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lfallas(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from tfallas where id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("pieza")&"."&rs2("descripcion")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lrevison(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from trevision where id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("pieza")&"."&rs2("descripcion")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub linven(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventario where codigo = '"&varia&"' order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("codigo")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub keje(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from vehiculos where id = "&varia&" order by id",Conn, 1,3
if not Rs2.EOF then
   response.Write rs2("sector")
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub dfallas()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from tfallas order by pieza,descripcion",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("pieza") & "." & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("pieza") & "." & rs2("descripcion") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub drevision()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from trevision order by pieza,descripcion",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("pieza") & "." & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("pieza") & "." & rs2("descripcion") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub dproductos()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventario order by codigo,descripcion",Conn, 1,3
do while not Rs2.eof
'   if rs("nombre") = dx2 then
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigo") & "  -  " & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("codigo") & "  -  " & rs2("descripcion") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub dllantasr()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventarioll order by id_llanta",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("id_llanta") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("id_llanta") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub dcant()
for i = 1 to 50
   if i =1 then
      Response.Write("<OPTION selected value= '" & i & "'>" & i & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & i & "'>" & i & "</OPTION>")
   end if
next 
End Sub

Sub llenatkm(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from tkms order by tipokm",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("tipokm") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("tipokm") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenamotivo(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from motivos where tipo = " & varia & " order by id",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenamotivo2()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from motivos  order by id",Conn, 1,3
do while not Rs2.eof
   if rs2("tipo") = 1 then tti = "Usadas"
   if rs2("tipo") = 2 then tti = "Reencauchadas"
   if rs2("tipo") = 3 then tti = "Basura"
   if rs2("tipo") = 4 then tti = "Reparacion"
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & tti & "-" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & tti & "-" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenamotivo3(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from motivos where tipo = " & varia & " order by id",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenaempre(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from empresasv where tipo = " & varia & " order by id",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenaempre2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from empresasv where id = " & varia & " and tipo = 2 order by id",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lmarcas()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from marcas order by dmarca",Conn, 1,3
varia = 1
do while not Rs2.eof
   if (varia) = 1then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("dmarca") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("dmarca") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lmarcasl(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from marcas order by dmarca",Conn, 1,3
do while not Rs2.eof
   if cint(varia) = Rs2("id") then
      Response.Write("<OPTION value= '" & rs2("id") & "' selected>" & rs2("dmarca") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("dmarca") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lmarcasd(varia)
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from marcas where id = " & varia,Conn, 1,3
if not Rs2.eof then
   Response.Write(rs2("dmarca"))
end if
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lestad()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from estadistica order by descripcion",Conn, 1,3
varia = 1
do while not Rs2.eof
   if (varia) = 1then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub lestad2(clasi)
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from estadistica order by descripcion",Conn, 1,3
do while not Rs2.eof
   if cint(rs2("id")) = cint(clasi) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION  value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   end if

   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub aceites(nace)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
if nace = 0 then
   Rs2.Open "SELECT * from inventario order by codigo",Conn, 1,3
else
   Rs2.Open "SELECT * from inventario where clasifi = '" & nace & "' order by codigo",Conn, 1,3
end if
varia = 1
do while not Rs2.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub


Sub peri()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT distinct(ano) from edsi",Conn, 1,3
varia = 1
do while not Rs2.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs2("ano") & "'>" & rs2("ano") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("ano") & "'>" & rs2("ano") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub perio2()
     Response.Write("<OPTION value= '2011'>2011</OPTION>")
     Response.Write("<OPTION selected value= '2012'>2012</OPTION>")
End Sub

Sub quemes(varia)
    if varia = 1 then
       response.write "Enero"
    end if
    if varia = 2 then
       response.write "Febrero"
    end if
    if varia = 3 then
       response.write "Marzo"
    end if
    if varia = 4 then
       response.write "Abril"
    end if
   if varia = 5 then
       response.write "Mayo"
    end if
   if varia = 6 then
       response.write "Junio"
    end if
   if varia = 7 then
       response.write "Julio"
    end if
   if varia = 8 then
       response.write "Agosto"
    end if
   if varia = 9 then
       response.write "Septiembre"
    end if
   if varia = 10 then
       response.write "Octubre"
    end if
   if varia = 11 then
       response.write "Noviembre"
    end if
   if varia = 12 then
       response.write "Diciembre"
    end if
End Sub

function quekm(varia,varia2,varia3)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
totalk = 0
febu = cdate( varia3 & "/" & varia2 & "/" & "01")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from ikms where vehiculo = " & varia & " and fecha >= '" & febu & "' ",Conn, 1,3
do while not Rs2.eof
    totalk = totalk + (cdbl(rs2("kmi"))-cdbl(rs2("kmant")))
    rs2.movenext
loop
'response.write totalk
quekm = totalk
set Rs2 = nothing
set Conn = nothing
End function

function quega(varia,varia2,varia3)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
totalk = 0
febu = cdate( varia3 & "/" & varia2 & "/" & "01")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs2a = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from salidace where vehiculo = " & varia & " and fecha >= '" & febu & "' ",Conn, 1,3
do while not Rs2.eof
    corres = rs2("corre")
    rs2a.Open "SELECT * from salidacd where id2 = " & corres & "",Conn, 1,3
    do while not rs2a.eof
       totalk = totalk + cdbl(rs2a("quantity"))
       rs2a.movenext
    loop
    rs2a.close
    rs2.movenext
loop
'response.write totalk
quega = totalk
set Rs2 = nothing
set Conn = nothing
End function

Sub aceite(nace,varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
if nace = 0 then
   Rs2.Open "SELECT * from inventario where (clasifi = '1' or clasifi = '7' or clasifi = '8' or clasifi = '9') order by codigo",Conn, 1,3
else
   Rs2.Open "SELECT * from inventario where clasifi = '" & nace & "' order by codigo",Conn, 1,3
end if
do while not Rs2.eof
   if cint(varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub filtroap(nace,varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventario where clasifi = '" & nace & "' order by codigo",Conn, 1,3
'varia = 1
do while not Rs2.eof
   if cint(varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("codigo") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub


Sub bpilotos(flo)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from pilotos  order by trim(nombre);",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub proves()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from proveedores order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub compradores()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from compradores order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub departamentos()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from departamentos order by descripcion",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub provesnit()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from proveedores order by Nit",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nit") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nit") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub provesd(qid)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from proveedores where id = " & qid & " order by nombre",Conn, 1,3
if not rst.eof then
   response.write rst("nombre")
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub provesl(qid)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from proveedores where id = " & qid & " order by nombre",Conn, 1,3
''Rst.Open "SELECT * from proveedores ",Conn, 1,3
if not rst.eof then
     Response.Write("<OPTION value= '" & Rst("id") & "'>" & Rst("nit") & "</OPTION>")
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub deptosd(qid)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from departamentos where id = " & qid & " order by descripcion",Conn, 1,3
varia = 1
if not rst.eof then
   response.write rst("descripcion")
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub compradoresd(qid)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from compradores where id = " & qid & " order by nombre",Conn, 1,3
varia = 1
if not rst.eof then
   response.write rst("nombre")
end if
set Rst = nothing
set Conn = nothing
End Sub

Sub clasifica()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from clasificacion order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub clasifi()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from clasificacion order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
    response.write "<a href='mantei2.asp?pagi=" & rs("id") & "'>" & rs("nombre") & " &nbsp; / &nbsp;</b></a>"
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub


Sub clasifi2()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from clasificacion order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
    response.write "<a href='mantes2.asp?pagi=" & rs("id") & "'>" & rs("nombre") & " &nbsp; / &nbsp;</b></a>"
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub clasifica3()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from clasificacion order by nombre",Conn, 1,3
varia = 1
do while not Rs2.eof
   if rs2("id") = clasi then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub clasifica4()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from tcomponentes order by nombre",Conn, 1,3
varia = 1
do while not Rs2.eof
   if rs2("id") = clasi then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub clasifi5(vara)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
Conn2.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from clasificacion where id = " & vara & " order by nombre",Conn2, 1,3
varia = 1
do while not Rs2.eof
    response.write rs2("id")
   rs2.movenext
loop
set Rs2 = nothing
set Conn2 = nothing
End Sub


Sub clasifica2(clasi)
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from clasificacion order by nombre",Conn, 3,3

do while not Rs2.eof
      Response.Write("<OPTION  value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub


Sub etmotor()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tipomotor order by id",Conn, 1,3
varia = 1
do while not Rsx.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub tipovehl(varia)
   if cint(varia) = 1 then
       Response.Write("<option selected value = 1>Bus</option>")
       Response.Write("<option value = 2>Panel</option>")
       Response.Write("<option value = 3>Camion</option>")
       Response.Write("<option value = 12>Motocicleta</option>")
       Response.Write("<option value = 5>Pickup</option>")
   end if
   if cint(varia) = 2 then
        Response.Write("<option selected value = 2>Panel</option>")
       Response.Write("<option value = 1>Bus</option>")
       Response.Write("<option value = 3>Camion</option>")
       Response.Write("<option value = 12>Motocicleta</option>")
       Response.Write("<option value = 5>Pickup</option>")
   end if
   if cint(varia) = 3 then
        Response.Write("<option selected value = 3>Camion</option>")
       Response.Write("<option value = 2>Panel</option>")
       Response.Write("<option value = 1>Bus</option>")
       Response.Write("<option value = 12>Motocicleta</option>")
       Response.Write("<option value = 5>Pickup</option>")
   end if
   if cint(varia) = 12 then
        Response.Write("<option selected value = 12>Motocicleta</option>")
       Response.Write("<option value = 2>Panel</option>")
       Response.Write("<option value = 3>Camion</option>")
       Response.Write("<option value = 1>Bus</option>")
       Response.Write("<option value = 5>Pickup</option>")   
   end if
   if cint(varia) = 5 then
       Response.Write("<option selected value = 5>Pickup</option>")
       Response.Write("<option value = 2>Panel</option>")
       Response.Write("<option value = 3>Camion</option>")
       Response.Write("<option value = 12>Motocicleta</option>")
       Response.Write("<option value = 1>Bus</option>")
   end if
End Sub

Sub tipovehd(varia)
   if cint(varia) = 1 then
       Response.Write("Bus")
   end if
   if cint(varia) = 2 then
       Response.Write("Panel")
   end if
   if cint(varia) = 3 then
       Response.Write("Camion")
   end if
   if cint(varia) = 4 then
       Response.Write("Motocicleta")
   end if
   if cint(varia) = 5 then
       Response.Write("Pickup")
   end if
End Sub


Sub Ejesl(varia)
   if cint(varia) = 0 then
        Response.Write("<option selected value = 0>0</option>")
		Response.Write("<option value = 1>1</option>")
        Response.Write("<option value = 2>2</option>")
   end if
   if cint(varia) = 1 then
        Response.Write("<option value = 0>0</option>")
		Response.Write("<option selected value = 1>1</option>")
        Response.Write("<option value = 2>2</option>")
   end if
   if cint(varia) = 2 then
        Response.Write("<option value = 0>0</option>")
		Response.Write("<option value = 1>1</option>")
        Response.Write("<option selected value = 2>2</option>")
   end if
End Sub

Sub Ejestl(varia)
   if cint(varia) = 0 then
        Response.Write("<option selected value = 0>0</option>")
		Response.Write("<option value = 1>1</option>")
        Response.Write("<option value = 2>2</option>")
   end if
   if cint(varia) = 1 then
        Response.Write("<option value = 0>0</option>")
		Response.Write("<option selected value = 1>1</option>")
        Response.Write("<option value = 2>2</option>")
   end if
   if cint(varia) = 2 then
        Response.Write("<option value = 0>0</option>")
		Response.Write("<option value = 1>1</option>")
        Response.Write("<option selected value = 2>2</option>")
   end if
End Sub

Sub patinl(varia)
   if (varia) = "si" then
           Response.Write("<option selected value = si>Si</option>")
           Response.Write("<option value = no>No</option>")
   else
           Response.Write("<option value = si>Si</option>")
           Response.Write("<option selected value = no>No</option>")
   end if
End Sub

Sub etmotorl(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT Id,tipomotor from tipomotor",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = Rsx("id") then
      Response.Write("<option  selected value= '" & rsx("Id") & "'>" & rsx("tipomotor") & "</option>")
   else
      Response.Write("<option value= '" & rsx("Id") & "'>" & rsx("tipomotor") & "</option>")
   end if
   rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub etmotord(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from timotor where id = " & varia,Conn, 1,3
if not Rsx.eof then
   Response.Write(rsx("tipomotor"))
end if
set Rsx = nothing
set Conn = nothing
End Sub


Sub mmotor()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from mmotor order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub tidifer()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tidifer order by id",Conn, 1,3
varia = 1
do while not Rsx.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub tidiferl(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tidifer order by id",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = Rsx("id") then
      Response.Write("<OPTION selected value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("tipomotor") & "</OPTION>")
   end if
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub tidiferd(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tidifer where id = " & varia,Conn, 1,3
if not Rsx.eof then
      Response.Write(Rsx("tipomotor"))
end if
set Rsx = nothing
set Conn = nothing
End Sub

Sub midifer()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from mdiferencial order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub ticaja()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tcaja order by id",Conn, 1,3
varia = 1
do while not Rsx.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub


Sub ticajal(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tcaja order by id",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = cint(Rsx("id")) then
     Response.Write("<OPTION selected value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rsx("id") & "'>" & rsx("tipomotor") & "</OPTION>")
   end if
   rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub ticajad(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from tcaja where id = " & varia,Conn, 1,3
if not Rsx.eof then
   Response.Write(rsx("tipomotor"))
end if
set Rsx = nothing
set Conn = nothing
End Sub

Sub servicios()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from rutas order by nombrerut",Conn, 1,3
varia = 1
do while not Rs.eof
     if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombrerut") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombrerut") & "</OPTION>")
   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaveh()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
quev = session("empn")
nbode  = session("lugar")
if nbode = 1 then
Rs.Open "SELECT * from vehiculos order by codigo",Conn, 1,3
else
Rs.Open "SELECT * from vehiculos where sector = " & nbode & " order by codigo",Conn, 1,3
end if
varia = 1
do while not Rs.eof
  if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   end if
 
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaorden()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.Open "SELECT * from ordenes where status = '1'",Conn, 1,3
varia = 1
do while not Rs3.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs3("corre") & "'>" & rs3("corre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs3("corre") & "'>" & rs3("corre") & "</OPTION>")
   end if
   varia = varia + 1
   rs3.movenext
loop
set Rs3 = nothing
set Conn = nothing
End Sub

Sub llenaorden2()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs3 = Server.CreateObject("ADODB.Recordset")
quev = session("empn")
Rs3.Open "SELECT * from ordenes where nempresa = " & quev & " order by id ",Conn, 1,3
varia = 1
do while not Rs3.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs3("corre") & "'>" & rs3("corre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs3("corre") & "'>" & rs3("corre") & "</OPTION>")
   end if
   varia = varia + 1
   rs3.movenext
loop
set Rs3 = nothing
set Conn = nothing
End Sub

Sub nvehi(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   response.Write rsx("codigo")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub



Sub nvehim(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Set Rsx2 = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   nocodigo = cdbl(rsx("codigo"))-1
   Rsx2.Open "SELECT * from vehiculos where codigo = '" & nocodigo & "' order by id",Conn2, 1,3
   if rsx2.recordcount > 0 then
      response.Write rsx2("id")
   else
     t = 1
     Rsx2.close
     do while t = 1
        nocodigo = nocodigo-1
        Rsx2.Open "SELECT * from vehiculos where codigo = '" & nocodigo & "' order by id",Conn2, 1,3
        if rsx2.recordcount > 0 then
           t = 2
           response.Write rsx2("id")
        end if
        Rsx2.close
        if nocodigo = 0 then
           t = 2
             response.Write varia
        end if
     loop
   end if
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub nvehis(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Set Rsx2 = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   nocodigo = cdbl(rsx("codigo"))+1
   Rsx2.Open "SELECT * from vehiculos where codigo = '" & nocodigo & "' order by id",Conn2, 1,3
   if rsx2.recordcount > 0 then
      response.Write rsx2("id")
   else
  t = 1
     Rsx2.close
     do while t = 1
        nocodigo = nocodigo+1
        Rsx2.Open "SELECT * from vehiculos where codigo = '" & nocodigo & "' order by id",Conn2, 1,3
        if rsx2.recordcount > 0 then
           t = 2
           response.Write rsx2("id")
        end if
        Rsx2.close
        if nocodigo = 2500 then
           t = 2
             response.Write varia
        end if
     loop
   end if
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub nvehi2(varia,nuop)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   if nuop = 1 then
       response.Write rsx("codigo")
   else
      if nuop = 2 then
         response.Write rsx("placa")
      else 
         if nuop = 3 then
            response.Write rsx("marca")
         else
            if nuop = 4 then
               response.Write rsx("modelo")
            else
               if nuop = 5 then
                  response.Write rsx("sector")
               else
                  if nuop = 6 then
                     response.Write rsx("empresas")
                  else
                     response.Write rsx("codigo")
                  end if
               end if
            end if
         end if
      end if
   end if
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub qvehi(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   response.Write rsx("codigo")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub quser(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from userw where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   response.Write rsx("username")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

sub qacce(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from rolesd where idpag = " & varia & " order by id",Conn2, 1,3
if not rsx.eof then
   response.Write rsx("rol")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub qrol(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from roles where id = " & varia & " order by id",Conn2, 1,3
if not rsx.eof then
   response.Write rsx("rol")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub llenaplaca()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
nbode = 1
if nbode = 1 then
	if session("flotilla")=1 then
		Rsx.Open "SELECT codigo,placa from _vehiculos order by placa",Conn, 1,3
	else
		Rsx.Open "SELECT codigo,placa from _vehiculos where empresap="&session("flotilla")&" order by placa",Conn, 1,3
	end if
else
	if session("flotilla")=1 then
		Rsx.Open "SELECT codigo,placa from _vehiculos where sector = " & nbode & " order by placa",Conn, 1,3
  	else
		Rsx.Open "SELECT codigo,placa from _vehiculos where sector = " & nbode & " and empresap="&session("flotilla")&" order by placa",Conn, 1,3
	end if
end if
varia = 1
do while not Rsx.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & Rsx("codigo") & "'>" & Rsx("placa") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("codigo") & "'>" & Rsx("placa") & "</OPTION>")
   end if
   varia = varia + 1
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

sub llenaunidad()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
nbode = 1
if nbode = 1 then
	if session("flotilla")=1 then
		Rsx.Open "SELECT codigo from _vehiculos order by codigo",Conn, 1,3
	else
		Rsx.Open "SELECT codigo from _vehiculos where empresap="&session("flotilla")&" order by codigo",Conn, 1,3
	end if
else
	if session("flotilla")=1 then
		Rsx.Open "SELECT codigo from _vehiculos where sector = " & nbode & " order by codigo",Conn, 1,3
	else
		Rsx.Open "SELECT codigo from _vehiculos where sector = " & nbode & " and empresap="&session("flotilla")&" order by codigo",Conn, 1,3
	end if
end if
varia = 1
do while not Rsx.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION  value= '" & Rsx("codigo") & "'>" & Rsx("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("codigo") & "'>" & Rsx("codigo") & "</OPTION>")
   end if
   varia = varia + 1
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub


sub llenaunidad2()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
if session("flotilla")=1 then
	Rs.Open "SELECT * from _vehiculos order by codigo",Conn, 1,3
else
	Rs.Open "SELECT * from _vehiculos where empresap="&session("flotilla")&" order by codigo",Conn, 1,3
end if
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub llenacodigopiloto()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rs.Open "SELECT id,nombre from pilotos order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("id") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("id") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub llenanombrepiloto()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rs.Open "SELECT * from pilotos order by nombre",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub cuentasc()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from cuentascontables order by id",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub descue(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from cuentascontables where id = "&varia&" order by id",Conn, 1,3
if not Rs2.eof then
   response.write rs2("descripcion") 
end if
set Rs2 = nothing
set Conn = nothing
End Sub


sub cuentasc2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from cuentascontables order by id",Conn, 1,3
do while not Rs2.eof
   if cint(rs2("id")) = cint(varia) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("descripcion") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

sub cecosto()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from centrocostos order by id",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub sucosto()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from subcentrocostos order by id",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub ldeptos()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from departamentos order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaveh2(nveh)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from vehiculos order by codigo",Conn, 1,3
do while not Rs.eof
   if CINT(nveh) = rs("id") then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
   else
   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaveh3(nveh)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
if session("flotilla")=0 then
	Rsx.Open "SELECT codigo from _vehiculos where tveh = " & nveh & " order by codigo",Conn, 1,3
else
	Rsx.Open "SELECT codigo from _vehiculos where tveh = " & nveh & " and empresap="&session("flotilla")&" order by codigo",Conn, 1,3
    'Rsx.Open "SELECT codigo from _vehiculos where tveh = " & nveh & " order by codigo",Conn, 1,3
end if
do while not Rsx.eof
      Response.Write("<OPTION selected value= '" & Rsx("codigo") & "'>" & Rsx("codigo") & "</OPTION>")
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub llenaveh4(nveh)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos order by id",Conn, 1,3
do while not Rsx.eof
   if CINT(nveh) = cint(Rsx("id")) then
      Response.Write("<OPTION selected value= '" & Rsx("id") & "'>" & Rsx("codigo") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("codigo") & "</OPTION>")
   end if
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub

Sub llenaveh4d(nveh)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from vehiculos where id="&nveh,Conn, 1,3
if not Rsx.eof then
      Response.Write(Rsx("codigo"))
end if
set Rsx = nothing
set Conn = nothing
End Sub

Sub llenatkm(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from tkms order by tipokm",Conn, 1,3
do while not Rs2.eof
   if (varia) = cint(rs2("id")) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("tipokm") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs2("id") & "'>" & rs2("tipokm") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub llenatkm2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from vehiculosd where idvehiculo = " & varia & " order by id",Conn, 1,3
if rs2.recordcount > 0 then
   nuvg = rs2("kms")
else
   nuvg = 3
end if
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.Open "SELECT * from tkms where id = " & nuvg & " order by id",Conn, 1,3
Response.Write("<OPTION selected value= '" & rs3("id") & "'>" & rs3("tipokm") & "</OPTION>")
set Rs2 = nothing
set Rs3 = nothing
set Conn = nothing
End Sub

Sub llenaFlota()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT id,descripcion from departamentos order by id",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if varia = 1 then
   Response.Write("<OPTION value= 0>" &"TODAS" & "</OPTION>")
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("descripcion") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaFlotal(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
    DSN = session("conec")
conn.Open DSN
Set RSx = Server.CreateObject("ADODB.Recordset")
RSx.Open "SELECT id,descipcion from departamentos order by id",Conn, 1,3
do while not RSx.eof
   if cint(varia) = cint(RSx("id")) then
      Response.Write("<OPTION selected value= '" & RSx("id") & "'>" & RSx("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & RSx("id") & "'>" & RSx("descripcion") & "</OPTION>")
   end if
   RSx.movenext
loop
set RSx = nothing
set Conn = nothing
End Sub

Sub llenaFlotad(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set RSx = Server.CreateObject("ADODB.Recordset")
RSx.Open "SELECT id,descripcion from departamentos where id =" & varia,Conn, 1,3
if not RSx.eof then
      Response.Write(RSx("descripcion"))
end if
set RSx = nothing
set Conn = nothing
End Sub

Sub agencias()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "Driver={MySQL ODBC 5.1 Driver};Server=192.168.10.183;User id=UnionSystems;password=union01;database=facturacion;"
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "select id_agc, nom_agc from agencia order by nom_agc",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id_agc") & "'>" & rs("nom_agc") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id_agc") & "'>" & rs("nom_agc") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub solicita()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "select * from personaladmin",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub tipo_conbustible()
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT * from combustible order by nombre",Conn, 1,3
varia = 1
do while not Rsba.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   Rsba.movenext
loop
set Rsba = nothing
set Conn = nothing
End Sub

sub tanque()
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT * from tanque order by nombre",Conn, 1,3
varia = 1
do while not Rsba.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsba("id") & "'>" & Rsba("nombre") & "</OPTION>")
   end if
   varia = varia + 1
   Rsba.movenext
loop
set Rsba = nothing
set Conn = nothing
End Sub

sub piloto()
set Conn = Server.CreateObject("ADODB.Connection")
 DSN = session("conec")
conn.Open DSN
Set Rsba = Server.CreateObject("ADODB.Recordset")
Rsba.Open "SELECT id_emp, nom_emp FROM encomiendas.empleado where id_pso=1",Conn, 1,3
varia = 1
do while not Rsba.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsba("id_emp") & "'>" & Rsba("nom_emp") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsba("id_emp") & "'>" & Rsba("nom_emp") & "</OPTION>")
   end if
   varia = varia + 1
   Rsba.movenext
loop
set Rsba = nothing
set Conn = nothing
End Sub

Sub pulgadas()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from medidaestacion order by id",Conn, 1,3
do while not Rs.eof
pulgada = split(rs("pulgadas"), " ")
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("pulgadas") & "</OPTION>")
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub tipovehiculo()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from tipo_vehiculo order by id_tipo_vehiculo",Conn, 1,3
do while not Rs.eof
      Response.Write("<OPTION value= '" & rs("id_tipo_vehiculo") & "'>" & rs("tipo_vehiculo") & "</OPTION>")
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub predios
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT id,nombre from predio order by id",Conn, 1,3
do while not Rsx.eof
   if cint(varia) = cint(Rsx("id")) then
      Response.Write("<OPTION selected value= '" & Rsx("id") & "'>" & Rsx("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx("id") & "'>" & Rsx("nombre") & "</OPTION>")
   end if
   Rsx.movenext
loop
set Rsx = nothing
set Conn = nothing
End Sub
%>