package com.bgs.fc.domain;

/**
 * 
 * @actionscript.class
 * managed = true
 * 
 */

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.bgs.fc.mappedsuperclass.AtlasBase;

@Entity
@Table(name="fe_webos_window")
public class WebosWindow extends AtlasBase implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8918184907871709564L;

	@Id
	@GeneratedValue
	private Long id;

	private String thumbnail;

	private String maximized = "N";

	private String icon;

	private String handle;

	private Integer width = 500;

	private String label;

	@Column(name="help_url")
	private String helpUrl;

	@Column(name="allow_resize")
	private String allowResize = "Y";
	
	@Column(name="show_close_button")
	private String showCloseButton = "Y";
	
	@Column(name="show_maximize_button")
	private String showMaximizeButton = "Y";
	
	@Column(name="show_minimize_button")
	private String showMinimizeButton = "Y";
	
	private String path;

	private Integer height = 300;
	
	@Column(name="min_width")
	private Integer minWidth = 100;
	
	@Column(name="min_height")
	private Integer minHeight = 100;

	@Column(name="is_wizard")
	private String isWizard = "N";

	@OneToMany(mappedBy="webosWindow", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<WebosWindowParameter> webosWindowParameterCollection;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="fe_webos_window_to_fe_webos_window_wizard_step",
		joinColumns=@JoinColumn(name="fe_webos_window_id"),
		inverseJoinColumns=@JoinColumn(name="fe_webos_window_wizard_step_id"))
	private Set<WebosWindow> wizardStepWindowCollection;
	
	public WebosWindow() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getMaximized() {
		return this.maximized;
	}

	public void setMaximized(String maximized) {
		this.maximized = maximized;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getHandle() {
		return this.handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public Integer getWidth() {
		return this.width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getHelpUrl() {
		return this.helpUrl;
	}

	public void setHelpUrl(String helpUrl) {
		this.helpUrl = helpUrl;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getHeight() {
		return this.height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getMinHeight() {
		return minHeight;
	}

	public void setMinHeight(Integer minHeight) {
		this.minHeight = minHeight;
	}

	public Integer getMinWidth() {
		return minWidth;
	}

	public void setMinWidth(Integer minWidth) {
		this.minWidth = minWidth;
	}

	public Set<WebosWindow> getWizardStepWindowCollection() {
		return wizardStepWindowCollection;
	}

	public void setWizardStepWindowCollection(
			Set<WebosWindow> wizardStepWindowCollection) {
		this.wizardStepWindowCollection = wizardStepWindowCollection;
	}

	public Set<WebosWindowParameter> getWebosWindowParameterCollection() {
		return webosWindowParameterCollection;
	}

	public void setWebosWindowParameterCollection(
			Set<WebosWindowParameter> webosWindowParameterCollection) {
		this.webosWindowParameterCollection = webosWindowParameterCollection;
	}

	public String getIsWizard() {
		return isWizard;
	}

	public void setIsWizard(String isWizard) {
		this.isWizard = isWizard;
	}

	public String getAllowResize() {
		return allowResize;
	}

	public void setAllowResize(String allowResize) {
		this.allowResize = allowResize;
	}

	public String getShowCloseButton() {
		return showCloseButton;
	}

	public void setShowCloseButton(String showCloseButton) {
		this.showCloseButton = showCloseButton;
	}

	public String getShowMaximizeButton() {
		return showMaximizeButton;
	}

	public void setShowMaximizeButton(String showMaximizeButton) {
		this.showMaximizeButton = showMaximizeButton;
	}

	public String getShowMinimizeButton() {
		return showMinimizeButton;
	}

	public void setShowMinimizeButton(String showMinimizeButton) {
		this.showMinimizeButton = showMinimizeButton;
	}

}
