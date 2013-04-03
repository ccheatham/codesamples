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
  <STYLE type="text/css"><!--
A.roll:hover {color: 666666;}
A.roll:visited {color: 663300;}
A.roll:visited:hover {color: 663300;}

A:hover {color: 666666;}
TABLE {font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
        color: 333333;
        }

P {font-family: times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
       
        }

P.nav {font-family: times new roman, times, arial, helvetica, sans-serif;
        font-size: 10pt;
        text-indent: 0em;
        text-align: center;
		font-weight: bold;
       }

--></STYLE>
  <TITLE>McAlpine Tankersley Architecture: <cfoutput query="getpub">Viewing <cfif #article_name# is not "">“#article_name#”<cfelse>An Article</cfif> from the #publication_date# issue of #magazine#Publications</TITLE></cfoutput>
</HEAD>
<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666">
<CENTER>
  <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center" width="100%">
    <TR>
      <TD><P ALIGN=Center>
	<IMG height=40 src="McT_with_ribbon.gif" width=517></TD>
    </TR>
    <TR>
      <TD>
	  <CFOUTPUT>
	<p class="nav">“#GetPub.article_name#” from #GetPub.magazine# - #getpub.publication_date#</p></CFOUTPUT>
	  
	
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
<BR>
	  
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






