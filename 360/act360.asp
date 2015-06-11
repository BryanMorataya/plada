


<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
    Dim RS2   ' Open Record Set
	Dim SQL  ' SQL statement  
    Dim SQLv  ' SQL statement  
	Dim DSN  ' DSN Less Connection

    vtipos = request.QueryString("tipos")
    vpiloto = request.QueryString("piloto")
    vobs1 = request.QueryString("obs1")
    vnunidad = request.QueryString("nunidad")
    contadorfallas= 0
    vfecha = request.QueryString("fecha")

    datos = request.QueryString("datos")

    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
    Set RSV = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	On Error Resume Next
	Conn.BeginTrans
'response.write session("empn")
    vfe2 = vfecha
    'Enca
    sqlbi = "INSERT INTO ichequeos (fecha,servicio,piloto,unidad,observaciones,usuario) "
    sqlbi = sqlbi+"values('"& vfe2 & "'," & vtipos  & "," & vpiloto  & ",'" & vnunidad & "','"&vobs1 &"','"&session("Username")&"'); "
    Set objExec = conn.execute(sqlbi)
	Set objExec = Nothing
	
	sqlcorre= "select @@identity as IdentityInsert"
	Set RsId = conn.Execute(sqlcorre)
	correlativo = RsId("IdentityInsert")
	
	'sqlUPDATE = "UPDATE ichequeos SET ncorre="&correlativo&" WHERE id="&correlativo
    'Set objExec = conn.execute(sqlUPDATE)
	'Set objExec = Nothing
	
   	contador=1
   	dato=split(datos,"@")
	SQL=""
	while contador<=ubound(dato)
		datos=split(dato(contador),",")
		if contador=1 then
			SQL=SQL+"("&correlativo&",'"&datos(1)&"','"&datos(0)&"','"&datos(2)&"')"
		else
			SQL=SQL+",("&correlativo&",'"&datos(1)&"','"&datos(0)&"','"&datos(2)&"')"
		end if
		contador=contador+1
	wend
    SQL = "INSERT INTO ichequeosd (idIchequeos,idPregunta,valor,descripcion)values"&SQL
    Set objExec = conn.execute(SQL)
	Set objExec = Nothing

Response.ContentType = "application/json"
	Response.Write "{"
	Response.Write "  ""datos"": ["
		Response.Write "{ "
		If Err.Number = 0 Then'*** Commit Transaction ***'
			Conn.CommitTrans
			Response.Write "   ""error"": ""0"""
		Else'*** Rollback Transaction ***'
			Conn.RollbackTrans
			Response.Write "   ""error"": """&err.description&"---"&correlativo&""""
		End If
		Response.Write "}"
	Response.Write " ]"
	Response.Write "}"
	Rs.Close
	Conn.Close
   Set Conn = nothing
  'response.Redirect "km360.asp"	
%>