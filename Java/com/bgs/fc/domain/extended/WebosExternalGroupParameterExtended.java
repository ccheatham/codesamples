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

import com.bgs.fc.mappedsuperclass.WebosExternalGroupParameterBase;

@Entity
@Table(name="fe_webos_external_group_parameter")
public class WebosExternalGroupParameterExtended extends WebosExternalGroupParameterBase  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6928364575744245048L;

	@ManyToOne
	@JoinColumn(name="fe_webos_external_group_id")
	private WebosExternalGroupExtended webosExternalGroup;

	public WebosExternalGroupParameterExtended() {
		super();
	}

	public WebosExternalGroupExtended getWebosExternalGroup() {
		return webosExternalGroup;
	}

	public void setWebosExternalGroup(WebosExternalGroupExtended webosExternalGroup) {
		this.webosExternalGroup = webosExternalGroup;
	}

}
