package com.bgs.common.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class ShipmentItem extends ShipmentItemBase implements Serializable {
	private static final long serialVersionUID = 1194909803450235013L;

	@Column(name="garcia_status")
	private String garciaStatus;

	@Column(name="ORIGIN_SERVER_ID")
	private String originServerId;

	@Column(name="DLV_CONTACT_NAME")
	private String dlvContactName;

	@Column(name="DLV_ADDRESS1")
	private String dlvAddress1;

	@Column(name="PU_PHONE_NUMBER")
	private String puPhoneNumber;

	@Column(name="DLV_DATE")
	private Date dlvDate;

	@Column(name="CUSTOMS_LIABILITY_USD")
	private Double customsLiabilityUsd;

	@Column(name="CUSTOMS_CODE")
	private String customsCode;

	@Column(name="delivery_airport_code")
	private String deliveryAirportCode;

	@Column(name="DLV_COUNTRY_CODE")
	private String dlvCountryCode;

	@Column(name="PU_ADDRESS3")
	private String puAddress3;

	@Column(name="NET_WEIGHT")
	private Double netWeight;

	@Column(name="PU_CONTACT_NAME")
	private String puContactName;

	@Column(name="current_site_code")
	private String currentSiteCode;

	@Column(name="PU_CITY")
	private String puCity;

	@Column(name="PU_INVOICE_NUMBER")
	private String puInvoiceNumber;

	@Column(name="PU_GCC")
	private String puGcc;

	@Column(name="DLV_NAME")
	private String dlvName;

	@Column(name="SHIPMENT_ID")
	private BigDecimal shipmentId;

	@Column(name="DLV_PHONE_NUMBER")
	private String dlvPhoneNumber;

	@Column(name="TRANSPORT_EXPENSE")
	private Double transportExpense;

	@Column(name="fine_pm_uom_code")
	private String finePmUomCode;

	@Column(name="PU_CUSTOMER_ID")
	private BigDecimal puCustomerId;

	@Column(name="CUSTOMS_CURRENCY_CODE")
	private String customsCurrencyCode;

	@Column(name="transfer_id")
	private BigDecimal transferId;

	@Column(name="delivery_site_code")
	private String deliverySiteCode;

	@Column(name="PU_DATE")
	private Date puDate;

	@Column(name="DLV_FAX_NUMBER")
	private String dlvFaxNumber;

	@Column(name="DLV_ADDRESS2")
	private String dlvAddress2;

	@Column(name="UOM_CODE")
	private String uomCode;

	@Column(name="COMMODITY_DESCRIPTION")
	private String commodityDescription;

	@Column(name="gross_pm_uom_code")
	private String grossPmUomCode;

	@Column(name="PU_ADDRESS4")
	private String puAddress4;

	@Column(name="pickup_site_code")
	private String pickupSiteCode;

	@Column(name="COMMODITY_ID")
	private BigDecimal commodityId;

	@Column(name="PU_CLEARANCE_AGENT_ID")
	private BigDecimal puClearanceAgentId;

	@Column(name="ORIGIN_SHIPMENT_ITEM_ID")
	private BigDecimal originShipmentItemId;

	@Column(name="TERM_CODE")
	private String termCode;

	@Column(name="GROSS_WEIGHT")
	private Double grossWeight;

	@Column(name="PU_ADDRESS2")
	private String puAddress2;

	@Column(name="INSURANCE_EXPENSE")
	private Double insuranceExpense;

	@Column(name="manifest_id")
	private BigDecimal manifestId;

	@Column(name="DLV_POSTAL_CODE")
	private String dlvPostalCode;

	@Column(name="UOM_NET_WEIGHT")
	private BigDecimal uomNetWeight;

	@Column(name="INSURANCE_LIABILITY")
	private Double insuranceLiability;

	@Column(name="DLV_ADDRESS3")
	private String dlvAddress3;

	@Column(name="DLV_CUSTOMER_ID")
	private BigDecimal dlvCustomerId;

	@Column(name="pouch_id")
	private BigDecimal pouchId;

	@Column(name="gross_pm_weight")
	private BigDecimal grossPmWeight;

	@Column(name="DLV_CLEARANCE_AGENT_ID")
	private BigDecimal dlvClearanceAgentId;

	@Column(name="PU_NAME")
	private String puName;

	@Column(name="ORIGIN_COUNTRY")
	private String originCountry;

	@Column(name="PU_PROVINCE_CODE")
	private String puProvinceCode;

	@Column(name="DLV_CITY")
	private String dlvCity;

	@Column(name="PU_POSTAL_CODE")
	private String puPostalCode;

	@Column(name="INSURANCE_LIABILITY_USD")
	private Double insuranceLiabilityUsd;

	@Column(name="fine_pm_weight")
	private BigDecimal finePmWeight;

	@Column(name="PU_INVOICE_DATE")
	private Date puInvoiceDate;

	@Column(name="DLV_GCC")
	private String dlvGcc;

	@Column(name="DELIVERY_FLAG")
	private String deliveryFlag;

	@Column(name="PU_COUNTRY_CODE")
	private String puCountryCode;

	@Column(name="CUSTOMS_LIABILITY")
	private Double customsLiability;

	@Column(name="PU_FAX_NUMBER")
	private String puFaxNumber;

	@Column(name="DLV_PROVINCE_CODE")
	private String dlvProvinceCode;

	@Column(name="DLV_ADDRESS4")
	private String dlvAddress4;

	@Column(name="OTHER_EXPENSE")
	private Double otherExpense;

	@Column(name="garcia_date_created")
	private Date garciaDateCreated;

	@Column(name="NUMBER_OF_ITEMS")
	private int numberOfItems;

	@Column(name="PU_ADDRESS1")
	private String puAddress1;

	@Column(name="INSUR_CURRENCY_CODE")
	private String insurCurrencyCode;

	public ShipmentItem() {
		super();
	}
	
	public String getGarciaStatus() {
		return this.garciaStatus;
	}

	public void setGarciaStatus(String garciaStatus) {
		this.garciaStatus = garciaStatus;
	}

	public String getOriginServerId() {
		return this.originServerId;
	}

	public void setOriginServerId(String originServerId) {
		this.originServerId = originServerId;
	}

	public String getDlvContactName() {
		return this.dlvContactName;
	}

	public void setDlvContactName(String dlvContactName) {
		this.dlvContactName = dlvContactName;
	}

	public String getDlvAddress1() {
		return this.dlvAddress1;
	}

	public void setDlvAddress1(String dlvAddress1) {
		this.dlvAddress1 = dlvAddress1;
	}

	public String getPuPhoneNumber() {
		return this.puPhoneNumber;
	}

	public void setPuPhoneNumber(String puPhoneNumber) {
		this.puPhoneNumber = puPhoneNumber;
	}

	public Date getDlvDate() {
		return this.dlvDate;
	}

	public void setDlvDate(Date dlvDate) {
		this.dlvDate = dlvDate;
	}

	public Double getCustomsLiabilityUsd() {
		return this.customsLiabilityUsd;
	}

	public void setCustomsLiabilityUsd(Double customsLiabilityUsd) {
		this.customsLiabilityUsd = customsLiabilityUsd;
	}

	public String getCustomsCode() {
		return this.customsCode;
	}

	public void setCustomsCode(String customsCode) {
		this.customsCode = customsCode;
	}

	public String getDeliveryAirportCode() {
		return this.deliveryAirportCode;
	}

	public void setDeliveryAirportCode(String deliveryAirportCode) {
		this.deliveryAirportCode = deliveryAirportCode;
	}

	public String getDlvCountryCode() {
		return this.dlvCountryCode;
	}

	public void setDlvCountryCode(String dlvCountryCode) {
		this.dlvCountryCode = dlvCountryCode;
	}

	public String getPuAddress3() {
		return this.puAddress3;
	}

	public void setPuAddress3(String puAddress3) {
		this.puAddress3 = puAddress3;
	}

	public Double getNetWeight() {
		return this.netWeight;
	}

	public void setNetWeight(Double netWeight) {
		this.netWeight = netWeight;
	}

	public String getPuContactName() {
		return this.puContactName;
	}

	public void setPuContactName(String puContactName) {
		this.puContactName = puContactName;
	}

	public String getCurrentSiteCode() {
		return this.currentSiteCode;
	}

	public void setCurrentSiteCode(String currentSiteCode) {
		this.currentSiteCode = currentSiteCode;
	}

	public String getPuCity() {
		return this.puCity;
	}

	public void setPuCity(String puCity) {
		this.puCity = puCity;
	}

	public String getPuInvoiceNumber() {
		return this.puInvoiceNumber;
	}

	public void setPuInvoiceNumber(String puInvoiceNumber) {
		this.puInvoiceNumber = puInvoiceNumber;
	}

	public String getPuGcc() {
		return this.puGcc;
	}

	public void setPuGcc(String puGcc) {
		this.puGcc = puGcc;
	}

	public String getDlvName() {
		return this.dlvName;
	}

	public void setDlvName(String dlvName) {
		this.dlvName = dlvName;
	}

	public BigDecimal getShipmentId() {
		return this.shipmentId;
	}

	public void setShipmentId(BigDecimal shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getDlvPhoneNumber() {
		return this.dlvPhoneNumber;
	}

	public void setDlvPhoneNumber(String dlvPhoneNumber) {
		this.dlvPhoneNumber = dlvPhoneNumber;
	}

	public Double getTransportExpense() {
		return this.transportExpense;
	}

	public void setTransportExpense(Double transportExpense) {
		this.transportExpense = transportExpense;
	}

	public String getFinePmUomCode() {
		return this.finePmUomCode;
	}

	public void setFinePmUomCode(String finePmUomCode) {
		this.finePmUomCode = finePmUomCode;
	}

	public BigDecimal getPuCustomerId() {
		return this.puCustomerId;
	}

	public void setPuCustomerId(BigDecimal puCustomerId) {
		this.puCustomerId = puCustomerId;
	}

	public String getCustomsCurrencyCode() {
		return this.customsCurrencyCode;
	}

	public void setCustomsCurrencyCode(String customsCurrencyCode) {
		this.customsCurrencyCode = customsCurrencyCode;
	}

	public BigDecimal getTransferId() {
		return this.transferId;
	}

	public void setTransferId(BigDecimal transferId) {
		this.transferId = transferId;
	}

	public String getDeliverySiteCode() {
		return this.deliverySiteCode;
	}

	public void setDeliverySiteCode(String deliverySiteCode) {
		this.deliverySiteCode = deliverySiteCode;
	}

	public Date getPuDate() {
		return this.puDate;
	}

	public void setPuDate(Date puDate) {
		this.puDate = puDate;
	}

	public String getDlvFaxNumber() {
		return this.dlvFaxNumber;
	}

	public void setDlvFaxNumber(String dlvFaxNumber) {
		this.dlvFaxNumber = dlvFaxNumber;
	}

	public String getDlvAddress2() {
		return this.dlvAddress2;
	}

	public void setDlvAddress2(String dlvAddress2) {
		this.dlvAddress2 = dlvAddress2;
	}

	public String getUomCode() {
		return this.uomCode;
	}

	public void setUomCode(String uomCode) {
		this.uomCode = uomCode;
	}

	public String getCommodityDescription() {
		return this.commodityDescription;
	}

	public void setCommodityDescription(String commodityDescription) {
		this.commodityDescription = commodityDescription;
	}

	public String getGrossPmUomCode() {
		return this.grossPmUomCode;
	}

	public void setGrossPmUomCode(String grossPmUomCode) {
		this.grossPmUomCode = grossPmUomCode;
	}

	public String getPuAddress4() {
		return this.puAddress4;
	}

	public void setPuAddress4(String puAddress4) {
		this.puAddress4 = puAddress4;
	}

	public String getPickupSiteCode() {
		return this.pickupSiteCode;
	}

	public void setPickupSiteCode(String pickupSiteCode) {
		this.pickupSiteCode = pickupSiteCode;
	}

	public BigDecimal getCommodityId() {
		return this.commodityId;
	}

	public void setCommodityId(BigDecimal commodityId) {
		this.commodityId = commodityId;
	}

	public BigDecimal getPuClearanceAgentId() {
		return this.puClearanceAgentId;
	}

	public void setPuClearanceAgentId(BigDecimal puClearanceAgentId) {
		this.puClearanceAgentId = puClearanceAgentId;
	}

	public BigDecimal getOriginShipmentItemId() {
		return this.originShipmentItemId;
	}

	public void setOriginShipmentItemId(BigDecimal originShipmentItemId) {
		this.originShipmentItemId = originShipmentItemId;
	}

	public String getTermCode() {
		return this.termCode;
	}

	public void setTermCode(String termCode) {
		this.termCode = termCode;
	}

	public Double getGrossWeight() {
		return this.grossWeight;
	}

	public void setGrossWeight(Double grossWeight) {
		this.grossWeight = grossWeight;
	}

	public String getPuAddress2() {
		return this.puAddress2;
	}

	public void setPuAddress2(String puAddress2) {
		this.puAddress2 = puAddress2;
	}

	public Double getInsuranceExpense() {
		return this.insuranceExpense;
	}

	public void setInsuranceExpense(Double insuranceExpense) {
		this.insuranceExpense = insuranceExpense;
	}

	public BigDecimal getManifestId() {
		return this.manifestId;
	}

	public void setManifestId(BigDecimal manifestId) {
		this.manifestId = manifestId;
	}

	public String getDlvPostalCode() {
		return this.dlvPostalCode;
	}

	public void setDlvPostalCode(String dlvPostalCode) {
		this.dlvPostalCode = dlvPostalCode;
	}

	public BigDecimal getUomNetWeight() {
		return this.uomNetWeight;
	}

	public void setUomNetWeight(BigDecimal uomNetWeight) {
		this.uomNetWeight = uomNetWeight;
	}

	public Double getInsuranceLiability() {
		return this.insuranceLiability;
	}

	public void setInsuranceLiability(Double insuranceLiability) {
		this.insuranceLiability = insuranceLiability;
	}

	public String getDlvAddress3() {
		return this.dlvAddress3;
	}

	public void setDlvAddress3(String dlvAddress3) {
		this.dlvAddress3 = dlvAddress3;
	}

	public BigDecimal getDlvCustomerId() {
		return this.dlvCustomerId;
	}

	public void setDlvCustomerId(BigDecimal dlvCustomerId) {
		this.dlvCustomerId = dlvCustomerId;
	}

	public BigDecimal getPouchId() {
		return this.pouchId;
	}

	public void setPouchId(BigDecimal pouchId) {
		this.pouchId = pouchId;
	}

	public BigDecimal getGrossPmWeight() {
		return this.grossPmWeight;
	}

	public void setGrossPmWeight(BigDecimal grossPmWeight) {
		this.grossPmWeight = grossPmWeight;
	}

	public BigDecimal getDlvClearanceAgentId() {
		return this.dlvClearanceAgentId;
	}

	public void setDlvClearanceAgentId(BigDecimal dlvClearanceAgentId) {
		this.dlvClearanceAgentId = dlvClearanceAgentId;
	}

	public String getPuName() {
		return this.puName;
	}

	public void setPuName(String puName) {
		this.puName = puName;
	}

	public String getOriginCountry() {
		return this.originCountry;
	}

	public void setOriginCountry(String originCountry) {
		this.originCountry = originCountry;
	}

	public String getPuProvinceCode() {
		return this.puProvinceCode;
	}

	public void setPuProvinceCode(String puProvinceCode) {
		this.puProvinceCode = puProvinceCode;
	}

	public String getDlvCity() {
		return this.dlvCity;
	}

	public void setDlvCity(String dlvCity) {
		this.dlvCity = dlvCity;
	}

	public String getPuPostalCode() {
		return this.puPostalCode;
	}

	public void setPuPostalCode(String puPostalCode) {
		this.puPostalCode = puPostalCode;
	}

	public Double getInsuranceLiabilityUsd() {
		return this.insuranceLiabilityUsd;
	}

	public void setInsuranceLiabilityUsd(Double insuranceLiabilityUsd) {
		this.insuranceLiabilityUsd = insuranceLiabilityUsd;
	}

	public BigDecimal getFinePmWeight() {
		return this.finePmWeight;
	}

	public void setFinePmWeight(BigDecimal finePmWeight) {
		this.finePmWeight = finePmWeight;
	}

	public Date getPuInvoiceDate() {
		return this.puInvoiceDate;
	}

	public void setPuInvoiceDate(Date puInvoiceDate) {
		this.puInvoiceDate = puInvoiceDate;
	}

	public String getDlvGcc() {
		return this.dlvGcc;
	}

	public void setDlvGcc(String dlvGcc) {
		this.dlvGcc = dlvGcc;
	}

	public String getDeliveryFlag() {
		return this.deliveryFlag;
	}

	public void setDeliveryFlag(String deliveryFlag) {
		this.deliveryFlag = deliveryFlag;
	}

	public String getPuCountryCode() {
		return this.puCountryCode;
	}

	public void setPuCountryCode(String puCountryCode) {
		this.puCountryCode = puCountryCode;
	}

	public Double getCustomsLiability() {
		return this.customsLiability;
	}

	public void setCustomsLiability(Double customsLiability) {
		this.customsLiability = customsLiability;
	}

	public String getPuFaxNumber() {
		return this.puFaxNumber;
	}

	public void setPuFaxNumber(String puFaxNumber) {
		this.puFaxNumber = puFaxNumber;
	}

	public String getDlvProvinceCode() {
		return this.dlvProvinceCode;
	}

	public void setDlvProvinceCode(String dlvProvinceCode) {
		this.dlvProvinceCode = dlvProvinceCode;
	}

	public String getDlvAddress4() {
		return this.dlvAddress4;
	}

	public void setDlvAddress4(String dlvAddress4) {
		this.dlvAddress4 = dlvAddress4;
	}

	public Double getOtherExpense() {
		return this.otherExpense;
	}

	public void setOtherExpense(Double otherExpense) {
		this.otherExpense = otherExpense;
	}

	public Date getGarciaDateCreated() {
		return this.garciaDateCreated;
	}

	public void setGarciaDateCreated(Date garciaDateCreated) {
		this.garciaDateCreated = garciaDateCreated;
	}

	public int getNumberOfItems() {
		return this.numberOfItems;
	}

	public void setNumberOfItems(int numberOfItems) {
		this.numberOfItems = numberOfItems;
	}

	public String getPuAddress1() {
		return this.puAddress1;
	}

	public void setPuAddress1(String puAddress1) {
		this.puAddress1 = puAddress1;
	}

	public String getInsurCurrencyCode() {
		return this.insurCurrencyCode;
	}

	public void setInsurCurrencyCode(String insurCurrencyCode) {
		this.insurCurrencyCode = insurCurrencyCode;
	}

}
