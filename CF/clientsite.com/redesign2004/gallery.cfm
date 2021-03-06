<CFQUERY NAME="GetPub" DATASOURCE="#request.mctDSN#" DBTYPE="ODBC">
	SELECT *
	FROM publications
	WHERE pubID=#URL.pubID#
</CFQUERY>
<CFQUERY NAME="GetPubImages" DATASOURCE="#request.mctDSN#" DBTYPE="ODBC">
	SELECT * 
	FROM images
	WHERE pubID = #url.pubID#
		AND sortorder <> 'X'
	ORDER BY sortorder
</CFQUERY>

<CFPARAM NAME="currentImage" DEFAULT="1">


<HTML>
<HEAD>
  <link href="mct_pub.css" type=text/css rel=stylesheet>
  <TITLE>McAlpine Tankersley Architecture: <cfoutput query="getpub">Viewing <cfif #article_name# is not "">�#article_name#�<cfelse>An Article</cfif> from the #publication_date# issue of #magazine#Publications</TITLE></cfoutput>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666">
<CENTER>
  <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center" width="100%">
    <TR>
      <TD><cfinclude template="header.cfm"></TD>
    </TR>
    <TR>
      <TD>
	  <CFOUTPUT>
	<p class="nav">�#GetPub.article_name#� from #GetPub.magazine# - #getpub.publication_date#</p></CFOUTPUT>
	  
	
	  <div align="center"><CFOUTPUT QUERY="GetPubImages">
	<CFIF CurrentRow is currentImage>
		<IMG SRC="#acmsURLStart#images/thumbs/#GetPubImages.imagefile[currentImage]#" BORDER="2">&nbsp;&nbsp;&nbsp;
	<CFELSE>
		<A HREF="gallery.cfm?pubID=#URL.pubID#&currentImage=#currentRow#"><IMG SRC="#acmsURLStart#images/thumbs/#GetPubImages.imagefile[CurrentRow]#" BORDER="0"></A>&nbsp;&nbsp;&nbsp;
	</CFIF>
	<CFSET doBR = CurrentRow MOD 5>
	<CFIF doBR IS 0>
		<BR>
	</CFIF>
</CFOUTPUT>
<p>Click an article thumbnail above to view that page<BR>
<a href="publications.cfm">Go Back to Publications List</a></p>
<!--- <BR>
or...
</div>
<CFOUTPUT>
	<CFIF currentImage GT 1>
		<CFSET backImage = currentImage - 1>
		<div align="center">[ <A HREF="gallery.cfm?pubID=#URL.pubID#&currentImage=#backImage#">&lt;- back</A> ]		</div>
	</CFIF>
	
	<CFIF currentImage LT GetPubImages.RecordCount>
		<CFSET nextImage = currentImage + 1>
<div align="center">		[ <A HREF="gallery.cfm?pubID=#URL.pubID#&currentImage=#nextImage#">next -&gt;</A> ]		</div>
	</CFIF>
</CFOUTPUT>
 --->
<CFPARAM NAME="currentImage" DEFAULT="1">

<CFOUTPUT>

<div align="center"><IMG SRC="#acmsURLStart#images/#GetPubImages.imagefile[currentImage]#"></div>

</CFOUTPUT>

<!--- <CFOUTPUT QUERY="GetPubImages">
	<CFIF CurrentRow is currentImage>
		[#imagefile#]
	<CFELSE>
		[<A HREF="gallery.cfm?pubID=#URL.pubID#&currentImage=#currentRow#">#imagefile#</A>]
	</CFIF>
</CFOUTPUT>
<BR>
or... --->
<cfinclude template="footer.cfm">
	  
	  </td></tr>
    <TR>
      <TD><P ALIGN=Center>
      </TD>
    </TR>
    <TR>
      <TD><P ALIGN=Right>
	
</TD>
    </TR>
  </TABLE>
</CENTER>
</BODY></HTML>






