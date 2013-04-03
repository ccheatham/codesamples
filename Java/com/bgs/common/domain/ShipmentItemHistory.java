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
@Table(name="SHIPMENT_ITEM_HISTORY")
public class ShipmentItemHistory extends com.bgs.common.mappedsuperclass.ShipmentItemHistory implements Serializable {
	private static final long serialVersionUID = -334852812810264081L;

	public ShipmentItemHistory() {
		super();
	}

}
