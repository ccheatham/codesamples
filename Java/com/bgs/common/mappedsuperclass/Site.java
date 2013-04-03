package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class Site extends SiteBase implements Serializable {
	
	private static final long serialVersionUID = -1008922907676082690L;

	private String address2;

	@Column(name="PHONE_NUMBER")
	private String phoneNumber;

	@Column(name="CITY_CODE")
	private String cityCode;

	@Column(name="SERVER_ID")
	private String serverId;

	private String address1;

	@Column(name="POSTAL_CODE")
	private String postalCode;

	@Column(name="GARCIA_MAP_X")
	private BigDecimal garciaMapX;

	@Column(name="EMAIL_ADDRESS")
	private String emailAddress;

	@Column(name="OUTBOUND_RECIPIENT")
	private String outboundRecipient;

	private String address3;

	private String timezone;

	@Column(name="COUNTRY_CODE")
	private String countryCode;

	@Column(name="CUSTOMER_SYNC_GROUP")
	private String customerSyncGroup;

	@Column(name="MANAGEMENT_SITE_CODE")
	private String managementSiteCode;

	@Column(name="PROVINCE_CODE")
	private String provinceCode;

	@Column(name="INBOUND_RECIPIENT")
	private String inboundRecipient;

	
	private String address4;

	@Column(name="HUB_SITE_CODE")
	private String hubSiteCode;

	@Column(name="FAX_NUMBER")
	private String faxNumber;

	@Column(name="CENTRAL_TABLE_MANAGEMENT")
	private String centralTableManagement;

	@Column(name="FTP_FOLDER")
	private String ftpFolder;

	@Column(name="GARCIA_MAP_Y")
	private BigDecimal garciaMapY;

	@Column(name="CUSTOMER_ID")
	private BigDecimal customerId;

	@Column(name="airclic_flag")
	private String airclicFlag;

	@Column(name="primary_airport_code")
	private String primaryAirportCode;
	
	public Site() {
		super();
	}
	
	
//	Getters n Setters
	
	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCityCode() {
		return this.cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getServerId() {
		return this.serverId;
	}

	public void setServerId(String serverId) {
		this.serverId = serverId;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public BigDecimal getGarciaMapX() {
		return this.garciaMapX;
	}

	public void setGarciaMapX(BigDecimal garciaMapX) {
		this.garciaMapX = garciaMapX;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getOutboundRecipient() {
		return this.outboundRecipient;
	}

	public void setOutboundRecipient(String outboundRecipient) {
		this.outboundRecipient = outboundRecipient;
	}

	public String getAddress3() {
		return this.address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getTimezone() {
		return this.timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCustomerSyncGroup() {
		return this.customerSyncGroup;
	}

	public void setCustomerSyncGroup(String customerSyncGroup) {
		this.customerSyncGroup = customerSyncGroup;
	}

	public String getManagementSiteCode() {
		return this.managementSiteCode;
	}

	public void setManagementSiteCode(String managementSiteCode) {
		this.managementSiteCode = managementSiteCode;
	}

	public String getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getInboundRecipient() {
		return this.inboundRecipient;
	}

	public void setInboundRecipient(String inboundRecipient) {
		this.inboundRecipient = inboundRecipient;
	}
	
	public String getAddress4() {
		return this.address4;
	}

	public void setAddress4(String address4) {
		this.address4 = address4;
	}

	public String getHubSiteCode() {
		return this.hubSiteCode;
	}

	public void setHubSiteCode(String hubSiteCode) {
		this.hubSiteCode = hubSiteCode;
	}

	public String getFaxNumber() {
		return this.faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getCentralTableManagement() {
		return this.centralTableManagement;
	}

	public void setCentralTableManagement(String centralTableManagement) {
		this.centralTableManagement = centralTableManagement;
	}

	public String getFtpFolder() {
		return this.ftpFolder;
	}

	public void setFtpFolder(String ftpFolder) {
		this.ftpFolder = ftpFolder;
	}

	public BigDecimal getGarciaMapY() {
		return this.garciaMapY;
	}

	public void setGarciaMapY(BigDecimal garciaMapY) {
		this.garciaMapY = garciaMapY;
	}

	public BigDecimal getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(BigDecimal customerId) {
		this.customerId = customerId;
	}
	
	public String getAirclicFlag () {
		return this.airclicFlag;
	}
	
	public void setAirclicFlag(String airclicFlag){
		this.airclicFlag = airclicFlag;
	}

	public String getPrimaryAirportCode() {
		return primaryAirportCode;
	}

	public void setPrimaryAirportCode(String primaryAirportCode) {
		this.primaryAirportCode = primaryAirportCode;
	}

}
