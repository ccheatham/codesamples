package com.bgs.fc.domain.extended;

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
public class WebosMenuItemParameterExtended extends WebosMenuItemParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5871074864021965301L;

	@ManyToOne
	@JoinColumn(name="fe_webos_menu_item_id")
	private WebosMenuItemExtended webosMenuItem;

	public WebosMenuItemParameterExtended() {
		super();
	}

	public WebosMenuItemExtended getWebosMenuItem() {
		return webosMenuItem;
	}

	public void setWebosMenuItem(WebosMenuItemExtended webosMenuItem) {
		this.webosMenuItem = webosMenuItem;
	}

}
