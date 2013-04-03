package com.bgs.common.ejb;

import java.io.File;
import java.io.FileWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;

import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.MapMessage;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.SimpleLayout;
import org.hibernate.search.jpa.FullTextEntityManager;

import com.bgs.common.ejb.interfaces.EntitySearchIndex;
import com.bgs.fc.ejb.webos.EJBBase;


public @Stateless class EntitySearchIndexBean extends EJBBase implements EntitySearchIndex{

	
	static Logger logger  = Logger.getLogger(EntitySearchIndexBean.class);
	@Resource(mappedName="ConnectionFactory")
	private ConnectionFactory connectionFactory;
	
	@Resource(mappedName="queue/IndexingQueue")
	private Queue queue;
	
	@PersistenceContext(unitName="webos_entities")
	protected EntityManager em;

	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	private List retrieveEntities(Integer start, Integer max) {
		Query query = em.createQuery("from Shipment s");
		return query.setMaxResults(max).setFirstResult(start).getResultList();
	}

	
	public void log(String logFileInput){
		
		SimpleLayout layout = new SimpleLayout();

		FileAppender appender = null;
	    
		String logfilename = "c:\\indexing.log";
		
		File f = new File(logfilename);
		
		if(!f.exists()){
			
			try{FileWriter output = new FileWriter(logfilename);
			} catch(Exception e){}
		}
		
		try {
	         appender = new FileAppender(layout,logfilename,false);
	      } catch(Exception e) {}
	      logger.addAppender(appender);
	      logger.setLevel((Level) Level.INFO);
	      logger.info(logFileInput);

	}
	
	private void sendMessage(Integer message) throws Exception{
		
		Connection connection = connectionFactory.createConnection();
		Session session = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
		MessageProducer producer = session.createProducer(queue);
		MapMessage mapMessage = session.createMapMessage();
		mapMessage.setInt("RecordCount",message);
		producer.send(mapMessage);
		producer.close();
		session.close();
		connection.close();
	
	}
	
	
	public void processIndexRequest(Integer start) throws Exception{
		
		FullTextEntityManager fullTextEntityManager = org.hibernate.search.jpa.Search.createFullTextEntityManager(em);
		Integer max = 15000;
		List results;
		Integer oldStart = start;

			results = this.retrieveEntities(start, max);
			
			start = start + results.size();
			
			this.log("Indexing from " + oldStart.toString()  + " to " + start.toString());
			
			Iterator i = results.iterator();
		
			while ( i.hasNext() ){
				
				fullTextEntityManager.index(i.next());
			
			}
		
		if (results.size() >0) this.sendMessage(start);

	}
	

	public Boolean indexEntities() throws Exception{
		
		this.log("Indexing Process Started");
		
		this.processIndexRequest(0);
		
		return true;
	}
}
