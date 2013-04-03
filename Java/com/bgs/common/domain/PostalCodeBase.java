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
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="POSTAL_CODE")
public class PostalCodeBase extends AtlasBase implements Serializable {

	private static final long serialVersionUID = 5226236096441236380L;

	@Id
	@Column(name="postal_code")
	private String postalCode;
	
	@Column(name="country_code")
	private String countryCode;

	@Column(name="service_days")
	private Integer serviceDays;

	@Column(name="site_id")
	private Integer siteId;

	private String city;

	@Column(name="delivery_code")
	private String deliveryCode;

	@Column(name="province_code")
	private String provinceCode;

	@Column(name="delivery_charge")
	private BigDecimal deliveryCharge;

	private String comments;

	@Column(name="connection_city_postal_code")
	private String connectionCityPostalCode;
	
	@Column(name="send_to_sites_flag")
	private String sendToSitesFlag;
	
	@Column(name="on_off_route")
	private String onOffRoute;
	
	public PostalCodeBase() {
		super();
	}
	
	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public int getServiceDays() {
		return this.serviceDays;
	}

	public void setServiceDays(int serviceDays) {
		this.serviceDays = serviceDays;
	}

	public int getSiteId() {
		return this.siteId;
	}

	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDeliveryCode() {
		return this.deliveryCode;
	}

	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}

	public String getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public BigDecimal getDeliveryCharge() {
		return this.deliveryCharge;
	}

	public void setDeliveryCharge(BigDecimal deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getConnectionCityPostalCode() {
		return this.connectionCityPostalCode;
	}

	public void setConnectionCityPostalCode(String connectionCityPostalCode) {
		this.connectionCityPostalCode = connectionCityPostalCode;
	}

	public void setServiceDays(Integer serviceDays) {
		this.serviceDays = serviceDays;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getOnOffRoute() {
		return onOffRoute;
	}

	public void setOnOffRoute(String onOffRoute) {
		this.onOffRoute = onOffRoute;
	}

	public String getSendToSitesFlag() {
		return sendToSitesFlag;
	}

	public void setSendToSitesFlag(String sendToSitesFlag) {
		this.sendToSitesFlag = sendToSitesFlag;
	}

}
