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
public class ShipmentItemHistoryBase extends com.bgs.common.mappedsuperclass.ShipmentItemHistoryBase implements Serializable {
	private static final long serialVersionUID = -2414963831798025569L;

	public ShipmentItemHistoryBase() {
		super();
	}

	

}
