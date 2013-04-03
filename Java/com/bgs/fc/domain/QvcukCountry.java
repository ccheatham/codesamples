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
import javax.persistence.Id;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="qvcuk_country")
public class QvcukCountry extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4572628402333232954L;

	@Id
	@Column(name="country_name")
	private String countryName;

	public QvcukCountry() {
		super();
	}

	public String getCountryName() {
		return this.countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

}
