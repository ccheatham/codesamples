package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="GARCIA_ROUTES")
public class GarciaRoutes extends AtlasBase implements Serializable {
	
	private static final long serialVersionUID = -3925532749202366518L;

	@Id
	@Column(name="route_code")
	private String routeCode;

	@Column(name="site_code")
	private String siteCode;

	private String description;
	
	private String active;
	
	@ManyToMany(targetEntity=PostalCode.class, cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@OrderBy("postalCode asc")
	@JoinTable(joinColumns = @JoinColumn(name = "route_code", referencedColumnName = "route_code"), inverseJoinColumns = @JoinColumn(name = "postal_code", referencedColumnName = "postal_code"), name = "GARCIA_ROUTE_POSTAL_CODE")
	private Set postalCodes;

	public GarciaRoutes() {
		super();
	}

	public String getRouteCode() {
		return this.routeCode;
	}

	public void setRouteCode(String routeCode) {
		this.routeCode = routeCode;
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

	public Set getPostalCodes() {
		return postalCodes;
	}

	public void setPostalCodes(Set postalCodes) {
		this.postalCodes = postalCodes;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

}
