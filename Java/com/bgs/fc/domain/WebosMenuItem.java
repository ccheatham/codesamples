package com.bgs.fc.domain;

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bgs.fc.mappedsuperclass.WindowFactory;

@Entity
@Table(name="fe_webos_menu_item")
public class WebosMenuItem extends WindowFactory implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4763990972876751841L;

	@ManyToOne
	@JoinColumn(name="parent_id")
	private WebosMenuItem parent;

	@OneToMany(mappedBy="webosMenuItem", fetch = FetchType.EAGER)
	private Set<WebosMenuItemParameter> webosMenuItemParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_external_account_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_external_account_id"))
	private Set<ExternalAccount> externalAccountCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_webos_external_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_external_group_id"))
	private Set<WebosExternalGroup> webosExternalGroupCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_internal_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_webos_menu_item_id"),
		inverseJoinColumns=@JoinColumn(name="fe_internal_group_id"))
	private Set<InternalGroup> internalGroupCollection;
	
	@Transient
	private ArrayList<WebosMenuItem> children;

	public WebosMenuItem() {
		super();
		
		this.children = new ArrayList<WebosMenuItem>();
	}

	public Set<WebosMenuItemParameter> getWebosMenuItemParameterCollection() {
		return this.webosMenuItemParameterCollection;
	}

	public void setWebosMenuItemParameterCollection(Set<WebosMenuItemParameter> feWebosMenuItemParameterCollection) {
		this.webosMenuItemParameterCollection = feWebosMenuItemParameterCollection;
	}

	public Set<ExternalAccount> getExternalAccountCollection() {
		return this.externalAccountCollection;
	}

	public void setExternalAccountCollection(Set<ExternalAccount> feExternalAccountCollection) {
		this.externalAccountCollection = feExternalAccountCollection;
	}

	public WebosMenuItem getParent() {
		return parent;
	}

	public void setParent(WebosMenuItem parent) {
		this.parent = parent;
	}

	public Set<InternalGroup> getInternalGroupCollection() {
		return internalGroupCollection;
	}

	public void setInternalGroupCollection(
			Set<InternalGroup> internalGroupCollection) {
		this.internalGroupCollection = internalGroupCollection;
	}

	public Set<WebosExternalGroup> getWebosExternalGroupCollection() {
		return webosExternalGroupCollection;
	}

	public void setWebosExternalGroupCollection(
			Set<WebosExternalGroup> webosExternalGroupCollection) {
		this.webosExternalGroupCollection = webosExternalGroupCollection;
	}
	
	

	public ArrayList<WebosMenuItem> getChildren() {
		return children;
	}

	public void setChildren(ArrayList<WebosMenuItem> children) {
		this.children = children;
	}

}
