<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="includes/funciones.asp"-->
<%
	if session("Username")="" then 
		Response.Redirect "index.asp"
    end if
    estapagina = 8
  '  resula = qacc(session("username"),estapagina)
'	if resula <> 1 then 
'		Response.Redirect "noacceso.asp"
'    end if
%>
<%
	Dim Conn ' Open Database Connection
	Dim RS   ' Open Record Set
    Dim RS2   ' Open Record Set
	Dim SQL  ' SQL statement  
    Dim SQLv  ' SQL statement  
	Dim DSN  ' DSN Less Connection

 '   response.write "--" & request.form.Count
     response.Write request.form

    vtipos = request.form("tipos")
    vpiloto = request.form("piloto")
    vobs1 = request.form("obs1")
    vnunidad = request.form("nunidad")
    contadorfallas= 0
    vfecha = request.form("fecha")

    vp1 = request.form("p1")
    vp2 = request.form("p2")
    vp3 = request.form("p3")
    vp4 = request.form("p4")
    vp5 = request.form("p5")
    vp6 = request.form("p6")
    if vp1=1 or vp2 =1 or vp3 =1 or vp4 =1 or vp5 =1 or vp6 =1 then
        contadorfallas = contadorfallas+1
    end if

    vi1 = request.form("i1")
    vi2 = request.form("i2")
    vi3 = request.form("i3")
    vi4 = request.form("i4")
    vi5 = request.form("i5")
    vi6 = request.form("i6")
    vi7 = request.form("i7")
    vi8 = request.form("i8")
    if vi1=1 or vi2 =1 or vi3 =1 or vi4 =1 or vi5 =1 or vi6 =1 or vi7 =1 or vi8 =1 then
        contadorfallas = contadorfallas+1
    end if
    vld1 = request.form("ld1")
    vld2 = request.form("ld2")
    vld3 = request.form("ld3")
    vld4 = request.form("ld4")
    vld5 = request.form("ld5")
    if vld1=1 or vld2 =1 or vld3 =1 or vld4 =1 or vld5 =1  then
        contadorfallas = contadorfallas+1
    end if
    vli1 = request.form("li1")
    vli2 = request.form("li2")
    vli3 = request.form("li3")
    vli4 = request.form("li4")
    vli5 = request.form("li5")
    if vli1=1 or vli2 =1 or vli3 =1 or vli4 =1 or vli5 =1  then
        contadorfallas = contadorfallas+1
    end if
    vpo1 = request.form("po1")
    vpo2 = request.form("po2")
    vpo3 = request.form("po3")
    vpo4 = request.form("po4")
    vpo5 = request.form("po5")
    vpo6 = request.form("po6")
    if vpo1=1 or vpo2=1 or vpo3 =1 or vpo4 =1 or vpo5 =1 or vpo6 =1  then
        contadorfallas = contadorfallas+1
    end if
    ves1 = request.form("es1")
    ves2 = request.form("es2")
    ves3 = request.form("es3")
    if ves1=1 or ves2=1 or ves3 =1 then
        contadorfallas = contadorfallas+1
    end if
    vdo1 = request.form("do1")
    vdo2 = request.form("do2")
    vdo3 = request.form("do3")
    vdo4 = request.form("do4")
    vdo5 = request.form("do5")
    vdo6 = request.form("do6")
    if vdo1=1 or vdo2=1 or vdo3 =1 or vdo4 =1 or vdo5 =1 or vdo6 =1  then
        contadorfallas = contadorfallas+1
    end if
    vhe1 = request.form("he1")
    vhe2 = request.form("he2")
    vhe3 = request.form("he3")
    vhe4 = request.form("he4")
    vhe5 = request.form("he5")
    vhe6 = request.form("he6")
    if vhe1=1 or vhe2=1 or vhe3 =1 or vhe4 =1 or vhe5 =1 or vhe6 =1  then
        contadorfallas = contadorfallas+1
    end if
    vod1 = request.form("od1")
    vod2 = request.form("od2")
    vod3 = request.form("od3")
    vod4 = request.form("od4")
    vod5 = request.form("od5")
    vod6 = request.form("od6")
    vod7 = request.form("od7")
    vod8 = request.form("od8")
    vod9 = request.form("od9")
    vod10 = request.form("od10")
    vod11 = request.form("od11")
    vod12 = request.form("od12")
    vod13 = request.form("od13")
    vod14 = request.form("od14")
    vod15 = request.form("od15")
    if vod1=1 or vod2=1 or vod3 =1 or vod4 =1 or vod5 =1 or vod6 =1 or vod7 =1 or vod8 =1 or vod9 =1 or vod10 =1 or vod11 =1 or vod12 =1 or vod13 =1 or vod14=1 or vod15 =1then
        contadorfallas = contadorfallas+1
    end if
    vpi1 = request.form("pi1")
    vpi2 = request.form("pi2")
    vpi3 = request.form("pi3")
    vpi4 = request.form("pi4")
    vpi5 = request.form("pi5")
    vpi6 = request.form("pi6")
    vpi7 = request.form("pi7")
    if vpi1=1 or vpi2=1 or vpi3 =1 or vpi4 =1 or vpi5 =1 or vpi6 =1 or vpi7 =1 then
        contadorfallas = contadorfallas+1
    end if
    vp1t = request.form("pbrisas")
    vp2t = request.form("Limpiadores")
    vp3t = request.form("Cuernos")
    vp4t = request.form("Luces")
    vp5t = request.form("Espejosl")
    vp6t = request.form("Calcomania")

    vi1t = request.form("videodvd")
    vi2t = request.form("Monitores")
    vi3t = request.form("Stereo")
    vi4t = request.form("Butacas")
    vi5t = request.form("Airec")
    vi6t = request.form("Lucesi")
    vi7t = request.form("Fundas")
    vi8t = request.form("bano")

    vld1t = request.form("Ventanillasd")
    vld2t = request.form("pserviciod")
    vld3t = request.form("bauld")
    vld4t = request.form("clateralmd")
    vld5t = request.form("lcalteralbd")

    vli1t = request.form("Ventanillasi")
    vli2t = request.form("pservicioi")
    vli3t = request.form("bauli")
    vli4t = request.form("clateralmi")
    vli5t = request.form("lcalteralbi")

    vpo1t = request.form("defensa")
    vpo2t = request.form("pluces")
    vpo3t = request.form("postes")
    vpo4t = request.form("pventanilla")
    vpo5t = request.form("pcalcomania")
    vpo6t = request.form("pmotor")
 
    ves1t = request.form("botiquin")
    ves2t = request.form("extinguidor")
    ves3t = request.form("reflejantes")

    vdo1t = request.form("ciryplaca")
    vdo2t = request.form("dcalcomania")
    vdo3t = request.form("operacion")
    vdo4t = request.form("rodaje")
    vdo5t = request.form("pseguro")
    vdo6t = request.form("licencia")

    vhe1t = request.form("tricket")
    vhe2t = request.form("lchuchos")
    vhe3t = request.form("lrepuesto")
    vhe4t = request.form("conost")
    vhe5t = request.form("evigia")
    vhe6t = request.form("slimpieza")

    vod1t = request.form("motor")
    vod2t = request.form("ccomb")
    vod3t = request.form("caja")
    vod4t = request.form("ejetras")
    vod5t = request.form("ejecar")
    vod6t = request.form("frenos")
    vod7t = request.form("selectrico")
    vod8t = request.form("ctimon")
    vod9t = request.form("retardador")
    vod10t = request.form("llantas")
    vod11t = request.form("itabl")
    vod12t = request.form("paceite")
    vod13t = request.form("rtemp")
    vod14t = request.form("rpsi")
    vod15t = request.form("aspiro")

    vpi1t = request.form("detaHorario")
    vpi2t = request.form("detaSalud")
    vpi3t = request.form("detaAnimi")
    vpi4t = request.form("detaApoyo")
    vpi5t = request.form("detaTrato")
    vpi6t = request.form("detaArmonia")
    vpi7t = request.form("detaCapacidades")

    DSN = session("conec")
	Set RS = Server.CreateObject("ADODB.Recordset")
    Set RSV = Server.CreateObject("ADODB.Recordset")
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open DSN
'response.write session("empn")

    strparam = session("empn")
    SQLv = "SELECT * FROM correlativo where nempresa =" & StrParam
	RSV.open SQLv, conn,3,3 
'response.write RSV.recordcount
    IF not rsv.eof then
       kac = rsv("c360") + 1
    else
       kac = 0
    end if

if kac > 0 then
    SQLed = "update correlativo set c360 ="&kac&" where nempresa =" & StrParam
    Conn.Execute SQLed
    SQLed=""
    vfe2 = year(date)&"-"&month(date)&"-"&day(date)
    vfe2 = year(vfecha)&"-"&month(vfecha)&"-"&day(vfecha)
    'Enca
    sqlbi = "INSERT INTO ichequeos (ncorre,fecha,servicio,piloto,unidad,observaciones) "
    sqlbi = sqlbi+"values("&kac&",'"& vfe2 & "'," & vtipos  & "," & vpiloto  & ",'" & vnunidad & "','"&vobs1 &"')"
  '  response.write sqlbi
    Conn.Execute sqlbi
   'p1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p1',"&vp1&",'"&vp1t&"')"
    Conn.Execute sqlbi
   'p2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p2',"&vp2&",'"&vp2t&"')"
    Conn.Execute sqlbi
   'p3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p3',"&vp3&",'"&vp3t&"')"
    Conn.Execute sqlbi
   'p4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p4',"&vp4&",'"&vp4t&"')"
    Conn.Execute sqlbi
   'p4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p5',"&vp5&",'"&vp5t&"')"
    Conn.Execute sqlbi
   'p5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'p6',"&vp6&",'"&vp6t&"')"
    Conn.Execute sqlbi
   'i1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i1',"&vi1&",'"&vi1t&"')"
    Conn.Execute sqlbi
   'i2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i2',"&vi2&",'"&vi2t&"')"
    Conn.Execute sqlbi
   'i3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i3',"&vi3&",'"&vi3t&"')"
    Conn.Execute sqlbi
   'i4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i4',"&vi4&",'"&vi4t&"')"
    Conn.Execute sqlbi
   'i5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i5',"&vi5&",'"&vi5t&"')"
    Conn.Execute sqlbi
   'i6
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i6',"&vi6&",'"&vi6t&"')"
    Conn.Execute sqlbi
   'i7
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i7',"&vi7&",'"&vi7t&"')"
    Conn.Execute sqlbi
   'i8
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'i8',"&vi8&",'"&vi8t&"')"
    Conn.Execute sqlbi
   'ld1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'ld1',"&vld1&",'"&vld1t&"')"
    Conn.Execute sqlbi
   'ld2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'ld2',"&vld2&",'"&vld2t&"')"
    Conn.Execute sqlbi
   'ld3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'ld3',"&vld3&",'"&vld3t&"')"
    Conn.Execute sqlbi
   'ld4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'ld4',"&vld4&",'"&vld4t&"')"
    Conn.Execute sqlbi
   'li1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'li1',"&vli1&",'"&vli1t&"')"
    Conn.Execute sqlbi
   'li2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'li2',"&vli2&",'"&vli2t&"')"
    Conn.Execute sqlbi
   'li3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'li3',"&vli3&",'"&vli3t&"')"
    Conn.Execute sqlbi
   'li4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'li4',"&vli4&",'"&vli4t&"')"
    Conn.Execute sqlbi
   'li5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'li5',"&vli5&",'"&vli5t&"')"
    Conn.Execute sqlbi
   'po1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po1',"&vpo1&",'"&vpo1t&"')"
    Conn.Execute sqlbi
   'po2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po2',"&vpo2&",'"&vpo2t&"')"
    Conn.Execute sqlbi
   'po3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po3',"&vpo3&",'"&vpo3t&"')"
    Conn.Execute sqlbi
   'po4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po4',"&vpo4&",'"&vpo4t&"')"
    Conn.Execute sqlbi
   'po5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po5',"&vpo5&",'"&vpo5t&"')"
    Conn.Execute sqlbi
    'po5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'po6',"&vpo6&",'"&vpo6t&"')"
    Conn.Execute sqlbi
   'es1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'es1',"&ves1&",'"&ves1t&"')"
    Conn.Execute sqlbi
   'es2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'es2',"&ves2&",'"&ves2t&"')"
    Conn.Execute sqlbi
   'es3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'es3',"&ves3&",'"&ves3t&"')"
    Conn.Execute sqlbi
   'do1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do1',"&vdo1&",'"&vdo1t&"')"
    Conn.Execute sqlbi
   'do2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do2',"&vdo2&",'"&vdo2t&"')"
    Conn.Execute sqlbi
   'do3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do3',"&vdo3&",'"&vdo3t&"')"
    Conn.Execute sqlbi
   'do4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do4',"&vdo4&",'"&vdo4t&"')"
    Conn.Execute sqlbi
   'do5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do5',"&vdo5&",'"&vdo5t&"')"
    Conn.Execute sqlbi
   'do6
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'do16',"&vdo6&",'"&vdo6t&"')"
    Conn.Execute sqlbi
   'he1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he1',"&vhe1&",'"&vhe1t&"')"
    Conn.Execute sqlbi
   'he2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he2',"&vhe2&",'"&vhe2t&"')"
    Conn.Execute sqlbi
   'he3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he3',"&vhe3&",'"&vhe3t&"')"
    Conn.Execute sqlbi
   'he4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he4',"&vhe4&",'"&vhe4t&"')"
    Conn.Execute sqlbi
   'he5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he5',"&vhe5&",'"&vhe5t&"')"
    Conn.Execute sqlbi
   'he6
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'he6',"&vhe6&",'"&vhe6t&"')"
    Conn.Execute sqlbi
   'od1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od1',"&vod1&",'"&vod1t&"')"
    Conn.Execute sqlbi
   'od2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od2',"&vod2&",'"&vod2t&"')"
    Conn.Execute sqlbi
   'od3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od3',"&vod3&",'"&vod3t&"')"
    Conn.Execute sqlbi
   'od4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od4',"&vod4&",'"&vod4t&"')"
    Conn.Execute sqlbi
   'od5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od5',"&vod5&",'"&vod5t&"')"
    Conn.Execute sqlbi
   'od6
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od6',"&vod6&",'"&vod6t&"')"
    Conn.Execute sqlbi
   'od7
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od7',"&vod7&",'"&vod7t&"')"
    Conn.Execute sqlbi
   'od8
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od8',"&vod8&",'"&vod8t&"')"
    Conn.Execute sqlbi
   'od9
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od9',"&vod9&",'"&vod9t&"')"
    Conn.Execute sqlbi
   'od10
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od10',"&vod10&",'"&vod10t&"')"
    Conn.Execute sqlbi
   'od11
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od11',"&vod11&",'"&vod11t&"')"
    Conn.Execute sqlbi
   'od12
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od12',"&vod12&",'"&vod12t&"')"
    Conn.Execute sqlbi
   'od13
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od13',"&vod13&",'"&vod13t&"')"
    Conn.Execute sqlbi
   'od14
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od14',"&vod14&",'"&vod14t&"')"
    Conn.Execute sqlbi
   'od15
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'od15',"&vod15&",'"&vod15t&"')"
    Conn.Execute sqlbi
   'pi1
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi1',"&vpi1&",'"&vpi1t&"')"
    Conn.Execute sqlbi
   'pi2
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi2',"&vpi2&",'"&vpi2t&"')"
    Conn.Execute sqlbi
   'pi3
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi3',"&vpi3&",'"&vpi3t&"')"
    Conn.Execute sqlbi
   'pi4
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi4',"&vpi4&",'"&vpi4t&"')"
    Conn.Execute sqlbi
   'pi5
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi5',"&vpi5&",'"&vpi5t&"')"
    Conn.Execute sqlbi
   'pi6
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi6',"&vpi6&",'"&vpi6t&"')"
    Conn.Execute sqlbi
   'pi7
    sqlbi = "INSERT INTO ichequeosd (ncorre,idpregunta,valor,descripcion) "
    sqlbi = sqlbi+"values("&kac&",'pi7',"&vpi7&",'"&vpi7t&"')"
    Conn.Execute sqlbi

    SQL = "select codigo,nparte1,id from vehiculos where id = " & vnunidad & ";"
    RS.Open SQL,Conn,3,1
    deunidad = RS("codigo")
    decorreo = RS("nparte1")
    RS.close
    response.write "unidad " & deunidad & "correo" & decorreo
if contadorfallas >0 then
 ''envio de correo
sendUrl="http://schemas.microsoft.com/cdo/configuration/sendusing"
smtpUrl="http://schemas.microsoft.com/cdo/configuration/smtpserver"
' Set the mail server configuration
Set objConfig=CreateObject("CDO.Configuration")
objConfig.Fields.Item(sendUrl)=2 ' cdoSendUsingPort
objConfig.Fields.Item(smtpUrl)="relay-hosting.secureserver.net"
objConfig.Fields.Update
end if
end if

   Set Conn = nothing
   response.Redirect "km360.asp?nuid=1"
 
		
%>