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
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	quev = session("empn")
	finicial=split(inicial,"/")
	inicial=finicial(2)&finicial(1)&finicial(0)
	ffinal=split(final,"/")
	final=ffinal(2)&ffinal(1)&ffinal(0)
	SQL = "select preg.descripcion,count(*) errores from ichequeosd icheqd inner join ichequeos icheq inner join preguntad_360 pregd inner join preguntae_360 preg on icheq.fecha between '"&inicial&"' and '"&final&"' and icheq.ncorre=icheqd.ncorre and icheqd.valor>0 and icheqd.idpregunta=pregd.idpregunta and pregd.poscicion_encabezado=preg.posicion group by preg.descripcion"
	RS.Open SQL,Conn,3,1
	Response.ContentType = "application/json"
	Response.Write "{"
	Response.Write "  ""datos"": ["
	count = 0

	While Not Rs.Eof
	  'Dim cod, desc, costo
		desc= RS("descripcion")
		errores=RS("errores")
		count = count + 1
		If count > 1 Then
			 Response.Write ", "
		End If

		Response.Write "{ "
		Response.Write "   ""desc"": """ & desc & """, "
		Response.Write "   ""errores"": """ & errores & """"
		Response.Write "}"
		Rs.MoveNext      
	Wend
	Response.Write " ]"
	Response.Write "}"

	Rs.Close
%>