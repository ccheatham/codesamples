package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */


import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.search.annotations.Boost;
import org.hibernate.search.annotations.DateBridge;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Resolution;
import org.hibernate.search.annotations.Store;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Indexed
@Table(name="SHIPMENT")
public class Shipment extends AtlasBase implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3620377739710562183L;

	@Id
	@DocumentId
	@Column(name="shipment_id")
	@GeneratedValue
	private Long shipmentId;
	
	
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Boost(2)
	@Column(name="pickup_site_id")
	private Long pickupSiteId;
	
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="delivery_site_id")
	private String deliverySiteId;
	
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="consignee_customer_id")
	private Long consigneeCustomerId;
	
	@DateBridge(resolution=Resolution.MONTH)
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="date_created")
	private Date createdDate;
	
	@DateBridge(resolution=Resolution.MONTH)
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="last_updated")
	private Date updatedDate;
	
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="consignee_name")
	private String consigneeName;
	
	@Field(index=Index.TOKENIZED,store=Store.NO)
	@Column(name="shipper_name")
	private String shipperName;
	
	public Shipment() {
		super();
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getDeliverySiteId() {
		return deliverySiteId;
	}

	public void setDeliverySiteId(String deliverySiteId) {
		this.deliverySiteId = deliverySiteId;
	}

	public Long getPickupSiteId() {
		return pickupSiteId;
	}

	public void setPickupSiteId(Long pickupSiteId) {
		this.pickupSiteId = pickupSiteId;
	}

	public Long getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(Long shipmentId) {
		this.shipmentId = shipmentId;
	}

	public Long getConsigneeCustomerId() {
		return consigneeCustomerId;
	}

	public void setConsigneeCustomerId(Long consigneeCustomerId) {
		this.consigneeCustomerId = consigneeCustomerId;
	}

	public String getConsigneeName() {
		return consigneeName;
	}

	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}

	public String getShipperName() {
		return shipperName;
	}

	public void setShipperName(String shipperName) {
		this.shipperName = shipperName;
	}
	
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
}