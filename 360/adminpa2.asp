<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
    quer = request.form("descrip")
	DSN = "DBQ=" & Server.Mappath("category2.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
        SQLA2 = quer
      response.write sqla2
	    Conn.Execute SQLA2 

   
		Conn.Close
		Set Conn = nothing
'		Response.Redirect("home.asp")
		
%>
		


