package com.bgs.fc.mappedsuperclass.extended;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.bgs.fc.domain.WebosWindow;
import com.bgs.fc.domain.extended.WebosApplicationExtended;
import com.bgs.fc.mappedsuperclass.AtlasBase;

@MappedSuperclass
public class WindowFactoryExtended extends AtlasBase implements Serializable {
	
	/**
	 * 
	 */
	public WindowFactoryExtended(){
		super();	
		
		if (this.getManagementDestination() == null)
			this.setManagementDestination("MenuItemManagement");
	}
	private static final long serialVersionUID = -2966548737713965069L;

	@Id
	@GeneratedValue
	private Long id;
	
	private String label;

	@Column(name="keyboard_shortcut")
	private String keyboardShortcut;

	@Column(name="hierarchy_id")
	private Long hierarchyId;

	@Column(name="radiobutton_group_name")
	private String groupName;
	
	@Column(name="type")
	private String type = "normal";
	
	@Column(name="use_window_icon")
	private String useWindowIcon = "Y";

	private String action;
	
	@ManyToOne
	@JoinColumn(name="fe_webos_window_id")
	private WebosWindow webosWindow;
	
	@ManyToOne
	@JoinColumn(name="fe_application_id")
	private WebosApplicationExtended feApplication;
	
	public WebosApplicationExtended getFeApplication() {
		return this.feApplication;
	}

	public void setFeApplication(WebosApplicationExtended feApplication) {
		this.feApplication = feApplication;
	
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public WebosWindow getWebosWindow() {
		return webosWindow;
	}

	public void setWebosWindow(WebosWindow webosWindow) {
		this.webosWindow = webosWindow;
	}
	
	public String getUseWindowIcon() {
		return useWindowIcon;
	}

	public void setUseWindowIcon(String useWindowIcon) {
		this.useWindowIcon = useWindowIcon;
	}
	
	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getKeyboardShortcut() {
		return this.keyboardShortcut;
	}

	public void setKeyboardShortcut(String keyboardShortcut) {
		this.keyboardShortcut = keyboardShortcut;
	}

	public Long getHierarchyId() {
		return this.hierarchyId;
	}

	public void setHierarchyId(Long hierarchyId) {
		this.hierarchyId = hierarchyId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
