package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class InternalGroupBase extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4114537935111735285L;

	@Id
	@GeneratedValue
	private Long id;

	private String label;

	@Column(name="site_code")
	private String siteCode;

	private String description;

	public InternalGroupBase() {
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

	public String getSiteCode() {
		return this.siteCode;
	}

	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
