<CFLOOP INDEX="thisImage" LIST="#FORM.sortList#" DELIMITERS=";">
	<CFSET thisImageID = ListLast(thisImage, ",")>
	<CFSET thisNewSort = ListFirst(thisImage, ",")>
	
	<CFIF thisNewSort is "X">
		<CFQUERY NAME="getImageBeforeDelete" DATASOURCE="#request.mctDSN#">
			UPDATE images
			SET sortorder = 'X'
			WHERE imageID = #thisImageID#
		</CFQUERY>
	<CFELSE>
		<CFQUERY NAME="UpdateImageSort" DATASOURCE="#request.mctDSN#">
			UPDATE images
			SET sortorder = '#Trim(thisNewSort)#'
			WHERE imageID = #thisImageID#
		</CFQUERY>
	</CFIF>
</CFLOOP>