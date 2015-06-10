<%
Dim clasificacion,count
para = Request.form("para")
asunto = Request.form("asunto")
mensaje = Request.form("mensaje")
On Error Resume Next
	sch = "http://schemas.microsoft.com/cdo/configuration/"
	Set cdoConfig = CreateObject("CDO.Configuration")
	With cdoConfig.Fields
		.Item(sch & "sendusing") = 2
		'.Item(sch & "smtpserverpickupdirectory") = "C:\inetpub\wwwroot\mail" 
		.Item(sch & "smtpserver") = "mail.grupo-genera.com"
		.Item(sch & "smtpserverport") = 587
		'.Item(sch & "smtpconnectiontimeout") = 40
		.Item(sch & "smtpauthenticate") = 1
		.Item(sch & "sendusername") = "notificaciones@grupo-genera.com"
		.Item(sch & "sendpassword") = "systemsnot"
		.update
	End With

	Set MailObject = Server.CreateObject("CDO.Message")
	Set MailObject.Configuration = cdoConfig
	MailObject.Fields.Item("urn:schemas:mailheader:X-MSMail-Priority") = "High"
	'MailObject.BodyFormat = 0
	'MailObject.mailformat = 0
	MailObject.From	= "<notificaciones@grupo-genera.com> Notificación USFlota"
	MailObject.To	= para
	MailObject.Subject = asunto
	mensaje = mensaje & "<br><br><span style='font-size:0.85em;'><em>Usuario: "&session("nombre")&"</em></span>"
	MailObject.HTMLBody = mensaje
	MailObject.Send
	Set MailObject = Nothing
	Set cdoConfig = Nothing
Response.ContentType = "application/json"
	Response.Write "{"
	Response.Write "  ""datos"": ["
	Response.Write "{ "
	If Err.Number = 0 Then'*** Commit Transaction ***'
		Response.Write "   ""error"": ""0"""
	Else'*** Rollback Transaction ***'
		Response.Write "   ""error"": """&err.description&""""
	End If
	Response.Write "}"
	Response.Write " ]"
	Response.Write "}"
	Rs.Close
	Conn.Close
%>