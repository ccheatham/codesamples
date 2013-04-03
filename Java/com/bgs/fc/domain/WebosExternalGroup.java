package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.WebosExternalGroupBase;
import javax.persistence.FetchType;

@Entity
@Table(name="fe_webos_external_group")
public class WebosExternalGroup extends WebosExternalGroupBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4004166536549467509L;

	@OneToMany(mappedBy="webosExternalGroup", fetch = FetchType.EAGER)
	private Set<WebosExternalGroupParameter> webosExternalGroupParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_webos_external_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_external_group_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItem> webosMenuItemCollection;

	@ManyToOne
	@JoinColumn(name = "fe_external_account_id")
	private ExternalAccount externalAccount;
	
	public WebosExternalGroup() {
		super();
	}

	public Set<WebosExternalGroupParameter> getWebosExternalGroupParameterCollection() {
		return this.webosExternalGroupParameterCollection;
	}

	public void setWebosExternalGroupParameterCollection(Set<WebosExternalGroupParameter> feWebosExternalGroupParameterCollection) {
		this.webosExternalGroupParameterCollection = feWebosExternalGroupParameterCollection;
	}

	public Set<WebosMenuItem> getFeWebosMenuItemCollection() {
		return this.webosMenuItemCollection;
	}

	public void setFeWebosMenuItemCollection(Set<WebosMenuItem> feWebosMenuItemCollection) {
		this.webosMenuItemCollection = feWebosMenuItemCollection;
	}
	
	public ExternalAccount getFeExternalAccount() {
		return this.externalAccount;
	}

	public void setFeExternalAccount(ExternalAccount externalAccount) {
		this.externalAccount = externalAccount;
	}

}
