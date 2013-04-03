package com.bgs.common.ejb.interfaces;

import java.util.Date;
import java.util.List;

import com.bgs.fc.ejb.webos.interfaces.EJBBaseInterface;

public interface ShipmentItemHistoryMgt extends EJBBaseInterface {
	public boolean createShipmentItemHistory(Integer shipmentItemId, String userId, String actionType, String messageText, String barcode, String currentSiteCode);
	public boolean createShipmentItemHistory(Integer shipmentItemId, String userId, String actionType, String messageText, String barcode, String currentSiteCode, String areaType, Date historyDate);
	public Object createShipmentItemHistory(Integer shipmentItemId, String actionType, String messageText, String barcode, String currentSiteCode, String areaType, Date historyDate);
	public List getShipmentItemHistoryByBarcode(String barcode);
}
