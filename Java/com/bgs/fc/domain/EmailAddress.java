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
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="fe_email_address")
public class EmailAddress extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1296397412565366008L;

	@Id
	@GeneratedValue
	private Long id;

	@Column(name="email_address")
	private String emailAddress;

	public EmailAddress() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

}
