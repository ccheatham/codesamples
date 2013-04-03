package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.bgs.fc.mappedsuperclass.CustomerBase;

@Entity
public class Customer extends CustomerBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6540836151106801792L;
	
	@ManyToOne
	@JoinColumn(name="fe_external_account_id")
	private ExternalAccount externalAccount;

	public Customer() {
		super();
	}

	public ExternalAccount getExternalAccount() {
		return externalAccount;
	}

	public void setExternalAccount(ExternalAccount externalAccount) {
		this.externalAccount = externalAccount;
	}

}
