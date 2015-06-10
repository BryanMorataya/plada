<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--#include file="includes/funciones.asp"-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 17
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
	Dim StrParam '
	StrParam = Request.QueryString("UserID")
    StrParam2 = Request.QueryString("uid")
	DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
        DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	strds2 = session("conec")
    strds2 = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
        strds2 = session("conec")
	Conn.Open strds2
	SQL = "DELETE FROM userd WHERE ID="&StrParam
	RS.Open SQL,Conn,3,1
	Response.Redirect("detrol.asp?UserID="&strparam2)
%>
<html>
</html>
