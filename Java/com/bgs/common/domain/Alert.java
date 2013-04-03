package com.bgs.common.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Alert implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7602244107402279178L;

	@Id
	@Column(name="ALERT_ID")
	@GeneratedValue
	private Long alertId;

	@Column(name="DATE_CREATED")
	@Temporal(TemporalType.DATE)
	private Date dateCreated;

	@Column(name="DLV_BRANCH_CODE")
	private String dlvBranchCode;

	@Column(name="WEB_URL")
	private String webUrl;

	@Column(name="INACTIVE_DATE")
	private Date inactiveDate;

	@Column(name="INACTIVE_FLAG")
	private String inactiveFlag;

	@Column(name="SHIPMENT_ITEM_HISTORY_ID")
	private Long shipmentItemHistoryId;

	@Column(name="ALERT_SENT_IND")
	private String alertSentInd;

	@Column(name="LAST_MODIFIED_USER")
	private String lastModifiedUser;

	@Column(name="ALERT_MSG")
	private String alertMsg;

	@Column(name="ACTION_TYPE")
	private String actionType;

	@Column(name="PU_BRANCH_CODE")
	private String puBranchCode;

	@Column(name="CURRENT_BRANCH_CODE")
	private String currentBranchCode;
	
	@Column(name="ALERT_CODE")
	private String alertCode;

	public Alert() {
		super();
	}

	public Long getAlertId() {
		return this.alertId;
	}

	public void setAlertId(Long alertId) {
		this.alertId = alertId;
	}

	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDlvBranchCode() {
		return this.dlvBranchCode;
	}

	public void setDlvBranchCode(String dlvBranchCode) {
		this.dlvBranchCode = dlvBranchCode;
	}

	public String getWebUrl() {
		return this.webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}

	public Date getInactiveDate() {
		return this.inactiveDate;
	}

	public void setInactiveDate(Date inactiveDate) {
		this.inactiveDate = inactiveDate;
	}

	public String getInactiveFlag() {
		return this.inactiveFlag;
	}

	public void setInactiveFlag(String inactiveFlag) {
		this.inactiveFlag = inactiveFlag;
	}

	public Long getShipmentItemHistoryId() {
		return this.shipmentItemHistoryId;
	}

	public void setShipmentItemHistoryId(Long shipmentItemHistoryId) {
		this.shipmentItemHistoryId = shipmentItemHistoryId;
	}

	public String getAlertSentInd() {
		return this.alertSentInd;
	}

	public void setAlertSentInd(String alertSentInd) {
		this.alertSentInd = alertSentInd;
	}

	public String getLastModifiedUser() {
		return this.lastModifiedUser;
	}

	public void setLastModifiedUser(String lastModifiedUser) {
		this.lastModifiedUser = lastModifiedUser;
	}

	public String getAlertMsg() {
		return this.alertMsg;
	}

	public void setAlertMsg(String alertMsg) {
		this.alertMsg = alertMsg;
	}

	public String getActionType() {
		return this.actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getPuBranchCode() {
		return this.puBranchCode;
	}

	public void setPuBranchCode(String puBranchCode) {
		this.puBranchCode = puBranchCode;
	}

	public String getCurrentBranchCode() {
		return this.currentBranchCode;
	}

	public void setCurrentBranchCode(String currentBranchCode) {
		this.currentBranchCode = currentBranchCode;
	}

	public String getAlertCode() {
		return alertCode;
	}

	public void setAlertCode(String alertCode) {
		this.alertCode = alertCode;
	}

	
}
