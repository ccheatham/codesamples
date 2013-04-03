package com.bgs.fc.ejb.webos;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.fc.ejb.webos.interfaces.MenuItemManagement;
import com.bgs.fc.ejb.webos.interfaces.MenuItemManagementRemote;

public @Stateless class MenuItemManagementBean extends EJBBase implements MenuItemManagement, MenuItemManagementRemote {
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public List getMenuItems()
	{
		Query q = em.createQuery("select m from WebosMenuItemExtended m where m.action is not 'app' " +
				"order by m.feApplication.id asc, m.parent.id asc, m.hierarchyId asc");
		List ret = q.getResultList();
		return ret;
	}
	
	public List getMenuItems(String type)
	{
		String query = "select m from "; 
		
		if (type.equals("normal"))
			query += "WebosMenuItem "; 
		else
			query += "WebosMenuItemExtended ";
		
		query += "m where m.action not in ('load','separator') " +
			"order by m.feApplication.id asc, m.parent.id asc, m.hierarchyId asc";
		
		Query q = em.createQuery(query);
		List ret = q.getResultList();
		return ret;
	}
	
	public List getMenuItems(String type, Long filterApplicationId)
	{
		String query = "select m from "; 
		
		if (type.equals("normal"))
			query += "WebosMenuItem "; 
		else
			query += "WebosMenuItemExtended ";
		
		query += "m where m.action not in ('load','separator') " +
			"and m.feApplication.id = :appId " +
			"order by m.parent.id asc, m.hierarchyId asc";
		
		Query q = em.createQuery(query);
		q.setParameter("appId", filterApplicationId);
		List ret = q.getResultList();
		return ret;
	}
}
