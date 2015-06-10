<%
dim rs
dim rs2
dim ban
dim currentPage
DBPath=server.MapPath("/fpdb/tracker.mdb")
RxName="usuarios"
filepath=server.MapPath("/fpdb/tracker.mdb")
strConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("/fpdb/tracker.mdb") & ";"

'-------------------------------
sub buscanombrea ()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM agencias where id_agencia = " & session("agencia") & " "
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
if not rs.eof then
    session("ep3") = rs("nombrea")
    session("bodega")= rs("bodega")
else
    session("ep3") =  "No se encuentra el nombre"
    session("bodega") = 01
end if
set Rs = nothing
set Cn = nothing
end sub

'-------------------------------
sub creaidrv (vadesc)
 strdate = "Alter session set nls_date_format = 'dd/mm/yyyy'"
 'dbase.Execute (strdate)
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM rviaticose where codigo = '" & session("Username") & "' order by id desc "
strsql2 = "insert into rviaticose (nombre,codigo,fechai,agencia,descrip) values ('" & session("ep2") & "','" & session("Username") & "','" & date & "','" & session("agencia") & "','" & vadesc & "')"
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
cn.execute (strdate)
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL2, cn
set Rs = nothing
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
if not rs.eof then
    session("idd") = rs("id")
else
    session("idd") =  0
end if
set Cn = nothing
end sub

sub boletas ()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM estadobanco where ofi = " & session("agencia") & " and saldob > 0 "
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
if not rs.eof then
   do while not Rs.eof
      Response.Write "<option>"
      Response.Write rs("docto")
      Response.Write "</option>"
      rs.movenext
   loop
end if
Response.Write "<option>"
Response.Write "CXC"
Response.Write "</option>"
set Rs = nothing
set Cn = nothing
end sub

sub paginas ()
for i = 1 to 24
      Response.Write "<option>"
      Response.Write i
      Response.Write "</option>"
next 
end sub

sub cantde ()
for i = 0 to 5
      Response.Write "<option>"
      Response.Write i
      Response.Write "</option>"
next 
end sub

Sub Populatem()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM ctaempleadosb where agencia = " & session("agencia") & ""
'strSQL = "SELECT * FROM ctaempleadosb where codigoe = '" & nus & "'" 
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("nombre")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub llenaagenciac()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM agencias order by id_agencia"
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("id_agencia")
Response.Write "</option>"
rs.movenext
loop
Response.Write "<option>"
Response.Write "aa"
Response.Write "</option>"

set Rs = nothing
set Conn = nothing
End Sub

Sub llenacodigoe()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM ctaempleadosb where tipo = 'B' order by codigoe"
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("codigoe")
Response.Write "</option>"
rs.movenext
loop
Response.Write "<option>"
Response.Write "aa"
Response.Write "</option>"

set Rs = nothing
set Conn = nothing
End Sub

Sub buscadatosv(dato1)
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM ctaempleadosb where codigoe = '" & session("Username") & "' order by codigoe"
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
if not rs.eof then
' session("tipo") = rs("tipo")
 session("ep2") = rs("nombre")
 session("cuentab") = rs("cuentab")
else
 session("ep2") = "No se encuentra"
end if
set Rs = nothing
set Conn = nothing
'Response.Write session("username")
End Sub

Sub llenaagencian()
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
strSQL = "SELECT * FROM agencias order by supervisormetro"
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open strConnectionString
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open strSQL, cn
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("id_agencia")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub horas()
   Response.Write "<option>"
   Response.Write "05:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "05:30"
   Response.Write "</option>"   
   Response.Write "<option>"
   Response.Write "06:00" 
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "06:30"
   Response.Write "</option>"                           
   Response.Write "<option>"
   Response.Write "07:00"
   Response.Write "</option>"   
   Response.Write "<option>"
   Response.Write "07:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "08:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "08:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "09:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "09:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "10:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "10:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "11:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "11:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "12:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "12:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "13:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "13:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "14:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "14:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "15:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "15:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "16:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "16:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "17:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "17:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "18:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "18:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "19:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "19:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "20:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "20:30"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "21:00"
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "21:30"
   Response.Write "</option>"               
   Response.Write "<option>"
   Response.Write "22:00" 
   Response.Write "</option>"
   Response.Write "<option>"
   Response.Write "22:30"
   Response.Write "</option>"
End Sub


'-------------------------------

' Empieza reportes
Sub repocomic()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
  usr = session("Username")
strSQL = "SELECT * FROM casod where usuario = '" & usr & "' order by id_encabezado "
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open strConnectionString
rowcount=0
nutra = 0
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
rs.Open strSQL, Conn ,1,2
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><border color=""#ffa500""><b><font color=""#FFFFFF"">Caso</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Fecha doc</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Agencia</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Productos</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Cantidad</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Precio</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Comicion</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Bono</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Estado</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Fecha pago</font></b></td>"
Response.Write "</tr>"
x = 0
do while not Rs.eof
   nutra = rs("id_encabezado")
   strSQL1 = "SELECT * FROM casoe where ID_TRANSACCION = " & nutra & " order by ID_TRANSACCION"
   rs1.Open strSQL1, Conn ,1,2
   if not rs1.eof then
      nuage = rs1("agencia")
      rs1.close
   else
      nuage = 0
      rs1.close
   end if
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("id_encabezado") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("fecha") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & nuage & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("codigop") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("cantidad") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("preciou") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("valorcomic") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("valorcomica") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("estadocom") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("fechapago") & "</td>"
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub

Sub repoinvea(nbod,nage)
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
usr = session("Username")
vnage = nage
strSQL = "SELECT * FROM productd where bodega = '" & nbod & "' order by PRODUCTID "
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open strConnectionString
rowcount=0
nutra = 0
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
rs.Open strSQL, Conn ,1,2
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><border color=""#ffa500""><b><font color=""#FFFFFF"">Agencia</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Producto</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Bodega</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Existencia</font></b></td>"
Response.Write "</tr>"
x = 0
do while not Rs.eof
'   nutra = rs("id_encabezado")
'  strSQL1 = "SELECT * FROM casoe where ID_TRANSACCION = " & nutra & " order by ID_TRANSACCION"
'   rs1.Open strSQL1, Conn ,1,2
'   if not rs1.eof then
'      nuage = rs1("agencia")
'      rs1.close
'   else
'      nuage = 0
'      rs1.close
'   end if
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""10%"" height=""19"">" & vnage & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("productid") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("bodega") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("existencia") & "</td>"
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub

Sub repovenage(nage)
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
strConnectionString = "DSN=naf123;uid=naf47;pwd=nafm_t3ch"
vnage = nage
strSQL = "SELECT * FROM casoe where agencia = " & vnage & " order by id_transaccion "
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open strConnectionString
rowcount=0
nutra = 0
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
rs.Open strSQL, Conn ,1,2
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><border color=""#ffa500""><b><font color=""#FFFFFF"">Agencia</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Fecha</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Valor</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Caso</font></b></td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Cliente</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Tipoentrega</font></b></td>"
Response.Write "</tr>"
x = 0
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""10%"" height=""19"">" & vnage & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("fecha") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("totalc") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("id_transaccion") & "</td>"
      Response.Write "<td width=""20%"" height=""19"">" & rs("clienom") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("tipoentrega") & "</td>"
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
end if
end Sub
'-------termina reportes

Sub Viewinven()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
rowcount=0
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=35
Rs.Open "SELECT * from inventario order by id", Conn, 1,3
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><border color=""#ffa500""><b><font color=""#FFFFFF"">Codigo</font></b></td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Costo</font></b></td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Tipo de Producto</font></b></td>"
Response.Write "</tr>"
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("codigo") & "</td>"
      Response.Write "<td width=""20%"" height=""19"">" & rs("costo") & "</td>"
	  if rs("tipo_producto") = "A" then
         Response.Write "<td width=""20%"" height=""19""> Inventario</td>"
      end if
	  if rs("tipo_producto") = "B" then
         Response.Write "<td width=""20%"" height=""19""> Refaccion</td>"
      end if
	  if rs("tipo_producto") = "C" then
         Response.Write "<td width=""20%"" height=""19""> Parte</td>"
      end if
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub
'-----------------------------
'llena datos de bitacora
'sub llenabita(valo1,valo2,valo3,valo4)

'end sub
'graba datos de bitacora
sub grababita(valo1,valo2,valo3,valo4)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
'Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from bitacora", Conn, 1,3
Rs.addnew
rs("operacion")= valo1
Rs("fecha")    = valo2
Rs("usuario")  = valo3
Rs("hora")     = valo4
Rs.update
set Rs = nothing
set Conn = nothing
end sub
'-----------This sub will add the user---------
Sub FillTheVariables(nameto,nnameto,npass,ntipo,npais)
nameto=Request.Form("txtname")
nnameto=Request.Form("txtage")
npass=Request.Form("txtemail")
ntipo=request.form("radio1")
npais=Request.Form("select1")
End Sub

Sub Fillvar1(nameto,nnameto,npass)
nameto=Request.Form("txtname")
nnameto=Request.Form("txtage")
npass=Request.Form("select1")
End Sub

Sub Writeinv(nameto, nnameto,npass)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario", Conn, 1,3
Rs.addnew
Rs("codigo") = nameto
Rs("exis1") = 0
Rs("exis2") = 0
Rs("exis_refacciones") = 0
Rs("costo")= nnameto
Rs("tipo_producto")= npass
Rs("exis4")= 0
Rs("exis5")= 0
Rs.update
set Rs = nothing
set Conn = nothing
End Sub

Sub llenadatos(nameto,nnameto,npass,ntipo,mm1,mm2,npaisto)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from " & RxName & " where nusuario='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
   nameto=Rs("nusuario")
   nnameto=rs("nnombre")
   npass=rs("nclave")
   ntipo=rS("ntipus")
   mm1=rs("emp1")
   mm2=rs("emp2")
   npaisto=rs("pais")   
else
   'rEponse.Write ("no entro esto")
end if
set Rs = nothing
set Conn = nothing
End Sub

Sub WriteToRecordset(nameto, nnameto,npass,ntipo,npais)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath

'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from usuarios", Conn, 1,3
Rs.addnew
rs("nentro")= "no"
Rs("nusuario") = nameto
Rs("nnombre") = nnameto
Rs("nclave") = npass
Rs("ntipus") = ntipo
rs("pais")= npais
Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'--------------------------------------
Sub llenadatosin(nameto,nnameto,npass)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario where codigo ='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
   nameto=Rs("codigo")
   nnameto=rs("costo")
   npass=rs("tipo_producto")
else
end if
set Rs = nothing
set Conn = nothing
End Sub

'-----------This sub will populate the 
'option box (combo box)---------------

Sub Populate()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
'Conn.ConnectionString = "dsn=tracker"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from " & RxName, Conn, 1,3
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("nusuario")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub Populatei()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
'Conn.ConnectionString = "dsn=tracker"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario order by codigo", Conn, 1,3
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("codigo")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub Populatec()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
'Conn.ConnectionString = "dsn=tracker"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist", Conn, 1,3
do while not Rs.eof
Response.Write "<option value=" & rs("id") & ">"
Response.Write rs("nombre")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

'-------This function will delete the 
'selected user------

Function DeleteUser(nameto)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath

'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from " & RxName & " where nusuario='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
	rs.delete
	DeleteUser=true
else
	DeleteUser=false
end if

set Rs = nothing
set Conn = nothing
End Function
'-------------------------------
Function Deleteinv(nameto)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario where codigo='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
	rs.delete
	Deleteinv=true
else
	Deleteinv=false
end if

set Rs = nothing
set Conn = nothing
End Function
'-------------------------------

Sub actualiza(nus,npa,ntp,npi,mm1,mm2)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath

'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from " & RxName & " where nusuario='" & nus & "'", Conn, 3,3
'Rs("nclave") = npa
rs("ntipus") =ntp
Rs("usuario")= Session("nusern")
rs("pais") =npi
rs("emp1")=mm1
rs("emp2")=mm2
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'--------------------------------------
Sub actualizai(nus,npa,ntp)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
npa = cint(npa)
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario where codigo='" & nus & "'", Conn, 3,3
Rs("costo")= npa
rs("tipo_producto") =ntp
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'--------------------------------------
Sub actualizaa(nus,npa,nta)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
npa = cint(npa)
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario where codigo='" & nus & "'", Conn, 3,3
Rs("exis1")= rs("exis1") + npa
Rs.update
set Rs = nothing
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist where nombre='" & nta & "'", Conn, 3,3
if rs.recordcount>0 then
   vcas = rs("id")
else
   vcas = 0
end if

set Rs = nothing
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from detalleinven where codigo='" & nus & "' and num_cas = " & vcas & "", Conn, 3,3
if rs.recordcount>0 then
   Rs("exis1")= rs("exis1") + npa
else
   Rs.addnew
   rs("codigo")= nus
   Rs("exis1") = npa
   Rs("num_cas") = vcas
   Rs("num_dist") = 0
end if
Rs.update

set Conn = nothing

End Sub
'--------------------------------------
Sub actualir(nus,ntp)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from reservas where mcorre=" & nus & "", Conn, 3,3
Rs("obse2") = ntp
Rs.update
set Rs = nothing
set Conn = nothing
End Sub

'CONEXIONES Y FUNCIONES DE INVENTARIO
Sub Viewcliente()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
rowcount=0
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
Rs.Open "SELECT * from distribut order by id", Conn, 1,3
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""25%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Nombre de el distribuidor</font></b></td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Direccion</font></b></td>"
Response.Write "<td width=""15%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Telefono</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Fax</font></b></td>"
Response.Write "<td width=""15%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Correo 1</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Pais</font></b></td>"
Response.Write "</tr>"
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""25%"" height=""19"">" & rs("nombre") & "</td>"
      Response.Write "<td width=""20%"" height=""19"">" & rs("direccion") & "</td>"
      Response.Write "<td width=""15%"" height=""19"">" & rs("telefono") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("fax") & "</td>"
      Response.Write "<td width=""15%"" height=""19"">" & rs("email") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("pais") & "</td>"            
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub
'-----------------------------
Sub Viewcas()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
rowcount=0
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
Rs.Open "SELECT * from caslist order by id", Conn, 1,3
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""15%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Nombre de el Cas</font></b></td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Direccion</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Telefono</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Fax</font></b></td>"
Response.Write "<td width=""15%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Correo 1</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Pais</font></b></td>"
Response.Write "</tr>"
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""15%"" height=""19"">" & rs("nombre") & "</td>"
      Response.Write "<td width=""20%"" height=""19"">" & rs("direccion") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("telefono") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("fax") & "</td>"
      Response.Write "<td width=""15%"" height=""19"">" & rs("email") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("pais") & "</td>"            
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
end if
'set Rs = nothing
'set Conn = nothing
end Sub

'-----------------------------
Sub llenado1(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu,tpro1,tpro2,tpro3,tpro4,tpro5,tpro6,tpro7)
nameto=Request.Form("txtname")
ndireto=Request.Form("txtage")
nteleto=Request.Form("txttel")
nfaxeto=request.form("txtfax")
npaisto=request.form("select1")
nmailto1=Request.Form("txtemai1")
nmailto2=Request.Form("txtemai2")
nsuc=Request.Form("txtsuc")
nciu=Request.Form("txtciu")
tpro1=Request.Form("txtp1")
tpro2=Request.Form("txtp2")
tpro3=Request.Form("txtp3")
tpro4=Request.Form("txtp4")
tpro5=Request.Form("txtp5")
tpro6=Request.Form("txtp6")
tpro7=Request.Form("txtp7")
End Sub
'-----------------------------
Sub llenad1(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu)
nameto=Request.Form("txtname")
ndireto=Request.Form("txtage")
nteleto=Request.Form("txttel")
nfaxeto=request.form("txtfax")
npaisto=request.form("select1")
nmailto1=Request.Form("txtemai1")
nmailto2=Request.Form("txtemai2")
nsuc=Request.Form("txtsuc")
nciu=Request.Form("txtciu")
tpro1=Request.Form("txtp1")
tpro2=Request.Form("txtp2")
tpro3=Request.Form("txtp3")
tpro4=Request.Form("txtp4")
tpro5=Request.Form("txtp5")
tpro6=Request.Form("txtp6")
tpro7=Request.Form("txtp7")
End Sub
'-----------------------------
sub graba1(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut", Conn, 1,3
Rs.addnew
Rs("nombre") = nameto
Rs("direccion") = ndireto
Rs("telefono") = nteleto
Rs("fax") = nfaxeto
Rs("email") = nmailto1
Rs("email2") = nmailto2
Rs("sucursal") = nsuc
Rs("ciudad") = nciu
RS("pais")=npaisto
'Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
sub grabc1(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu,tpro1,tpro2,tpro3,tpro4,tpro5,tpro6,tpro7)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist", Conn, 1,3
Rs.addnew
Rs("nombre") = nameto
Rs("direccion") = ndireto
Rs("telefono") = nteleto
Rs("fax") = nfaxeto
Rs("email") = nmailto1
Rs("email2") = nmailto2
Rs("sucursal") = nsuc
Rs("ciudad") = nciu
Rs("pais") = npaisto	
RS("prob1")=tpro1
RS("prob2")=tpro2
RS("prob3")=tpro3
RS("prob4")=tpro4
RS("prob5")=tpro5
RS("prob6")=tpro6
RS("prob7")=tpro7
'Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenavi(nclit,ndest,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,nfevt,nfeit,nsemt)
nclit=Request.Form("txtclie")
ndest=Request.Form("txtdesc")
ntv1t=Request.Form("checkbox1")
ntv2t=request.form("checkbox2")
ntv3t=request.form("checkbox3")
ntv4t=Request.Form("checkbox4")
ntv5t=Request.Form("checkbox5")
ntv6t=Request.Form("checkbox6")
ntv7t=request.form("checkbox7")
ntv8t=Request.Form("checkbox8")
ntv9t=Request.Form("checkbox9")
nfevt=Request.Form("txtvisi")
nfeit=Request.Form("txtingr")
nsemt=1
End Sub
'-----------------------------
sub grabvi(nclit,ndest,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,nfevt,nfeit,ntip,nhor,nsemt,npai)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from eventos", Conn, 1,3
Rs.addnew
Rs("mempcli") = nclit
Rs("desc1") = ndest
Rs("tv1") = ntv1t
Rs("tv2") = ntv2t
Rs("tv3") = ntv3t
rs("tv4") = ntv4t
rs("tv5") = ntv5t
rs("tv6") = ntv6t
rs("tv7") = ntv7t
rs("tv8") = ntv8t
rs("tv9") = ntv9t
rs("fecha1") = nfevt
rs("fecha2") = nfeit
Rs("usuario")= Session("nusern")
rs("tipoeven")=ntip
rs("horalog")=nhor
rs("semana")=nsemt
rs("pais")=npai
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenafa(nclit,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,ntv10t,nfevt,nfeit,nsemt,ntv11t,ntv12t,ntv13t,ntv14t,ntv15t,ntv16t,ntv17t,ntv18t,ntv19t,ntv20t,ntv21t,ntv22t,ntv23t,ntv24t,ntv25t,ntv26t,ntv27t,ntv28t,ntv29t,ntv30t)
nclit=Request.Form("txtclie")
ntv1t=Request.Form("txtinv1")
ntv2t=request.form("txtinv2")
ntv3t=request.form("txtinv3")
ntv4t=Request.Form("txtinv4")
ntv5t=Request.Form("txtinv5")
ntv6t=Request.Form("txtinv6")
ntv7t=request.form("txtinv7")
ntv8t=Request.Form("txtinv8")
ntv9t=Request.Form("txtinv9")
ntv10t=Request.Form("txtinv10")
nfevt=Request.Form("txtingr")
nfeit=Request.Form("txtingr")
nsemt=Request.Form("selesema")
ntv11t=Request.Form("txtinv11")
ntv12t=request.form("txtinv12")
ntv13t=request.form("txtinv13")
ntv14t=Request.Form("txtinv14")
ntv15t=Request.Form("txtinv15")
ntv16t=Request.Form("txtinv16")
ntv17t=request.form("txtinv17")
ntv18t=Request.Form("txtinv18")
ntv19t=Request.Form("txtinv19")
ntv20t=Request.Form("txtinv20")
ntv21t=Request.Form("txtinv21")
ntv22t=request.form("txtinv22")
ntv23t=request.form("txtinv23")
ntv24t=Request.Form("txtinv24")
ntv25t=Request.Form("txtinv25")
ntv26t=Request.Form("txtinv26")
ntv27t=request.form("txtinv27")
ntv28t=Request.Form("txtinv28")
ntv29t=Request.Form("txtinv29")
ntv30t=Request.Form("txtinv30")
End Sub
'-----------------------------
sub grabfa(nclit,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,ntv10t,nfevt,nfeit,ntip,nhor,nsemt,npai,ntv11t,ntv12t,ntv13t,ntv14t,ntv15t,ntv16t,ntv17t,ntv18t,ntv19t,ntv20t,ntv21t,ntv22t,ntv23t,ntv24t,ntv25t,ntv26t,ntv27t,ntv28t,ntv29t,ntv30t)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from facturacion", Conn, 1,3
Rs.addnew
Rs("mempcli") = nclit
Rs("tv1") = ntv1t
Rs("tv2") = ntv2t
Rs("tv3") = ntv3t
rs("tv4") = ntv4t
rs("tv5") = ntv5t
rs("tv6") = ntv6t
rs("tv7") = ntv7t
rs("tv8") = ntv8t
rs("tv9") = ntv9t
rs("tv10") = ntv10t
rs("fecha1") = nfevt
rs("fecha2") = nfeit
Rs("usuario")= Session("nusern")
rs("tipoeven")=ntip
rs("horalog")=nhor
rs("semana")=nsemt
rs("pais")=npai
Rs("tv11") = ntv11t
Rs("tv12") = ntv12t
Rs("tv13") = ntv13t
rs("tv14") = ntv14t
rs("tv15") = ntv15t
rs("tv16") = ntv16t
rs("tv17") = ntv17t
rs("tv18") = ntv18t
rs("tv19") = ntv19t
rs("tv20") = ntv20t
Rs("tv21") = ntv21t
Rs("tv22") = ntv22t
Rs("tv23") = ntv23t
rs("tv24") = ntv24t
rs("tv25") = ntv25t
rs("tv26") = ntv26t
rs("tv27") = ntv27t
rs("tv28") = ntv28t
rs("tv29") = ntv29t
rs("tv30") = ntv30t
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenain(nclit,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,ntv10t,nfevt,nfeit,nsemt,ntv11t,ntv12t,ntv13t,ntv14t,ntv15t,ntv16t,ntv17t,ntv18t,ntv19t,ntv20t,ntv21t,ntv22t,ntv23t,ntv24t,ntv25t,ntv26t,ntv27t,ntv28t,ntv29t,ntv30t)
nclit=Request.Form("txtclie")
ntv1t=Request.Form("txtinv1")
ntv2t=request.form("txtinv2")
ntv3t=request.form("txtinv3")
ntv4t=Request.Form("txtinv4")
ntv5t=Request.Form("txtinv5")
ntv6t=Request.Form("txtinv6")
ntv7t=request.form("txtinv7")
ntv8t=Request.Form("txtinv8")
ntv9t=Request.Form("txtinv9")
ntv10t=Request.Form("txtinv10")
nfevt=Request.Form("txtingr")
nfeit=Request.Form("txtingr")
nsemt=Request.Form("selesema")
ntv11t=Request.Form("txtinv11")
ntv12t=request.form("txtinv12")
ntv13t=request.form("txtinv13")
ntv14t=Request.Form("txtinv14")
ntv15t=Request.Form("txtinv15")
ntv16t=Request.Form("txtinv16")
ntv17t=request.form("txtinv17")
ntv18t=Request.Form("txtinv18")
ntv19t=Request.Form("txtinv19")
ntv20t=Request.Form("txtinv20")
ntv21t=Request.Form("txtinv21")
ntv22t=request.form("txtinv22")
ntv23t=request.form("txtinv23")
ntv24t=Request.Form("txtinv24")
ntv25t=Request.Form("txtinv25")
ntv26t=Request.Form("txtinv26")
ntv27t=request.form("txtinv27")
ntv28t=Request.Form("txtinv28")
ntv29t=Request.Form("txtinv29")
ntv30t=Request.Form("txtinv30")
End Sub
'-----------------------------
sub grabin(nclit,ntv1t,ntv2t,ntv3t,ntv4t,ntv5t,ntv6t,ntv7t,ntv8t,ntv9t,ntv10t,nfevt,nfeit,ntip,nhor,nsemt,npai,ntv11t,ntv12t,ntv13t,ntv14t,ntv15t,ntv16t,ntv17t,ntv18t,ntv19t,ntv20t,ntv21t,ntv22t,ntv23t,ntv24t,ntv25t,ntv26t,ntv27t,ntv28t,ntv29t,ntv30t)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventarios", Conn, 1,3
Rs.addnew
Rs("mempcli") = nclit
Rs("tv1") = ntv1t
Rs("tv2") = ntv2t
Rs("tv3") = ntv3t
rs("tv4") = ntv4t
rs("tv5") = ntv5t
rs("tv6") = ntv6t
rs("tv7") = ntv7t
rs("tv8") = ntv8t
rs("tv9") = ntv9t
rs("tv10") = ntv10t
rs("fecha1") = nfevt
rs("fecha2") = nfeit
Rs("usuario")= Session("nusern")
rs("tipoeven")=ntip
rs("horalog")=nhor
rs("semana")=nsemt
rs("pais")=npai
Rs("tv11") = ntv11t
Rs("tv12") = ntv12t
Rs("tv13") = ntv13t
rs("tv14") = ntv14t
rs("tv15") = ntv15t
rs("tv16") = ntv16t
rs("tv17") = ntv17t
rs("tv18") = ntv18t
rs("tv19") = ntv19t
rs("tv20") = ntv20t
Rs("tv21") = ntv21t
Rs("tv22") = ntv22t
Rs("tv23") = ntv23t
rs("tv24") = ntv24t
rs("tv25") = ntv25t
rs("tv26") = ntv26t
rs("tv27") = ntv27t
rs("tv28") = ntv28t
rs("tv29") = ntv29t
rs("tv30") = ntv30t
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenaop1()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut order by id",Conn, 1,3
do while not Rs.eof
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'------------------------------
'-----------------------------
Sub llenaop1l(mm1)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut order by id",Conn, 1,3
do while not Rs.eof
if rs("nombre")=mm1 then
      Response.Write "<option selected>"
      Response.Write rs("nombre")
      Response.Write "</option>"
      Response.Write mm1
else
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
end if
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub llenacas1()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist order by id",Conn, 1,3
do while not Rs.eof
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
'-------------------------------
Sub llenacas1l(mm2)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist order by id",Conn, 1,3
do while not Rs.eof
if rs("nombre")=mm2 then
      Response.Write "<option selected>"
      Response.Write rs("nombre")
      Response.Write "</option>"
else
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
end if
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
'-------------------------------
Sub llenamode()
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from inventario' order by codigo",Conn, 1,3
do while not Rs.eof
   Response.Write "<option>"
   Response.Write rs("codigo")
   Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
'-------------------------------
Sub llenamayo(kpais)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut where pais = '" & kpais & "' order by nombre",Conn, 1,3
do while not Rs.eof
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub llenacasp(kpais)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist where pais = '" & kpais & "' order by nombre",Conn, 1,3
do while not Rs.eof
   Response.Write "<option>"
   Response.Write rs("nombre")
   Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub llenadatos2(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nsoc1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut where nombre='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
   nameto=Rs("nombre")
   ndireto=rs("direccion")
   nteleto=rs("telefono")
   nfaxeto=rs("fax")
   npaisto=rs("pais")
   nmailto1=rs("email")
   nmailto2=rs("email")
   nsuc=rs("sucursal")
   nciu=rs("ciudad")
else
end if
set Rs = nothing
set Conn = nothing
End Sub
'---------------------------------------------
Sub llenacas2(nameto,ndireto,nteleto,nfaxeto,npaisto,nmailto1,ndes1to,ndes2to,ncon1to,nsoc1to,nnit1to,ncon2to,nmailto2,ncon3to,nmailto3,ncon4to,nmailto4,ncon5to,nmailto5,nsuc,nciu,tpro1,tpro2,tpro3,tpro4,tpro5,tpro6,tpro7)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist where nombre='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
   nameto=Rs("nombre")
   ndireto=rs("direccion")
   nteleto=rs("telefono")
   nfaxeto=rs("fax")
   npaisto=rs("pais")
   nmailto1=rs("email")
   nmailto2=rs("email")
   nsuc=rs("sucursal")
   nciu=rs("ciudad")
   tpro1=rs("prob1")
   tpro2=rs("prob2")
   tpro3=rs("prob3")
   tpro4=rs("prob4")
   tpro5=rs("prob5")
   tpro6=rs("prob6")
   tpro7=rs("prob7")
else
end if
set Rs = nothing
set Conn = nothing
End Sub
'---------------------------------------------
'-------------------------------
Sub buscamayo(mnom,mdir,mtel,memail)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut where nombre='" & mnom & "'", Conn, 1,3
if rs.recordcount>0 then
   mdir=Rs("direccion")
   mtel=rs("telefono")
   memail=rs("email")
else
end if
set Rs = nothing
set Conn = nothing
End Sub
'---------------------------------------------
sub actualiza1(nus,nom,ndi,nc1,nm1,nc2,nm2,nc3,nm3,nc4,nm4,nc5,nm5,tel,fax,mni,nsuc,nciu)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from distribut where nombre='" & nus & "'", Conn, 3,3
Rs("nombre") = nom
Rs("direccion") = ndi
Rs("telefono") = tel
Rs("fax") = fax
Rs("email") = nm1
Rs("email2") = nm2
Rs("sucursal") = nsuc
Rs("ciudad") = nciu
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'---------------------------------------------
sub actcas1(nus,nom,ndi,nc1,nm1,nc2,nm2,nc3,nm3,nc4,nm4,nc5,nm5,tel,fax,mni,nsuc,nciu,tpro1,tpro2,tpro3,tpro4,tpro5,tpro6,tpro7)
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from caslist where nombre='" & nus & "'", Conn, 3,3
Rs("nombre") = nom
Rs("direccion") = ndi
Rs("telefono") = tel
Rs("fax") = fax
Rs("email") = nm1
Rs("email2") = nm2
Rs("sucursal") = nsuc
Rs("ciudad") = nciu
RS("prob1")=tpro1
RS("prob2")=tpro2
RS("prob3")=tpro3
RS("prob4")=tpro4
RS("prob5")=tpro5
RS("prob6")=tpro6
RS("prob7")=tpro7
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'---------------------------------------------

Function Deleteclie(nameto)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from calllog where clasi1='" & nameto & "' or clasi2='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
	  Deleteclie=false
else
  set Rs = nothing
  Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.Open "SELECT * from distribut where nombre='" & nameto & "'", Conn, 1,3
  if rs.recordcount>0 then
    if rs("id")=1 then
	  Deleteclie=false
    else
      rs.delete
	  Deleteclie=true
    end if
  else
	  Deleteclie=false
  end if	
end if  
set Rs = nothing
set Conn = nothing
End Function
'-------------------------------
Function Deletecas(nameto)
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
'Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from calllog where clasi1='" & nameto & "' or clasi2='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
	  Deletecas=false
else
  set Rs = nothing
  Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.Open "SELECT * from caslist where nombre='" & nameto & "'", Conn, 1,3
  if rs.recordcount>0 then
    if rs("id")=1 then
	  Deletecas=false
    else
  	  rs.delete
	  Deletecas=true
    end if
  else
	  Deletecas=false
  end if	
end if
set Rs = nothing
set Conn = nothing
End Function
'-------------------------------
'CONEXIONES Y FUNCIONES DE HOTELES
Sub Viewhotel()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
rowcount=0
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
Rs.Open "SELECT * from hotel order by mcorre", Conn, 1,3
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Hotel</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Principal</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Precio simple</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Anexo 1</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Precio doble</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Anexo 2</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Precio triple</font></b></td>"
Response.Write "</tr>"
'if (rs.recordcount mod 25) > 0 then
'   varc=round(rs.recordcount/25,0)+1
'else
'   varc=round(rs.recordcount/25,0)
'end if
'dim nora 
'dim nord
'nora= round(25*(a-1))
'if a=1 then
'   session("b") = 1
'else
'   rs.move nora
'end if
'if a= varc then
'   nord= rs.recordcount-nora
'   session("b") = 2   
'else
'   nord= 25
'end if
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
'    for i = 1 to nord
    Response.Write "<tr>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("mnombre") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("mcant1") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("precio1") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("mcant2") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("precio2") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("mcant3") & "</td>"
    Response.Write "<td width=""10%"" height=""19"">" & rs("precio3") & "</td>"
    Response.Write "</tr>"
    rs.movenext
    rowcount= rowcount+1
'    next 
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub
'-----------------------------
Sub llenado2(nameto,ncan1to,ncan2to,ncan3to,npre1to,npre2to,npre3to,npre4to)
nameto=Request.Form("txtname")
ncan1to=Request.Form("txtage")
ncan2to=Request.Form("txttel")
ncan3to=request.form("txtfax")
npre1to=Request.Form("txtpr1")
npre2to=Request.Form("txtpr2")
npre3to=Request.Form("txtpr3")
npre4to=Request.Form("txtpr4")
End Sub
'-----------------------------
Sub graba2(nameto,ncan1to,ncan2to,ncan3to,npre1to,npre2to,npre3to,npre4to)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel", Conn, 1,3
Rs.addnew
Rs("mnombre") = nameto
Rs("mcant1") = ncan1to
Rs("mcant2") = ncan2to
Rs("mcant3") = ncan3to
rs("precio1") = npre1to
rs("precio2") = npre2to
rs("precio3") = npre3to
rs("precio4") = npre4to
Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
'-----------------------------
Sub llenaop2()
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel",Conn, 1,3
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("mnombre")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'------------------------------- 
Sub llenadatos3(nameto,ncan1to,ncan2to,ncan3to,npre1to,npre2to,npre3to,npre4to)
dim nora 
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel where mnombre='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
   nameto=Rs("mnombre")
   ncan1to=rs("mcant1")
   ncan2to=rs("mcant2")
   ncan3to=rs("mcant3")
   npre1to=rs("precio1")
   npre2to=rs("precio2")
   npre3to=rs("precio3")
   npre4to=rs("precio4")            
else
'  Response.Write ("no entro esto")
end if
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Sub actualiza2(nus,nc1,nc2,nc3,pr1,pr2,pr3,pr4)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel where mnombre='" & nus & "'", Conn, 3,3
'Rs("mempcli") = nameto
Rs("mcant1") = nc1
Rs("mcant2") = nc2
Rs("mcant3") = nc3
rs("precio1") = pr1
rs("precio2") = pr2
rs("precio3") = pr3
rs("precio4") = pr4
Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenaop2()
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel",Conn, 1,3
do while not Rs.eof
Response.Write "<option>"
Response.Write rs("mnombre")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-------------------------------
Function Deletehote(nameto)
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel where mnombre='" & nameto & "'", Conn, 1,3
if rs.recordcount>0 then
	rs.delete
	Deletehote=true
else
	Deletehote=false
end if	

set Rs = nothing
set Conn = nothing
End Function
'--------------------------------------
'CONEXIONES Y FUNCIONES DE RESERVAS
Sub Viewreserva()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
rowcount=0
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
Rs.Open "SELECT * from reservas where mestado='" & "I" & "' order by mcorre desc", Conn, 1,3
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write fet1
Response.Write fet2
Response.Write "<tr>"
Response.Write "<td width=""5%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF""># Reserva</td>"
Response.Write "<td width=""5%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF"">Cliente</td>"
Response.Write "<td width=""20%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF"">Nombre</td>"
Response.Write "<td width=""7%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF"">Fecha Entrada</td>"
Response.Write "<td width=""7%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF"">Fecha Salida</td>"
Response.Write "<td width=""5%"" align=""left"" bgcolor=""#cc9900"" height=""1""><b><font color=""#FFFFFF"">Operaciones</td>"
Response.Write "</tr>"
'DoCount currentPage
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"%>
      <td width=""5%""><A HREF="Despliega1.asp?qryProdID=<%= rs("mcorre") %>"><%= rs("mcorre") %></TD>
      <%	
'      Response.Write "<td width=""1%"" height=""19"">" & rs("mcorre") & "</td>"
      Response.Write "<td width=""5%"" height=""19"">" & rs("mcliente") & "</td>"
      Response.Write "<td width=""20%"" height=""19"">" & rs("mncliente") & "</td>"
'if rs("mhotel1")<>" " then      
'   Response.Write "<td width=""20%"" height=""19"">" & "Entro uno" & "</td>"
'else
'   if rs("mhotel2")<>"  " then      
'      Response.Write "<td width=""20%"" height=""19"">" & "Entro dos" & "</td>"   
'  else
'      Response.Write "<td width=""20%"" height=""19"">" & "Entro tres" & "</td>"   
'   end if
'end if
if rs("mhotel1")<>" " then      
   'Response.Write "<td width=""20%"" height=""19"">" & "Entro uno" & "</td>"
      fer1=rs("fecha1")
      fer2=rs("fecha2")
      '4,2.1,2..8
      '3,2.1,1..9
      '4,1.1,2..9
      '3,1.1,1..10
      if len(fer1)=10 then
         fei1=mid(fer1,1,2)&"/"&mid(fer1,4,2)&"/"&mid(fer1,7,4)
      else
         if len(fer1)=9 then
            if mid(fer1,2,1)="/" then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,2)+"/"+mid(fer1,6,4)
            else
               fei1=mid(fer1,1,2)+"/"+mid(fer1,4,1)+"/"+mid(fer1,6,4)
            end if
         else
            if len(fer1)=8 then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,1)+"/"+mid(fer1,5,4)
            end if
         end if
      end if   
      if len(fer2)=10 then
         fei2=mid(fer2,1,2)&"/"&mid(fer2,4,2)&"/"&mid(fer2,7,4)
      else
         if len(fer2)=9 then
            if mid(fer2,2,1)="/" then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,2)+"/"+mid(fer2,6,4)
            else
               fei2=mid(fer2,1,2)+"/"+mid(fer2,4,1)+"/"+mid(fer2,6,4)
            end if
         else
            if len(fer2)=8 then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,1)+"/"+mid(fer2,5,4)
            end if
         end if
      end if   
else
   if RS("mhotel2")<>" " then
      'Response.Write "<td width=""20%"" height=""19"">" & "Entro dos" & "</td>"      
      fer1=rs("fecha3")
      fer2=rs("fecha4")
      if len(fer1)=10 then
         fei1=mid(fer1,1,2)&"/"&mid(fer1,4,2)&"/"&mid(fer1,7,4)
      else
         if len(fer1)=9 then
            if mid(fer1,2,1)="/" then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,2)+"/"+mid(fer1,6,4)
            else
               fei1=mid(fer1,1,2)+"/"+mid(fer1,4,1)+"/"+mid(fer1,6,4)
            end if
         else
            if len(fer1)=8 then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,1)+"/"+mid(fer1,5,4)
            end if
         end if
      end if   
      if len(fer2)=10 then
         fei2=mid(fer2,1,2)&"/"&mid(fer2,4,2)&"/"&mid(fer2,7,4)
      else
         if len(fer2)=9 then
            if mid(fer2,2,1)="/" then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,2)+"/"+mid(fer2,6,4)
            else
               fei2=mid(fer2,1,2)+"/"+mid(fer2,4,1)+"/"+mid(fer2,6,4)
            end if
         else
            if len(fer2)=8 then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,1)+"/"+mid(fer2,5,4)
            end if
         end if
      end if   
   else
      'Response.Write "<td width=""20%"" height=""19"">" & "Entro tres" & "</td>"      
      fer1=rs("fecha5")
      fer2=rs("fecha6")
      if len(fer1)=10 then
         fei1=mid(fer1,1,2)&"/"&mid(fer1,4,2)&"/"&mid(fer1,7,4)
      else
         if len(fer1)=9 then
            if mid(fer1,2,1)="/" then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,2)+"/"+mid(fer1,6,4)
            else
               fei1=mid(fer1,1,2)+"/"+mid(fer1,4,1)+"/"+mid(fer1,6,4)
            end if
         else
            if len(fer1)=8 then
               fei1=mid(fer1,1,1)+"/"+mid(fer1,3,1)+"/"+mid(fer1,5,4)
            end if
         end if
      end if   
      if len(fer2)=10 then
         fei2=mid(fer2,1,2)&"/"&mid(fer2,4,2)&"/"&mid(fer2,7,4)
      else
         if len(fer2)=9 then
            if mid(fer2,2,1)="/" then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,2)+"/"+mid(fer2,6,4)
            else
               fei2=mid(fer2,1,2)+"/"+mid(fer2,4,1)+"/"+mid(fer2,6,4)
            end if
         else
            if len(fer2)=8 then
               fei2=mid(fer2,1,1)+"/"+mid(fer2,3,1)+"/"+mid(fer2,5,4)
            end if
         end if
      end if   
    end if      
end if      
'      Response.Write "<td width=""7%"" height=""19"">" & rs("fecha1") & "&nbsp;&nbsp;&nbsp;</td>"
'      Response.Write "<td width=""7%"" height=""19"">" & rs("fecha2") & "</td>"
      Response.Write "<td width=""05%"" height=""5"">" & fei1 & "</td>"
      Response.Write "<td width=""05%"" height=""5"">" & fei2 & "</td>"
      %>
      <td width=""5%"">
      &nbsp;&nbsp;&nbsp;
      <%'if int(session("acceso"))<=1 then%>
         <A HREF="cambia1.asp?qryProdID=<%= rs("mcorre") %>""><img src="b_mod.jpg">
         <A HREF="modifica1.asp?qryProdID=<%= rs("mcorre") %>""><img src="modificar.gif">
         <A HREF="prelimina1.asp?qryProdID=<%= rs("mcorre") %>""><img src="eliminar.gif">
      <%'else
      '   <A <img src="modificar.gif">
      '   <A <img src="eliminar.gif">
      'end if%>
      </TD>
      <%
'<IMG height=19 src="modificar.GIF" width=12 border=0 name=figura1>      
      Response.Write "</tr>"
     rs.movenext
     rowcount= rowcount+1
loop
'set Rs = nothing
'set Conn = nothing
end if
end Sub
'-----------------------------
SUB CIERRA1()
set Rs = nothing
set Conn = nothing
END SUB
 
Sub llenado3(ncliet,nmclit,nhotet,nfec1t,nfec2t,nngrut,npaist,nhab1t,npre1t,nhab2t,npre2t,nhab3t,npre3t,ncom1t,ncom2t,ncom3t,npag1t,ndoc1t,nnum1t,nobs1t)
ncliet=Request.Form("txt3")
nmclit=Request.Form("select5")
nhotet= Request.Form("radio1")
nfec1t=Request.Form("VonDatum")
nfec2t=Request.Form("VonDatum2")
nngrut=Request.Form("txtgrup")
'npaist=Request.Form("Select1")
npaist=Request.Form("tx6")
nhab1t=Request.Form("select14")
npre1t=Request.Form("txtpre1")
nhab2t=Request.Form("select6")
npre2t=Request.Form("txtpre2")
nhab3t=Request.Form("select7")
npre3t=Request.Form("txtpre3")
if Request.Form("checkbox1")= "on" then
   ncom1t="si"
end if
if Request.Form("checkbox2")= "on" then
   ncom2t="si"
end if
if Request.Form("checkbox3")= "on" then
   ncom3t="si"
end if
npag1t=Request.Form("radio2")
ndoc1t=Request.Form("txttot")
nnum1t=Request.Form("txttot2")
nobs1t=Request.Form("txtobse")
End Sub
'-----------------------------
Sub graba3(ncliet,nmclit,nhotet,nfec1t,nfec2t,nngrut,npaist,nhab1t,npre1t,nhab2t,npre2t,nhab3t,npre3t,ncom1t,ncom2t,ncom3t,npag1t,ndoc1t,nnum1t,nobs1t)
Set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from reservas", Conn, 1,3
Rs.addnew
Rs("mcliente") = ncliet
Rs("mncliente") = nmclit
Rs("mhotel") = nhotet
Rs("fecha1") = (nfec1t)
Rs("fecha2") = (nfec2t)
Rs("mngrupo") = nngrut
Rs("mnpais") = npaist
Rs("mhabit1") = int(nhab1t)
Rs("mnprecio1")= int(npre1t)
Rs("mhabit2") = int(nhab2t)
Rs("mnprecio2")= int(npre2t)
Rs("mhabit3") = int(nhab3t)
Rs("mnprecio3")= int(npre3t)
Rs("mcomida1")=ncom1t
Rs("mcomida2")=ncom2t
Rs("mcomida3")=ncom3t
Rs("mtpago")=npag1t
Rs("mtdocu")=ndoc1t
Rs("mtnumer")=nnum1t
Rs("mobse")=nobs1t
Rs("usuario")= Session("nusern")
Rs.update
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
'Funciones Varias
Sub llena3(rr9)
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from clientes order by mempcli",Conn, 1,3
do while not Rs.eof
if rr9=" " then
   Response.Write("<OPTION selected value= '" & rs("mempcli") & "'>" & rs("mempcli") & "</OPTION>")
'   Response.Write("<OPTION selected '" & "UNO" & "'>" & "UNO" & "</OPTION>")   
else
  if rr9=rs("mempcli") then
     Response.Write("<OPTION selected value= '" & rr9 & "'>" & rs("mempcli") & "</OPTION>")
  else
     Response.Write("<OPTION value= '" & rs("mempcli") & "'>" & rs("mempcli") & "</OPTION>")  
  end if
'   Response.Write("<OPTION selected value= '" & rr9 & "'>" & "enor" & "</OPTION>")
end if   
'Response.Write rs("mempcli")
Response.Write "</option>"
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub llenav(vrr9)
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from clientes where mpais = '" & session("nopais") & "' order by mempcli",Conn, 1,3
do while not Rs.eof
   Response.Write("<OPTION selected value= '" & rs("mempcli") & "'>" & rs("mempcli") & "</OPTION>")  
   Response.Write "</option>"
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub
'-----------------------------
Sub DoCount(currentPage) 
h = 0
stable="reservas"
saction="viewreserva"
for i = 1 to rs.PageCount
 Response.Write(" <a href=" & chr(34) & ThisPage & "?currentpage=" &  i  & "&action=" & sAction & "&table=" & sTable & chr(34) & ">" & i & "</a>")
h = h +1
next
Response.Write("<BR><Small>Pagina " & currentPage & " de  " & h & "</SMALL></center><BR><BR>")
end sub

'-----------------------------
Sub DoCount2(currentPage) 
h = 0
stable="hotel"
saction="viewhotel"
for i = 1 to rs.PageCount
 Response.Write(" <a href=" & chr(34) & ThisPage & "?currentpage=" &  i  & "&action=" & sAction & "&table=" & sTable & chr(34) & ">" & i & "</a>")
h = h +1
next
Response.Write("<BR><Small>Pagina " & currentPage & " de  " & h & "</SMALL></center><BR><BR>")
end sub
'-----------------------------
Sub DoCount3(currentPage) 
h = 0
stable="clientescas"
saction="viewcas"
for i = 1 to rs.PageCount
 Response.Write(" <a href=" & chr(34) & ThisPage & "?currentpage=" &  i  & "&action=" & sAction & "&table=" & sTable & chr(34) & ">" & i & "</a>")
h = h +1
next
Response.Write("<BR><Small>Pagina " & currentPage & " de  " & h & "</SMALL></center><BR><BR>")
end sub
'-----------------------------
Sub DoCount4(currentPage) 
h = 0
stable="usuarios"
saction="viewuser"
for i = 1 to rs.PageCount
 Response.Write(" <a href=" & chr(34) & ThisPage & "?currentpage=" &  i  & "&action=" & sAction & "&table=" & sTable & chr(34) & ">" & i & "</a>")
h = h +1
next
Response.Write("<BR><Small>Pagina " & currentPage & " de  " & h & "</SMALL></center><BR><BR>")
end sub
'-----------------------------
Sub llenado5(npp,np2,np3,np4,np5,np6,np7,np8)
npp=Request.Form("select14")
np2=Request.Form("radio1")
np3=0
np4=Request.Form("checkbox4")
np5=Request.Form("checkbox5")
np6=Request.Form("checkbox6")
np7=0
np8=0	
end Sub

Sub questions(nque)
set Conn = Server.CreateObject("ADODB.Connection")
DBPath=server.MapPath("/fpdb/tracker.mdb")
set Conn = Server.CreateObject("ADODB.Connection")
Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "Data Source=" & dbpath
Conn.Open
if nque = 1 then
   qpre = 13
end if
if nque = 2 then
   qpre = 14
end if
if nque = 3 then
   qpre = 15
end if
if nque = 4 then
   qpre = 16
end if
if nque = 5 then
   qpre = 17
end if

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from QDB where id = " & qpre & " order by id",Conn, 1,3
do while not Rs.eof
   Response.Write rs("question") 
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub



'-----------------------------
Function chequea1(npp,np2,np3,np4,np5,np6,np7,np8)
set Conn = Server.CreateObject("ADODB.Connection")
'Conn.Provider = "Microsoft.Jet.OLEDB.4.0"
Conn.ConnectionString = "dsn=tracker"
Conn.Open
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from hotel where mcorre= " & np2 & "",Conn, 1,3
do while not Rs.eof
np3=0
np7=0
np8=0
if np4="on" then
   np3=rs("precio1")
end if
if np5="on" then
   np7=rs("precio2")
end if     
if np6="on" then
   np8=rs("precio3")
end if
rs.movenext
loop
set Rs = nothing
set Conn = nothing
End function
%>