package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;


@Entity
@Table(name="fe_parameter_type")
public class ParameterType extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1023920291689585908L;

	@Id
	@GeneratedValue
	private Long id;
	
	private String label;
	
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
}
