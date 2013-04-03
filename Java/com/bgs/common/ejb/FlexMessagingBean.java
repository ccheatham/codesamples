package com.bgs.common.ejb;

import java.util.HashMap;
import java.util.Set;

import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import com.bgs.common.ejb.interfaces.FlexMessaging;

public @Stateless class FlexMessagingBean implements FlexMessaging {

	
	@Resource(mappedName="topic/GeneralFlexTopic")
	private javax.jms.Topic topic;
	
	@Resource(mappedName="ConnectionFactory")
	private ConnectionFactory factory;
		
	public boolean sendTextMessage(String msg, String app, String winName, HashMap<String,String> map)
	{		
		try{			
			javax.jms.Connection connection = factory.createConnection();			
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			TextMessage message = null;
			message = session.createTextMessage(msg);	
			
			if (app == null)
				app = "";
				
			if (winName == null)
				winName = "";
						
			if (map != null && !map.isEmpty()){
				Set<String> keySet = map.keySet();				
				for (String key:keySet){
					message.setStringProperty(key, map.get(key));
				}				
			}
			
			message.setStringProperty("Application", app);
			message.setStringProperty("WindowName", winName);			
			
			send(session, message);				
			session.close();
			connection.close();
			
		}catch (Exception e){
			System.out.println("ManifestMgtBean: send(). " + e.getMessage());			
			return false;
		}
			
		return true;
	}

	private void send(Session session, TextMessage message) throws JMSException {
		MessageProducer producer = session.createProducer(topic);
		producer.send(message);			
		producer.close();
		
	}

	
	
}
