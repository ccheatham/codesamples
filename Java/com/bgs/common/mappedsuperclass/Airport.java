package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class Airport extends AirportBase implements Serializable {
	private static final long serialVersionUID = 3835354829316371743L;

	@Column(name="fax_number")
	private String faxNumber;

	@Column(name="sea_port_type")
	private String seaPortType;

	@Column(name="mode_validation")
	private String modeValidation;

	@Column(name="customs_port_code")
	private String customsPortCode;

	@Column(name="mode_of_transportation")
	private String modeOfTransportation;

	@Column(name="customs_range_end")
	private Integer customsRangeEnd;

	@Column(name="province_code")
	private String provinceCode;

	@Column(name="local_monitoring_flag")
	private String localMonitoringFlag;

	@Column(name="site_id")
	private Integer siteId;

	@Column(name="begin_subcontractor_date")
	private Date beginSubcontractorDate;

	@Column(name="phone_number")
	private String phoneNumber;

	private String description;

	private String gateway;

	@Column(name="country_code")
	private String countryCode;

	@Column(name="department_code")
	private String departmentCode;

	@Column(name="customs_range_start")
	private Integer customsRangeStart;

	private String city;

	@Column(name="end_subcontractor_date")
	private Date endSubcontractorDate;
	
	@Column(name="harrt_international_direct")
	private String harrtInternationalDirect;
	
	@Transient
	private String primaryAirportFlag;

	/* Add this if we need to know flight defaults per airport
	 * @OneToMany(mappedBy="origin")
	private Set<GarciaFlightDefaults> garciaFlightDefaultsCollection;*/

	public Airport() {
		super();
	}

	public String getFaxNumber() {
		return this.faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getSeaPortType() {
		return this.seaPortType;
	}

	public void setSeaPortType(String seaPortType) {
		this.seaPortType = seaPortType;
	}

	public String getModeValidation() {
		return this.modeValidation;
	}

	public void setModeValidation(String modeValidation) {
		this.modeValidation = modeValidation;
	}

	public String getCustomsPortCode() {
		return this.customsPortCode;
	}

	public void setCustomsPortCode(String customsPortCode) {
		this.customsPortCode = customsPortCode;
	}

	public String getModeOfTransportation() {
		return this.modeOfTransportation;
	}

	public void setModeOfTransportation(String modeOfTransportation) {
		this.modeOfTransportation = modeOfTransportation;
	}

	public Integer getCustomsRangeEnd() {
		return this.customsRangeEnd;
	}

	public void setCustomsRangeEnd(int customsRangeEnd) {
		this.customsRangeEnd = customsRangeEnd;
	}

	public String getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getLocalMonitoringFlag() {
		return this.localMonitoringFlag;
	}

	public void setLocalMonitoringFlag(String localMonitoringFlag) {
		this.localMonitoringFlag = localMonitoringFlag;
	}

	public int getSiteId() {
		return this.siteId;
	}

	public void setSiteId(int siteId) {
		if (siteId == 0)
			this.siteId = null;
		else
			this.siteId = siteId;
	}

	public Date getBeginSubcontractorDate() {
		return this.beginSubcontractorDate;
	}

	public void setBeginSubcontractorDate(Date beginSubcontractorDate) {
		this.beginSubcontractorDate = beginSubcontractorDate;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGateway() {
		return this.gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getDepartmentCode() {
		return this.departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public Integer getCustomsRangeStart() {
		return this.customsRangeStart;
	}

	public void setCustomsRangeStart(int customsRangeStart) {
		this.customsRangeStart = customsRangeStart;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getEndSubcontractorDate() {
		return this.endSubcontractorDate;
	}

	public void setEndSubcontractorDate(Date endSubcontractorDate) {
		this.endSubcontractorDate = endSubcontractorDate;
	}

	public String getPrimaryAirportFlag() {
		return primaryAirportFlag;
	}

	public void setPrimaryAirportFlag(String primaryAirportFlag) {
		this.primaryAirportFlag = primaryAirportFlag;
	}

	public String getHarrtInternationalDirect() {
		return harrtInternationalDirect;
	}

	public void setHarrtInternationalDirect(String harrtInternationalDirect) {
		this.harrtInternationalDirect = harrtInternationalDirect;
	}
	
	/*public Set<GarciaFlightDefaults> getGarciaFlightDefaultsCollection() {
		return this.garciaFlightDefaultsCollection;
	}

	public void setGarciaFlightDefaultsCollection(Set<GarciaFlightDefaults> garciaFlightDefaultsCollection) {
		this.garciaFlightDefaultsCollection = garciaFlightDefaultsCollection;
	}*/

}
