package com.bgs.common.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jboss.ejb3.entity.HibernateSession;

import com.bgs.common.domain.Site;
import com.bgs.common.domain.SiteBase;
import com.bgs.common.ejb.interfaces.SiteMgtLocal;
import com.bgs.common.ejb.interfaces.SiteMgtRemote;
import com.bgs.fc.ejb.webos.EJBBase;

public @Stateless class SiteMgtBean extends EJBBase implements SiteMgtLocal, SiteMgtRemote {

	@PersistenceContext(unitName="webos_entities")
	private EntityManager manager;
	
	//Obtain a data source connection.
	//@Resource(mappedName="java:ATLAS")
	//private DataSource ds;
		
	public List searchSites(Site siteObj){
		if (siteObj.getCity() != null)
		{
			siteObj.setCity(siteObj.getCity() + "%");
		}
		
		String ls_siteCode = null;
		
		if (siteObj.getSiteCode() != null)
		{
			ls_siteCode = siteObj.getSiteCode();
			siteObj.setSiteCode(null);
		}
		
		HibernateSession hs = (HibernateSession)manager;
		org.hibernate.Session session = hs.getHibernateSession();
		
		Criteria crit = session.createCriteria(Site.class);
		Example search = Example.create(siteObj);
		
		search.excludeZeroes();
		search.enableLike();
		crit.add(search);
		
		if ( ls_siteCode != null)
		{
			Criterion sitecode = Restrictions.like("siteCode", ls_siteCode + "%"); 
			Criterion branchid	= Restrictions.like("gaBranchCode",ls_siteCode + "%" );
			
			LogicalExpression orExp = Restrictions.or(sitecode, branchid);
			crit.add(orExp);
		}
		
		crit.addOrder(Order.asc("city") );				
		return crit.list();
	}
	
	public Site getSiteByIP(String ip) {		
		Query que = manager.createQuery("from Site s where s.garciaIp = :ip");
		que.setParameter("ip", ip);		
		Site siteObj = (Site) que.getSingleResult();		
		return siteObj;		
	}

	public SiteBase getSiteBaseByIP(String ip) {
		Query que = manager.createQuery("from SiteBase s where s.garciaIp = :ip");
		que.setParameter("ip", ip);		
		SiteBase siteObj = (SiteBase) que.getSingleResult();		
		return siteObj;		
	}

	public SiteBase getSiteBaseBySiteCode(String siteCode) {
		String sql;
		if (siteCode.toUpperCase().charAt(0) == 'B')
			sql = "from SiteBase s where s.gaBranchCode = :code";
		else
			sql = "from SiteBase s where s.siteCode = :code";
		
		Query que = manager.createQuery(sql);
		que.setParameter("code", siteCode);
		SiteBase siteObj;
		
		try
		{
			siteObj = (SiteBase) que.getSingleResult();
		}
		catch (Exception e)
		{
			return null;
		}
		
		return siteObj;
	}

	public Site getSiteBySiteCode(String siteCode) {
		String sql;
		if (siteCode.toUpperCase().charAt(0) == 'B')
			sql = "from SiteBase s where s.gaBranchCode = :code";
		else
			sql = "from SiteBase s where s.siteCode = :code";
		
		Query que = manager.createQuery(sql);
		que.setParameter("code", siteCode);
		Site siteObj;
		
		try
		{
			siteObj = (Site) que.getSingleResult();
		}
		catch (Exception e)
		{
			return null;
		}
		
		return siteObj;
	}

	public String lookupSiteCode(String siteCodeIn) {
		//check for branch code
		if (siteCodeIn != null && siteCodeIn.toUpperCase().contains("B"))
		{
			SiteBase siteBase = this.getSiteBaseBySiteCode(siteCodeIn);
			if (siteBase != null)
				return siteBase.getSiteCode();
			else
				return siteCodeIn;
		}
		
		return siteCodeIn;
	}

	@Override
	protected EntityManager getEntityManager() {
		return this.manager;
	}

}
