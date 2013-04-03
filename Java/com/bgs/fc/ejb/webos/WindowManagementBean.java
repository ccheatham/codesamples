package com.bgs.fc.ejb.webos;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.fc.ejb.webos.interfaces.WindowManagement;
import com.bgs.fc.ejb.webos.interfaces.WindowManagementRemote;

public @Stateless class WindowManagementBean extends EJBBase implements WindowManagement, WindowManagementRemote {
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public List getWindows()
	{
		Query q = em.createQuery("select w from WebosWindow w");
		List ret = q.getResultList();
		return ret;
	}
}
