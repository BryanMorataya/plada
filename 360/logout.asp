    <%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
	<%
	session.Abandon()
	Response.Redirect("index.asp")
	%>
<html>
<head>
<title>Cerrar session</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="450" border="0" align="center" cellpadding="1" cellspacing="0" bgcolor="#FF0000">
  <tr><img src="images/emp/logop2.png" align = "left" width="120" height="70" /><img src="logoun1.png" align= "right" width="120" height="70" />
    <td><table width="450" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="20">
<div align="center" class="navlink8bl"><span class="navlink10bl"><font color="#FF0000">Su session ha
         sido cerrada</font></span><font color="#FF0000"> 
              <a href="login.aspx" class="navlink10bl"></a></font></div></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
