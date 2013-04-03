package com.critical;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.QueueingConsumer;


public class CriticalGdsSqlConsumer {
    
	private com.rabbitmq.client.Connection gdsConnection;
	private java.sql.Connection sqlConnection;
		
	private String gdsServiceURI; 
	private String messageQueue;
	private String fullSQLConnectionString;
	
	public void getMessages() {
        try {
            String uri = gdsServiceURI;
            String queueName = messageQueue;

            ConnectionFactory connFactory = new ConnectionFactory();
            connFactory.setUri(uri);
            com.rabbitmq.client.Connection gdsConnection = connFactory.newConnection();

            final Channel ch = gdsConnection.createChannel();

            ch.queueDeclare(queueName, false, false, false, null);

            QueueingConsumer consumer = new QueueingConsumer(ch);
            ch.basicConsume(queueName, false, consumer);
            while (true) {
                QueueingConsumer.Delivery delivery = consumer.nextDelivery();
                
                Class.forName("org.postgresql.Driver").newInstance();
                sqlConnection = DriverManager.getConnection(fullSQLConnectionString);
                Statement statement = sqlConnection.createStatement();
                System.out.println(new String(delivery.getBody()));
                statement.executeUpdate(new String(delivery.getBody()));
                
                //result.close() ;
                statement.close() ;
                
                //System.out.println("Message: " + new String(delivery.getBody()));
                ch.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
                broadcastNewDataAvailable("new data available");
            }
        } catch (Exception ex) {
            
        	System.out.println(ex.getMessage());
        	
        	try {
				sqlConnection.close();
				gdsConnection.close();
			} catch (SQLException e) {

				System.out.println(e.getMessage());
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
        	
        	System.err.println("Main thread caught exception: " + ex);
            ex.printStackTrace();
            System.exit(1);
        }
    }
	
	private void broadcastNewDataAvailable(String message){
		
            String uri = gdsServiceURI;
            String queueName = "newClientData";

            ConnectionFactory connFactory = new ConnectionFactory();
            try {
				
            	
            	connFactory.setUri(uri);
				com.rabbitmq.client.Connection gdsConnection = connFactory.newConnection();
				Channel ch = gdsConnection.createChannel();
				
				ch.basicPublish(queueName, "", null, message.getBytes());
				
			} catch (KeyManagementException e) {

				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {

				e.printStackTrace();
			} catch (URISyntaxException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
	}
	
	public com.rabbitmq.client.Connection getGdsConnection() {
		return gdsConnection;
	}


	public void setGdsConnection(com.rabbitmq.client.Connection gdsConnection) {
		this.gdsConnection = gdsConnection;
	}


	public java.sql.Connection getSqlConnection() {
		return sqlConnection;
	}


	public void setSqlConnection(java.sql.Connection sqlConnection) {
		this.sqlConnection = sqlConnection;
	}
	
	public String getGdsServiceURI() {
		return gdsServiceURI;
	}


	public void setGdsServiceURI(String gdsServiceURI) {
		this.gdsServiceURI = gdsServiceURI;
	}


	public String getMessageQueue() {
		return messageQueue;
	}


	public void setMessageQueue(String messageQueue) {
		this.messageQueue = messageQueue;
	}


	public String getFullSQLConnectionString() {
		return fullSQLConnectionString;
	}


	public void setFullSQLConnectionString(String fullSQLConnectionString) {
		this.fullSQLConnectionString = fullSQLConnectionString;
	}
}
