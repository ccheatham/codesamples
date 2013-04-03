package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="SHIPMENT_ITEM")
public class ShipmentItemBase extends com.bgs.common.mappedsuperclass.ShipmentItemBase implements Serializable {
	private static final long serialVersionUID = 7151052804377353989L;
	
	public ShipmentItemBase() {
		super();
	}
	
}
