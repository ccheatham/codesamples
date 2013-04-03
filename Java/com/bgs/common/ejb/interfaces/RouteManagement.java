package com.bgs.common.ejb.interfaces;

import java.util.List;

import javax.ejb.Local;

import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;

@Local
public interface RouteManagement extends EJBBaseInterface {
	public List getUSDomesticRoutes();
	public List searchPostalCodes(String postalCode);
	public List listUpdate(List changes);
}
