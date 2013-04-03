package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Cache (usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Country extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2277612464204095429L;

	@Id
	@Column(name="country_code")
	private String countryCode;

	private String ec;

	@Column(name="description_nls")
	private String descriptionNls;

	private String description;

	@Column(name="country_code_nls")
	private String countryCodeNls;

	@Column(name="region_id")
	private BigDecimal regionId;

	@Column(name="iso_number")
	private String isoNumber;

	@Column(name="iso_code")
	private String isoCode;

	

	public Country() {
		super();
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getEc() {
		return this.ec;
	}

	public void setEc(String ec) {
		this.ec = ec;
	}

	public String getDescriptionNls() {
		return this.descriptionNls;
	}

	public void setDescriptionNls(String descriptionNls) {
		this.descriptionNls = descriptionNls;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCountryCodeNls() {
		return this.countryCodeNls;
	}

	public void setCountryCodeNls(String countryCodeNls) {
		this.countryCodeNls = countryCodeNls;
	}

	public BigDecimal getRegionId() {
		return this.regionId;
	}

	public void setRegionId(BigDecimal regionId) {
		this.regionId = regionId;
	}

	public String getIsoNumber() {
		return this.isoNumber;
	}

	public void setIsoNumber(String isoNumber) {
		this.isoNumber = isoNumber;
	}

	public String getIsoCode() {
		return this.isoCode;
	}

	public void setIsoCode(String isoCode) {
		this.isoCode = isoCode;
	}

}
