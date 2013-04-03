package com.bgs.fc.ejb.webos;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.bgs.fc.domain.User;
import com.bgs.fc.domain.WebosMenuItem;
import com.bgs.fc.ejb.webos.interfaces.UserManagement;
import com.bgs.fc.ejb.webos.interfaces.UserManagementRemote;
import com.bgs.fc.security.WebOSSecurity;

public @Stateless class UserManagementBean extends EJBBase implements UserManagementRemote,UserManagement {

	@PersistenceContext(unitName="webos_entities")
	private EntityManager em;
	
	@EJB
	private WebOSSecurity security;
	
	@Override
	protected EntityManager getEntityManager() {
		return em;
	}
	
	@Override
	public Object update(Object item)
	{
		User in = (User) item;
		
		List<String> stringRoles = in.getStringRoles();
		ArrayList<WebosMenuItem> userMenu = in.getUserMenu();
		ArrayList<WebosMenuItem> allMenuItems = in.getAllMenuItems();
		
		User user = (User) super.update(item);
		
		user.setStringRoles(stringRoles);
		user.setUserMenu(userMenu);
		user.setAllMenuItems(allMenuItems);
		
		if (this.security.getUserInfo().getUsername().equals(user.getUsername()))
			this.security.setUserInfo(user);
		
		return user;
	}

}
