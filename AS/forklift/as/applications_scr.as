import mx.controls.Alert;
appSelCoverup_btn.useHandCursor = false;
//set up code
currentApplication_sel.addEventListener("change",currentApplication_sel);
dbPersistors_sel.addEventListener("change",dbPersistors_sel);
dsn_sel.addEventListener("change",dsn_sel);
installRelationshipTables_btn.addEventListener("click",installRelationshipTables_btn);

saveApplication_btn.addEventListener("click",saveApplication_btn);
deleteApplication_btn.addEventListener("click",deleteApplication_btn);

newApplication_btn.addEventListener("click",currentApplication_sel)

bNewApplication = false;

oFlashAppService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.applicationcontrol",this);
oFlashRelService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.relationshipcontrol",this);
//BOUNDING BOX///////////////////////////////////////////
createEmptyMovieClip ("applicationBoundBox_mc", 1);
with (applicationBoundBox_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (540, 0);
lineTo (540, 332.0);
lineTo (0, 332.0);
lineTo (0, 0);
endFill();
_x = 71;
_y = 88;
swapDepths(currentApplication_sel.getDepth() - 1);
}
///////////////////////////////////////////////////////////////

//event handlers
currentApplication_sel.click = function(event) {
	if (event.target.label == "New Application") {
		event.target.label = "Cancel";
		blankFields();
		appSelCoverup_btn._x =  444.2;
		_root.focusManager.setFocus(currentApplication_sel.textField);
		currentApplication_sel.textField.restrict = '0-9a-zA-Z_';
		_root.focusManager.defaultPushButton = saveApplication_btn;
		currentSelAppIndex = this.selectedIndex;
		bNewApplication = true;
		this.editable = true;
		deleteApplication_btn.enabled = false;
		installRelationshipTables_btn.enabled = false;
		dsn_sel.selectedIndex = 0;
	    dsn_sel.change({type:"dsn_sel",target:dsn_sel});
	}
	else if (event.target.label == "Start Here") {
		event.target.bFirstApp = true;
		event.target.label = "Cancel";
		enableFields();
		this.enabled = true;
		deleteApplication_btn.enabled = false;
		installRelationshipTables_btn.enabled = false;
		this.editable = true;
		_root.focusManager.setFocus(currentApplication_sel.textField);
		appSelCoverup_btn._x =  444.2;
		currentApplication_sel.textField.restrict = '0-9a-zA-Z_';
		_root.focusManager.defaultPushButton = saveApplication_btn;
		bNewApplication = true;
		dbPersistors_sel.selectedIndex = 0;
		dbPersistors_sel.change({type:"dbPersistors_sel",target:dbPersistors_sel});
		dsn_sel.selectedIndex = 0;
	    dsn_sel.change({type:"dsn_sel",target:dsn_sel});
		cacheApplication_cb.selected = true;
	}
	else {
		if (event.target.bFirstApp) {
			event.target.bFirstApp = false;
			currentApplication_sel.selectedIndex = 0;
			currentApplication_sel.enabled = false;
			newApplication_btn.label = "Start Here";
			blankFields();
			disableFields();
			_root.focusManager.defaultPushButton = newApplication_btn;
		}
		else {
			event.target.label = "New Application";
			appSelCoverup_btn._x = 1000;
			this.editable = false;
			this.selectedIndex = currentSelAppIndex;
			bNewApplication = false;
			_root.focusManager.defaultPushButton = undefined;
			currentApplication_sel.change({type:"currentApplication_sel",target:currentApplication_sel});
			deleteApplication_btn.enabled = true;
		}
	}
}

dsn_sel.change = function(event) {
	_root.application.status_txt.text = 'Checking Relationship Table Installation...';
	oFlashRelService.checkRelationshipTables(event.target.selectedItem.label,dbPersistors_sel.selectedItem,_global.oGlobalData.profileSo.data.password);
}

this.checkRelationshipTables_Result = function(bInstalled) {
		_root.application.status_txt.text = '';
		if(bInstalled) {
			relationshipTables_txt.text = "Relationship Tables Installed";
			relationshipTables_txt._x = 302.6;
			installRelationshipTables_btn.visible = false;
		}
		else {
			relationshipTables_txt.text = "";
			relationshipTables_txt._x = 1000;
			installRelationshipTables_btn.visible = true;
		}
}

deleteApplication_btn.click = function(ev){
	Alert.show("Are you sure you wish to delete the application?","Delete Application?",Alert.OK | Alert.CANCEL,_parent,deleteConfirm);
	}
	
function deleteApplication_Result(result){
	_root.application.status_txt.text = '';
	aApplications.splice(currentApplication_sel.selectedIndex,1);
	
	if (aApplications.length > 0) {
		currentApplication_sel.selectedIndex = 0;
		currentApplication_sel.change({type:"currentApplication_sel",target:currentApplication_sel});
	}
	else {
		aApplications[0] = {label:"<create new>",data:"new"};
		newApplication_btn.label = "Start Here";
		currentApplication_sel.selectedIndex = 0;
		currentApplication_sel.enabled = false;
		blankFields();
		disableFields();
		_root.focusManager.defaultPushButton = newApplication_btn;
	}
}


saveApplication_btn.click = function(ev) {
	//verify all fields
	if (!bNewApplication) {
		if(applicationClassesLocation_txt.text != "" && applicationURL_txt.text != "" && applicationURI_txt.text != "" && applicationLocation_txt.text != "") {
			_root.application.status_txt.text = 'Saving Application...';
			
			if(cacheApplication_cb.selected)
				var bCache = "YES";
			else
				var bCache = "NO";
			
			oFlashAppService.updateApplication(_global.oGlobalData.profileSo.data.password,currentApplication_sel.selectedItem.data.NAME,applicationLocation_txt.text,applicationClassesLocation_txt.text,
											   					applicationURI_txt.text,dsn_sel.selectedItem.label,applicationURL_txt.text,dbPersistors_sel.selectedItem,bCache);
																
			
			aApplications[currentApplication_sel.selectedIndex].data.APPLICATIONLOCATION = applicationLocation_txt.text;
			aApplications[currentApplication_sel.selectedIndex].data.COMLOC = applicationClassesLocation_txt.text;
			aApplications[currentApplication_sel.selectedIndex].data.COMURI = applicationURI_txt.text;
			aApplications[currentApplication_sel.selectedIndex].data.DSN = dsn_sel.selectedItem.label;
			aApplications[currentApplication_sel.selectedIndex].data.HTTP = applicationURL_txt.text;
			aApplications[currentApplication_sel.selectedIndex].data.PERTYPE = dbPersistors_sel.selectedItem;
			aApplications[currentApplication_sel.selectedIndex].data.BCACHEAPP = bCache;
			
			if (relationshipTables_txt._x != 1000) {
				aApplications[currentApplication_sel.selectedIndex].data.BRELATIONSHIPTABLESINSTALLED = "true";
			}
			else
				aApplications[currentApplication_sel.selectedIndex].data.BRELATIONSHIPTABLESINSTALLED = "false";
		}
		else
			Alert.show("The application text fields can not be blank.","Save Error",Alert.OK);
	}
	else{
		if(newApplication_btn.bFirstApp) {
			newApplication_btn.bFirstApp = false;
			aApplications.splice(0);
			installRelationshipTables_btn.enabled = true;
		}

		//new application
		if(currentApplication_sel.text != "" && applicationClassesLocation_txt.text != "" && applicationURL_txt.text != "" && applicationURI_txt.text != "" && applicationLocation_txt.text != "") {
			_root.application.status_txt.text = 'Saving New Application...';
			
			if(cacheApplication_cb.selected)
				var bCache = "YES";
			else
				var bCache = "NO";
			
			oFlashAppService.createApplication(_global.oGlobalData.profileSo.data.password,currentApplication_sel.text,applicationLocation_txt.text,applicationClassesLocation_txt.text,
											   					applicationURI_txt.text,dsn_sel.selectedItem.label,applicationURL_txt.text,dbPersistors_sel.selectedItem,bCache);
			newApplication_btn.label = "New Application";
			appSelCoverup_btn._x = 1000;
			
			
			bNewApplication = false;
			_root.focusManager.defaultPushButton = undefined;
			
			//applicationLocation_txt.text = '';
			
			var newIndex = 	aApplications.length;
			
			aApplications[newIndex]= new Object();
			aApplications[newIndex].label = currentApplication_sel.text;
			aApplications[newIndex].data = new Object();
			
			aApplications[newIndex].data.NAME = currentApplication_sel.text;
			aApplications[newIndex].data.APPLICATIONLOCATION = applicationLocation_txt.text;
			aApplications[newIndex].data.COMLOC = applicationClassesLocation_txt.text;
			aApplications[newIndex].data.COMURI = applicationURI_txt.text;
			aApplications[newIndex].data.DSN = dsn_sel.selectedItem.label;
			aApplications[newIndex].data.HTTP = applicationURL_txt.text;
			aApplications[newIndex].data.PERTYPE = dbPersistors_sel.selectedItem;
			aApplications[newIndex].data.BCACHEAPP = bCache;
			
			if (relationshipTables_txt._x != 1000) {
				aApplications[newIndex].data.BRELATIONSHIPTABLESINSTALLED = "true";
			}
			else
				aApplications[newIndex].data.BRELATIONSHIPTABLESINSTALLED = "false";
			currentApplication_sel.editable = false;
			currentApplication_sel.selectedIndex = newIndex;
			currentApplication_sel.change({type:"currentApplication_sel",target:currentApplication_sel});		
		}
		else
			Alert.show("The application text fields can not be blank.","Save Error",Alert.OK);
		
	}
}

this.createApplication_Result = function(results) {
	_root.application.status_txt.text = '';
	Alert.show("New Application Added.","New Application",Alert.OK);
}

this.updateApplication_Result = function(results) {
	_root.application.status_txt.text = '';
	Alert.show("Application Updated Successfully.","Save Application",Alert.OK);
}

installRelationshipTables_btn.click = function(ev) {
	var oFlashRelService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.relationshipcontrol",this);
	oFlashRelService.installRelationshipTables(currentApplication_sel.selectedItem.data.DSN,currentApplication_sel.selectedItem.data.PERTYPE,_global.oGlobalData.profileSo.data.password);
	_root.application.status_txt.text = 'Installing Relationship Tables...';
}

installRelationshipTables_btn.installRelationshipTables_Result = function(results) {
	for (var i=0;i<aApplications.length;i++) {
		if (aApplications[i].data.DSN == currentApplication_sel.selectedItem.data.DSN) {
			aApplications[i].data.BRELATIONSHIPTABLESINSTALLED = "true";
		}
	}
	
	relationshipTables_txt.text = "Relationship Tables Installed";
	_root.application.status_txt.text = '';
	relationshipTables_txt._x = 302.6;
	this.visible = false;
}

currentApplication_sel.change = function(event) {
	if(!event.target.editable){
	enableFields();
	setProfileSO();
	//place data into fields based on selected application
	applicationClassesLocation_txt.text = event.target.selectedItem.data.COMLOC;
	applicationURL_txt.text = event.target.selectedItem.data.HTTP;
	applicationURI_txt.text = event.target.selectedItem.data.COMURI;
	applicationLocation_txt.text = event.target.selectedItem.data.APPLICATIONLOCATION;
	
	if (event.target.selectedItem.data.BRELATIONSHIPTABLESINSTALLED == "true") {
		relationshipTables_txt.text = "Relationship Tables Installed";
		relationshipTables_txt._x = 302.6;
		installRelationshipTables_btn.visible = false;
	}
	else {
		relationshipTables_txt.text = "";
		relationshipTables_txt._x = 1000;
		installRelationshipTables_btn.visible = true;
	}
	
	for (var i=0;i < dbPersistors_sel.dataProvider.length;i++) {
		if(dbPersistors_sel.getItemAt(i) == event.target.selectedItem.data.PERTYPE) {
			dbPersistors_sel.selectedIndex = i;
			dbPersistors_sel.change({type:'dbPersistors_sel',target:dbPersistors_sel});
			break;
		}
	}
	
	for (var i=0;i < dsn_sel.dataProvider.length;i++) {
		if(dsn_sel.getItemAt(i).label == event.target.selectedItem.data.DSN) {
			dsn_sel.selectedIndex = i;
			break;
		}
	}
	
	if(event.target.selectedItem.data.BCACHEAPP == "YES") 
		cacheApplication_cb.selected = true;
	else
		cacheApplication_cb.selected = false;
	}
	
	//load application classes etc.
	_global.oGlobalData.getClasses();
	_root.application.relationships_scr.getRelationships();
}

dbPersistors_sel.change = function(event) {
	switch (event.target.selectedItem){
		case "MSSQL": 
			var selPer = 'MSSQLServer';
			break;
		case "MSACCESS":
			var selPer = 'MSAccess';
			break;
		case "MYSQL":
			var selPer = 'MySQL';
			break;
		case "ORACLE":
			var selPer = 'Oracle';
			break;
		}
	dsn_sel.dataProvider = _global.filterObjectArray(aDataSources,selPer,'driver',false,true);	
	//dsn_sel.selectedIndex = 0;
	//dsn_sel.change({type:"dsn_sel",target:dsn_sel});
}

this.tabClick = function(ev) {
	_global.hideAllBelow(_root.application);
	this.visible = true;
	var bFound = false;
	
	if (aApplications.length == 0) {
		aApplications[0] = {label:"<create new>",data:"new"};
		newApplication_btn.label = "Start Here";
		currentApplication_sel.dataProvider = aApplications;
		currentApplication_sel.sortItemsBy("label","ASC");
		currentApplication_sel.selectedIndex = 0;
		currentApplication_sel.enabled = false;
		disableFields();
		_root.focusManager.defaultPushButton = newApplication_btn;
	}
	else {
		currentApplication_sel.dataProvider = aApplications;
		
		if (_global.oGlobalData.profileSo.data.applicationName != "") {
			for (var i=0;i < aApplications.length;i++) {
				if(aApplications[i].data.NAME == _global.oGlobalData.profileSo.data.applicationName) {
					currentApplication_sel.selectedIndex = i;
					bFound = true;
					break;
				}
			}
		}
		
		if(! bFound) {
			currentApplication_sel.selectedIndex = 0;
			currentApplication_sel.change({type:"currentApplication_sel",target:currentApplication_sel});
		}
		else {
			currentApplication_sel.change({type:"currentApplication_sel",target:currentApplication_sel});
		}
	}
}

this.loadApplications = function(event) {
	aApplications = event.target.concat();
}

this.loadDbPersistors = function(event) {
	aDbPersistors = event.target.concat();
	dbPersistors_sel.dataProvider = aDbPersistors;
	dbPersistors_sel.sortItemsBy("label","ASC");
}

this.loadDataSources = function(event) {
	aDataSources = event.target.concat();
	dsn_sel.dataProvider = aDataSources;
	dsn_sel.sortItemsBy("label","ASC");
}

//general functions
function blankFields() {
	applicationClassesLocation_txt.text = "";
	applicationURL_txt.text = "";
	applicationURI_txt.text = "";
	applicationLocation_txt.text = "";
	dbPersistors_sel.selectedIndex = 0;
	dsn_sel.selectedIndex = 0;
	cacheApplication_cb.selected = true;
}

function disableFields() {
	applicationClassesLocation_txt.editable = false;
	applicationURL_txt.editable = false;
	applicationLocation_txt.editable = false;
	applicationURI_txt.editable = false;
	dbPersistors_sel.enabled = false;
	dsn_sel.enabled = false;
	cacheApplication_cb.enabled = false;
	saveApplication_btn.enabled = false;
	deleteApplication_btn.enabled = false;
	installRelationshipTables_btn.enabled = false;
}

function enableFields() {
	applicationClassesLocation_txt.editable = true;
	applicationLocation_txt.editable = true;
	applicationURL_txt.editable = true;
	applicationURI_txt.editable = true;
	dbPersistors_sel.enabled = true;
	dsn_sel.enabled = true;
	cacheApplication_cb.enabled = true;
	saveApplication_btn.enabled = true;
	deleteApplication_btn.enabled = true;
	installRelationshipTables_btn.enabled = true;
}

function deleteConfirm(event) {
	if (event.detail == Alert.OK) {
		_root.application.status_txt.text = 'Deleting Application...';
		oFlashAppService.deleteApplication(_global.oGlobalData.profileSo.data.password,currentApplication_sel.selectedItem.data.NAME);
	}
}

function setProfileSO(){
	_global.oGlobalData.profileSo.data.applicationName = currentApplication_sel.selectedItem.data.NAME;
	}