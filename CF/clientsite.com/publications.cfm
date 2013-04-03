<CFPARAM NAME = "URL.sort" DEFAULT = "pub_dt">
<CFPARAM NAME = "session.currentSort" DEFAULT = "pub_dt">
<CFPARAM NAME = "session.currentOrder" DEFAULT = "DESC">

<CFSET allowedSort = "pub_dt,magazine,publication_date,article_name,home,home_city,home_state,article_scan">
<CFSET sortOrders = "DESC,ASC,ASC,ASC,ASC,ASC,ASC,ASC">

<CFIF URL.sort EQ session.currentSort>
  <CFIF session.currentOrder IS "ASC">
    <CFSET session.currentOrder = "DESC">
  <CFELSE>
    <CFSET session.currentOrder = "ASC">
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
	    pub_dt DESC
	  </CFIF>
</CFQUERY>
<CFSET session.currentSort = URL.sort>

<HTML>
<HEAD>
 <META name="description" content="Described as 'nurturing, compassionate, soulful', McAlpine Tankersley's architecture, wedding historical precedence with modern living, strives to create 'The Inheritable House'.">
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <!-- LWT/KBK New Media for Mcalpine Tankersley Architecture -->

  <STYLE type="text/css"><!--
A.roll:hover {color: 666666;}
A.roll:visited {color: 663300;}
A.roll:visited:hover {color: 663300;}

A:hover {color: 666666;}
TABLE {font-family: <img src="articleicon.gif" border="0" alt="">times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
        color: 333333;
        }

P {font-family: book antiqua, times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
        color: 333333;
        }
.bold {font-family: book antiqua, times new roman, times, arial, helvetica, sans-serif; 
        font-size: 10pt;        
        text-indent: 0em;
        color: 333333;
		font-weight: bold
        }		

P.nav {font-family: times new roman, times, arial, helvetica, sans-serif;
        font-size: 10pt;
        text-indent: 0em;
        text-align: center;
       }

--></STYLE>
  <TITLE>McAlpine Tankersley: Publications</TITLE>
</HEAD>

<BODY BGCOLOR="#cccc99" TEXT="#333333" topmargin="0" marginheight="0" link="#663300"
vlink="#666666">
<CENTER>
  <TABLE BORDER="0" CELLPADDING="2" ALIGN="Center">
    <TR>
      <TD><P ALIGN=Center>
	<IMG height=40 src="McT_with_ribbon.gif" width=517><BR>
	<IMG SRC="navbar.gif" WIDTH="515" HEIGHT="45" BORDER="0" USEMAP="#navbar"></TD>
    </TR>
    <TR>
      <TD><TABLE BORDER="0" CELLSPACING="0" CELLPADDING="4" ALIGN="center" WIDTH="100%">
	  <tr><td><A HREF = "publications.cfm?sort=article_scan"><img src="articleicon.gif" width="14" height="17" alt="article available?" border="0"></A></td>
	  	  <td><p><b><A HREF = "publications.cfm?sort=magazine">Magazine</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=pub_dt">Publication Date</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=article_name">Article Name</A></b></p></td>
		  <td><p><b><A HREF = "publications.cfm?sort=home">Featured</A></b></p></td>
		  <td><p><b>Home City &amp; <A HREF = "publications.cfm?sort=home_state">State</A></b></p></td></tr>
	 <CFOUTPUT QUERY="GetPubs">
	 
	 
	  <tr <cfif #GetPubs.currentrow# mod 2 is 0> bgcolor="##e9e9c8"</cfif>>
	 <td> <CFIF article_scan><A HREF="gallery.cfm?pubID=#pubID#"><img src="articleicon.gif" width="14" height="17" alt="click for article" border="0"></a><cfelse>&nbsp;</cfif></td>
	<CFIF article_scan><td> <span class="bold">
		<A HREF="gallery.cfm?pubID=#pubID#">#magazine#</A></span></td><td><span class="bold">#publication_date#</span></td><td><cfif #article_name# is not ""><span class="bold">“#article_name#”</span><cfelse>&nbsp;</cfif></td><td><CFIF #home# is not ""><span class="bold">#home#</span><cfelse>&nbsp;</cfif></td><td><CFIF #home_city# is not ""><span class="bold">#home_city#, #home_state#</span><cfelse>&nbsp;</cfif></td>
	<CFELSE><td>#magazine#</td><td>#publication_date#</td><td><cfif #article_name# is not "">“#article_name#”<cfelse>&nbsp;</cfif></td><td><CFIF #home# is not "">#home#<cfelse>&nbsp;</cfif></td><td><CFIF #home_city# is not "">#home_city#, #home_state#<cfelse>&nbsp;</cfif></td></cfif></tr>
	

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
<MAP NAME="navbar">
<AREA SHAPE=RECT COORDS="7,4,77,21" HREF="about_us.html" onclick="openWindow(this,'aboutus')">
<AREA SHAPE=RECT COORDS="93,4,133,18" HREF="news.html" onclick="openWindow(this,'news')">
<AREA SHAPE=RECT COORDS="150,6,246,19" HREF="publications.cfm" onclick="openWindow(this,'publications')">
<AREA SHAPE=RECT COORDS="260,5,345,18" HREF="contact_us.cfm" onclick="openWindow(this,'contact')">
<AREA SHAPE=RECT COORDS="363,6,508,20" HREF="about_this_site.html" onclick="openWindow(this,'about')">
<AREA SHAPE=RECT COORDS="3,25,251,35" HREF="http://www.mcalpineboothferrier.com" target="blank">
<AREA SHAPE=RECT COORDS="269,24,406,36" HREF="http://www.mcalpinefurniture.com" target="blank">
<AREA SHAPE=RECT COORDS="424,25,513,36" HREF="http://www.adantiquity.com" target="blank">
</MAP>
</BODY></HTML>
