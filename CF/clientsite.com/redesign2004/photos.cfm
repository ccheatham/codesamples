<cfquery name="getPortfolio" datasource="#request.mctDSN#">
	select *
	from publications
	where portfolioPosition > 0
	order by portfolioPosition desc
</cfquery>

<HTML>
<HEAD>
  <META name="description" content="Described as 'nurturing, compassionate, soulful', McAlpine Tankersley's architecture, wedding historical precedence with modern living, strives to create 'The Inheritable House'.">
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <!-- Created for McAlpine Tankersley -->
  <SCRIPT language = "JavaScript">

<!--

var x = 0;
function ScrollRight(dist) {
        if (x < 1605) {
        scrollEnd = x + dist;
        x = x + 20;
         ScrollRight2();
 }
}

function ScrollRight2() {
        if (x < scrollEnd) {
                scroll(x,0);
                x = x + 20;
                setTimeout('ScrollRight2()', 75);
        }
        else {
                x = scrollEnd;
        }
}

function ScrollLeft(dist2) {
        x = dist2
        if (x > 0) {
         scrollEnd = x - dist2;
         x = x - 15;
         ScrollLeft2();
 }
} 

function ScrollLeft2() {
        if (x > scrollEnd) {
                scroll(x,0);
                x = x - 15;
                setTimeout('ScrollLeft2()', 1);
        }
        else {
                x = scrollEnd;
        }
}
//-->

</SCRIPT>




<SCRIPT language = "JavaScript">

<!--
             
    if (document.images)  {
				//cfloop to create javascript dynamically
				<cfloop query="getPortfolio">
					<cfoutput>
						graphic#getPortfolio.portfolioPosition# = new Image();
						graphic#getPortfolio.portfolioPosition#.src = "#getPortfolio.portfolioPosition#_off.jpg";
						graphic#getPortfolio.portfolioPosition#on = new Image();
						graphic#getPortfolio.portfolioPosition#on.src = "#getPortfolio.portfolioPosition#_on.jpg";
					</cfoutput>
				</cfloop>
				    
                      }
                      function imageChange(imageID,imageName) { 

                      {
                      document.images[imageID].src = eval(imageName + ".src");
                     
                      }

                      }


                      
					 
//-->

</SCRIPT>
  <SCRIPT LANGUAGE="JavaScript"> 
  <!--
  function openWindow(myLink,windowName)
  {
  if(! window.focus)return;
  var myWin=window.open("",windowName,"height=450,width=420,scrollbars=no,resizable=no,dependent=yes");
  myWin.focus();
  myLink.target=windowName;
  }
  //-->
  </SCRIPT>
  <META name="keywords" content="McAlpine Tankersley Architecture, McAlpine Tankersley, Bobby McAlpine, Robert Frank McAlpine, Greg Tankersley, Residential Architects, Southern Architects, Southern Residential Architects, House Designs, Southern House Designs, House Plans">
  <TITLE>McAlpine/Tankersley</TITLE>
  
  <link href="mct.css" type=text/css rel=stylesheet>
<style type="text/css">
body {margin: 0; padding: 0;
		background: #CCCCBB;
		background-repeat: no-repeat;
		background-position: center center;
		background-attachment: fixed;}
		
.border {border: 1px solid #8E8E87;}	
</style>
</HEAD>
<BODY BGCOLOR="#CCCCBB" TEXT="#000000" LINK="#7f7f7f">
<CENTER>
  <TABLE CELLSPACING="0" border="0" CELLPADDING="0" ALIGN="center" width="1605" class="border">
    <TR>
      <TD><div align= "CENTER"><br>
	  <TABLE BORDER CELLSPACING="0" border="0" CELLPADDING="0" ALIGN="Center"  class="border" width="1605">
	    <TR>
		<cfloop query="getPortfolio">		
			<cfoutput>
				<TD>
					<A HREF="portfolioPopUp.cfm?architectureId=#pubid#" onclick="openWindow(this,'#getPortfolio.portfolioPosition#')" onMouseOver="imageChange('ImageID#getPortfolio.portfolioPosition#','graphic#getPortfolio.portfolioPosition#on')"
					onMouseOut="imageChange('ImageID#getPortfolio.portfolioPosition#','graphic#getPortfolio.portfolioPosition#')"><IMG SRC="#getPortfolio.portfolioPosition#_off.jpg" name="ImageID#getPortfolio.portfolioPosition#"
					WIDTH="75" HEIGHT="75" BORDER="0"></A>
				</TD>
			</cfoutput>
		</cfloop>
	    </TR>
	  </TABLE>
	</div>

	<div align= "CENTER">
	  <TABLE width="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" ALIGN="Center" background="trans.gif">
	    <TR>
	      <TD><A href="JavaScript:ScrollRight(395)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='View More';return true"><IMG SRC="fwd.gif"
		    WIDTH="22" HEIGHT="25" border="0"></A></td>
			<TD><A href="JavaScript:ScrollRight(595)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='View More';return true"><IMG SRC="fwd.gif"
		    WIDTH="22" HEIGHT="25" border="0"></A></td>
	
	<TD><A href="JavaScript:ScrollRight(795)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='View More';return true"><IMG SRC="fwd.gif"
		    WIDTH="22" HEIGHT="25" border="0"></A></td>
		<td><A href="JavaScript:ScrollRight(995)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='View More';return true"><IMG SRC="fwd.gif"
		    WIDTH="22" HEIGHT="25" border="0"></A></td>
		<td><A href="JavaScript:ScrollRight(1095)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='View More';return true"><IMG SRC="fwd.gif"
		    WIDTH="22" HEIGHT="25" border="0"></A></td>
		<td><A href="JavaScript:ScrollLeft(1295)" onmouseout="window.status=''; return true"
		    onmouseover="window.status='Go back';return true"><IMG SRC="back.gif"
		    WIDTH="22" HEIGHT="25" BORDER="0"></A></TD>
	    </TR>
	  </TABLE>
	</div>
      </TD>
    </TR>
  </TABLE>
</CENTER>
</BODY></HTML>
