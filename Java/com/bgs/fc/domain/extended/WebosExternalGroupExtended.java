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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.domain.User;
import com.bgs.fc.mappedsuperclass.WebosExternalGroupBase;
import javax.persistence.FetchType;

@Entity
@Table(name="fe_webos_external_group")
public class WebosExternalGroupExtended extends WebosExternalGroupBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 663499586233059264L;

	@OneToMany(mappedBy="webosExternalGroup", fetch = FetchType.EAGER)
	private Set<WebosExternalGroupParameterExtended> webosExternalGroupParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_webos_external_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_external_group_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItemExtended> webosMenuItemCollection;

	@ManyToMany(mappedBy="webosExternalGroupCollection", fetch = FetchType.EAGER, targetEntity = com.bgs.fc.domain.User.class)
	private Set<User> userCollection;
	
	@ManyToOne
	@JoinColumn(name = "fe_external_account_id")
	private ExternalAccountExtended externalAccount;

	public WebosExternalGroupExtended() {
		super();
	}

	public Set<User> getUserCollection() {
		return userCollection;
	}

	public void setUserCollection(Set<User> userCollection) {
		this.userCollection = userCollection;
	}

	public Set<WebosExternalGroupParameterExtended> getWebosExternalGroupParameterCollection() {
		return webosExternalGroupParameterCollection;
	}

	public void setWebosExternalGroupParameterCollection(
			Set<WebosExternalGroupParameterExtended> webosExternalGroupParameterCollection) {
		this.webosExternalGroupParameterCollection = webosExternalGroupParameterCollection;
	}

	public Set<WebosMenuItemExtended> getWebosMenuItemCollection() {
		return webosMenuItemCollection;
	}

	public void setWebosMenuItemCollection(
			Set<WebosMenuItemExtended> webosMenuItemCollection) {
		this.webosMenuItemCollection = webosMenuItemCollection;
	}
	
	public ExternalAccountExtended getFeExternalAccount() {
		return this.externalAccount;
	}

	public void setFeExternalAccount(ExternalAccountExtended externalAccount) {
		this.externalAccount = externalAccount;
	}

}
