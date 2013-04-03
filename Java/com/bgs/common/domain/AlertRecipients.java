package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="ALERT_RECIPIENTS")
public class AlertRecipients extends AtlasBase implements Serializable {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 6302476906944110859L;

	@Id
	@Column(name="ALERT_RECIPIENTS_ID")
	@GeneratedValue
	private Long alertRecipientsId;

	@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "alertRecipients")
	private Set<AlertCodes> alertCodes;
	
//	@ManyToMany(cascade=CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "alertRecipients")
//	private Set<AlertSubscriber> alertSubscribers;
	
	@Column(name="SITE_CODE")
	private String siteCode;

	@Column(name="EMAIL_SUBJECT")
	private String emailSubject;

	@Column(name="EMAIL_ADDRESS")
	private String emailAddress;

	@Column(name="ALERT_CODE")
	private String alertCode;

	@Column(name="EMAIL_BODY")
	private String emailBody;

	@Column(name="EMAIL_NAME")
	private String emailName;
	
	@Column(name="DATE_CREATED")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	@Column(name="CREATED_BY_USERID")
	private String createdByUserid;
	
	public AlertRecipients() {
		super();
	}

	public Long getAlertRecipientsId() {
		return this.alertRecipientsId;
	}

	public void setAlertRecipientsId(Long alertRecipientsId) {
		this.alertRecipientsId = alertRecipientsId;
	}

	public String getSiteCode() {
		return this.siteCode;
	}

	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}

	public String getEmailSubject() {
		return this.emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getAlertCode() {
		return this.alertCode;
	}

	public void setAlertCode(String alertCode) {
		this.alertCode = alertCode;
	}

	public String getEmailBody() {
		return this.emailBody;
	}

	public void setEmailBody(String emailBody) {
		this.emailBody = emailBody;
	}

	public Set<AlertCodes> getAlertCodes() {
		return alertCodes;
	}

	public void setAlertCodes(Set<AlertCodes> alertCodes) {
		this.alertCodes = alertCodes;
	}

//	public Set<AlertSubscriber> getAlertSubscribers() {
//		return alertSubscribers;
//	}
//
//	public void setAlertSubscribers(Set<AlertSubscriber> alertSubscribers) {
//		this.alertSubscribers = alertSubscribers;
//	}

	public String getEmailName() {
		return emailName;
	}

	public void setEmailName(String emailName) {
		this.emailName = emailName;
	}

	public String getCreatedByUserid() {
		return createdByUserid;
	}

	public void setCreatedByUserid(String createdByUserid) {
		this.createdByUserid = createdByUserid;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

}
