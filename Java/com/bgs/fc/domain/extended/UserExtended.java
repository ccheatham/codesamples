package com.bgs.fc.domain.extended;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.domain.Customer;
import com.bgs.fc.domain.WebosMenuItem;
import com.bgs.fc.domain.WebosUserParameter;
import com.bgs.fc.mappedsuperclass.UserBase;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

@Entity
@Table(name="fe_user")
public class UserExtended extends UserBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3679943856030253811L;

	@OneToMany(mappedBy="user", fetch = FetchType.EAGER)
	private Set<WebosUserParameter> webosUserParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_webos_external_group",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_external_group_id"))
	private Set<WebosExternalGroupExtended> webosExternalGroupCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_bits_customer",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="bits_customer_id"))
	private Set<Customer> customerCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_internal_group", 
		joinColumns = @JoinColumn(name = "fe_user_id", referencedColumnName = "id"), 
		inverseJoinColumns = @JoinColumn(name = "fe_internal_group_id", referencedColumnName = "id"))
	private Set<InternalGroupExtended> internalGroupCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItemExtended> webosMenuItemCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_webos_menu_item_recent",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItem> recentWebosMenuItemCollection;
	
	@ManyToOne
	@JoinColumn(name="fe_external_account_id")
	private ExternalAccountExtended externalAccount;

	public UserExtended() {
		super();
	}

	public Set<WebosUserParameter> getWebosUserParameterCollection() {
		return this.webosUserParameterCollection;
	}

	public void setWebosUserParameterCollection(Set<WebosUserParameter> feWebosUserParameterCollection) {
		this.webosUserParameterCollection = feWebosUserParameterCollection;
	}

	public Set<WebosExternalGroupExtended> getWebosExternalGroupCollection() {
		return this.webosExternalGroupCollection;
	}

	public void setWebosExternalGroupCollection(Set<WebosExternalGroupExtended> feWebosExternalGroupCollection) {
		this.webosExternalGroupCollection = feWebosExternalGroupCollection;
	}

	public Set<Customer> getCustomerCollection() {
		return this.customerCollection;
	}

	public void setCustomerCollection(Set<Customer> customerCollection) {
		this.customerCollection = customerCollection;
	}

	public Set<InternalGroupExtended> getInternalGroupCollection() {
		return this.internalGroupCollection;
	}

	public void setInternalGroupCollection(Set<InternalGroupExtended> feInternalGroupCollection) {
		this.internalGroupCollection = feInternalGroupCollection;
	}

	public Set<WebosMenuItemExtended> getWebosMenuItemCollection() {
		return webosMenuItemCollection;
	}

	public void setWebosMenuItemCollection(
			Set<WebosMenuItemExtended> webosMenuItemCollection) {
		this.webosMenuItemCollection = webosMenuItemCollection;
	}
	
	public ExternalAccountExtended getExternalAccount() {
		return externalAccount;
	}

	public void setExternalAccount(ExternalAccountExtended externalAccount) {
		this.externalAccount = externalAccount;
	}

	public Set<WebosMenuItem> getRecentWebosMenuItemCollection() {
		return recentWebosMenuItemCollection;
	}

	public void setRecentWebosMenuItemCollection(
			Set<WebosMenuItem> recentWebosMenuItemCollection) {
		this.recentWebosMenuItemCollection = recentWebosMenuItemCollection;
	}

}
