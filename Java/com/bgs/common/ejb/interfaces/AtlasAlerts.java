package com.bgs.common.ejb.interfaces;

import java.util.Date;
import java.util.List;

import javax.ejb.Local;
import javax.mail.MessagingException;

import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;




@Local
public interface AtlasAlerts extends EJBBaseInterface {
		
	//View Alerts window.
	public List getAlerts(String siteCode, Date alertDate);
	
	//Alerts Admin window.
	public List getAlertsAdmin();
	
	//Recipients window.
	public List getRecipientAlerts(String siteCodeArg);
	public List getAlertCodes();
	
	public void postAlert(String msg, String alertCode) throws MessagingException;
	public void postAlertOnly(String alertCode, String msg) throws MessagingException;
	
	public void sendAlertEmail(String alertCode, String msg) throws MessagingException;
	
	public void sendEmail( String recipients[ ], 
						  String subject, 
						  String message , 
						  String from) throws MessagingException;

}
