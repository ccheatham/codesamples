package com.bgs.fc.domain.extended;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bgs.fc.mappedsuperclass.extended.WindowFactoryExtended;

@Entity
@Table(name="fe_webos_menu_item")
public class WebosMenuItemExtended extends WindowFactoryExtended implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4763990972876751841L;

	@ManyToOne
	@JoinColumn(name="parent_id")
	private WebosMenuItemExtended parent;

	@OneToMany(mappedBy="webosMenuItem", fetch = FetchType.EAGER)
	private Set<WebosMenuItemParameterExtended> webosMenuItemParameterCollection;

	/*@ManyToMany(fetch=FetchType.EAGER, targetEntity = com.bgs.fc.domain.User.class)
	@JoinTable(name="fe_external_account_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_external_account_id"))
	private Set<ExternalAccount> externalAccountCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_webos_external_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_external_group_id"))
	private Set<WebosExternalGroupExtended> webosExternalGroupCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_internal_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_internal_group_id"))
	private Set<InternalGroupExtended> internalGroupCollection;*/
	
	@Transient
	private ArrayList<WebosMenuItemExtended> children;

	public WebosMenuItemExtended() {
		super();
		
		this.children = new ArrayList<WebosMenuItemExtended>();
	}

	public Set<WebosMenuItemParameterExtended> getWebosMenuItemParameterCollection() {
		return this.webosMenuItemParameterCollection;
	}

	public void setWebosMenuItemParameterCollection(Set<WebosMenuItemParameterExtended> feWebosMenuItemParameterCollection) {
		this.webosMenuItemParameterCollection = feWebosMenuItemParameterCollection;
	}

	/*public Set<ExternalAccount> getExternalAccountCollection() {
		return this.externalAccountCollection;
	}

	public void setExternalAccountCollection(Set<ExternalAccount> feExternalAccountCollection) {
		this.externalAccountCollection = feExternalAccountCollection;
	}*/

	public WebosMenuItemExtended getParent() {
		return parent;
	}

	public void setParent(WebosMenuItemExtended parent) {
		this.parent = parent;
	}

	/*public Set<InternalGroupExtended> getInternalGroupCollection() {
		return internalGroupCollection;
	}

	public void setInternalGroupCollection(
			Set<InternalGroupExtended> internalGroupCollection) {
		this.internalGroupCollection = internalGroupCollection;
	}

	public Set<WebosExternalGroupExtended> getWebosExternalGroupCollection() {
		return webosExternalGroupCollection;
	}

	public void setWebosExternalGroupCollection(
			Set<WebosExternalGroupExtended> webosExternalGroupCollection) {
		this.webosExternalGroupCollection = webosExternalGroupCollection;
	}*/

	public ArrayList<WebosMenuItemExtended> getChildren() {
		return children;
	}

	public void setChildren(ArrayList<WebosMenuItemExtended> children) {
		this.children = children;
	}

}
