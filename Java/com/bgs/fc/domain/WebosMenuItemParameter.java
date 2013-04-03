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

import com.bgs.fc.mappedsuperclass.WebosMenuItemParameterBase;

@Entity
@Table(name="fe_webos_menu_item_parameter")
public class WebosMenuItemParameter extends WebosMenuItemParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6700776901895267265L;
	
	@ManyToOne
	@JoinColumn(name="fe_webos_menu_item_id")
	private WebosMenuItem webosMenuItem;

	public WebosMenuItemParameter() {
		super();
	}

	public WebosMenuItem getWebosMenuItem() {
		return webosMenuItem;
	}

	public void setWebosMenuItem(WebosMenuItem webosMenuItem) {
		this.webosMenuItem = webosMenuItem;
	}

}
