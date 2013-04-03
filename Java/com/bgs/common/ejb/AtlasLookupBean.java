package com.bgs.common.ejb;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.jboss.ejb3.entity.HibernateSession;

import com.bgs.common.domain.Airport;
import com.bgs.common.domain.PostalCodeBase;
import com.bgs.common.ejb.interfaces.AtlasLookupLocal;
import com.bgs.common.ejb.interfaces.AtlasLookupRemote;
import com.bgs.fc.ejb.webos.EJBBase;

public @Stateless class AtlasLookupBean extends EJBBase implements AtlasLookupLocal, AtlasLookupRemote {

	@PersistenceContext(unitName="webos_entities")
	private EntityManager manager;
	
	public List getCountries(List args) {
		Query que = manager.createQuery("from Country c Order by c.description");		
		return que.getResultList();
		
		//System.out.println(args.size());			
	}

	public List getAirports()
	{
		Query que = manager.createQuery("select a from Airport a where a.countryCode = 'US' order by a.airportCode");
		return que.getResultList();
	}

	public List searchAirports(Airport airport){

		HibernateSession hs = (HibernateSession)manager;
		org.hibernate.Session session = hs.getHibernateSession();
		
		Criteria crit = session.createCriteria(Airport.class);
		Example search = Example.create(airport);
		
		search.excludeZeroes();
		search.enableLike();
		crit.add(search);
	
		crit.addOrder(Order.asc("city") );				
		return crit.list();
	}	
	
	public List searchPostalCodes(PostalCodeBase postalCode){

		HibernateSession hs = (HibernateSession)manager;
		org.hibernate.Session session = hs.getHibernateSession();
		
		Criteria crit = session.createCriteria(PostalCodeBase.class);
		Example search = Example.create(postalCode);
		
		search.excludeZeroes();
		search.enableLike();
		crit.add(search);
	
		crit.addOrder(Order.asc("city") );				
		return crit.list();
	}
	
	@SuppressWarnings("unchecked")
	public List findPostalCode(String postalCode){
		PostalCodeBase pc = manager.find(PostalCodeBase.class, postalCode);
		
		List<PostalCodeBase> postalCodeList = new ArrayList();
		postalCodeList.add(pc);
		return postalCodeList;
	}

	@Override
	protected EntityManager getEntityManager() {
		return this.manager;
	}
	
}
