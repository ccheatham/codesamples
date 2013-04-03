package com.bgs.common.ejb;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.bgs.common.domain.SiteBase;
import com.bgs.common.ejb.interfaces.SiteMgtLocal;
import com.bgs.common.ejb.interfaces.UserMgtGarciaLocal;
import com.bgs.common.ejb.interfaces.UserMgtGarciaRemote;
import com.bgs.fc.domain.User;
import com.bgs.fc.security.WebOSExtendedSimplePrincipal;
import com.bgs.fc.security.WebOSSecurity;

public @Stateless class UserMgtGarciaBean implements UserMgtGarciaRemote, UserMgtGarciaLocal {
	@EJB
	private WebOSSecurity bgsSecurity;
	
	@EJB
	private SiteMgtLocal siteMgt;
	
	@PersistenceContext(unitName="webos_entities")
	private EntityManager manager;
	
	public User updateUserSiteByIP(String ip) {		
	
		User UserObj = bgsSecurity.getUserInfo();		
		SiteBase siteObj = siteMgt.getSiteBaseByIP(ip);		
		UserObj.setUserSite(siteObj);
		
		return this.updateUser(UserObj);
	}
	
	public User updateUserSiteBySiteCode(String siteCode) {
		//get site
		SiteBase siteObj = siteMgt.getSiteBaseBySiteCode(siteCode);
		User user = (User) bgsSecurity.getUserInfo();
		user.setUserSite(siteObj);
		
		return this.updateUser(user);
	}
	
	public User createUser(User createUser) {		
		
		WebOSExtendedSimplePrincipal principal = bgsSecurity.getPrincipal();
		createUser.setUsername(principal.getName());
		createUser.setPassword(principal.getUserPassword());

		return this.updateUser(createUser);
	}

	public void deleteUser(User deleteUser) {
		
	}

	public User updateUser(User updateMe) {
		updateMe = manager.merge(updateMe);
		bgsSecurity.setUserInfo(updateMe);
		return updateMe;
	}
		
	public List getAllUsers() {
		Query query = manager.createQuery("from User u");
		return query.getResultList();
	}
	
}
