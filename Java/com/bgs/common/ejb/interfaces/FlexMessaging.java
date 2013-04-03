package com.bgs.common.ejb.interfaces;

import java.util.HashMap;

import javax.ejb.Local;

@Local
public interface FlexMessaging {
	
	public boolean sendTextMessage(String msg, String app, String winName, HashMap<String,String> map);
	//public boolean sendTextMessage(String msg, String app, List winNames, HashMap<String,String> map);

}
