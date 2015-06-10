<%
Dim ConnString, objConnection3, DatabaseLocation


function conectarsc(va7,varia7,varia8)
cerrarobj()
DSN = session("conec")
Set cn = Server.CreateObject("ADODB.Connection")
cn.Open DSN
if va7 = 1 then
    strSQL = "select * from ddocs where codigo = '" & varia7 & "' and id2 = " & varia8 & " order by id"
end if
if va7 = 2 then
    strSQL = "select * from checkd where codigo = '" & varia7 & "' and id2 = " & varia8 & " order by id"
end if
if va7 = 3 then
    strSQL = "select * from rdocsd where codigo = '" & varia7 & "' and id2 = " & varia8 & " order by id"
end if

Set objRs = Server.CreateObject("ADODB.Recordset")
objRS.Open strSQL, cn,1,2

end function

sub cerrarobj()
   'con.Close
   set cn = nothing
   set objRS = nothing
end sub

Sub OpenDataBase()
'ADO Connection Object
'The ADO Connection Object is used to create an open connection to a data source.
set objConnection3=Server.CreateObject("ADODB.Connection")
objConnection3.Provider="Microsoft.Jet.OLEDB.4.0"
objConnection3.Open DatabaseLocation
End Sub

'Creating Sub, To Close Database
'Creating this Sub is Not Necessary, You can use directly code this inside of this Function/Sub 
Sub CloseDataBase()
objConnection3.close 
End Sub

Sub servicios()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from rutas order by nombrerut",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
     if varia = 1 then	
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombrerut") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("nombrerut") & "</OPTION>")
   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub horarios(qho)
if qho < 1 then
   Response.Write("<OPTION selected value= 1>" & "00:00" & "</OPTION>")
end if
if qho < 2 then
Response.Write("<OPTION selected value= 2>" & "00:30" & "</OPTION>")
end if
if qho < 3 then
Response.Write("<OPTION selected value= 3>" & "01:00" & "</OPTION>")
end if
if qho < 4 then
Response.Write("<OPTION selected value= 4>" & "01:30" & "</OPTION>")
end if
if qho < 5 then
Response.Write("<OPTION selected value= 5>" & "02:00" & "</OPTION>")
end if
if qho < 6 then
Response.Write("<OPTION selected value= 6>" & "02:30" & "</OPTION>")
end if
if qho < 7 then
Response.Write("<OPTION selected value= 7>" & "03:00" & "</OPTION>")
end if
if qho < 8 then
Response.Write("<OPTION selected value= 8>" & "03:30" & "</OPTION>")
end if
if qho < 9 then
Response.Write("<OPTION selected value= 9>" & "04:00" & "</OPTION>")
end if
if qho < 10 then
Response.Write("<OPTION selected value= 10>" & "04:30" & "</OPTION>")
end if
if qho < 11 then
Response.Write("<OPTION selected value= 11>" & "05:00" & "</OPTION>")
end if
if qho < 12 then
Response.Write("<OPTION selected value= 12>" & "05:30" & "</OPTION>")
end if
if qho < 13 then
Response.Write("<OPTION selected value= 13>" & "06:00" & "</OPTION>")
end if
if qho < 14 then
Response.Write("<OPTION selected value= 14>" & "06:30" & "</OPTION>")
end if
if qho < 15 then
Response.Write("<OPTION selected value= 15>" & "07:00" & "</OPTION>")
end if
if qho < 16 then
Response.Write("<OPTION selected value= 16>" & "07:30" & "</OPTION>")
end if
if qho < 17 then
Response.Write("<OPTION selected value= 17>" & "08:00" & "</OPTION>")
end if
if qho < 18 then
Response.Write("<OPTION selected value= 18>" & "08:30" & "</OPTION>")
end if
if qho < 19 then
Response.Write("<OPTION selected value= 19>" & "09:00" & "</OPTION>")
end if
if qho < 20 then
Response.Write("<OPTION selected value= 20>" & "09:30" & "</OPTION>")
end if
if qho < 21 then
Response.Write("<OPTION selected value= 21>" & "10:00" & "</OPTION>")
end if
if qho < 22 then
Response.Write("<OPTION selected value= 22>" & "10:30" & "</OPTION>")
end if
if qho < 23 then
Response.Write("<OPTION selected value= 23>" & "11:00" & "</OPTION>")
end if
if qho < 24 then
Response.Write("<OPTION selected value= 24>" & "11:30" & "</OPTION>")
end if
if qho < 25 then
Response.Write("<OPTION selected value= 25>" & "12:00" & "</OPTION>")
end if
if qho < 26 then
Response.Write("<OPTION selected value= 26>" & "12:30" & "</OPTION>")
end if
if qho < 27 then
Response.Write("<OPTION selected value= 27>" & "13:00" & "</OPTION>")
end if
if qho < 28 then
Response.Write("<OPTION selected value= 28>" & "13:30" & "</OPTION>")
end if
if qho < 29 then
Response.Write("<OPTION selected value= 29>" & "14:00" & "</OPTION>")
end if
if qho < 30 then
Response.Write("<OPTION selected value= 30>" & "14:30" & "</OPTION>")
end if
if qho < 31 then
Response.Write("<OPTION selected value= 31>" & "15:00" & "</OPTION>")
end if
if qho < 32 then
Response.Write("<OPTION selected value= 32>" & "15:30" & "</OPTION>")
end if
if qho < 33 then
Response.Write("<OPTION selected value= 33>" & "16:00" & "</OPTION>")
end if
if qho < 34 then
Response.Write("<OPTION selected value= 34>" & "16:30" & "</OPTION>")
end if
if qho < 35 then
Response.Write("<OPTION selected value= 35>" & "17:00" & "</OPTION>")
end if
if qho < 36 then
Response.Write("<OPTION selected value= 36>" & "17:30" & "</OPTION>")
end if
if qho < 37 then
Response.Write("<OPTION selected value= 37>" & "18:00" & "</OPTION>")
end if
if qho < 38 then
Response.Write("<OPTION selected value= 38>" & "18:30" & "</OPTION>")
end if
if qho < 39 then
Response.Write("<OPTION selected value= 39>" & "19:00" & "</OPTION>")
end if
if qho < 40 then
Response.Write("<OPTION selected value= 40>" & "19:30" & "</OPTION>")
end if
if qho < 41 then
Response.Write("<OPTION selected value= 41>" & "20:00" & "</OPTION>")
end if
if qho < 42 then
Response.Write("<OPTION selected value= 42>" & "20:30" & "</OPTION>")
end if
if qho < 43 then
Response.Write("<OPTION selected value= 43>" & "21:00" & "</OPTION>")
end if
if qho < 44 then
Response.Write("<OPTION selected value= 44>" & "21:30" & "</OPTION>")
end if
if qho < 45 then
Response.Write("<OPTION selected value= 45>" & "22:00" & "</OPTION>")
end if
if qho < 46 then
Response.Write("<OPTION selected value= 46>" & "22:30" & "</OPTION>")
end if
if qho < 47 then
Response.Write("<OPTION selected value= 47>" & "23:00" & "</OPTION>")
end if
if qho < 48 then
Response.Write("<OPTION selected value= 48>" & "23:30" & "</OPTION>")
end if
End Sub

Sub horariosp()
if qho < 43 then
Response.Write("<OPTION selected value= 43>" & "21:00" & "</OPTION>")
end if
if qho < 45 then
Response.Write("<OPTION selected value= 45>" & "22:00" & "</OPTION>")
end if
End Sub

Sub horarios2()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from rutas order by nombrerut",Conn, 1,3
do while not Rs.eof
'   if rs("nombre") = dx2 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("nombrerut") & "</OPTION>")
'   else
'      Response.Write("<OPTION value= '" & rs("id") & "' >" & rs("nombrerut") & "</OPTION>")
'   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing

End Sub

Sub cajas1()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from user order by username",Conn, 1,3
Response.Write("<OPTION selected value=0>Todas</OPTION>")
do while not Rs.eof
'   if rs("nombre") = dx2 then
      Response.Write("<OPTION value= '" & rs("username") & "'>" & rs("username") & "</OPTION>")
'   else
'      Response.Write("<OPTION value= '" & rs("id") & "' >" & rs("nombrerut") & "</OPTION>")
'   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing

End Sub


Sub ddestinosf(ndes)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
idru = session("lugar")
Rs2.Open "SELECT * from destinos where id = " & ndes & " order by destino",Conn, 1,3
do while not Rs2.eof
''      if rs2("id") = ndes then
         Response.Write("<OPTION selected value= '" & rs2("id") &","& rs2("destino")& "'>" & rs2("destino") & "</OPTION>")
'      else
   '      Response.Write("<OPTION value= '" & rs2("id") &","& rs2("destino")& "'>" & rs2("destino") & "</OPTION>")
'      end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing
End Sub

Sub dbusf(nbuse)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.Open "SELECT * from buses order by codigob",Conn, 1,3
varia = 1
do while not Rs2.eof
   if rs2("id") = nbuse then
      Response.Write("<OPTION selected value= '" & rs2("id") & "'>" & rs2("codigob") & "</OPTION>")
   else
      Response.Write("<OPTION  value= '" & rs2("id") & "'>" & rs2("codigob") & "</OPTION>")
   end if
   rs2.movenext
loop
set Rs2 = nothing
set Conn = nothing

End Sub

Sub ddestinos()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
idru = session("lugar")
Rs.Open "SELECT * from destinos order by destino",Conn, 1,3
do while not Rs.eof
      Response.Write("<OPTION selected value= '" & rs("id") &","& rs("destino")& "'>" & rs("destino") & "</OPTION>")
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

sub chorarios(nruta)
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.Open "SELECT * from horarios where idruta = " & nruta & " order by idruta",Conn, 1,3
if not rs3.eof then
    if rs3("h1") = 1 then
       Response.Write("00:00<input type='checkbox' name='h1' checked >&nbsp;")
    else
       Response.Write("00:00<input type='checkbox' name='h1'  >&nbsp;")
    end if 
    if rs3("h2") = 1 then
       Response.Write("00:30<input type='checkbox' name='h2' checked >&nbsp;")
    else
       Response.Write("00:30<input type='checkbox' name='h2'  >&nbsp;")
    end if 
    if rs3("h3") = 1 then
       Response.Write("01:00<input type='checkbox' name='h3' checked >&nbsp;")
    else
       Response.Write("01:00<input type='checkbox' name='h3'  >&nbsp;")
    end if 
    if rs3("h4") = 1 then
       Response.Write("01:30<input type='checkbox' name='h4' checked >&nbsp;")
    else
       Response.Write("01:30<input type='checkbox' name='h4'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h5") = 1 then
       Response.Write("02:00<input type='checkbox' name='h5' checked >&nbsp;")
    else
       Response.Write("02:00<input type='checkbox' name='h5'  >&nbsp;")
    end if 
    if rs3("h6") = 1 then
       Response.Write("02:30<input type='checkbox' name='h6' checked >&nbsp;")
    else
       Response.Write("02:30<input type='checkbox' name='h6'  >&nbsp;")
    end if 
    if rs3("h7") = 1 then
       Response.Write("03:00<input type='checkbox' name='h7' checked >&nbsp;")
    else
       Response.Write("03:00<input type='checkbox' name='h7'  >&nbsp;")
    end if 
    if rs3("h8") = 1 then
       Response.Write("03:30<input type='checkbox' name='h8' checked >&nbsp;")
    else
       Response.Write("03:30<input type='checkbox' name='h8'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h9") = 1 then
       Response.Write("04:00<input type='checkbox' name='h9' checked >&nbsp;")
    else
       Response.Write("04:00<input type='checkbox' name='h9'  >&nbsp;")
    end if 
    if rs3("h10") = 1 then
       Response.Write("04:30<input type='checkbox' name='h10' checked >&nbsp;")
    else
       Response.Write("04:30<input type='checkbox' name='h10'  >&nbsp;")
    end if 
    if rs3("h11") = 1 then
       Response.Write("05:00<input type='checkbox' name='h11' checked >&nbsp;")
    else
       Response.Write("05:00<input type='checkbox' name='h11'  >&nbsp;")
    end if 
    if rs3("h12") = 1 then
       Response.Write("05:30<input type='checkbox' name='h12' checked >&nbsp;")
    else
       Response.Write("05:30<input type='checkbox' name='h12'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h13") = 1 then
       Response.Write("06:00<input type='checkbox' name='h13' checked >&nbsp;")
    else
       Response.Write("06:00<input type='checkbox' name='h13'  >&nbsp;")
    end if 
    if rs3("h14") = 1 then
       Response.Write("06:30<input type='checkbox' name='h14' checked >&nbsp;")
    else
       Response.Write("06:30<input type='checkbox' name='h14'  >&nbsp;")
    end if 
    if rs3("h15") = 1 then
       Response.Write("07:00<input type='checkbox' name='h15' checked >&nbsp;")
    else
       Response.Write("07:00<input type='checkbox' name='h15'  >&nbsp;")
    end if 
    if rs3("h16") = 1 then
       Response.Write("07:30<input type='checkbox' name='h16' checked >&nbsp;")
    else
       Response.Write("07:30<input type='checkbox' name='h16'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h17") = 1 then
       Response.Write("08:00<input type='checkbox' name='h17' checked >&nbsp;")
    else
       Response.Write("08:00<input type='checkbox' name='h17'  >&nbsp;")
    end if 
    if rs3("h18") = 1 then
       Response.Write("08:30<input type='checkbox' name='h18' checked >&nbsp;")
    else
       Response.Write("08:30<input type='checkbox' name='h18'  >&nbsp;")
    end if 
    if rs3("h19") = 1 then
       Response.Write("09:00<input type='checkbox' name='h19' checked >&nbsp;")
    else
       Response.Write("09:00<input type='checkbox' name='h19'  >&nbsp;")
    end if 
    if rs3("h20") = 1 then
       Response.Write("09:30<input type='checkbox' name='h20' checked >&nbsp;")
    else
       Response.Write("09:30<input type='checkbox' name='h20'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h21") = 1 then
       Response.Write("10:00<input type='checkbox' name='h21' checked >&nbsp;")
    else
       Response.Write("10:00<input type='checkbox' name='h21'  >&nbsp;")
    end if 
    if rs3("h22") = 1 then
       Response.Write("10:30<input type='checkbox' name='h22' checked >&nbsp;")
    else
       Response.Write("10:30<input type='checkbox' name='h22'  >&nbsp;")
    end if 
    if rs3("h23") = 1 then
       Response.Write("11:00<input type='checkbox' name='h23' checked >&nbsp;")
    else
       Response.Write("11:00<input type='checkbox' name='h23'  >&nbsp;")
    end if 
    if rs3("h24") = 1 then
       Response.Write("11:30<input type='checkbox' name='h24' checked >&nbsp;")
    else
       Response.Write("11:30<input type='checkbox' name='h24'  >&nbsp;")
    end if 
    Response.Write("<br>")
     if rs3("h25") = 1 then
       Response.Write("12:00<input type='checkbox' name='h25' checked >&nbsp;")
    else
       Response.Write("12:00<input type='checkbox' name='h25'  >&nbsp;")
    end if 
    if rs3("h26") = 1 then
       Response.Write("12:30<input type='checkbox' name='h26' checked >&nbsp;")
    else
       Response.Write("12:30<input type='checkbox' name='h26'  >&nbsp;")
    end if 
    if rs3("h27") = 1 then
       Response.Write("13:00<input type='checkbox' name='h27' checked >&nbsp;")
    else
       Response.Write("13:00<input type='checkbox' name='h27'  >&nbsp;")
    end if 
    if rs3("h28") = 1 then
       Response.Write("13:30<input type='checkbox' name='h28' checked >&nbsp;")
    else
       Response.Write("13:30<input type='checkbox' name='h28'  >&nbsp;")
    end if 
    Response.Write("<br>")
     if rs3("h29") = 1 then
       Response.Write("14:00<input type='checkbox' name='h29' checked >&nbsp;")
    else
       Response.Write("14:00<input type='checkbox' name='h29'  >&nbsp;")
    end if 
    if rs3("h30") = 1 then
       Response.Write("14:30<input type='checkbox' name='h30' checked >&nbsp;")
    else
       Response.Write("14:30<input type='checkbox' name='h30'  >&nbsp;")
    end if 
    if rs3("h31") = 1 then
       Response.Write("15:00<input type='checkbox' name='h31' checked >&nbsp;")
    else
       Response.Write("15:00<input type='checkbox' name='h31'  >&nbsp;")
    end if 
    if rs3("h32") = 1 then
       Response.Write("15:30<input type='checkbox' name='h32' checked >&nbsp;")
    else
       Response.Write("15:30<input type='checkbox' name='h32'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h33") = 1 then
       Response.Write("16:00<input type='checkbox' name='h33' checked >&nbsp;")
    else
       Response.Write("16:00<input type='checkbox' name='h33'  >&nbsp;")
    end if 
    if rs3("h34") = 1 then
       Response.Write("16:30<input type='checkbox' name='h34' checked >&nbsp;")
    else
       Response.Write("16:30<input type='checkbox' name='h34'  >&nbsp;")
    end if 
    if rs3("h35") = 1 then
       Response.Write("17:00<input type='checkbox' name='h35' checked >&nbsp;")
    else
       Response.Write("17:00<input type='checkbox' name='h35'  >&nbsp;")
    end if 
    if rs3("h36") = 1 then
       Response.Write("17:30<input type='checkbox' name='h36' checked >&nbsp;")
    else
       Response.Write("17:30<input type='checkbox' name='h36'  >&nbsp;")
    end if 
    Response.Write("<br>")
      if rs3("h37") = 1 then
       Response.Write("18:00<input type='checkbox' name='h37' checked >&nbsp;")
    else
       Response.Write("18:00<input type='checkbox' name='h37'  >&nbsp;")
    end if 
    if rs3("h38") = 1 then
       Response.Write("18:30<input type='checkbox' name='h38' checked >&nbsp;")
    else
       Response.Write("18:30<input type='checkbox' name='h38'  >&nbsp;")
    end if 
    if rs3("h39") = 1 then
       Response.Write("19:00<input type='checkbox' name='h39' checked >&nbsp;")
    else
       Response.Write("19:00<input type='checkbox' name='h39'  >&nbsp;")
    end if 
    if rs3("h40") = 1 then
       Response.Write("19:30<input type='checkbox' name='h40' checked >&nbsp;")
    else
       Response.Write("19:30<input type='checkbox' name='h40'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h41") = 1 then
       Response.Write("20:00<input type='checkbox' name='h41' checked >&nbsp;")
    else
       Response.Write("20:00<input type='checkbox' name='h41'  >&nbsp;")
    end if 
    if rs3("h42") = 1 then
       Response.Write("20:30<input type='checkbox' name='h42' checked >&nbsp;")
    else
       Response.Write("20:30<input type='checkbox' name='h42'  >&nbsp;")
    end if 
    if rs3("h43") = 1 then
       Response.Write("21:00<input type='checkbox' name='h43' checked >&nbsp;")
    else
       Response.Write("21:00<input type='checkbox' name='h43'  >&nbsp;")
    end if 
    if rs3("h44") = 1 then
       Response.Write("21:30<input type='checkbox' name='h44' checked >&nbsp;")
    else
       Response.Write("21:30<input type='checkbox' name='h44'  >&nbsp;")
    end if 
    Response.Write("<br>")
    if rs3("h45") = 1 then
       Response.Write("22:00<input type='checkbox' name='h45' checked >&nbsp;")
    else
       Response.Write("22:00<input type='checkbox' name='h45'  >&nbsp;")
    end if 
    if rs3("h46") = 1 then
       Response.Write("22:30<input type='checkbox' name='h46' checked >&nbsp;")
    else
       Response.Write("22:30<input type='checkbox' name='h46'  >&nbsp;")
    end if 
    if rs3("h47") = 1 then
       Response.Write("23:00<input type='checkbox' name='h47' checked >&nbsp;")
    else
       Response.Write("23:00<input type='checkbox' name='h47'  >&nbsp;")
    end if 
    if rs3("h48") = 1 then
       Response.Write("23:30<input type='checkbox' name='h48' checked >&nbsp;")
    else
       Response.Write("23:30<input type='checkbox' name='h48'  >&nbsp;")
    end if 
    Response.Write("<br>")

    
    
else

end if
end sub

Sub destinos()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
idru = session("lugar")
Rs.Open "SELECT * from rutas where salida = '" & idru & "' order by nombrerut",Conn, 1,3
do while not Rs.eof
'  if rs("id") <> session("lugar") then
   if isnull(rs("p1"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",1," & rs("pre1") &"'>" & rs("llegadan") &  "-" & rs("p1") &"</OPTION>")
   end if
   if isnull(rs("p2"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",2," & rs("pre2") &"'>" & rs("llegadan") & "-" & rs("p2") & "</OPTION>")
   end if
   if isnull(rs("p3"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",3," & rs("pre3") &"'>" & rs("llegadan") & "-" & rs("p3") & "</OPTION>")
   end if
   if isnull(rs("p4"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",4," & rs("pre4") &"'>" & rs("llegadan") & "-" & rs("p4") & "</OPTION>")
   end if 
   if isnull(rs("p5"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",5," & rs("pre5") &"'>" & rs("llegadan") & "-" & rs("p5") & "</OPTION>")
   end if
   if isnull(rs("p6"))= false then   
      Response.Write("<OPTION selected value= '" & rs("llegada") & ",6," & rs("pre6") &"'>" & rs("llegadan") & "-" & rs("p6") & "</OPTION>")
   end if
'  end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub lsalidas()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from destinos order by destino",Conn, 1,3
do while not Rs.eof
  if rs("id") = session("lugar") then
   Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("destino") & "</OPTION>")
  else
  ' Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("destino") & "</OPTION>")
  end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub lpaquete()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from tiposc order by tipo",Conn, 1,3
do while not Rs.eof
  if rs("tipo") = "Sobre" then
   Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("tipo") & "</OPTION>")
  else
   Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("tipo") & "</OPTION>")
  end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub lsalidas2()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from destinos order by destino",Conn, 1,3
do while not Rs.eof
  if rs("id") = session("lugar") then
   Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("destino") & "</OPTION>")
  else
   Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("destino") & "</OPTION>")
  end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
End Sub

Sub lservicios()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from servicios order by servicio",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
   if rs("idser")=2  then 
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("servicio") & "</OPTION>")
   else
      Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("servicio") & "</OPTION>")
'      Response.Write("<OPTION value= '" & rs("id") & "' >" & rs("nombrerut") & "</OPTION>")
   end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing

End Sub

Sub dbus()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from buses order by codigob",Conn, 1,3
varia = 1
do while not Rs.eof
'   if rs("nombre") = dx2 then
      Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("codigob") & "</OPTION>")
'      Response.Write("<OPTION value= '" & rs("id") & "' >" & rs("nombrerut") & "</OPTION>")
   rs.movenext
loop
set Rs = nothing
set Conn = nothing

End Sub

Sub lseguros()
Response.Write("<OPTION selected value= 3>" & "Q3" & "</OPTION>")
Response.Write("<OPTION value= 20>" & "Q20" & "</OPTION>")
Response.Write("<OPTION  value= 0>" & "No" & "</OPTION>")
End Sub

sub lnivel(kenivel)
if kenivel = 1 then
   Response.Write("<OPTION selected value= 1>" & "1" & "</OPTION>")
else
   Response.Write("<OPTION  value= 1>" & "1" & "</OPTION>")

end if
if kenivel = 2 then
   Response.Write("<OPTION selected value= 2>" & "2" & "</OPTION>")
else
   Response.Write("<OPTION value= 2>" & "2" & "</OPTION>")
end if
if kenivel = 3 then
   Response.Write("<OPTION selected value= 3>" & "3" & "</OPTION>")
else
   Response.Write("<OPTION  value= 3>" & "3" & "</OPTION>")
end if
end sub

Sub lsegurosp()
Response.Write("<OPTION selected value= 3>" & "Q3" & "</OPTION>")
Response.Write("<OPTION value= 20>" & "Q20" & "</OPTION>")
End Sub


'--------------------------------------------------------

sub cerrarcust()
'   rsCustomers.Close
   set cn = nothing
   set rsCustomers = nothing
end sub


Sub repo2()
currentPage = TRIM(Request("currentPage"))
if currentPage = "" then currentPage = 1
strConnectionString = "DSN=bolet"
strSQL = "SELECT * FROM detallerutas "
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open strConnectionString
rowcount=0
nutra = 0
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")
rs.pagesize=25
rs.Open strSQL, Conn ,1,2
ban=currentpage
if not rs.eof then
rs.AbsolutePage = cINT(ban)
Response.Write "<tr>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><border color=""#ffa500""><b><font color=""#FFFFFF"">Agencia</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Producto</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Bodega</font></b></td>"
Response.Write "<td width=""10%"" align=""left"" bgcolor=""#cc9900"" height=""19""><b><font color=""#FFFFFF"">Existencia</font></b></td>"
Response.Write "</tr>"
x = 0
do while not Rs.eof
   if rowCount = rs.PageSize then exit DO
      Response.Write "<tr>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("id")	 & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("salida") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("llegada") & "</td>"
      Response.Write "<td width=""10%"" height=""19"">" & rs("busesa") & "</td>"
      Response.Write "</tr>"
      rs.movenext
      rowcount= rowcount+1
loop
end if
end Sub

Sub rhorariot()
set Conn = Server.CreateObject("ADODB.Connection")
DSN = "DBQ=" & Server.Mappath("category.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
DSN = session("conec")
conn.Open DSN
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open "SELECT * from dhorarios order by id",Conn, 1,3
do while not Rs.eof
 if rs("id") = 43 or rs("id")=45 then
  if rs("id") = 43   then
   Response.Write("<OPTION selected value= '" & rs("id") & "'>" & rs("hora") & "</OPTION>")
  else
   Response.Write("<OPTION value= '" & rs("id") & "'>" & rs("hora") & "</OPTION>")
  end if
end if
   rs.movenext
loop
set Rs = nothing
set Conn = nothing
end Sub
%>


















