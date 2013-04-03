package com.bgs.common.ejb.interfaces;

import java.util.List;

import com.bgs.fc.domain.User;

public interface UserMgtGarcia {

	public User updateUser(User updateMe);
	
	public User updateUserSiteByIP(String ip);
	
	public User updateUserSiteBySiteCode(String siteCode);
	
	public User createUser(User createUser);
	
	public void deleteUser(User deleteUser);
	
	public List getAllUsers();
	
}
