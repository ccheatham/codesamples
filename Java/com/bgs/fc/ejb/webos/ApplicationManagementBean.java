package com.bgs.fc.ejb.webos;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.fc.domain.extended.WebosApplicationExtended;
import com.bgs.fc.domain.extended.WebosMenuItemExtended;
import com.bgs.fc.ejb.webos.interfaces.ApplicationManagement;
import com.bgs.fc.ejb.webos.interfaces.ApplicationManagementRemote;

public @Stateless class ApplicationManagementBean extends EJBBase implements ApplicationManagement, ApplicationManagementRemote {
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@Override
	public Object create(Object item)
	{
		WebosApplicationExtended retApp = (WebosApplicationExtended) super.create(item);
		
		//get next available hierarchy id
		Query q = em.createQuery("select max(mi.hierarchyId) as maxId from WebosMenuItem mi " +
				"where mi.action = 'app'");
		Long hierarchyId = (Long) q.getSingleResult();
		
		//create the menu item as well
		WebosMenuItemExtended newMenu = new WebosMenuItemExtended();
		newMenu.setFeApplication(retApp);
		newMenu.setLabel(retApp.getLabel());
		newMenu.setType("normal");
		newMenu.setAction("app");
		newMenu.setUseWindowIcon("Y");
		newMenu.setHierarchyId(hierarchyId+1);
		newMenu.create();
		
		return retApp;
	}
	
	public List getApplications(String type)
	{
		String query = "select a from "; 
		
		if (type.equals("normal"))
			query += "WebosApplication "; 
		else
			query += "WebosApplicationExtended ";
		
		query += "a";
		
		Query q = em.createQuery(query);
		List ret = q.getResultList();
		return ret;
	}
	
	public List getApplications()
	{
		Query q = em.createQuery("select a from WebosApplication a");
		List ret = q.getResultList();
		return ret;
	}
}
