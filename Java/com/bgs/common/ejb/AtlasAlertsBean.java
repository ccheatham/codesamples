package com.bgs.common.ejb;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.InitialContext;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.common.domain.Alert;
import com.bgs.common.domain.AlertCodes;
import com.bgs.common.domain.AlertRecipients;
import com.bgs.common.ejb.interfaces.AtlasAlerts;
import com.bgs.fc.ejb.webos.EJBBase;
import com.bgs.fc.security.WebOSSecurity;

/*
 * Write to Alert table and send emails.
 * 
 * Throw all critical errors  back to caller.
 * 
 */

public @Stateless class AtlasAlertsBean extends EJBBase  implements AtlasAlerts {
	
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	//Write to Alert table w/option to send eamils.
	public void postAlertOnly(String alertCode, String msg) throws MessagingException
	{
		/* Testing: 8-June-2007 DaveB.
		 * Used specifically to write loose item alerts and One email is
		 * sent containing all sites w/loose items.
		 * 
		 * 	Will consolidate and streamline code later...
		 */
		
		AlertCodes ac = em.find(AlertCodes.class, alertCode);		
		if (ac != null){
						
			//jndi lookup for user info..
			WebOSSecurity sec = null;
			boolean security = false;
			try {
				InitialContext ctx = new InitialContext();
				sec = (WebOSSecurity) ctx.lookup("WebOSSecurityBean/local");	
				sec.getUserInfo().getUserSite().getSiteCode();
				security = true;
				
			}catch (Exception e){
				this.writeToLog("postAlertOnly(). Security Context unavailable.");
			}
						
			Alert alert = new Alert();
			
			//Tells us someone was emailed or not.
			if (ac.getAutoEmail().equals("Y")){
				alert.setAlertSentInd("Y");
			}
			else
				alert.setAlertSentInd("N");
			
			
			alert.setAlertCode(alertCode);
			alert.setActionType(alertCode);
			alert.setAlertMsg(msg);
			
			if (! security ){
				alert.setCurrentBranchCode("BGS");
				alert.setLastModifiedUser("BGSSPY");
			}
			else
			{
				alert.setCurrentBranchCode(sec.getUserInfo().getUserSite().getSiteCode());
				alert.setLastModifiedUser(sec.getUserInfo().getUsername());				
			}
			
			alert.setDateCreated(new Date());
			alert.setInactiveFlag("N");
						
			em.merge(alert);
			em.flush();
		}
		else{
			//Send Non Registered alert Alert.
			this.postUnregisteredAlertCode(alertCode);
		}
	}
	
	public void postAlert(String msg, String alertCode) throws MessagingException
	{
		AlertCodes ac = em.find(AlertCodes.class, alertCode);		
		if (ac != null){
						
			//jndi lookup for user info..
			WebOSSecurity sec = null;
			boolean security = false;
			try {
				InitialContext ctx = new InitialContext();
				sec = (WebOSSecurity) ctx.lookup("WebOSSecurityBean/local");	
				sec.getUserInfo().getUserSite().getSiteCode();
				security = true;
				
			}catch (Exception e){
				this.writeToLog("postAlert(). Security Context unavailable.");
			}
			
			String[] recips = new String[ac.getAlertRecipients().size()];
			
			int ctr = 0;
			for (AlertRecipients recip:ac.getAlertRecipients()){
				recips[ctr] = recip.getEmailAddress();
				ctr++;
			}
			
			Alert alert = new Alert();
			
			if (ac.getAutoEmail().equals("Y") && recips.length > 0){
				try{
					this.sendEmail(recips, ac.getAlertCodeDesc(), msg, "garcia@brinksinc.com");
				}catch (MessagingException e){
					throw e;					
				}				
			}
			else
				alert.setAlertSentInd("N");
			
			alert.setAlertCode(alertCode);
			alert.setActionType(alertCode);
			alert.setAlertMsg(msg);
			
			if (! security ){
				alert.setCurrentBranchCode("BGS");
				alert.setLastModifiedUser("BGSSPY");
			}
			else
			{
				alert.setCurrentBranchCode(sec.getUserInfo().getUserSite().getSiteCode());
				alert.setLastModifiedUser(sec.getUserInfo().getUsername());				
			}
			
			alert.setDateCreated(new Date());
			alert.setInactiveFlag("N");
						
			em.merge(alert);
			em.flush();
		}
		else{
			//Send Non Registered alert Alert.
			this.postUnregisteredAlertCode(alertCode);
		}
	}
	
	private void postUnregisteredAlertCode(String alertCode)
	{
		//Sept 20, 2007 DB: System attempted to post an alert that has 
		//	not yet been entered into the alert code table.
		
		
		//jndi lookup for user info..
		WebOSSecurity sec = null;
		boolean security = false;
		try {
			InitialContext ctx = new InitialContext();
			sec = (WebOSSecurity) ctx.lookup("WebOSSecurityBean/local");	
			sec.getUserInfo().getUserSite().getSiteCode();
			security = true;
			
		}catch (Exception e){
			this.writeToLog("postAlert(). Security Context unavailable.");
		}
		
		//Create the alert code.
		AlertCodes ac = new AlertCodes();
		ac.setAlertCode(alertCode);
		ac.setAlertCodeDesc("PLEASE UPDATE...");
		ac.setCreatedByUserid("OZ");
		ac.setAutoEmail("N");
		ac.setDateCreated(new Date());
		
		em.merge(ac);
		em.flush();
		
		//Write an alert.
		String sBranch = "000";
		if(security)
			sBranch = sec.getUserInfo().getUserSite().getSiteCode();
		
		Alert alert = new Alert();
		alert.setAlertCode(alertCode);
		alert.setActionType(alertCode);
		alert.setLastModifiedUser("OZ");
		alert.setCurrentBranchCode(sBranch);
		alert.setDateCreated(new Date());
		alert.setAlertMsg("Unregistered Alert generated from Branch '" + sBranch + "'." +
				"Please update Alert Code " + alertCode + " in Alerts Admin.");
		
		em.merge(alert);
		em.flush();
		
	}
	
	//Test: After alerts have been written, send an email 
	//	to the alertcode's recipients.
	public void sendAlertEmail(String alertCode, String msg) throws MessagingException
	{
		AlertCodes ac = em.find(AlertCodes.class, alertCode);	
		
			
		String[] recips = new String[ac.getAlertRecipients().size()];
		
		int ctr = 0;
		for (AlertRecipients recip:ac.getAlertRecipients()){
			recips[ctr] = recip.getEmailAddress();
			ctr++;
		}
		
		if (ac.getAutoEmail().equals("Y") && recips.length > 0){
			try{
				this.sendEmail(recips, ac.getAlertCodeDesc(), msg, "garcia@brinksinc.com");
			}catch (MessagingException e){
				throw e;					
			}		
		}	
	}
	
	public void sendEmail( String recipients[ ], String subject, String message , String from) throws MessagingException
	{
	    boolean debug = false;

	    //Set the host smtp address
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "NAD0019SMTP02.brinksinc.com");
	    
	    // create some properties and get the default Session
	    Session session = Session.getDefaultInstance(props, null);
	    session.setDebug(debug);

	    // create a message
	    Message msg = new MimeMessage(session);

	    // set the from and to address
	    InternetAddress addressFrom = new InternetAddress(from);
	    msg.setFrom(addressFrom);

	    InternetAddress[] addressTo = new InternetAddress[recipients.length]; 
	    for (int i = 0; i < recipients.length; i++)
	    {
	        addressTo[i] = new InternetAddress(recipients[i]);
	    }
	    msg.setRecipients(Message.RecipientType.TO, addressTo);
	   

	    // Optional : You can also set your custom headers in the Email if you Want
	    //msg.addHeader("MyHeaderName", "myHeaderValue");

	    // Setting the Subject and Content Type
	    msg.setSubject(subject);
	    msg.setContent(message, "text/plain");
	   
	    //send the message, or throw error back to caller.
	    try{
	    	Transport.send(msg);
	    } catch (MessagingException e) { 	
	    	this.writeToLog("sendEmail(): Error sending email.");
	    	throw e;
	    }
	   	  
	}

	
// Alert Recipient Functions . . .
	
	public List getRecipientAlerts(String siteCodeArg)
	{
		Query que = em.createQuery("from AlertRecipients a where a.siteCode = :siteCode" );
		que.setParameter("siteCode", siteCodeArg);
		
		List recip = que.getResultList();
		
		if (recip.size() > 0)
			return recip;
		else
			return null;
	}	
	
	public List getAlertCodes()
	{
		Query que = em.createQuery("select a.alertCode, a.alertCodeDesc from AlertCodes a ");
		List aCodes = que.getResultList();
		
		if (aCodes.size() > 0)
			return aCodes;
		else
			return null;
	}
	
	
	
// Alerts Admin functions . . .
	
	public List getAlertsAdmin()
	{		
		Query que = em.createQuery("from AlertCodes ");
		List alertsAdmin = que.getResultList();
		
		if (alertsAdmin.size() > 0)
			return alertsAdmin;
		else
			return null;
	}
	
	
// Alerts Viewer Functions ...	
	
	@SuppressWarnings("deprecation")
	public List getAlerts(String puBranchCode, Date dateCreated)
	{		
		//Zero the current time until i figure out how to do it
		// on the flex side.
		dateCreated.setHours(00);
		dateCreated.setMinutes(00);
		dateCreated.setSeconds(00);		
		
		Query que;
		
		if (puBranchCode != null)
		{
			//UserInfo user = sec.getUserInfo();			
			que = em.createQuery("from Alert a " +
					"where a.puBranchCode = :puBranchCode and a.dateCreated = :dateCreated " );	
			que.setParameter("puBranchCode", puBranchCode);
		}
		else
			que = em.createQuery("from Alert a where a.dateCreated = :dateCreated " );
				
		
		que.setParameter("dateCreated", dateCreated);
		
		List alertList = que.getResultList();		
		
		if (alertList.size() > 0)
			return alertList;
		else
			return null;
			
	}

	/*@SuppressWarnings("unchecked")
	public List updateAlerts(List alertObject) {
		
		Iterator i = alertObject.iterator();
		while (i.hasNext())
		{
			HashMap thisItem = (HashMap) i.next();
			
			if (thisItem.get("status").equals("u")) 
			{
				thisItem.put("object", this.update(thisItem.get("object")));
			}
			else if (thisItem.get("status").equals("i"))
			{
				thisItem.put("object", this.create(thisItem.get("object")));
			}
			else if (thisItem.get("status").equals("d"))
			{
				this.delete(thisItem.get("object"));
			}
		}
		
		return alertObject;
	}*/
	
	public void writeToLog(String msg)
	{
		System.out.println("AtlasAlertsBean: " + msg);
	}
	
// Overrides . . .	
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
//	@Override
//	public Object create(Object alert)
//	{
//		Object newAlert = em.merge(alert);		
//		em.flush();		
//		return newAlert;
//	}
	
	/*@Override
	public Object update(Object alert)
	{
		Object newAlert = em.merge(alert);		
		em.flush();		
		return newAlert;
	}*/
	
//	@Override
//	public boolean delete(Object obj)
//	{		
//		Object newObj = em.merge(obj);
//		em.remove(newObj);
//		em.flush();	
//		return true;
//	}
	
	
}
