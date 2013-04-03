package com.bgs.fc.ejb.webos;

import java.util.HashMap;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.fc.domain.WebosApplication;
import com.bgs.fc.domain.WebosWindow;
import com.bgs.fc.ejb.webos.interfaces.WebosUtilities;
import com.bgs.fc.ejb.webos.interfaces.WebosUtilitiesRemote;
import com.bgs.fc.mappedsuperclass.WindowFactory;

public @Stateless class WebosUtilitiesBean extends EJBBase implements WebosUtilities, WebosUtilitiesRemote {
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	public HashMap<String, Object> getWebosCacheData()
	{
		HashMap<String, Object> ret = new HashMap<String, Object>();
		
		//use this method to load generic WebOS Data to cache at client
		
		//get parameter types
		Query q = em.createQuery("select pt from ParameterType pt");
		List items = q.getResultList();
		
		ret.put("parameterTypes", items);
		
		return ret;
	}
	
	public WindowFactory getWindowFactory(String windowName, WebosApplication application)
	{
		Query query = em.createQuery("select w from WebosWindow w where w.handle = :handle");
		query.setParameter("handle", windowName);
		
		try
		{
			WebosWindow w = (WebosWindow) query.getSingleResult();
			
			em.clear();
			
			WindowFactory wf = new WindowFactory();
			wf.setAction("load");
			wf.setFeApplication(application);
			wf.setWebosWindow(w);
			wf.setLabel(w.getLabel());
			
			return wf;
		}
		catch (Exception e)
		{
			return null;
		}
	}
	
	public WindowFactory getWindowFactory(Long id, WebosApplication application)
	{
		WebosWindow w = em.find(WebosWindow.class, id);
		
		if (w != null)
		{
			em.clear();
			
			WindowFactory wf = new WindowFactory();
			wf.setAction("load");
			wf.setFeApplication(application);
			wf.setWebosWindow(w);
			wf.setLabel(w.getLabel());
			
			return wf;
		}
		else
			return null;
	}
}
