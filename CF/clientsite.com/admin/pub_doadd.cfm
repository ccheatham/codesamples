<CFPARAM NAME="article_scan" DEFAULT="0">
<CFQUERY NAME="InsterPub" DATASOURCE="#request.mctDSN#">
	Insert into publications(magazine, publication_date, pub_dt, article_name, home, home_city, home_state, article_scan)
	VALUES('#magazine#',
	'#publication_date#', 
	'#pub_dt#', 
	'#article_name#', 
	'#home#', 
	'#home_city#', 
	'#home_state#',
	'#article_scan#')
</CFQUERY>
