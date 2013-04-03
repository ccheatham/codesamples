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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache (usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Table(name="SITE")
public class SiteBase extends com.bgs.common.mappedsuperclass.SiteBase implements Serializable {
	
	private static final long serialVersionUID = -647468749216201802L;

	public SiteBase() {
		super();
	}

	
}
