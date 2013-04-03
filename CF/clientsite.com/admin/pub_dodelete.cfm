<!--- delete pub --->

<!--- get pub info --->
<CFQUERY NAME="GetPub" DATASOURCE="#request.mctDSN#">
	SELECT *
	FROM publications
	WHERE pubID = #pubID#
</CFQUERY>

<!--- mark pub Images for deletion --->
<!--- need a scheduled task to do the actual deletes... --->
<!--- cause IIS likes to hold the images --->
<CFQUERY NAME="MarkImages" DATASOURCE="#request.mctDSN#">
	UPDATE images
	SET sortorder = 'X'
	WHERE pubID = #pubID#
</CFQUERY>

<!--- delete pub --->
<CFQUERY NAME="delrecord" DATASOURCE="#request.mctDSN#">
	DELETE FROM publications
	WHERE pubID = #pubID#
</CFQUERY>
