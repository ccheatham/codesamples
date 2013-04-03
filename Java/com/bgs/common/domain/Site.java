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
public class Site extends com.bgs.common.mappedsuperclass.Site implements Serializable {
	
	
	private static final long serialVersionUID = -6069604722463467335L;

	public Site() {
		super();
	}
	
	
}
