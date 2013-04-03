package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class CustomerBase extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1913795000824554569L;

	@Id
	@Column(name="CUSTOMER_ID")
	private Long customerId;

	@Column(name="RISK_CODE")
	private String riskCode;

	@Column(name="PREFERRED_CURRENCY")
	private String preferredCurrency;

	@Column(name="EMAIL_ADDRESS")
	private String emailAddress;

	@Column(name="ATLAS_LAST_UPDATED")
	private Date atlasLastUpdated;

	private String city;

	private String name;

	@Column(name="NOTIFY_PICKUP_VIA_EMAIL")
	private String notifyPickupViaEmail;

	@Column(name="NOTIFY_SHIPPER_VIA_EMAIL")
	private String notifyShipperViaEmail;

	@Column(name="FAX_NUMBER")
	private String faxNumber;

	@Column(name="USER_ID")
	private String userId;

	@Column(name="PROVINCE_CODE")
	private String provinceCode;

	@Column(name="INVOICE_CUSTOMER_ID")
	private Long invoiceCustomerId;

	@Column(name="DATE_CREATED")
	private Date dateCreated;

	@Column(name="NOTIFY_EMAIL_ADDRESS")
	private String notifyEmailAddress;

	@Column(name="POSTAL_CODE")
	private String postalCode;

	@Column(name="CLASS_CODE")
	private String classCode;

	@Column(name="NOTIFY_DELIVERY_VIA_EMAIL")
	private String notifyDeliveryViaEmail;

	@Column(name="SITE_ID")
	private Long siteId;

	private String address1;

	@Column(name="NOTIFY_CONSIGNEE_VIA_EMAIL")
	private String notifyConsigneeViaEmail;

	private String address2;

	private String address4;

	@Column(name="BATCH_UPDATE_DATE")
	private Date batchUpdateDate;

	@Column(name="LAST_UPDATED")
	private Date lastUpdated;

	@Column(name="ATLAS_LAST_UPDATED_USER")
	private String atlasLastUpdatedUser;

	@Column(name="COUNTRY_CODE")
	private String countryCode;

	@Column(name="TAX_ID")
	private String taxId;

	@Column(name="GLOBAL_CUSTOMER_CODE")
	private String globalCustomerCode;

	@Column(name="PHONE_NUMBER")
	private String phoneNumber;

	private String address3;

	public CustomerBase() {
		super();
	}

	public Long getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getRiskCode() {
		return this.riskCode;
	}

	public void setRiskCode(String riskCode) {
		this.riskCode = riskCode;
	}

	public String getPreferredCurrency() {
		return this.preferredCurrency;
	}

	public void setPreferredCurrency(String preferredCurrency) {
		this.preferredCurrency = preferredCurrency;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public Date getAtlasLastUpdated() {
		return this.atlasLastUpdated;
	}

	public void setAtlasLastUpdated(Date atlasLastUpdated) {
		this.atlasLastUpdated = atlasLastUpdated;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotifyPickupViaEmail() {
		return this.notifyPickupViaEmail;
	}

	public void setNotifyPickupViaEmail(String notifyPickupViaEmail) {
		this.notifyPickupViaEmail = notifyPickupViaEmail;
	}

	public String getNotifyShipperViaEmail() {
		return this.notifyShipperViaEmail;
	}

	public void setNotifyShipperViaEmail(String notifyShipperViaEmail) {
		this.notifyShipperViaEmail = notifyShipperViaEmail;
	}

	public String getFaxNumber() {
		return this.faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public Long getInvoiceCustomerId() {
		return this.invoiceCustomerId;
	}

	public void setInvoiceCustomerId(Long invoiceCustomerId) {
		this.invoiceCustomerId = invoiceCustomerId;
	}

	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getNotifyEmailAddress() {
		return this.notifyEmailAddress;
	}

	public void setNotifyEmailAddress(String notifyEmailAddress) {
		this.notifyEmailAddress = notifyEmailAddress;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getClassCode() {
		return this.classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getNotifyDeliveryViaEmail() {
		return this.notifyDeliveryViaEmail;
	}

	public void setNotifyDeliveryViaEmail(String notifyDeliveryViaEmail) {
		this.notifyDeliveryViaEmail = notifyDeliveryViaEmail;
	}

	public Long getSiteId() {
		return this.siteId;
	}

	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getNotifyConsigneeViaEmail() {
		return this.notifyConsigneeViaEmail;
	}

	public void setNotifyConsigneeViaEmail(String notifyConsigneeViaEmail) {
		this.notifyConsigneeViaEmail = notifyConsigneeViaEmail;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress4() {
		return this.address4;
	}

	public void setAddress4(String address4) {
		this.address4 = address4;
	}

	public Date getBatchUpdateDate() {
		return this.batchUpdateDate;
	}

	public void setBatchUpdateDate(Date batchUpdateDate) {
		this.batchUpdateDate = batchUpdateDate;
	}

	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getAtlasLastUpdatedUser() {
		return this.atlasLastUpdatedUser;
	}

	public void setAtlasLastUpdatedUser(String atlasLastUpdatedUser) {
		this.atlasLastUpdatedUser = atlasLastUpdatedUser;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getTaxId() {
		return this.taxId;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	public String getGlobalCustomerCode() {
		return this.globalCustomerCode;
	}

	public void setGlobalCustomerCode(String globalCustomerCode) {
		this.globalCustomerCode = globalCustomerCode;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress3() {
		return this.address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

}
