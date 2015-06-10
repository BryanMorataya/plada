 <%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 2
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
  	vcodigo =  Request.Form("codigo")
    'response.Write request.Form
	DSN = "DBQ=" & Server.Mappath("dbshell.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
        DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
	SQL = "SELECT * FROM _vehiculos where codigo= '" & vcodigo & "' and empresap='"&session("flota")&"'"
	RS.open SQL, conn,3,3
	if RS.EOF Then
		vcodigo =  Request.Form("codigo")
		vdescrip = Request.Form("descrip")
		vmotor = Request.Form("motor")
		vcha = Request.Form("cha")
        vcorreo = request.form("correon")
		vtmotor = Request.Form("tmotor")
		vcaj = Request.Form("tcaja")
		vtdiferen = Request.Form("tdiferen")
		vplaca = Request.Form("placa")
		vnpiloto = Request.Form("npiloto")
		vobserva = Request.Form("observa")
		vkmi = Request.Form("kmi")
		vmarca   = Request.Form("marca")
		vmodelo  = Request.Form("modelo")
        vccontable = Request.Form("ccontable")
        vfpoliza = Request.Form("fpoliza")
        vnpoliza = Request.Form("npoliza")
        vcobertura = Request.Form("cobertura")
        vtveh    = request.form("tveh")
        vpais    = request.form("dpais")

        vlinea = Request.Form("linea")
        vcc = Request.Form("cc")
        vcil = Request.Form("cil")
        vtonelaje = Request.Form("tonelaje")
        vmmotor = Request.Form("mmotor")
        vmdifere = Request.Form("mdifere")
        vtcha = Request.Form("tcha")    
        vuserv = request.form("uservicio")
        vdserv = request.form("dservicio")   
        empresa = session("empn")
        vejed = request.Form("ejed")
        vejet = request.Form("ejet")
        vpatin = request.form("patin")
        vemprep = request.form("emprep")
        vempres = 5
        vpimpo = request.form("pimpo")
        vfimpo = request.form("fimpo")
        vsect = request.form("sect")
        vruta = request.form("ruta")
        vpred = request.form("predio")
        vfimpo2 = year(vfimpo)&"-"&day(vfimpo)&"-"&month(vfimpo)
        vfpoliza2 = year(vfpoliza)&"-"&day(vfpoliza)&"-"&month(vfpoliza)
        vfimpo2 = year(vfimpo)&"-"&month(vfimpo)&"-"&day(vfimpo)
        vfpoliza2 = year(vfpoliza)&"-"&month(vfpoliza)&"-"&day(vfpoliza)
		SQLAdd = "INSERT INTO _vehiculos(codigo,descripcion,motor,cha,tmotor,tcaj,tdiferen,placa,kma,marca,modelo,ccontable,fpoliza,tveh,uservicio,xservicio,nempresa,cejed,cejet,telefonoe,empresap,empresas,sector,ruta,predio,nparte1)Values('"
		SQLAdd = SQLAdd &vcodigo&"','"&vdescrip&"','"&vmotor&"','"&vcha&"','"&vtmotor&"','"&vcaj&"','"&vtdiferen&"','"&vplaca&"',"&vkmi&",'"&vmarca&"','"&vmodelo&"','"&vccontable&"','"&vfpoliza2&"',"&vtveh&""
        SQLAdd = SQLAdd & ","&vuserv&","&vdserv&",23,"&vejed&","&vejet&",'"&vpatin&"','"&vemprep&"','"&vempres&"',"&vsect&",'"&vruta&"','"&vpred&"','"&vcorreo&"')"
      response.write sqladd
		Conn.Execute SQLAdd
		Conn.Close
		Set Conn = nothing
      response.redirect("dashboard.asp")
    else
     response.Write("EL Código Ya existe en Base de Datos")
	end if  
		
%>