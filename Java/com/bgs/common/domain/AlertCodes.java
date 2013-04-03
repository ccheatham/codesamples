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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="ALERT_CODES")
public class AlertCodes extends AtlasBase implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7396201490587066088L;

	@Id
	@Column(name="ALERT_CODE")
	private String alertCode;

	
	@ManyToMany(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinTable(name="ALERT_CODES_RECIP_JT", joinColumns = @JoinColumn(name = "ALERT_CODE", referencedColumnName = "ALERT_CODE"),inverseJoinColumns = @JoinColumn(name = "ALERT_RECIPIENTS_ID", referencedColumnName = "ALERT_RECIPIENTS_ID"))
	private Set<AlertRecipients> alertRecipients;
	
	@Column(name="AUTO_EMAIL")
	private String autoEmail;

	@Column(name="DATE_CREATED")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;

	@Column(name="ALERT_CODE_DESC")
	private String alertCodeDesc;

	@Column(name="CREATED_BY_USERID")
	private String createdByUserid;

	@Column(name="ALERT_TYPE")
	private String alertType;

	
	public AlertCodes() {
		super();
	}

	public String getAlertCode() {
		return this.alertCode;
	}

	public void setAlertCode(String alertCode) {
		this.alertCode = alertCode;
	}

	public String getAutoEmail() {
		return this.autoEmail;
	}

	public void setAutoEmail(String autoEmail) {
		this.autoEmail = autoEmail;
	}

	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getAlertCodeDesc() {
		return this.alertCodeDesc;
	}

	public void setAlertCodeDesc(String alertCodeDesc) {
		this.alertCodeDesc = alertCodeDesc;
	}

	public String getCreatedByUserid() {
		return this.createdByUserid;
	}

	public void setCreatedByUserid(String createdByUserid) {
		this.createdByUserid = createdByUserid;
	}

	public String getAlertType() {
		return this.alertType;
	}

	public void setAlertType(String alertType) {
		this.alertType = alertType;
	}

	public Set<AlertRecipients> getAlertRecipients() {
		return alertRecipients;
	}

	public void setAlertRecipients(Set<AlertRecipients> alertRecipients) {
		this.alertRecipients = alertRecipients;
	}

	
}
