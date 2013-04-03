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
public class WebosExternalGroupBase extends AtlasBase implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7605025025746789904L;

	@Id
	@GeneratedValue
	private Long id;
	
	private String label;
	
	@Column(name = "site_id")
	private String siteId;

	public WebosExternalGroupBase() {
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

	public String getSiteId() {
		return this.siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

}