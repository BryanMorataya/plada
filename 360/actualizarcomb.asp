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
  descripcion=request.QueryString("descripcion")
	datos=request.QueryString("string")
    dato=split(datos,"@")
	fecha = request.QueryString("fecha")
    fechas=split(fecha,"/")
	fecha=fechas(2)&fechas(0)&fechas(1)
	insertar = "INSERT INTO ajustese (descripcion,fecha,usuario,status,nempresa) VALUES ('"&descripcion&"','"&fecha&"','"&usuario&"','1','"&empresa&"')"
            encabezado=1
       Conn.Execute insertar
	 correlativo= "select @@identity as IdentityInsert"
Set RS = Conn.Execute(correlativo)

corres= RS("IdentityInsert")

	dim cont
	cont=0
	insertardeta="INSERT INTO ajustesd(codigo,Price, Uprice, Username, Quantity, id2) VALUES"
	while cont <= ubound (dato)
    datos=split(dato(cont),",")
	codigo=datos(0)
	cantidad=datos(1)
	precio=datos(2)
	total=datos(3)
	if cont=0 then
	 insertardeta=insertardeta&"('"&codigo&"','"&total&"','"&precio&"','"&usuario&"','"&cantidad&"',"&corres&") "
	 else
	 insertardeta=insertardeta&",('"&codigo&"','"&total&"','"&precio&"','"&usuario&"','"&cantidad&"',"&corres&") "
	 end if
	cont=cont+1
	wend
	response.Write(insertardeta)
   Conn.Execute insertardeta
	''response.Write(descrip)

    %>
     <script type="text/javascript">;
     location.href="ajustesinventario.asp#succes";
     </script>
     <%


                
%>
