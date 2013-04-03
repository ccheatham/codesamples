package com.bgs.common.ejb;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;

import com.bgs.common.ejb.interfaces.EntitySearchIndex;



public @MessageDriven(activationConfig = {	
			@ActivationConfigProperty(propertyName="destinationType", propertyValue="javax.jms.Queue"),
			@ActivationConfigProperty(propertyName="destination", propertyValue="queue/IndexingQueue"),
			@ActivationConfigProperty(propertyName="acknowledgeMode", propertyValue="Auto-acknowledge")
		}
	)
class IndexMDB implements MessageListener {

@EJB EntitySearchIndex esi;
	
@Override
	public void onMessage(Message message) {
		
		try{
			
			MapMessage mapMsg  = (MapMessage)message;
			
			Integer recordCount  = mapMsg.getInt("RecordCount");

			
			try{
				
				esi.processIndexRequest(recordCount);
				
				esi.log("Message Pick-up to start to index another chunck");
			
			}
			
			catch(Exception e){}
		
		}
		
		catch(JMSException jmsException){
			
			jmsException.printStackTrace();
			
		}
	}
}