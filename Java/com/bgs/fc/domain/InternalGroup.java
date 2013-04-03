package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.InternalGroupBase;

@Entity
@Table(name="fe_internal_group")
public class InternalGroup extends InternalGroupBase {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4741340329945919859L;

	public InternalGroup() {
		super();
	}
	
	@OneToMany(mappedBy="internalGroup", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<WebosInternalGroupParameter> webosInternalGroupParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_internal_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_internal_group_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItem> webosMenuItemCollection;
	
	public Set<WebosInternalGroupParameter> getWebosInternalGroupParameterCollection() {
		return webosInternalGroupParameterCollection;
	}

	public void setWebosInternalGroupParameterCollection(
			Set<WebosInternalGroupParameter> webosInternalGroupParameterCollection) {
		this.webosInternalGroupParameterCollection = webosInternalGroupParameterCollection;
	}

	public Set<WebosMenuItem> getWebosMenuItemCollection() {
		return webosMenuItemCollection;
	}

	public void setWebosMenuItemCollection(
			Set<WebosMenuItem> webosMenuItemCollection) {
		this.webosMenuItemCollection = webosMenuItemCollection;
	}

}
