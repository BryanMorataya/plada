<%

sub msidebar()
%>
				<ul>
						<li>
							<div id="search" >
								<form method="post" action="logout.asp">
									<div>
										Bienvenido :&nbsp;<%=session("Username") %>
										 <input name="Submit" type="image" class="navlink" id="Submit" value="Login" src="images/Unlock-32.png" alt="Cerrar su session" />
									</div>
								</form>
							</div>
							<div style="clear: both;">&nbsp;</div>
						</li>
						<li>
							<h2>Vehiculos</h2></li>
	                         <a href="vehiculos.asp"><li>
		                	<img src="images/bustrans.png" alt="" width="160" height="76" border="0" /></li></a>
						</li>
						<li>
							<h2>Inventarios</h2></li>
	                         <a href="inven.asp"><li><img src="images/Basket-128.png" alt="" width="95" 
                                height="76" border="0" /></li></a>
                        </li>
						<li>
							<h2>Ingresos</h2></li>
	                         <a href="manteg.asp"><li>
							<img src="images/Tools-128.png" alt="" width="95" height="76" border="0" /></li></a>
                        </li>
						<li>
							<h2>Salidas</h2></li>
	                         <a href="salidas.asp"><li>
							<img src="images/Invoice-128.png" alt="" width="95" height="76" border="0"></li></a>
						</li>
						<li>
							<h2>Kilometraje</h2></li>
	                         <a href="km.asp"><li>
	                       <img src="images/km.png" alt="" width="95" height="76" border="0" /></li></a>
						</li>
						<li>
							<h2>Reportes</h2></li>
	                         <a href="reportesp.asp"><li>
							<img src="images/bar128.png" alt="" width="95" height="76" border="0" /></li></a>
						</li>
       		           <%if session("Username")<>"" then 
                        estapagina = 7
                        resula = qacc(session("username"),estapagina)
                        if resula <> 1 then
                        %>
                    	<li>
							<h2>Seguridad</h2></li>
	                         <a href="seguridad.asp"><li>
							<img src="images/seguridad.png" alt="" width="95" height="76" border="0" /></li></a>
						</li>	
                        <%end if 
                           end if
 
                        %>					
					</ul>
<%
end sub

sub logop()
%>
		    <h1 align="center">
                <img src="images/trans/iconounion.png" alt="" border = 0 
                    style="width: 132px; height: 65px;" /> 
                    </h1>
<%
end sub

sub tite()
%>
		    Sistema de prueba
<%
end sub

Sub codigos()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
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

sub drutas3(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from rutas order by id",Conn, 1,3
do while not Rst.eof
  if rst("id") = varia then
'   if varia = 1 then
      Response.Write("<OPTION selected value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rst("id") & "'>" & rst("descripcion") & "</OPTION>")
   end if
   rst.movenext
loop
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
Set Rsx2 = Server.CreateObject("ADODB.Recordset")
Rsx2.Open "SELECT * from roles order by rol",Conn, 1,3
varia = 1
do while not Rsx2.eof
   if varia = 1 then
      Response.Write("<OPTION value= '" & Rsx2("id") & "'>" & Rsx2("rol") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx2("id") & "'>" & Rsx2("rol") & "</OPTION>")
   end if
   varia = varia + 1
   Rsx2.movenext
loop
set Rsx2 = nothing
set Conn = nothing
End Sub

sub ktipo(varia)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn.Open DSN
Set Rsx2 = Server.CreateObject("ADODB.Recordset")
Rsx2.Open "SELECT * from tusuarios order by nid",Conn, 1,3
do while not Rsx2.eof
  if cint(varia) = cint(Rsx2("nid")) then
      Response.Write("<OPTION selected value= '" & Rsx2("nid") & "'>" & Rsx2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & Rsx2("nid") & "'>" & Rsx2("nombre") & "</OPTION>")
   end if
   Rsx2.movenext
loop
set Rsx2 = nothing
set Conn = nothing
End Sub

sub roles2(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rsx2 = Server.CreateObject("ADODB.Recordset")
Rsx2.Open "SELECT * from roles order by rol",Conn, 1,3
do while not Rsx2.eof
   if cint(varia) = cint(Rsx2("id")) then
      Response.Write("<OPTION selected value= '" & Rsx2("id") & "'>" & Rsx2("rol") & "</OPTION>")
    else
      Response.Write("<OPTION value= '" & Rsx2("id") & "'>" & Rsx2("rol") & "</OPTION>")
   end if
   Rsx2.movenext
loop
set Rsx2 = nothing
set Conn = nothing
End Sub

sub verrol(varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
if isnull(varia) or varia = "" then
   varia = 0
end if
Rst.Open "SELECT * from roles where id = " & varia & "",Conn, 1,3
if rst.recordcount > 0 then
   response.write rst("rol")
end if
set Rst = nothing
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
if rs2.recordcount > 0 then
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
Rs2.Open "SELECT * FROM userw WHERE username = '"&varia&"' order by id",Conn, 1,3
if rs2.recordcount > 0 then
 '  valor = rs2("desgaste")
    nud = rs2("nrol")
    Set Rs3 = Server.CreateObject("ADODB.Recordset")
    Rs3.Open "SELECT * FROM userd WHERE idrol = "&nud&" and idacce = "&varia2&" order by id",Conn, 1,3
    if rs3.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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
Rs2.Open "SELECT * from inventario where id = "&varia&" order by id",Conn, 1,3
if rs2.recordcount > 0 then
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
if rs2.recordcount > 0 then
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

Sub dcombustibles()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from inventario where clasifi = 5 or clasifi = 18 order by codigo,descripcion",Conn, 1,3
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

Sub aceite(nace,varia)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
if nace = 0 then
   Rs2.Open "SELECT * from inventario where (clasifi = '6' or clasifi = '7' or clasifi = '8' or clasifi = '9') order by codigo",Conn, 1,3
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

Sub provesd(qid)
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rst = Server.CreateObject("ADODB.Recordset")
Rst.Open "SELECT * from proveedores where id = " & qid & " order by nombre",Conn, 1,3
varia = 1
if rst.recordcount>0 then
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
Rs2.Open "SELECT * from clasificacion order by nombre",Conn, 1,3

do while not Rs2.eof
   if cint(rs2("id")) = cint(clasi) then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   else
      Response.Write("<OPTION  value= '" & rs2("id") & "'>" & rs2("nombre") & "</OPTION>")
   end if

   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub


Sub etmotor()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from timotor order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
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
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from tidifer order by id",Conn, 1,3
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
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from tcaja order by id",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipomotor") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
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
 ' if varia = 1 then
 '         Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
 '  else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("codigo") & "</OPTION>")
 '  end if
 
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

Sub borden(varia)
set Conn2 = Server.CreateObject("ADODB.Connection")
DSN = session("conec")
conn2.Open DSN
Set Rsx = Server.CreateObject("ADODB.Recordset")
Rsx.Open "SELECT * from ordenes where id = " & varia & " order by id",Conn2, 1,3
if rsx.recordcount > 0 then
   response.Write rsx("corre")
end if
set Rsx = nothing
set Conn2 = nothing
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
if rsx.recordcount > 0 then
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
if rsx.recordcount > 0 then
   response.Write rsx("rol")
end if
set Rsx = nothing
set Conn2 = nothing
End Sub

Sub llenaplaca()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
Rs.Open "SELECT * from vehiculos where sector = " & nbode & " order by placa",Conn, 1,3
varia = 1
do while not Rs.eof
   if varia = 1 then
      Response.Write("<OPTION  value= '" & rs("id") & "'>" & rs("placa") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("placa") & "</OPTION>")
   end if
   varia = varia + 1
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub llenaunidad()
set Conn = Server.CreateObject("ADODB.Connection")
    DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
nbode = session("lugar")
if nbode = 1 then
Rs.Open "SELECT * from vehiculos order by codigo",Conn, 1,3
else
Rs.Open "SELECT * from vehiculos where sector = " & nbode & " order by codigo",Conn, 1,3
end if
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
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

%>