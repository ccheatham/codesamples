package com.bgs.fc.ejb.webos.interfaces;

import java.util.List;

import javax.ejb.Local;

@Local
public interface MenuItemManagement extends EJBBaseInterface {
	public List getMenuItems();
	public List getMenuItems(String type);
	public List getMenuItems(String type, Long filterApplicationId);
}
