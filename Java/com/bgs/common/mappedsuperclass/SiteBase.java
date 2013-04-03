package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.bgs.fc.mappedsuperclass.AtlasBase;


@MappedSuperclass
public class SiteBase extends AtlasBase implements Serializable {
	
	private static final long serialVersionUID = -7380074032287865246L;

	@Id
	@Column(name="SITE_ID")
	private Long siteId;
	
	@Column(name="SITE_CODE")
	private String siteCode;
	
	@Column(name="GARCIA_IP")
	private String garciaIp;
	
	@Column(name="GA_BRANCH_CODE")
	private String gaBranchCode;
	
	private String description;
	
	private String city;
	
	public SiteBase() {
		super();
	}

/* Getters / Setters */
	
	
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Long getSiteId() {
		return this.siteId;
	}

	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}

	public String getSiteCode() {
		return this.siteCode;
	}
	
	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}

	public String getGarciaIp() {
		return garciaIp;
	}

	public void setGarciaIp(String garciaIp) {
		this.garciaIp = garciaIp;
	}

	public String getGaBranchCode() {
		return gaBranchCode;
	}

	public void setGaBranchCode(String gaBranchCode) {
		this.gaBranchCode = gaBranchCode;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
