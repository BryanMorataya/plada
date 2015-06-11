<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="includes/funciones.asp"-->
<%

Dim Conn ' Open Database Connection
Dim RS   ' Open Record Set
Dim SQL  ' SQL statement  
Dim DSN  ' DSN Less Connection
DSN = session("conec")
Set RS = Server.CreateObject("ADODB.Recordset")
Set RS1 = Server.CreateObject("ADODB.Recordset")
Set Conn = Server.CreateObject("ADODB.Connection")
    ''cant = request.queryString("cant")	
   Conn.Open DSN

   
   ''SQL1 = "select * from correlativo where nempresa="&session("empn")
	''RS1.Open SQL1,Conn,3,3
	empresa=session("empn")
    ''correlativo=RS1("ajustes")+1
    usuario=session("username")
  veh=request.QueryString("veh")
	tipo=request.QueryString("tipo")
   
	insertar = "update _vehiculos set tipo_combustible="&tipo&" where codigo="&veh&""
            response.write(insertar)
       Conn.Execute insertar
	 correlativo= "select @@identity as IdentityInsert"
Set RS = Conn.Execute(correlativo)


    %>
     <script type="text/javascript">;
     location.href="combustible.asp#succes";
     </script>
     <%


                
%>
