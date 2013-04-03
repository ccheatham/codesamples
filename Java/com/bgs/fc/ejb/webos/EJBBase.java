package com.bgs.fc.ejb.webos;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.transform.DistinctRootEntityResultTransformer;
import org.jboss.ejb3.entity.HibernateSession;

import com.bgs.fc.mappedsuperclass.AtlasBase;

abstract public class EJBBase {
	public boolean initializeDestinationsForFlex()
	{
		//this function is called as a cludge from Flex because of the overritten destination problem
		return true;
	}
	
	public List searchByEntity(Object entity, boolean excludeZeros, String orderBy, boolean removeDuplicates, String[] excludeProps)
	{
		HibernateSession hs = (HibernateSession)this.getEntityManager();
		org.hibernate.Session session = hs.getHibernateSession();
						
		Criteria crit = session.createCriteria(entity.getClass());
		Example search = Example.create(entity);
		
		if (excludeZeros)
			search.excludeZeroes();
		
		if (excludeProps != null)
		{
			for (int i = 0;i < excludeProps.length;i++)
				search.excludeProperty(excludeProps[i]);
		}
		
		crit.add(search);
		
		if (orderBy != null)
			crit.addOrder(Order.asc(orderBy));
		
		if (removeDuplicates)
		{
			return new DistinctRootEntityResultTransformer().transformList(crit.list());
		}
		else
			return crit.list();
	}
	
	@SuppressWarnings("unchecked")
	public List listUpdate(List items)
	{
		Iterator i = items.iterator();
		
		List<HashMap<String, Object>> errors = new ArrayList<HashMap<String, Object>>();
		
		while(i.hasNext()){
			HashMap thisItem = (HashMap) i.next();
			
			if (thisItem.get("status").equals("u")) {
				try
				{
					thisItem.put("object", this.update(thisItem.get("object")));
				}
				catch (RuntimeException e)
				{
					InvocationTargetException topError = (InvocationTargetException) e.getCause();
					
					if (topError.getTargetException().getClass().equals(WebosException.class))
					{
						errors.add(this.setErrorObject((WebosException) topError.getTargetException()));
					}
					else
						throw e;
				}
			}
			else if (thisItem.get("status").equals("i")) {
				try
				{
					thisItem.put("object", this.create(thisItem.get("object")));
				}
				catch (RuntimeException e)
				{
					InvocationTargetException topError = (InvocationTargetException) e.getCause();
					
					if (topError.getTargetException().getClass().equals(WebosException.class))
					{
						errors.add(this.setErrorObject((WebosException) topError.getTargetException()));
					}
					else
						throw e;
				}
			}
			else if (thisItem.get("status").equals("d")) {
				try
				{
					this.delete(thisItem.get("object"));
				}
				catch (RuntimeException e)
				{
					InvocationTargetException topError = (InvocationTargetException) e.getCause();
					
					if (topError.getTargetException().getClass().equals(WebosException.class))
					{
						errors.add(this.setErrorObject((WebosException) topError.getTargetException()));
					}
					else
						throw e;
				}
			}	
		}
		
		if (errors.isEmpty())
			return items;
		else
			throw new WebosException("Errors exist while updating objects.",errors);
	}
	
	private HashMap<String, Object> setErrorObject(WebosException currentError)
	{
		HashMap<String, Object> error = new HashMap<String, Object>();
		error.put("message", currentError.getMessage());
		error.put("errorObject", currentError.getError());
		return error;
	}
	
	public boolean delete(Object item)
	{
		EntityManager em = this.getEntityManager();
		
		try
		{
			em.remove(item);
		}
		catch (Exception e)
		{
			item = em.merge(item);
			em.remove(item);
		}
		
		return true;
	}
	
	public boolean remove(Object item)
	{
		this.delete(item);
		
		return true;
	}
	
	public Object create(Object item)
	{
		EntityManager em = this.getEntityManager();
		
		List editedProperties = null;
		List editedPropertiesOriginalValues = null;
		String uiUniqueId = null;
		String managementDestination = null;
		
		try
		{
			AtlasBase atlasItem = (AtlasBase) item;
			editedProperties = atlasItem.getEditedProperties();
			editedPropertiesOriginalValues = atlasItem.getEditedPropertiesOriginalValues();
			uiUniqueId = atlasItem.getUiUniqueId();
			managementDestination = atlasItem.getManagementDestination();
		}
		catch (Exception e)
		{
			//do nothing
		}
		
		item = em.merge(item);
		
		try
		{
			AtlasBase atlasItem = (AtlasBase) item;
			atlasItem.setEditedProperties(editedProperties);
			atlasItem.setEditedPropertiesOriginalValues(editedPropertiesOriginalValues);
			atlasItem.setUiUniqueId(uiUniqueId);
			atlasItem.setManagementDestination(managementDestination);
		}
		catch (Exception e)
		{
			//do nothing
		}
		
		//force em flush in order to capture pre-persist errors if needed
		em.flush();
		
		return item;
	}
	
	public Object update(Object item)
	{
		EntityManager em = this.getEntityManager();
		
		List editedProperties = null;
		List editedPropertiesOriginalValues = null;
		String uiUniqueId = null;
		String managementDestination = null;
		
		try
		{
			AtlasBase atlasItem = (AtlasBase) item;
			editedProperties = atlasItem.getEditedProperties();
			editedPropertiesOriginalValues = atlasItem.getEditedPropertiesOriginalValues();
			uiUniqueId = atlasItem.getUiUniqueId();
			managementDestination = atlasItem.getManagementDestination();
		}
		catch (Exception e)
		{
			//do nothing
		}
		
		item = em.merge(item);
		
		try
		{
			AtlasBase atlasItem = (AtlasBase) item;
			atlasItem.setEditedProperties(editedProperties);
			atlasItem.setEditedPropertiesOriginalValues(editedPropertiesOriginalValues);
			atlasItem.setUiUniqueId(uiUniqueId);
			atlasItem.setManagementDestination(managementDestination);
		}
		catch (Exception e)
		{
			//do nothing
		}
		
		//force em flush in order to capture pre-persist errors if needed
		em.flush();
		
		return item;
	}
	
	abstract protected EntityManager getEntityManager();
	
}
