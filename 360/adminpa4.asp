<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'if Session("Admin") = False or IsNull (Session("Admin")) = True then
'Response.Redirect("login.asp")
'end if
%>
<%
	Dim Conn ' Open Database Connection
    Dim Conn2 ' Open Database Connection
	Dim RS   ' Open Record Set
    Dim RS2   ' Open Record Set
    Dim RS3   ' Open Record Set
    Dim RS4   ' Open Record Set
	Dim SQL  ' SQL statement  
    Dim SQL2  ' SQL statement
    Dim SQL3  ' SQL statement
    Dim SQL4  ' SQL statement
	Dim DSN  ' DSN Less Connection
    Dim DSN2  ' DSN Less Connection
    DSN = session("conec")
    DSN2 = "DBQ=" & Server.Mappath("bdadime.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
	Set RS = Server.CreateObject("ADODB.Recordset")
    Set RS2 = Server.CreateObject("ADODB.Recordset")
    Set RS3 = Server.CreateObject("ADODB.Recordset")
    Set RS4 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Set Conn2 = Server.CreateObject("ADODB.Connection")
    Conn.Open DSN
	Conn2.Open DSN2
    	vnoguia = Request.querystring("noguia")
    	SQL = "SELECT * FROM pilotos"
        'response.write sql
    	RS.open SQL, conn2,3,3 
        if RS.eof = false then
         Do while not RS.EOF
           nuco = rs("identificacion")
           SQL2 = "SELECT * FROM pilotos where docidentificacion = '" & nuco & "'"
    	  ' response.write sql2
           RS2.open SQL2, conn,3,3
   '        if rs2.eof = true then 
              tpendi = 0
   		      SQLAdd = "INSERT INTO pilotos(nombre,edad,licencia,docidentificacion,telefono,empresa,vehiculo,codigo)Values('"
		      SQLAdd = SQLAdd & rs("nombre") &"',0,'"& rs("licencia") &"','"& rs("identificacion") &"',0,7,0,0)"

	   	      response.Write SQLAdd
             Conn.Execute SQLAdd
   '        end if
           rs2.close
          rs.movenext
         loop   
        end if
	'   Response.Redirect("paquetesr.asp")
    
%>


