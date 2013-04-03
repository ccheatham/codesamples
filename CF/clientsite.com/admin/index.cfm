<!--- this is the traffic cop template --->
<CFPARAM NAME="action" DEFAULT=".">

<CFIF action is "add">
	<CFINCLUDE TEMPLATE="pub_doadd.cfm">
</CFIF>

<CFIF action is "update">
	<CFIF IsDefined("FORM.delete")>
		<CFSET action = "delete">
	<CFELSE>
		<CFINCLUDE TEMPLATE="pub_doupdate.cfm">
	</CFIF>
</CFIF>

<CFIF action is "delete">
	<CFINCLUDE TEMPLATE="pub_dodelete.cfm">
</CFIF>

<CFIF action is "upload">
	<CFINCLUDE TEMPLATE="image_upload.cfm">
	<CFSET action = "newupload">
</CFIF>

<CFIF action is "sort">
	<CFINCLUDE TEMPLATE="re-sort.cfm">
	<CFSET action = "newupload">
</CFIF>

<CFIF action is "newupload">
	<CFINCLUDE TEMPLATE="image_form.cfm">
	<CFABORT>
</CFIF>


<CFINCLUDE TEMPLATE="addEdit.cfm">