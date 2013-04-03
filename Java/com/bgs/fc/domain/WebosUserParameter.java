package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="fe_webos_user_parameter")
public class WebosUserParameter extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8834250575528387509L;

	@Id
	@GeneratedValue
	private Long id;

	@Column(name="application_name")
	private String applicationName;

	@Column(name="extended_information")
	private String extendedInformation;

	@Column(name="parameter_value")
	private String parameterValue;

	@Column(name="parameter_name")
	private String parameterName;
	
	@ManyToOne
	@JoinColumn(name="fe_parameter_type_id")
	private ParameterType parameterType;

	@ManyToOne
	@JoinColumn(name="fe_user_id")
	private User user;

	public WebosUserParameter() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getApplicationName() {
		return this.applicationName;
	}

	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}

	public String getExtendedInformation() {
		return this.extendedInformation;
	}

	public void setExtendedInformation(String extendedInformation) {
		this.extendedInformation = extendedInformation;
	}

	public String getParameterValue() {
		return this.parameterValue;
	}

	public void setParameterValue(String parameterValue) {
		this.parameterValue = parameterValue;
	}

	public String getParameterName() {
		return this.parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ParameterType getParameterType() {
		return parameterType;
	}

	public void setParameterType(ParameterType parameterType) {
		this.parameterType = parameterType;
	}

}
