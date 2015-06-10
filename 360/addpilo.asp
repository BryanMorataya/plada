<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 5
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
  	vcodigo =  Request.Form("codigo")
    response.Write request.Form
	DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
        DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	SQL = "SELECT * FROM pilotos where codigo= '" & vcodigo & "'"
    response.write sql
	RS.open SQL, conn,3,3
    response.write sql
	if RS.EOF Then
		vcodigo =  Request.Form("codigo")
		vnombre = Request.Form("nombre")
		vedad = Request.Form("edad")
		vlicencia = Request.Form("licencia")
		vident = Request.Form("ident")
		vtelef = Request.Form("telef")
		vemprep = Request.Form("emprep")
		vvehiculo = Request.Form("vehiculo")
		
		SQLAdd = "INSERT INTO pilotos(codigo,nombre,edad,licencia,docidentificacion,telefono,empresa,vehiculo)Values('"
		SQLAdd = SQLAdd &vcodigo&"','"&vnombre&"',"&vedad&",'"&vlicencia&"','"&vident&"','"&vtelef&"','"&vemprep&"','"&vvehiculo&"')"
        response.write sqladd
		Conn.Execute SQLAdd
		Conn.Close
		Set Conn = nothing
      response.redirect("dashboard.asp")
    else
      response.redirect("error.asp")
	end if  
		
%>