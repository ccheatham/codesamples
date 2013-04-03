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
@Table(name="qvcuk_vendor")
public class QvcukVendor extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4446207365855963238L;

	@Id
	@Column(name="vendor_name")
	private String vendorName;

	public QvcukVendor() {
		super();
	}

	public String getVendorName() {
		return this.vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

}
