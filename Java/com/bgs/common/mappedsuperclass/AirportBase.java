package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@MappedSuperclass
public class AirportBase extends AtlasBase implements Serializable {
	private static final long serialVersionUID = 8350995346109022366L;

	@Id
	@Column(name="airport_code")
	private String airportCode;

	public AirportBase() {
		super();
	}

	public String getAirportCode() {
		return this.airportCode;
	}

	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}

}
