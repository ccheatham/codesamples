package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class ExternalAccountBase extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9076582080577709874L;

	@Id
	@GeneratedValue
	private Long id;

	private String label;
	
	public ExternalAccountBase() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
