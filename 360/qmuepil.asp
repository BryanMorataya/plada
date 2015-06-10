<%

	StrParam = Request.form("vehID")
    strpara6 = request.form("uhid")
    response.write request.form
    if strparam <> "0" then
       response.Redirect "muepil1.asp?vehID="&StrParam
    else
      if strpara6 >0 then
         response.Redirect "muepil1.asp?vehID="&strpara6
      else
         response.Redirect "bpilo.asp"
      end if
    end if
%>

