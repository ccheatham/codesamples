package com.bgs.fc.ejb.webos.interfaces;

import java.util.List;

public interface EJBBaseInterface {
	public boolean initializeDestinationsForFlex();
	public Object update(Object item);
	public Object create(Object item);
	public boolean delete(Object item);
	public boolean remove(Object item);
	public List listUpdate(List items);
	public List searchByEntity(Object entity, boolean excludeZeros, String orderBy, boolean removeDuplicates, String[] excludeProps);
}
