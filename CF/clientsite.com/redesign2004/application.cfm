<CFAPPLICATION NAME = "mcalpineTank" APPLICATIONTIMEOUT = "#CreateTimeSpan(2,0,0,0)#"
	SESSIONMANAGEMENT = "YES" SESSIONTIMEOUT = "#CreateTimeSpan(0,0,30,0)#">
<CFPARAM name="FileUploadPath" default="d:\inetpub\root.39\htdocs\images\">
<CFPARAM name="acmsURLStart" default="http://www.mcalpinetankersley.com/">
<CFPARAM name="thumbSize" default="100">
<CFSET request.mctDSN = "mcalpine"> 
<cfset request.portfolioImagesDir = "../redesign2004/">