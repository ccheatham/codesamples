package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.ExternalAccountBase;

@Entity
@Table(name="fe_external_account")
public class ExternalAccount extends ExternalAccountBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5518172524030018042L;

	public ExternalAccount() {
		super();
	}

}
