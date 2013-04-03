package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="qvcuk_roles")
public class QvcukRoles extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 71387827901229841L;

	@Id
	private String role;

	private String description;

	public QvcukRoles() {
		super();
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
