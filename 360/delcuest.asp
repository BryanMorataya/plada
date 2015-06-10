<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--#include file="includes/funciones.asp"-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 18
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
	strds2 = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set RS2 = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open strds2

    	SQL2 = "update preguntae_360 set sisEstado='D' WHERE id="&StrParam
	    RS2.Open SQL2,Conn,3,1
    Response.Redirect("cuestionario.asp")
%>
<html>
</html>
