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

import com.bgs.fc.mappedsuperclass.WebosExternalGroupParameterBase;

@Entity
@Table(name="fe_webos_external_group_parameter")
public class WebosExternalGroupParameter extends WebosExternalGroupParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6928364575744245048L;

	@ManyToOne
	@JoinColumn(name = "fe_webos_external_group_id")
	private WebosExternalGroup webosExternalGroup;
	
	public WebosExternalGroupParameter() {
		super();
	}
	
	public WebosExternalGroup getFeWebosExternalGroup() {
		return this.webosExternalGroup;
	}

	public void setFeWebosExternalGroup(WebosExternalGroup webosExternalGroup) {
		this.webosExternalGroup = webosExternalGroup;
	}

}
