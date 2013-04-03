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
@Table(name="AIRPORT")
public class AirportBase extends com.bgs.common.mappedsuperclass.AirportBase implements Serializable {
	private static final long serialVersionUID = -1449958628430711668L;
	
	public AirportBase() {
		super();
	}

}
