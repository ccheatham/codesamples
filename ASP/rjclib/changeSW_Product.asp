<%@ Language=VBScript %>
<%
ProductID		= Request.Form("ProductID")
ProductName		= Request.Form("ProductName")
Category		= Request.Form("Category")
Manufacturer	= Request.Form("Manufacturer")
Media			= Request.Form("Media")
Copies			= Request.Form("Copies")
CopiesAvailable = Request.Form("CopiesAvailable")
OldCopies       = Request.Form("OldCopies")

CopiesAvailable = CInt(CopiesAvailable)
OldCopies       = CInt(OldCopies)
Copies          = CInt(Copies)

AddedCopies     = Copies - OldCopies 

CopiesAvail     = AddedCopies + CopiesAvailable
%>
<!--#INCLUDE FILE ="incDE.asp"-->
<%objDe.spChangeSW_Product ProductID,ProductName,Category,Manufacturer,Media,Copies,CopiesAvail%>
<%Response.Redirect("main.asp")%>