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

import com.bgs.fc.mappedsuperclass.WebosInternalGroupParameterBase;

@Entity
@Table(name="fe_webos_internal_group_parameter")
public class WebosInternalGroupParameterExtended extends WebosInternalGroupParameterBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9143213567009941343L;

	@ManyToOne
	@JoinColumn(name="fe_internal_group_id")
	private InternalGroupExtended internalGroup;

	public WebosInternalGroupParameterExtended() {
		super();
	}

	public InternalGroupExtended getInternalGroup() {
		return internalGroup;
	}

	public void setInternalGroup(InternalGroupExtended internalGroup) {
		this.internalGroup = internalGroup;
	}

}
