package com.bgs.fc.mappedsuperclass;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class AtlasBase implements Serializable {
	private static final long serialVersionUID = 4073951499155001727L;

	@Transient
	private List editedProperties;
	
	@Transient
	private List editedPropertiesOriginalValues;
	
	@Transient
	private String uiUniqueId;
	
	@Transient
	private String managementDestination;
	
	public AtlasBase()
	{
		if (this.getUiUniqueId() == null)
			this.setUiUniqueId(new java.rmi.server.UID().toString());
	}
	
	//CRUD methods
	
	public AtlasBase update()
	{
		return this.update(this.managementDestination);
	}
	public AtlasBase update(String managementDestination)
	{
		managementDestination = this.setManagementBean(managementDestination);
		
		return callCRUDMethod(managementDestination, "update");
	}
	
	public AtlasBase delete()
	{
		return this.delete(this.managementDestination);
	}
	public AtlasBase delete(String managementDestination)
	{
		managementDestination = this.setManagementBean(managementDestination);
		
		return callCRUDMethod(managementDestination, "delete");
	}
	
	public AtlasBase create()
	{
		return this.create(this.managementDestination);
	}
	public AtlasBase create(String managementDestination)
	{
		managementDestination = this.setManagementBean(managementDestination);
		
		return callCRUDMethod(managementDestination, "create");
	}
	
	private String setManagementBean(String managementDestination)
    {
    	if (managementDestination != null && this.managementDestination == null)
    		this.managementDestination = managementDestination + "Bean/local";
    	else if (this.managementDestination != null)
    		managementDestination = this.managementDestination + "Bean/local";
    	
    	return managementDestination;
    }
	
	private Object getEJBInstance(String managementDestination) throws NamingException
	{
		InitialContext ctx = new InitialContext();
		
		Object ejb = ctx.lookup(managementDestination);
		
		return ejb;
	}
	
	private AtlasBase callCRUDMethod(String managementDestination, String operation) 
	{
		try
		{
			Object ejb = this.getEJBInstance(managementDestination);
			
			//get method definition from lookup up object
			Method method = ejb.getClass().getMethod(operation,Object.class);
			List<AtlasBase> args = new ArrayList<AtlasBase>();
			args.add(this);
			return (AtlasBase) method.invoke(ejb,args.toArray());
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return this;
	}
	
	//CRUD methods

	public String getUiUniqueId() {
		return uiUniqueId;
	}

	public void setUiUniqueId(String uiUniqueId) {
		this.uiUniqueId = uiUniqueId;
	}

	public List getEditedProperties() {
		return editedProperties;
	}

	public void setEditedProperties(List editedProperties) {
		this.editedProperties = editedProperties;
	}

	public List getEditedPropertiesOriginalValues() {
		return editedPropertiesOriginalValues;
	}

	public void setEditedPropertiesOriginalValues(
			List editedPropertiesOriginalValues) {
		this.editedPropertiesOriginalValues = editedPropertiesOriginalValues;
	}

	public String getManagementDestination() {
		return managementDestination;
	}

	public void setManagementDestination(String managementDestination) {
		this.managementDestination = managementDestination;
	}
}
