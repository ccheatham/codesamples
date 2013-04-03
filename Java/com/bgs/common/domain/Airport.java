package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache (usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Airport extends com.bgs.common.mappedsuperclass.Airport implements Serializable {
	private static final long serialVersionUID = 628915414482458066L;

	public Airport() {
		super();
	}

	
}
