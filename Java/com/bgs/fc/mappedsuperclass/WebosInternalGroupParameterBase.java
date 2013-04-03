package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.bgs.fc.domain.ParameterType;

@MappedSuperclass
public class WebosInternalGroupParameterBase extends AtlasBase implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2199118890830150721L;

	@Id
	@GeneratedValue
	private Long id;
	
	@Column(name = "extended_information")
	private String extendedInformation;
	
	@Column(name = "parameter_name")
	private String parameterName;
	
	@Column(name = "parameter_value")
	private String parameterValue;
	
	@ManyToOne
	@JoinColumn(name="fe_parameter_type_id")
	private ParameterType parameterType;

	public WebosInternalGroupParameterBase() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getExtendedInformation() {
		return this.extendedInformation;
	}

	public void setExtendedInformation(String extendedInformation) {
		this.extendedInformation = extendedInformation;
	}

	public String getParameterName() {
		return this.parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public String getParameterValue() {
		return this.parameterValue;
	}

	public void setParameterValue(String parameterValue) {
		this.parameterValue = parameterValue;
	}

	public ParameterType getParameterType() {
		return parameterType;
	}

	public void setParameterType(ParameterType parameterType) {
		this.parameterType = parameterType;
	}

}