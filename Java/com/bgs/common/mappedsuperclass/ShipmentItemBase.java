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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import com.bgs.fc.ejb.webos.WebosException;
import com.bgs.fc.mappedsuperclass.AtlasBase;

@MappedSuperclass
public class ShipmentItemBase extends AtlasBase implements Serializable {
	private static final long serialVersionUID = 2668475367879877977L;

	@Id
	@Column(name="SHIPMENT_ITEM_ID")
	@GeneratedValue
	private Integer shipmentItemId;
	
	@Column(name="barcode")
	private String barcode;
	
	@Column(name="route_code")
	private String routeCode;
	
	@Column(name="service_order_number")
	private String serviceOrderNumber;

	
	public ShipmentItemBase() {
		super();
	}

	public Integer getShipmentItemId() {
		return this.shipmentItemId;
	}

	public void setShipmentItemId(Integer shipmentItemId) {
		this.shipmentItemId = shipmentItemId;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	
	@PreUpdate
	@PrePersist
	void beforeShipmentItemBaseUpdate()
	{
		if (this.barcode == null || (this.barcode != null && this.barcode.length() == 0))
		{
			throw new WebosException("Shipment Item does not contain a valid barcode.  Cannot be updated or persisted to the database.",this);
		}
		
	}

	public String getRouteCode() {
		return routeCode;
	}

	public void setRouteCode(String routeCode) {
		if(routeCode.equals("")){
			routeCode = null;
		}
		this.routeCode = routeCode;
	}

	public String getServiceOrderNumber() {
		return serviceOrderNumber;
	}

	public void setServiceOrderNumber(String serviceOrderNumber) {
		this.serviceOrderNumber = serviceOrderNumber;
	}

}
