package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.WebosWindowParameterBase;

@Entity
@Table(name="fe_webos_window_parameter")
public class WebosWindowParameter extends WebosWindowParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3639941851737331402L;
	
	@ManyToOne
	@JoinColumn(name="fe_webos_window_id")
	private WebosWindow webosWindow;

	public WebosWindowParameter() {
		super();
	}

	public WebosWindow getWebosWindow() {
		return webosWindow;
	}

	public void setWebosWindow(WebosWindow webosWindow) {
		this.webosWindow = webosWindow;
	}

}
