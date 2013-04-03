package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.CascadeType;

@Entity
@Table(name="BGS_SERVICE_MANAGER")
public class BgsServiceManager implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5668453677780885849L;

	
	@Id
	@Column(name="service_id")
	@GeneratedValue
	private Long serviceId;

	@Column(name="service_name")
	private String serviceName;
	
	@Column(name="service_type")
	private String serviceType;

	@Column(name="timeout_interval_type")
	private String timeoutIntervalType;
	
	@Column(name="timeout_interval")
	private Integer timeoutInterval;
	
	@Column(name="start_interval")
	private Integer startInterval;

	@Column(name="service_code")
	private String serviceCode;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "service", cascade = CascadeType.ALL)
	private Set <BgsServiceAttributes> attributes;
		
	@Column(name="start_date")
	private String startDate;
	
	private String description;
	
	public BgsServiceManager() {
		super();
	}

	public Long getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	
	public String getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	
	public String getServiceName() {
		return this.serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Integer getTimeoutInterval() {
		return this.timeoutInterval;
	}

	public void setTimeoutInterval(Integer timeoutInterval) {
		if (this.timeoutInterval == null){
			this.timeoutInterval = 0;
		}
		this.timeoutInterval = timeoutInterval;
	}

	public Integer getStartInterval() {
		return this.startInterval;
	}

	public void setStartInterval(Integer startInterval) {
		if (this.startInterval == null){
			this.startInterval = 0;
		}
		this.startInterval = startInterval;
	}

	public String getServiceCode() {
		return this.serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getTimeoutIntervalType() {
		return timeoutIntervalType;
	}

	public void setTimeoutIntervalType(String timeoutIntervalType) {
		this.timeoutIntervalType = timeoutIntervalType;
	}

	public Set<BgsServiceAttributes> getAttributes() {
		return attributes;
	}

	public void setAttributes(Set<BgsServiceAttributes> attributes) {
		this.attributes = attributes;
	}

}
