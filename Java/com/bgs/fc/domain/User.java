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

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bgs.fc.mappedsuperclass.UserBase;
import com.bgs.fc.utils.BrinksUtils;


@Entity
@Table(name="fe_user")
public class User extends UserBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2602417628301074388L;

	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<WebosUserParameter> webosUserParameterCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_webos_external_group",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_external_group_id"))
	private Set<WebosExternalGroup> webosExternalGroupCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_bits_customer",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="bits_customer_id"))
	private Set<Customer> customerCollection;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_internal_group", 
		joinColumns = @JoinColumn(name = "fe_user_id", referencedColumnName = "id"), 
		inverseJoinColumns = @JoinColumn(name = "fe_internal_group_id", referencedColumnName = "id"))
	private Set<InternalGroup> internalGroupCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_user_to_fe_webos_menu_item",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItem> webosMenuItemCollection;
	
	@ManyToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name="fe_user_to_fe_webos_menu_item_recent",
		joinColumns=@JoinColumn(name="fe_user_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_menu_item_id"))
	private Set<WebosMenuItem> recentWebosMenuItemCollection;
	
	@ManyToOne
	@JoinColumn(name="fe_external_account_id")
	private ExternalAccount externalAccount;
	
	@Transient
	private ArrayList<WebosMenuItem> userMenu;
	
	@Transient
	private ArrayList<WebosMenuItem> allMenuItems;

	public User() {
		super();
		
		this.setManagementDestination("UserManagement");
		
		this.userMenu = new ArrayList<WebosMenuItem>();
		this.allMenuItems = new ArrayList<WebosMenuItem>();
	}
	
	public WebosUserParameter getUserParameter(String parameterName)
	{
		try
		{
			return BrinksUtils.findObjectInCollection(parameterName,"parameterName", this.webosUserParameterCollection);
		}
		catch (Exception e)
		{
			// do nothing will return null
		}
			
		return null;
	}

	public Set<WebosUserParameter> getWebosUserParameterCollection() {
		return this.webosUserParameterCollection;
	}

	public void setWebosUserParameterCollection(Set<WebosUserParameter> feWebosUserParameterCollection) {
		this.webosUserParameterCollection = feWebosUserParameterCollection;
	}

	public Set<WebosExternalGroup> getWebosExternalGroupCollection() {
		return this.webosExternalGroupCollection;
	}

	public void setWebosExternalGroupCollection(Set<WebosExternalGroup> feWebosExternalGroupCollection) {
		this.webosExternalGroupCollection = feWebosExternalGroupCollection;
	}

	public Set<Customer> getCustomerCollection() {
		return this.customerCollection;
	}

	public void setCustomerCollection(Set<Customer> customerCollection) {
		this.customerCollection = customerCollection;
	}

	public Set<InternalGroup> getInternalGroupCollection() {
		return this.internalGroupCollection;
	}

	public void setInternalGroupCollection(Set<InternalGroup> feInternalGroupCollection) {
		this.internalGroupCollection = feInternalGroupCollection;
	}

	public Set<WebosMenuItem> getWebosMenuItemCollection() {
		return webosMenuItemCollection;
	}

	public void setWebosMenuItemCollection(
			Set<WebosMenuItem> webosMenuItemCollection) {
		this.webosMenuItemCollection = webosMenuItemCollection;
	}

	public ExternalAccount getExternalAccount() {
		return externalAccount;
	}

	public void setExternalAccount(ExternalAccount externalAccount) {
		this.externalAccount = externalAccount;
	}

	public ArrayList<WebosMenuItem> getUserMenu() {
		return userMenu;
	}

	public void setUserMenu(ArrayList<WebosMenuItem> userMenu) {
		this.userMenu = userMenu;
	}

	public Set<WebosMenuItem> getRecentWebosMenuItemCollection() {
		return recentWebosMenuItemCollection;
	}

	public void setRecentWebosMenuItemCollection(
			Set<WebosMenuItem> recentWebosMenuItemCollection) {
		this.recentWebosMenuItemCollection = recentWebosMenuItemCollection;
	}

	public ArrayList<WebosMenuItem> getAllMenuItems() {
		return allMenuItems;
	}

	public void setAllMenuItems(ArrayList<WebosMenuItem> allMenuItems) {
		this.allMenuItems = allMenuItems;
	}

}
