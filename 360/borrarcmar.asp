
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	Dim StrParam '
		StrParam = Request.QueryString("UserID")

	
    DSN = session("conec")

	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
 	SQL2 = "update preguntad_360 set sisEstado = 'D' where ID="+StrParam
    'SQL2 = "SELECT * FROM marcas WHERE NEMPRESA="&session("empn")
    'SQL2 = SQL2 & " and ID="&StrParam

 	RS.Open SQL2,Conn,3,1
    response.Redirect("cuestionario.asp")
%>
