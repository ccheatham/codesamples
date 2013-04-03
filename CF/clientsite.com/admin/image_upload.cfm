<!--- do the processing of upload stuff --->
<CFIF IsDefined("FORM.imagefile")>
	<CFIF Len(Trim(FORM.imagefile))>
		<CFFILE ACTION="UPLOAD" 
			FILEFIELD="imagefile" 
			DESTINATION="#FileUploadPath#"
			NAMECONFLICT="MAKEUNIQUE">
		<CFIF cffile.fileWasSaved>
			<CFTRANSACTION>
				<CFQUERY NAME="getCurrentMax" DATASOURCE="#request.mctDSN#">
					SELECT Max(sortorder) AS currentSortMax
					FROM images
					WHERE pubID = #url.pubID#
				</CFQUERY>
				<CFSET thissort = Val(getCurrentMax.currentSortMax) + 1>
				<CFQUERY NAME="insertImage" DATASOURCE="#request.mctDSN#">
					INSERT INTO images (pubID, imagefile, sortorder)
					VALUES (#url.pubID#, '#cffile.serverFile#', '#thissort#')
				</CFQUERY>
				<CFQUERY NAME="updatePub" DATASOURCE="#request.mctDSN#">
					UPDATE publications
					SET article_scan = 1
					WHERE pubID = #url.pubID#
				</CFQUERY>
			</CFTRANSACTION>
			
			<CFX_GIFGD ACTION="READ"
				FILE="#FileUploadPath##cffile.serverFile#">
				
			<CFIF IMG_WIDTH GT IMG_HEIGHT>
				<CFX_GIFGD ACTION="RESIZE"
					FILE="#FileUploadPath##cffile.serverFile#"
					OUTPUT="#FileUploadPath#thumbs\#cffile.serverFile#"
					X="#thumbSize#">
			<CFELSE>
				<CFX_GIFGD ACTION="RESIZE"
					FILE="#FileUploadPath##cffile.serverFile#"
					OUTPUT="#FileUploadPath#thumbs\#cffile.serverFile#"
					Y="#thumbSize#">
			</CFIF>
			
		</CFIF>
	</CFIF>
</CFIF>