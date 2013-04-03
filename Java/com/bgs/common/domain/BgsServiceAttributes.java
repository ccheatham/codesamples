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
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.CascadeType;

@Entity
@Table(name="BGS_SERVICE_ATTRIBUTES")
public class BgsServiceAttributes implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2381652455730295231L;

	@Id
	@GeneratedValue
	private Long id;

	@Column(name="service_type")
	private String serviceType;

	private String attribute;

	@Column(name="attribute_value")
	private String attributeValue;
	
	private String description;
	
	@Column(name="xml_field")
	private String xmlField;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="service_code", referencedColumnName = "service_code")
	private BgsServiceManager service;
	
	public BgsServiceAttributes() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getAttribute() {
		return this.attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getAttributeValue() {
		return this.attributeValue;
	}

	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	
	public BgsServiceManager getService() {
		return service;
	}

	public void setService(BgsServiceManager service) {
		this.service = service;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getXmlField() {
		return xmlField;
	}

	public void setXmlField(String xmlField) {
		this.xmlField = xmlField;
	}

}
