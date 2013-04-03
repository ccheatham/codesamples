package com.bgs.fc.domain.extended;

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
public class WebosApplicationExtended extends WebosApplicationBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 592616133549820422L;

	public WebosApplicationExtended() {
		super();
	}

}
