package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@MappedSuperclass
public class ShipmentItemHistory extends ShipmentItemHistoryBase implements Serializable {
	private static final long serialVersionUID = -4742257861928796875L;

	@PrePersist
	void preCreate()
	{
		if (this.getShipmentItemHistoryDate() == null)
		{
			this.setShipmentItemHistoryDate(new Date(new java.util.Date().getTime()));
		}
	}
	
	@Column(name="external_history_id")
	private String externalHistoryId;

	@Column(name="ACTION_TYPE")
	private String actionType;

	@Column(name="SHIPMENT_ITEM_HISTORY_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date shipmentItemHistoryDate;

	@Column(name="current_site_code")
	private String currentSiteCode;

	@Column(name="AREA_TYPE")
	private String areaType;

	@Column(name="MESSAGE_TEXT")
	private String messageText;

	private String barcode;

	@Column(name="USER_ID")
	private String userId;

	@Column(name="SHIPMENT_ITEM_ID")
	private Integer shipmentItemId;

	public ShipmentItemHistory() {
		super();
	}
	
	public String getExternalHistoryId() {
		return this.externalHistoryId;
	}

	public void setExternalHistoryId(String externalHistoryId) {
		this.externalHistoryId = externalHistoryId;
	}

	public String getActionType() {
		return this.actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public Date getShipmentItemHistoryDate() {
		return this.shipmentItemHistoryDate;
	}

	public void setShipmentItemHistoryDate(Date shipmentItemHistoryDate) {
		this.shipmentItemHistoryDate = shipmentItemHistoryDate;
	}

	public String getCurrentSiteCode() {
		return this.currentSiteCode;
	}

	public void setCurrentSiteCode(String currentSiteCode) {
		this.currentSiteCode = currentSiteCode;
	}

	public String getAreaType() {
		return this.areaType;
	}

	public void setAreaType(String areaType) {
		this.areaType = areaType;
	}

	public String getMessageText() {
		return this.messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getShipmentItemId() {
		return this.shipmentItemId;
	}

	public void setShipmentItemId(Integer shipmentItemId) {
		this.shipmentItemId = shipmentItemId;
	}

}
