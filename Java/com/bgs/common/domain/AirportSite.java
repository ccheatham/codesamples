package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="airport_site")
public class AirportSite extends AtlasBase implements Serializable {
	private static final long serialVersionUID = 7543619330508364448L;

	@Id
	@Column(name="airport_site_id")
	private Integer airportSiteId;

	@Column(name="site_id")
	private Long siteId;

	@Column(name="site_code")
	private String siteCode;

	@Column(name="airport_code")
	private String airportCode;

	@Column(name="garcia_primary")
	private String garciaPrimary;

	public AirportSite() {
		super();
	}

	public long getAirportSiteId() {
		return this.airportSiteId;
	}

	public void setAirportSiteId(Integer airportSiteId) {
		this.airportSiteId = airportSiteId;
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

	public String getAirportCode() {
		return this.airportCode;
	}

	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}

	public String getGarciaPrimary() {
		return this.garciaPrimary;
	}

	public void setGarciaPrimary(String garciaPrimary) {
		this.garciaPrimary = garciaPrimary;
	}

}
