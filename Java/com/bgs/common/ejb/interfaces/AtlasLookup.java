package com.bgs.common.ejb.interfaces;

import java.util.List;

import com.bgs.common.domain.Airport;
import com.bgs.common.domain.PostalCodeBase;
import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;



public interface AtlasLookup extends EJBBaseInterface {

	public List getCountries(List args);
	public List getAirports();
	public List searchPostalCodes(PostalCodeBase postalCode);
	public List searchAirports(Airport airport);
	public List findPostalCode(String postalCode);
	
}
