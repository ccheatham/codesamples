package com.bgs.fc.ejb.webos.interfaces;

import java.util.HashMap;

import javax.ejb.Local;

import com.bgs.fc.domain.WebosApplication;
import com.bgs.fc.mappedsuperclass.WindowFactory;

@Local
public interface WebosUtilities {
	public WindowFactory getWindowFactory(String windowName, WebosApplication application);
	public WindowFactory getWindowFactory(Long id, WebosApplication application);
	public HashMap<String, Object> getWebosCacheData();
}
