package com.bgs.common.ejb.interfaces;

import java.util.List;

import com.bgs.common.domain.Site;
import com.bgs.common.domain.SiteBase;
import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;


public interface SiteMgt extends EJBBaseInterface {
	
	public Site	getSiteByIP(String ip);
	
	public SiteBase getSiteBaseByIP(String ip);
	
	public Site getSiteBySiteCode(String siteCode);
	
	public SiteBase getSiteBaseBySiteCode(String siteCode);
	
	public List searchSites(Site siteObj);
	
	public String lookupSiteCode(String siteCodeIn);
	
}
