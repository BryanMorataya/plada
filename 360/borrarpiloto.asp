
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	Dim StrParam '
		StrParam = Request.QueryString("UserID")

	DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
    DSN = session("conec")

	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
 	SQL2 = "delete from pilotos where id="+StrParam
    'SQL2 = "SELECT * FROM marcas WHERE NEMPRESA="&session("empn")
    'SQL2 = SQL2 & " and ID="&StrParam

 	RS.Open SQL2,Conn,3,1
    response.Redirect("bpilo.asp")
%>
