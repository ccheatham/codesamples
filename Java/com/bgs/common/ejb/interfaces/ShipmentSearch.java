package com.bgs.common.ejb.interfaces;

import java.util.List;

import javax.ejb.Local;

import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;

@Local 
public interface ShipmentSearch extends EJBBaseInterface {
	public List searchShipments(String userInput) throws Exception;
}
