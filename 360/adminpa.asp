<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 19

%>
<%


%>

<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Shell Lubricantes</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery/jquery.gallerax-0.2.js"></script>
<style type="text/css">
    @import "gallery.css";
    #Text2
    {
        width: 77px;
    }
    #Text3
    {
        width: 186px;
    }
    .style1
    {
        width: 138px;
    }
    #descrip
    {
        width: 421px;
        height: 51px;
    }
    #motor
    {
        width: 150px;
    }
    #Text4
    {
        width: 150px;
    }
    #Text9
    {
        width: 216px;
    }
    #Text10
    {
        width: 323px;
    }
    #chassis
    {
        width: 150px;
    }
    #observa
    {
        width: 200px;
        height: 57px;
    }
    #npiloto
    {
        width: 201px;
    }
    .style2
    {
        width: 72px;
    }
    #codigo
    {
        width: 83px;
    }
</style>
</head>
<body>
<div id="wrapper">
	<div id="header">

	</div>
	<!-- end #header -->

	<!-- end #menu -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="content">
                <form name="nveh" method="post" action="adminpa2.asp">

					<div class="post">
						<h2 class="title">Ingreso de querys manuales</h2>
						<div style="clear: both;">&nbsp;<table style="width:100%;">
  
                            <tr>
                                <td class="style1">
                                    Query</td>
                                <td class="style2">
                                    <input id="descrip" type="text" size="300" maxlength="350" name="descrip" /></td>
                                <td>
                                    &nbsp;</td>

                            </tr>
    
  
                            <tr>
                                <td class="style1">
                                    &nbsp;</td>
                                <td class="style2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    &nbsp;</td>
                                <td class="style2">
                                    <input id="Submit1" type="submit" value="Grabar" name="Grabar" /><input id="Reset1" 
                                        type="reset" value="Limpiar" /></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            </table>

                            
                        </div>
						<div class="entry">
							
							
						</div>
					</div>
	
					<div style="clear: both;">&nbsp;</div>
                    </form>
				</div>
                
				<!-- end #content -->

				<!-- end #sidebar -->
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- end #page -->
</div>

<!-- end #footer -->
</body>
</html>
