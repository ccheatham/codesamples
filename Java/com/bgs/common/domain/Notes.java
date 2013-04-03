package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Transient;

import com.bgs.fc.domain.User;
import com.bgs.fc.ejb.webos.WebosException;
import com.bgs.fc.mappedsuperclass.AtlasBase;
import com.bgs.fc.security.WebOSSecurity;

@Entity
public class Notes extends AtlasBase implements Serializable {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 8280657930241864377L;

	@Transient
	private Context ctx;
	@Transient
	private WebOSSecurity sec;
	@Transient
	private User user;
	
	
	@Id
	@GeneratedValue
	@Column(name="notes_id")
	private Long notesId;
	
	@Column(name="app_code")
	private String appCode;
	
	private String note;
	
	@Column(name="DATE_CREATED")
	private Date dateCreated;
	
	@Column(name="USERID")
	private String userid;
	
	public Notes() {
		super();
	}

	public String getAppCode() {
		return this.appCode;
	}

	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}

	public Long getNotesId() {
		return this.notesId;
	}

	public void setNotesId(Long notesId) {
		this.notesId = notesId;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		
		this.note = note;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@PrePersist public void defaultValues()	{
		
		this.setDateCreated(new Date(new java.util.Date().getTime()));
		
		if (this.user == null)
		{
			try
			{
				this.ctx = new InitialContext();
				this.sec = (WebOSSecurity) ctx.lookup("WebOSSecurityBean/local");
				this.user = sec.getUserInfo();
			}
			catch (Exception e)
			{
				throw new WebosException("Error while looking up security context for user info.",this);
			}
		}
				
		this.setUserid(this.user.getUsername());
	}
	
}
