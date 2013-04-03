package com.bgs.fc.ejb.webos.interfaces;

import java.util.List;

import javax.ejb.Local;

@Local
public interface WindowManagement extends EJBBaseInterface {
	public List getWindows();
}
