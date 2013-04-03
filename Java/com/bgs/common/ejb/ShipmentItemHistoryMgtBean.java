package com.bgs.common.ejb;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.common.domain.BgsServiceAttributes;
import com.bgs.common.domain.BgsServiceManager;
import com.bgs.common.domain.ShipmentItem;
import com.bgs.common.domain.ShipmentItemHistory;
import com.bgs.common.ejb.interfaces.ShipmentItemHistoryMgtLocal;
import com.bgs.common.ejb.interfaces.ShipmentItemHistoryMgtRemote;
import com.bgs.fc.domain.User;
import com.bgs.fc.ejb.webos.EJBBase;
import com.bgs.fc.security.WebOSSecurity;


public @Stateless class ShipmentItemHistoryMgtBean extends EJBBase implements ShipmentItemHistoryMgtLocal, ShipmentItemHistoryMgtRemote {
	
	@EJB
	private WebOSSecurity sec;
	
	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	private ShipmentItemHistory sih = new ShipmentItemHistory();
	
	public boolean createShipmentItemHistory(Integer shipmentItemId, String userId, String actionType, String messageText, String barcode, String currentSiteCode) {
		
		this.sih.setActionType(actionType);
		this.sih.setBarcode(barcode);
		this.sih.setCurrentSiteCode(currentSiteCode);
		this.sih.setMessageText(messageText);
		this.sih.setShipmentItemId(shipmentItemId);
		this.sih.setUserId(userId);
		
		//DaveB 15-May-2007.
		//	Default area type of all garcia generated shipment item history
		//	so they can be identified by various processes.
		String sAreaType = this.sih.getAreaType();
		if (sAreaType == null || sAreaType == ""){
			this.sih.setAreaType("GRCIA");
		}		
		
		if (sih.getShipmentItemHistoryDate() == null){
			sih.setShipmentItemHistoryDate(new Date(new java.util.Date().getTime()));
		}		
		
		this.writeToFile(sih);		
		
		em.merge(this.sih);
		
		return true;
	}

	public boolean createShipmentItemHistory(Integer shipmentItemId, String userId, String actionType, String messageText, String barcode, String currentSiteCode, String areaType, Date historyDate) {
		
		this.sih.setAreaType(areaType);
		this.sih.setShipmentItemHistoryDate(new java.sql.Date(historyDate.getTime()));
		return this.createShipmentItemHistory(shipmentItemId, userId, actionType, messageText, barcode, currentSiteCode);
	}

	public Object createShipmentItemHistory(Integer shipmentItemId, String actionType, String messageText, String barcode, String currentSiteCode, String areaType, Date historyDate) {
		User user = sec.getUserInfo();
		
		this.sih.setBarcode(barcode);
		this.sih.setActionType(actionType);
		this.sih.setMessageText(messageText);
		this.sih.setAreaType(areaType);
		this.sih.setCurrentSiteCode(currentSiteCode);
		this.sih.setShipmentItemHistoryDate(historyDate);		
		this.sih.setUserId(user.getUsername());

		if (shipmentItemId != null && shipmentItemId > 0){
			this.sih.setShipmentItemId(shipmentItemId);
			this.writeToFile(sih);
		}				
		
		this.sih = em.merge(this.sih);

		return this.sih;
	}
	
	public List getShipmentItemHistoryByBarcode(String barcode) {
		Query query = em.createQuery("from ShipmentItemHistory s where s.barcode = :barcode Order by s.shipmentItemHistoryDate");
		query.setParameter("barcode", barcode);
		return query.getResultList();
	}
	
	public void writeToFile(ShipmentItemHistory sih)
	{
		ShipmentItem si = em.find(ShipmentItem.class, sih.getShipmentItemId());
		
		//Cannot send if from PMCHeckin.
		if (si.getDeliverySiteCode() == null){
			return;
		}
		
		StringBuffer str = new StringBuffer();
		str.append("<record_type>SHIPMENT_ITEM_HISTORY");
		//str.append("<origin_shipment_item_id>" + null);
		//str.append("<origin_server_id>" + null);
		str.append("<shipment_item_id>" + sih.getShipmentItemId().toString());
		str.append("<user_id>" + sih.getUserId().toString());
		str.append("<action_type>" + sih.getActionType().toString());
		str.append("<area_type>" + sih.getAreaType().toString());
		str.append("<message_text>" + sih.getMessageText());
		str.append("<ignore_atlas>" + "Y");
		
		if (sih.getShipmentItemHistoryDate() != null){
			
			//CalendarUtils calUtil = new CalendarUtils();
			//Calendar cal = Calendar.getInstance();
			//cal.setTime(sih.getShipmentItemHistoryDate());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");		    
			str.append("<shipment_item_history_date>" + sdf.format(sih.getShipmentItemHistoryDate()));
		}
		else
			str.append("<shipment_item_history_date>" + null);
		
		
		str.append("<dest_site_code>" + si.getDeliverySiteCode().toString());
		str.append("<shipment_item_barcode>" + sih.getBarcode().toString());	
		str.append("<eof>");
		
		Calendar c = Calendar.getInstance(); // Now
		
		String sOrigin = si.getPickupSiteCode();		
		if (sOrigin == null){
			System.out.println("ShipmentItemHistoryMgtBean: writeToFile(): Cannot generate HISs file - Pickup Site Code missing.");
			return;
		}
		
		if (sOrigin.length() < 4){
			while (sOrigin.length() < 4){
				sOrigin = "0" + sOrigin;
			}			
		}
		
		String sDestin = si.getDeliverySiteCode();		
		if (sDestin == null){
			System.out.println("ShipmentItemHistoryMgtBean: writeToFile(): Cannot generate HISs file - Delivery Site Code missing.");
			return;
		}
		
		if (sDestin.length() < 4){
			while (sDestin.length() < 4){
				sDestin = "0" + sDestin;
			}			
		}
				
		Long ltime   = c.getTime().getTime();		
		String stime = ltime.toString();
		String fileName = sOrigin + sDestin + "HISs" + stime.substring(9) + ".ATL";	
		
		//Get ftp directory path where history files will 
		//	be saved, and later ftp'd from.
		Query que = em.createQuery("select a from BgsServiceManager a " +
		"where a.serviceCode = 'GARIH' ");

		List ftpParms = que.getResultList();
		if (ftpParms.size() < 1){
			//NOTIFY somebody we dont have ftp parms.
			System.out.println("Error: Cannot find the Garcia FTP parameters.");
		}
		else{
			BgsServiceManager svc = new BgsServiceManager();
			svc = (BgsServiceManager) ftpParms.get(0);
			
			String ftpDirectory = "";
			
			for (BgsServiceAttributes svcmgr:svc.getAttributes()){
				if (svcmgr.getAttribute().equalsIgnoreCase("ftp_local_dir")){
					ftpDirectory = svcmgr.getAttributeValue();
					break;
				}
			}
			
			if(ftpDirectory.equals("")){
				//NOTIFY we can ascertain the HISs directory.
				System.out.println("Error: Cannot find the FTP Garcia Item History directory.");
			}
			else{				
				//String filePath = "../FTP/Garcia/itemhistory/" + fileName ; 
				String filePath = ftpDirectory + "/" + fileName;
				try {
					FileWriter fstream = new FileWriter(filePath);
					BufferedWriter out = new BufferedWriter(fstream);
					out.write(str.toString());
					out.close();
					
				}
				catch (IOException e) {
					System.out.println("Error writing to output file. " + fileName);				   			
				}		
				
			}
		}
		
	 }

	@Override
	protected EntityManager getEntityManager() {
		return this.em;
	}
}
