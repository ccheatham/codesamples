package com.bgs.common.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.bgs.common.ejb.interfaces.ShipmentItemMgtLocal;
import com.bgs.common.ejb.interfaces.ShipmentItemMgtRemote;
import com.bgs.fc.ejb.webos.EJBBase;

public @Stateless class ShipmentItemMgtBean 
	extends EJBBase 
	implements ShipmentItemMgtLocal,ShipmentItemMgtRemote {

	@PersistenceContext(unitName="webos_entities")
	protected EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

}
