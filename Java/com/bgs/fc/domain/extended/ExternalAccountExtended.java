package com.bgs.fc.domain.extended;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.ExternalAccountBase;

@Entity
@Table(name="fe_external_account")
public class ExternalAccountExtended extends ExternalAccountBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5518172524030018042L;

	@OneToMany(mappedBy="externalAccount", fetch = FetchType.EAGER)
	private Set<CustomerExtended> customerCollection;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "externalAccount")
	private Set<WebosExternalGroupExtended> externalGroupCollection;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "externalAccount")
	private Set<UserExtended> userCollection;
	
	public ExternalAccountExtended() {
		super();
	}

	public Set<CustomerExtended> getCustomerCollection() {
		return customerCollection;
	}

	public void setCustomerCollection(Set<CustomerExtended> customerCollection) {
		this.customerCollection = customerCollection;
	}

	public Set<WebosExternalGroupExtended> getExternalGroupCollection() {
		return externalGroupCollection;
	}

	public void setExternalGroupCollection(
			Set<WebosExternalGroupExtended> externalGroupCollection) {
		this.externalGroupCollection = externalGroupCollection;
	}

	public Set<UserExtended> getUserCollection() {
		return userCollection;
	}

	public void setUserCollection(Set<UserExtended> userCollection) {
		this.userCollection = userCollection;
	}

}
