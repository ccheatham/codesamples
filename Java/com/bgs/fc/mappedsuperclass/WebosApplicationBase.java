package com.bgs.fc.mappedsuperclass;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class WebosApplicationBase extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6259964516056243556L;

	@Id
	@GeneratedValue
	private Long id;

	@Column(name="help_url")
	private String helpUrl;

	private String handle;
	
	@Column(name="modules_url")
	private String modulesUrl;

	private String label;

	private String icon;

	private String thumbnail;

	private String style;
	
	private String version;
	
	public WebosApplicationBase() {
		super();
		
		if (this.getManagementDestination() == null)
			this.setManagementDestination("ApplicationManagement");
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getHelpUrl() {
		return this.helpUrl;
	}

	public void setHelpUrl(String helpUrl) {
		this.helpUrl = helpUrl;
	}

	public String getHandle() {
		return this.handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getModulesUrl() {
		return modulesUrl;
	}

	public void setModulesUrl(String modulesUrl) {
		this.modulesUrl = modulesUrl;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}
