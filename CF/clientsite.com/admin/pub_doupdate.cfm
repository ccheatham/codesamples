<CFQUERY NAME="UpdatePub" DATASOURCE="#request.mctDSN#">
	UPDATE publications
	SET magazine='#magazine#',
		publication_date='#publication_date#', 
		pub_dt='#pub_dt#', 
		article_name='#article_name#', 
		home='#home#', 
		home_city='#home_city#', 
		home_state='#home_state#',
		article_scan='#article_scan#',
		portfolioPosition=#form.portfolioPosition#
	Where pubID=#pubID#
</CFQUERY>
<cflocation url="addedit.cfm">