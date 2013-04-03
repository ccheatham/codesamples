package com.bgs.common.ejb.interfaces;

import javax.ejb.Local;

import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;

@Local
public interface EntitySearchIndex extends EJBBaseInterface{
	public Boolean indexEntities() throws Exception;
	public void processIndexRequest(Integer start) throws Exception;
	public void log(String logFileInput);
}
