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

import com.bgs.fc.mappedsuperclass.WebosInternalGroupParameterBase;

@Entity
@Table(name="fe_webos_internal_group_parameter")
public class WebosInternalGroupParameter extends WebosInternalGroupParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 493011104916200192L;

	@ManyToOne
	@JoinColumn(name = "fe_internal_group_id")
	private InternalGroup internalGroup;
	
	public WebosInternalGroupParameter() {
		super();
	}
	
	public InternalGroup getFeInternalGroup() {
		return this.internalGroup;
	}

	public void setFeInternalGroup(InternalGroup internalGroup) {
		this.internalGroup = internalGroup;
	}

}
