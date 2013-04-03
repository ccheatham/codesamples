package com.bgs.fc.ejb.webos.interfaces;

import java.util.List;

import javax.ejb.Local;

@Local
public interface ApplicationManagement extends EJBBaseInterface {
	public List getApplications(String type);
	public List getApplications();
}
