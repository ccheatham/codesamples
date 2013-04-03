package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.bgs.common.domain.SiteBase;
import com.bgs.fc.domain.EmailAddress;
import com.bgs.fc.domain.QvcukCountry;
import com.bgs.fc.domain.QvcukRoles;
import com.bgs.fc.domain.QvcukVendor;


@MappedSuperclass
public class UserBase extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4438964935901710253L;

	@Id
	@GeneratedValue
	private Long id;

	private String password;

	private String username;

	private String phone3;

	@Column(name="super_user")
	private String superUser;

	private String active;

	private String phone2;

	private String address1;

	private String address2;

	@Column(name="country_code")
	private String countryCode;

	private String city;

	private String phone1;

	@Column(name="last_name")
	private String lastName;

	@Column(name="postal_code")
	private String postalCode;

	private String type;

	@Column(name="first_name")
	private String firstName;
	

	@Column(name="province_code")
	private String provinceCode;

	@ManyToOne
	@JoinColumn(name="qvc_vendor_name")
	private QvcukVendor qvcVendor;

	@ManyToOne
	@JoinColumn(name="qvc_country_name")
	private QvcukCountry qvcCountry;

	@ManyToOne
	@JoinColumn(name="fe_email_address_id")
	private EmailAddress emailAddress;

	@ManyToOne
	@JoinColumn(name="qvc_role")
	private QvcukRoles qvcRole;
	
	@ManyToOne
	@JoinColumn(name="site_code", referencedColumnName = "SITE_CODE")
	private SiteBase userSite;
	
	@Transient
	private List<String> stringRoles;

	public UserBase() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone3() {
		return this.phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getSuperUser() {
		return this.superUser;
	}

	public void setSuperUser(String superUser) {
		this.superUser = superUser;
	}

	public String getActive() {
		return this.active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getPhone2() {
		return this.phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone1() {
		return this.phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getProvinceCode() {
		return this.provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public QvcukVendor getQvcVendor() {
		return this.qvcVendor;
	}

	public void setQvcVendor(QvcukVendor qvc) {
		this.qvcVendor = qvc;
	}

	public QvcukCountry getQvcCountry() {
		return this.qvcCountry;
	}

	public void setQvcCountry(QvcukCountry qvc2) {
		this.qvcCountry = qvc2;
	}

	public QvcukRoles getQvcRole() {
		return this.qvcRole;
	}

	public void setQvcRole(QvcukRoles qvc3) {
		this.qvcRole = qvc3;
	}

	public EmailAddress getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(EmailAddress emailAddress) {
		this.emailAddress = emailAddress;
	}

	public List<String> getStringRoles() {
		return stringRoles;
	}

	public void setStringRoles(List<String> stringRoles) {
		this.stringRoles = stringRoles;
	}

	public SiteBase getUserSite() {
		return userSite;
	}

	public void setUserSite(SiteBase userSite) {
		this.userSite = userSite;
	}

}
