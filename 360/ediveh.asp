<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 4
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
  ''   response.Write request.Form
	 DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
     DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	SQL = "SELECT * FROM _vehiculos where codigo='"&Request.Form("codigo")&"'"
    ''response.write sql
	RS.open SQL, conn,3,3
	if not RS.EOF Then
		vcodigo =  Request.Form("codigo")
		vdescrip = Request.Form("descrip")
		vmotor = Request.Form("motor")
		vcha = Request.Form("cha")
		vtmotor = Request.Form("tmotor")
		vcaj = Request.Form("tcaja")
        'vcorreo = request.form("correon")
		vtdiferen = Request.Form("tdiferen")
		vplaca = Request.Form("placa")
		'vnpiloto = Request.Form("npiloto")
		'vobserva = Request.Form("observa")
	    vkmi = Request.Form("kmi")
		vmarca   = Request.Form("marca")
		vmodelo  = Request.Form("modelo")
        vccontable = Request.Form("ccontable")
        'vfpoliza = Request.Form("fpoliza")
        'vnpoliza = Request.Form("npoliza")
        'vcobertura = Request.Form("cobertura")
        'vlinea = Request.Form("linea")
        'vcc = Request.Form("cc")
        'vcil = Request.Form("cil")
        'vtonelaje = Request.Form("tonelaje")
        vtveh= request.form("tveh")
        vdserv= request.form("dservicio")
        vejed = request.Form("ejed")
        vejet = request.Form("ejet")
        'vpatin = request.form("patin")

        vemprep = request.form("emprep")
        'vempres = request.form("empres")
        'vpimpo = request.form("pimpo")
        'vfimpo = request.form("fimpo")
        'vsect = request.form("sect")
        vruta = request.form("demarcacion")
        vpred = request.form("predio")

		SQLAdd = "update _vehiculos set descripcion='"&vdescrip&"',motor='"&vmotor&"',cha='"&vcha&"',placa='"&vplaca&"',"
        SQLAdd = SQLAdd + "modelo='"&vmodelo&"',ccontable='"&vccontable&"',servicio="&vdserv&","
        SQLAdd = SQLAdd + "ruta = '"&vruta&"',predio = '"&vpred&"' where codigo='"&Request.Form("codigo")&"'"
	    response.write SQLAdd
    	Conn.Execute SQLAdd
		Conn.Close
		Set Conn = nothing
  
        response.redirect("bveh.asp")
    else
         
	end if  
		
%>