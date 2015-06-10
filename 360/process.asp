<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
	<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
	Dim SQL  ' SQL statement  
	Dim DSN  ' DSN Less Connection
	Dim StrUser ' Get Value of Username
	Dim StrPass ' Get Value of the Password
    response.write request.form
	session("Username") = ""
	session("lugar")= 0
    session("nuid") = 0
    session("empn") = 0
    session("conec") = ""
	session("flotila")=1
	session("ID")=""
'	DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
  '  session("conec") = DSN

  ''  session("conec") = "Provider=MSDASQL; Driver={SQL Server}; Server=dbtransadime.db.11147031.hostedresource.com; Database=dbtransadime; UID=dbtransadime; PWD=Wilson03#;"
 ''   session("conec") = "Provider=MSDASQL; Driver={SQL Server}; Server=MAVERIC-PC\SQLEXPRESS2; Database=dbtrans; UID=prosales; PWD=Wilson03*;"
 ''   session("conec") = "Provider=MySQLProv; Data Source=mySQLDB; UID=prosales2; PASSWORD=modelos99; OPTION=3" 
    'session("conec") = "driver={MySQL ODBC 3.51 Driver}; SERVER=dbtransadime.db.11147031.hostedresource.com;Database=dbtransadime; Uid=dbtransadime; Pwd=Wilson03#;"
 ''    session("conec") = "Driver={MySQL ODBC 5.1 Driver};Server=localhost;uid=prosales2;pwd=modelos99;database=dbtrans;"  
 ''   session("conec") = "Driver={MySQL ODBC 5.1 Driver};Server=localhost;uid=UnionSystems;pwd=union01;database=dbtrans;"  
   '' session("conec") = "Driver={MySQL ODBC 3.51 Driver};Server=dbtransadime.db.11147031.hostedresource.com;User id=dbtransadime;password=Wilson03#;database=dbtransadime;"  
  'session("conec") = "Provider=MSDASQL;DRIVER={MySQL ODBC 5.2w Driver};SERVER=localhost;DATABASE=dbtrans;UID=root;PWD=root;" 
'' session("conec") = "Provider=MSDASQL;DRIVER={MySQL ODBC 5.2w Driver};SERVER=localhost;DATABASE=dbtrans;UID=root;PWD=root;" 

    session("conec") = "Driver={MySQL ODBC 5.3 ANSI Driver};Server=basededatos001.usgenera.com;Port=3306;Database=plada_dbtrans;User=root;Password=Union413;Option=3;"
'	session("conec") = "Driver={MySQL ODBC 5.1 ANSI Driver};Server=localhost;Port=3306;Database=dbtransgentrac;User=gentrac;Password=gentrac;Option=3;" 
    DSN = session("conec")
    response.write dsn
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	StrUser = Request.Form("username")
	Conn.Open DSN
	SQL = "CALL Login('"&StrUser&"', '"&Request.Form("password")&"');" 
	RS.Open SQL,Conn,3,1
	%>
	<%

	If NOT RS.EOF Then
        session("nombre") = rs("firstname") & " " & rs("lastname")
        session("Username") = rs("username")
        session("lugar") = rs("idagencia")
        session("empn") = rs("nempresa")
		session("flotilla")=rs("flotilla")
		session("ID")=rs("id")
		session("flota") = rs("flotilla")
		session("nombre")=rs("FirstName")&" "&rs("LastName")

		  if RS("Status") = True then
		  	session("Admin") = True
			session("Good") = True
			session.Timeout = 100
			Response.Redirect("dashboard.asp")	
			End if

	'close connection before processing send redirect
	' Redirect to the success login

			if RS("Status") = False then
			session("Good") = True
			session.Timeout = 100
			Response.Redirect("index.asp")
			End if
'			session("Good") = True
'			session.Timeout = 100
		    Response.Redirect("index.asp")
       End if
'			session("Good") = True
'			session.Timeout = 100
'			Response.Redirect("default.asp")
	' Close object
	set Rs = nothing
	set Con = nothing
	set SQL = nothing
	'Response.Write Request.Form
		session("Good") = false
		session("Admin") = false
		Response.Redirect("index.asp")
	%>
