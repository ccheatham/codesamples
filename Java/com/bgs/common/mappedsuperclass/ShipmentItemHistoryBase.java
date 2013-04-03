package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@MappedSuperclass
public class ShipmentItemHistoryBase extends AtlasBase implements Serializable {
	private static final long serialVersionUID = 5711677353700161139L;
	
	@Id
	@Column(name="SHIPMENT_ITEM_HISTORY_ID")
	@GeneratedValue
	private Long shipmentItemHistoryId;
	
	public ShipmentItemHistoryBase() {
		super();
	}

	public long getShipmentItemHistoryId() {
		return this.shipmentItemHistoryId;
	}

	public void setShipmentItemHistoryId(long shipmentItemHistoryId) {
		this.shipmentItemHistoryId = shipmentItemHistoryId;
	}

	

}
