package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.WebosApplicationBase;

@Entity
@Table(name="fe_webos_application")
public class WebosApplication extends WebosApplicationBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8142356607012780113L;
	
	public WebosApplication() {
		super();
	}

}
