package com.bgs.fc.domain.extended;

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
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.CustomerBase;

@Entity
@Table(name="customer")
public class CustomerExtended extends CustomerBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6915400814455304870L;
	
	@ManyToOne
	@JoinColumn(name="fe_external_account_id")
	private ExternalAccountExtended externalAccount;

	public CustomerExtended() {
		super();
	}

	public ExternalAccountExtended getExternalAccount() {
		return externalAccount;
	}

	public void setExternalAccount(ExternalAccountExtended externalAccount) {
		this.externalAccount = externalAccount;
	}

}
