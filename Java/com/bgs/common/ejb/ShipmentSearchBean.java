package com.bgs.common.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.queryParser.MultiFieldQueryParser;

import com.bgs.common.domain.Shipment;
import com.bgs.common.ejb.interfaces.ShipmentSearch;
import com.bgs.fc.ejb.webos.EJBBase;

public @Stateless class ShipmentSearchBean extends EJBBase implements ShipmentSearch {

	@PersistenceContext(unitName="webos_entities")
	protected EntityManager em;

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}

	
	public List searchShipments(String userInput) throws Exception {
		
		org.hibernate.search.jpa.FullTextEntityManager  fullTextEntityManager = org.hibernate.search.jpa.Search.createFullTextEntityManager(em);	
		
		MultiFieldQueryParser parser = new MultiFieldQueryParser( new String[] {"pickupSiteId","deliverySiteId","consigneeName"}, new StandardAnalyzer());
		
		org.apache.lucene.search.Query query = parser.parse(userInput);;
		
		javax.persistence.Query fullTextQuery = fullTextEntityManager.createFullTextQuery(query, Shipment.class );
		
		return  fullTextQuery.getResultList();
	}
	
}
