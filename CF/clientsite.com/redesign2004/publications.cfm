<CFPARAM NAME = "URL.sort" DEFAULT = "pub_dt">
<CFPARAM NAME = "session.currentSort" DEFAULT = "pub_dt">
<CFPARAM NAME = "session.currentOrder" DEFAULT = "DESC">

<CFSET allowedSort = "pub_dt,magazine,publication_date,article_name,home,home_city,home_state,article_scan">
<CFSET sortOrders = "DESC,ASC,ASC,ASC,ASC,ASC,ASC,ASC">

<CFIF URL.sort EQ session.currentSort>
  <CFIF session.currentOrder IS "ASC">
    <CFSET session.currentOrder = "DESC">
  <CFELSE>
    <CFSET session.currentOrder = "DESC">
  </CFIF>
<CFELSE>
  <CFSET session.currentOrder = ListGetAt(sortOrders,ListFind(allowedSort,URL.sort,","))>
</CFIF>
<CFQUERY NAME="GetPubs" DATASOURCE="#request.mctDSN#" DBTYPE="ODBC">
	SELECT *
	FROM publications
	ORDER by 
	  <CFIF ListContains(allowedSort,URL.sort,",")>
	    #URL.sort# #session.currentOrder#
		 <CFIF URL.sort IS "home_state">, home_city ASC</CFIF>
		 <CFIF URL.sort IS "article_scan">, #session.currentSort# #session.currentOrder#</CFIF>
	  <CFELSE>
	    pub_dt ASC
	  </CFIF>
</CFQUERY>
<CFSET session.currentSort = URL.sort>

<HTML>
<HEAD>
 <META name="description" content="Described as 'nurturing, compassionate, soulful', McAlpine Tankersley's architecture, wedding historical precedence with modern living, strives to create 'The Inheritable House'.">
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <!-- LWT/KBK New Media for Mcalpine Tankersley Architecture -->
<link href="mct.css" type=text/css rel=stylesheet>
<link href="mct_pub.css" type=text/css rel=stylesheet>

  
  <TITLE>McAlpine Tankersley: Publications</TITLE>
</HEAD>

<BODY>
<CENTER>
  <TABLE BORDER="0" CELLPADDING="0" ALIGN="Center" width="100%">
    <TR>
      <TD><cfinclude template="header.cfm"></TD>
    </TR>
    <TR>
      <TD style="padding-top: 8px;"><cfinclude template="footer.cfm">
	  <TABLE CELLSPACING="0" CELLPADDING="4" ALIGN="center" class = "border" WIDTH="600">
<tr><td colspan = "6"><p class = "list"><span class = "title">Press Clippings: </span><br><br> A chronology of our periodical appearances. Click on a column heading to sort by that criteria. Note: The little book icon means you can view the published article, and you may sort on that as well!</p>
	</p></td></tr>
	 
	  <tr background="trans.gif"><td><A HREF = "publications.cfm?sort=article_scan"><img src="articleicon.gif" width="14" height="17" alt="article available?" border="0"></A></td>
	  	  <td><p class="nav"><b><A HREF = "publications.cfm?sort=magazine" class="stuff">Magazine</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=pub_dt" class="stuff">Publication Date</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=article_name" class="stuff">Article Name</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=home" class="stuff">Featured</A></b></p></td>
		  <td><p><b>City &amp; <A HREF = "publications.cfm?sort=home_state" class="stuff">State</A></b></p></td></tr>
	 <CFOUTPUT QUERY="GetPubs">
	 
	 
	  <tr <cfif #GetPubs.currentrow# mod 2 is 0> background="trans.gif"</cfif>>
	 <td> <CFIF article_scan><A HREF="gallery.cfm?pubID=#pubID#"><img src="articleicon.gif" width="14" height="17" alt="click for article" border="0"></a><cfelse>&nbsp;</cfif></td>
	<CFIF article_scan><td class = "list"> <span class="bold">
		<A HREF="gallery.cfm?pubID=#pubID#">#magazine#</A></span></td><td><span class="bold">#publication_date#</span></td><td><cfif #article_name# is not ""><span class="bold">"#article_name#"</span><cfelse>&nbsp;</cfif></td><td><CFIF #home# is not ""><span class="bold">#home#</span><cfelse>&nbsp;</cfif></td><td><CFIF #home_city# is not ""><span class="bold">#home_city#, #home_state#</span><cfelse>&nbsp;</cfif></td>
	<CFELSE><td>#magazine#</td><td>#publication_date#</td><td><cfif #article_name# is not "">"#article_name#"<cfelse>&nbsp;</cfif></td><td><CFIF #home# is not "">#home#<cfelse>&nbsp;</cfif></td><td><CFIF #home_city# is not "">#home_city#, #home_state#<cfelse>&nbsp;</cfif></td></cfif></tr>
	

     </cfoutput></table></td></tr>
    <TR>
      <TD>
      </TD>
    </TR>
	

	
	
    <TR>
      <TD>
	
	</TD>
    </TR>
  </TABLE>
</CENTER>
<cfinclude template="footer.cfm">
</BODY></HTML>
