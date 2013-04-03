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
public class ShipmentItem extends com.bgs.common.mappedsuperclass.ShipmentItem implements Serializable {
	private static final long serialVersionUID = -379103347575136133L;

	public ShipmentItem() {
		super();
	}
	
	
}
