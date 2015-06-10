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
    	SQL = "SELECT * FROM vehiculos"
        'response.write sql
    	RS.open SQL, conn2,3,3 
        if RS.eof = false then
         Do while not RS.EOF
           nuco = rs("codigo")
           SQL2 = "SELECT * FROM _vehiculos where codigo = '" & nuco & "'"
    	   response.write sql2
           RS2.open SQL2, conn,3,3
   '        if rs2.eof = true then 
              descri = "Unidad " & rs("uso") & " " & rs("codigo") 
              tpendi = 0
'       	  SQLAdd = "INSERT INTO _vehiculos(codigo,descripcion,motor,cha,tmotor,tcaj,tdiferen,placa,kma,marca,modelo,ccontable,fpoliza,tveh,uservicio,xservicio,nempresa,cejed,cejet,cpatin,empresap,empresas,pimpor,fimpor,sector,ruta,predio,nparte1)Values('"
   		      SQLAdd = "INSERT INTO vehiculos(codigo,descripcion,kma,motor,cha,placa,ccontable,tmotor,tcaj,tdiferen,tveh,xservicio,marca,modelo,cejed,cejet,cpatin,sector,ruta,predio,uservicio,empresap,empresas,pais)Values('"
		      SQLAdd = SQLAdd & rs("codigo") &"','"& descri &"',"& 0 &",'"& rs("motor") &"','"& rs("chasis") &"','"& rs("placas") &"','"& rs("cuentacontable") &"','"& tpendi &"','"& tpendi &"','"& tpendi &"','"& rs("tipov") &"',0,'"& rs("marca") &"','"& rs("modelo") &"',0,0,0,'"& rs("planta") &"','"& rs("sector") &"','"& rs("predio") &"',0,'"& rs("empresaservicio") &"','"& rs("empresapropiedad") &"',1)"

	   	      response.Write SQLAdd
             Conn.Execute SQLAdd
   '        end if
           rs2.close
          rs.movenext
         loop   
        end if
	'   Response.Redirect("paquetesr.asp")
    
%>


