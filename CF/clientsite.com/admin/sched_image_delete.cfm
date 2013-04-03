<CFQUERY NAME="GetImagesToDelete" DATASOURCE="#request.mctDSN#">
	SELECT *
	FROM images
	WHERE sortorder = 'X'
</CFQUERY>

<CFLOOP QUERY="GetImagesToDelete">
<!--- check to see if the imagename is still in use --->

<!--- try to delete the image if it's not in use --->

<!--- delete the record if file delete went ok --->

</CFLOOP>
