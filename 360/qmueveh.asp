<%

	StrParam = Request.form("vehID")
    strpara6 = request.form("uhid")
    response.write request.form
    if strparam <> "0" then
       response.Redirect "mueveh1.asp?vehID="&StrParam
    else
         response.Redirect "mueveh1.asp?vehID="&strpara6
    end if
%>

