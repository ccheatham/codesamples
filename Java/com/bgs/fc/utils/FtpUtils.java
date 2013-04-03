package com.bgs.fc.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import com.bgs.fc.utils.CalendarUtils;

/* FTP Service.
 * 		Jakarta ORO - Doc API at http://jakarta.apache.org/oro/
 * 		Jakarta CommonsNet - Doc API at http://jakarta.apache.org/commons/net/
 * 
 */
public class FtpUtils extends FTPClient {

	private String ftpLog = "";
	
	public FTPClient connectToServer(String server, String userid, String pwd)
	{		
		FTPClient ftp = new FTPClient();

		try{						
			ftp.connect(server);
			ftp.login(userid,pwd);	
			this.writeToLog("connectToServer(): Connected to " +  server + ". " + ftp.getReplyString());			
			return ftp;
			
		}catch (IOException e) {
			
			this.writeToLog("connectToServer(): Connect Error: " + e.getMessage().toString());
			
			//Alert someone of a failed ftp server connection attempt.		
		//	try
		//	{
		//		this.alertMgt.postAlert("FTP Mgr: Error occured while Connecting to FTP server. . .", "GARIH");
		//	}
		//	catch (MessagingException x)
		//	{
		//		this.writeToLog("connectToServer(): " + x.getMessage().toString());	 			
		//	}			
		}
		
		return ftp;
	}

	//Move files from local to remote ftp box.
	public boolean send(String fileName, String propFile)
	{	

	    Properties p = new Properties();
	    try {
			p.load(new FileInputStream(propFile));
		} catch (FileNotFoundException ef) {
			this.writeToLog("Load file ftp.properties not found: " + ef.getMessage().toString());
			return false;
		} catch (IOException e1) {
			this.writeToLog("Load file ftp.properties error: " + e1.getMessage().toString());
			return false;
		}
	    
		try{	
			
			//Load the attributes.			
		    String ftpip 	   = p.getProperty("ftpip");
		    String ftpuserid   = p.getProperty("ftpuserid");
		    String ftppwd 	   = p.getProperty("ftppwd");
		    String localFile   = ""; //p.getProperty("localFileName");
		    String remoteFile  = p.getProperty("remoteFile");
		    String ftpDir 	   = p.getProperty("ftpDirectory");
		    String localDir    = p.getProperty("localDirectory");
		    String deleteLocal = p.getProperty("deleteLocalFiles");			
			
			//Get handle to local directory.
			File dir = new File(localDir);				
			File file;
			if(! dir.isDirectory()){
				return true;
			}
			
			//check for files to upload.
			String s[] = dir.list();	        
	        InputStream input;
		        
	        if (s.length < 1){
	        	return true;     //no files
	        }
	        
	        //Connect to server.
			FTPClient ftp = this.connectToServer(ftpip, ftpuserid, ftppwd);
			
			// Verify connection.
			if (!ftp.isConnected()){
				throw new IOException();
			}
			
			//Set working directory.			
			ftp.changeWorkingDirectory(ftpDir);
			ftpDir = ftp.printWorkingDirectory();
			
			if (ftpDir == null){				
				this.writeToLog("send(): Error setting remote directory. Verify FTP parms.");
				return false;
			}
			else
				this.writeToLog("send(): Remote Directory Set: " + ftpDir);
			
			ftp.setFileType(FTP.BINARY_FILE_TYPE); 
			
			//Set to Passive Mode allowing the client to initiate the data connection 
			//	to the server which works better when behind a firewall.
			/* Ref: http://slacksite.com/other/ftp.html
			 * The main problem with active mode FTP actually falls on the client side. 
			 * The FTP client doesn't make the actual connection to the data port of the 
			 * server--it simply tells the server what port it is listening on and the server 
			 * connects back to the specified port on the client. From the client side 
			 * firewall this appears to be an outside system initiating a connection to an 
			 * internal client--something that is usually blocked. 
			 */
			ftp.enterLocalPassiveMode();
	        
	        this.writeToLog("send(): Begin Directory Read: " + localDir);
			
	   //     for (int i=0; i<s.length; i++)
	    //    {
	        	localFile = fileName;

	    	    this.writeToLog("send(): Read: " + localFile);
	    	    
	    	    input = new FileInputStream(localDir + "/" + localFile);
	    	  
	    	    remoteFile = ftpDir + "/" + localFile;
	    	    ftp.storeFile(remoteFile,input);
	    	    input.close(); 
	    	    
	    	    if (deleteLocal.equalsIgnoreCase("Y")){
	    	    	file = new File(localDir + "/" + localFile);
	 	    	    boolean deleted = file.delete();
	 	    	    
	 	    	    if (deleted){
	 	    	    	//System.out.println(". . .File Deleted: " + localFileName);
	 	    	    	this.writeToLog(". . .File Deleted: " + localFile);
	 	    	    }
	 	    	    else
	 	    	    	this.writeToLog(". . .Failed to delete file: " + localFile);
	    	    }    	   
	     //   }
	        
            if (ftp.isConnected()){
	        	ftp.logout();	        	
	        	
	        	this.writeToLog("send(): FTP Logout: " + ftpDir);
	        }

		}catch (IOException e) {
			 if (e.getMessage() != null){
				 this.writeToLog("send(): Error during file upload: " +  e.getMessage());
			 }
			 else
				 this.writeToLog("send(): General Exception.");
			 
			 return false;			 			
		}
				
		return true;
	}
	
	public void writeToLog(String msg)
	{
		
		//Write to ftp log.
		try {
			CalendarUtils c = new CalendarUtils();
			
	        //BufferedWriter out = new BufferedWriter(new FileWriter("../ServiceLogs/BGS/itemhistory/ftpLog.txt",true));
			BufferedWriter out = new BufferedWriter(new FileWriter(ftpLog + "ftpLog.txt",true));
			out.write("\n" + c.getTimeAndDate(false) + " - " + msg);
	        out.close();
	    }catch (IOException e){
	    	System.out.println("FtpMgrBean: " + e.getMessage().toString());
	    }		
	}
}
