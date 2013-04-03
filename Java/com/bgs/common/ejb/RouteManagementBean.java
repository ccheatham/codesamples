package com.bgs.common.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.common.ejb.interfaces.RouteManagement;
import com.bgs.fc.ejb.webos.EJBBase;

public @Stateless class RouteManagementBean extends EJBBase implements RouteManagement {

	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return this.em;
	}

	public List getUSDomesticRoutes() {
		Query q = em.createQuery("select r from GarciaRoutes r where r.routeCode not in ('SPLIT ZIP','SPLIT ROUTE','MIXEDROUTE') order by r.routeCode ASC"); 
		return q.getResultList();
	}

	public List searchPostalCodes(String postalCode) {
		Query q = em.createQuery("select pc from PostalCode pc where pc.postalCode like '" + postalCode + "%' order by pc.postalCode ASC");
		
		return q.getResultList();
	}

}
