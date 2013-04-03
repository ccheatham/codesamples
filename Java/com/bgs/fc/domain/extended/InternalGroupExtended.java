package com.bgs.fc.domain.extended;

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

import com.bgs.fc.domain.User;
import com.bgs.fc.mappedsuperclass.InternalGroupBase;

@Entity
@Table(name="fe_internal_group")
public class InternalGroupExtended extends InternalGroupBase {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5847565483309753266L;

	@OneToMany(mappedBy="internalGroup", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<WebosInternalGroupParameterExtended> webosInternalGroupParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_internal_group_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_internal_group_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItemExtended> webosMenuItemCollection;
	
	@ManyToMany(fetch=FetchType.EAGER, cascade = CascadeType.MERGE, targetEntity = com.bgs.fc.domain.User.class)
	@JoinTable(name="fe_user_to_fe_internal_group",
		joinColumns=@JoinColumn(name="fe_internal_group_id"),
		inverseJoinColumns=@JoinColumn(name="fe_user_id"))
	private Set<User> userCollection;

	public InternalGroupExtended() {
		super();
	}

	public Set<WebosInternalGroupParameterExtended> getWebosInternalGroupParameterCollection() {
		return this.webosInternalGroupParameterCollection;
	}

	public void setWebosInternalGroupParameterCollection(Set<WebosInternalGroupParameterExtended> feWebosInternalGroupParameterCollection) {
		this.webosInternalGroupParameterCollection = feWebosInternalGroupParameterCollection;
	}

	public Set<User> getUserCollection() {
		return this.userCollection;
	}

	public void setUserCollection(Set<User> feUserCollection) {
		this.userCollection = feUserCollection;
	}

	public Set<WebosMenuItemExtended> getWebosMenuItemCollection() {
		return webosMenuItemCollection;
	}

	public void setWebosMenuItemCollection(
			Set<WebosMenuItemExtended> webosMenuItemCollection) {
		this.webosMenuItemCollection = webosMenuItemCollection;
	}

}
