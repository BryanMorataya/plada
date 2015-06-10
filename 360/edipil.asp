<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 7
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
    response.Write request.Form
	 DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
     DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	SQL = "SELECT * FROM pilotos where codigo='"&Request.Form("codigo")&"'"
    response.write sql
	RS.open SQL, conn,3,3
	if not RS.EOF Then
		vcodigo =  Request.Form("codigo")
		vnombre = Request.Form("nombre")
		vedad = Request.Form("edad")
		vlicencia = Request.Form("licencia")
		vident = Request.Form("ident")
		vtelef = Request.Form("telef")
		vemprep = Request.Form("emprep")
		vvehiculo = Request.Form("vehiculo")

		SQLAdd = "update pilotos set nombre='"&vnombre&"',edad='"&vedad&"',licencia='"&vlicencia&"',docidentificacion='"&vident&"',telefono='"&vtelef&"',empresa='"&vemprep&"',vehiculo='"&vvehiculo&"' where codigo='"&Request.Form("codigo")&"'"
	    response.write SQLAdd
    	Conn.Execute SQLAdd
		Conn.Close
		Set Conn = nothing
  
        response.redirect("bpilo.asp")
    else
        response.redirect("error.asp")   
	end if  
		
%>