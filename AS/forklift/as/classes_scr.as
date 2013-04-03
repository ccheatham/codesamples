import mx.controls.Alert;
import mx.controls.gridclasses.DataGridColumn;
filterSystemProps_cb.selected = _global.oGlobalData.profileSo.data.bFilterClassSystemProperties;
//set up code
oClassControlService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.classcontrol",this);
setupGrid();
getDataTypes();
//set event handlers
newClass_btn.addEventListener("click",newClass_btn);
deleteClass_btn.addEventListener("click",deleteClass_btn);
newProperty_btn.addEventListener("click",newProperty_btn);
deleteProperty_btn.addEventListener("click",deleteProperty_btn);
filterSystemProps_cb.addEventListener("click",filterSystemProps_cb);
dataType_sel.addEventListener("change",dataType_sel);

deleteProperty_btn.enabled = false;
newProperty_btn.enabled = false;
deleteClass_btn.enabled = false;
dataType_sel.visible = false;
booleanType_sel.visible = false;
objectType_sel.visible = false;

dataType_sel._width = 115;
booleanType_sel._width = 110;
objectType_sel._width = 110;

//BOUNDING BOXES/////////////////////////////////////////
createEmptyMovieClip ("classBoundBox_mc", 1);
with (classBoundBox_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (176, 0);
lineTo (176, 407);
lineTo (0, 407);
lineTo (0, 0);
endFill();
_x = 22.8;
_y = 58.5;
swapDepths(deleteClass_btn.getDepth()-1);	
}
createEmptyMovieClip ("classPropertiesBoundBox_mc", 1);
with (classPropertiesBoundBox_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (452, 0);
lineTo (452, 407);
lineTo (0, 407);
lineTo (0, 0);
endFill();
_x = 204;
_y = 58.5;
swapDepths(filterSystemProps_cb.getDepth()-1);	
}
///////////////////////////////////////////////////////////////	

//event handlers
filterSystemProps_cb.click = function(ev) {
	if(filterSystemProps_cb.selected){
		_global.oGlobalData.profileSo.data.bFilterClassSystemProperties = true;
		}
	else{
		_global.oGlobalData.profileSo.data.bFilterClassSystemProperties = false;
		}	
	//_global.oGlobalData.getClasses(); - removed call ACM
	oClassControlService.getClassProperties(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classes_grid.selectedItem.CLASS_LABEL,_global.oGlobalData.profileSo.data.bFilterClassSystemProperties);
}
dataType_sel.change = function(ev) {
	if(ev.target.selectedItem.label == "Object"){
		objectType_sel.visible = true;
		booleanType_sel.visible = false;
		}
	else if (ev.target.selectedItem.label == "Boolean"){
		booleanType_sel.visible = true;
		objectType_sel.visible = false;	
		}
	else{
		booleanType_sel.visible = false;
		objectType_sel.visible = false;		
		}
}
newClass_btn.click = function(ev) {		
		if (ev.target.label == "Save") {
		classes_grid.editable = false;
		oClassControlService.createClass(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classes_grid.selectedItem.CLASS_LABEL);
		_root.application.status_txt.text = "Creating " + classes_grid.selectedItem.CLASS_LABEL + " Class...";
		//ev.target.label = "New Class";
	}	
		if (ev.target.label == "New Class") {
		ev.target.label = "Save";
		deleteClass_btn.label = "Cancel";
		classes_grid.dataProvider.addItemAt(0,{CLASS_LABEL:"", TABLE_NAME:""});
		classes_grid.selectedIndex = 0;
		classes_grid.editable = true;
		classes_grid.focusedCell = {columnIndex:1, itemIndex:0};
		newProperty_btn.enabled =false;
		deleteClass_btn.enabled = true;
	}			
}

createClass_Result = function(bClassCreated) {	
	_global.oGlobalData.getClasses();
	newClass_btn.label = 'New Class';
	deleteClass_btn.label = 'Delete Class';
	deleteClass_btn.enabled =false;
	_root.application.status_txt.text = "";
}
		
deleteClass_btn.click = function(ev) {
	if(ev.target.label == "Delete Class"){
		Alert.show("Are you sure you wish to delete the " + classes_grid.selectedItem.CLASS_LABEL + " class?","Delete " + classes_grid.selectedItem.CLASS_LABEL +" Class?",Alert.OK | Alert.CANCEL,_parent,deleteClassConfirm);
	}
	if(ev.target.label == "Cancel"){
		classes_grid.editable = false;
		ev.target.label = "Delete Class";
		newClass_btn.label = "New Class";
		classes_grid.dataProvider.removeItemAt(0);
		
	}
}

function deleteClassConfirm(ev) {
	if (ev.detail == Alert.OK) {
		_root.application.status_txt.text = 'Deleting Class...';
		oClassControlService.deleteClass(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classes_grid.selectedItem.TABLE_NAME);
		classes_grid.dataProvider.removeItemAt(classes_grid.selectedIndex);
		deleteClass_btn.enabled = false;
	}
}

deleteClass_Result = function(bClassDeleted) {
	_root.application.status_txt.text = '';
	_global.oGlobalData.getClasses();
	if (classes_grid.dataProvider.length == 0){
		classProperties_grid.dataProvider.removeAll();
		}
}

newProperty_btn.click = function(ev) {
	if (ev.target.label == "Save") {
	classProperties_grid.editable = false;
		switch (dataType_sel.selectedItem.label){
		
		case "Boolean": 
			propertyDefault = booleanType_sel.selectedItem.data;
			classTable = '';
			break;
		case "Object":
			propertyDefault = objectType_sel.selectedItem.CLASS_LABEL;
			classTable = objectType_sel.selectedItem.TABLE_NAME;
			break;
		default:
			propertyDefault = classProperties_grid.selectedItem.PROPERTY_DEFAULT;
			classTable = '';
		}

	oClassControlService.addClassProperty(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classProperties_grid.selectedItem.PROPERTY_NAME,
										  classes_grid.selectedItem.TABLE_NAME,dataType_sel.selectedItem.dataTypeID,propertyDefault,classTable,0);
	_root.application.status_txt.text = "Creating " + classProperties_grid.selectedItem.PROPERTY_NAME + " Property...";
	//ev.target.label = "New Class";
	}	
	if (ev.target.label == "New Property") {
	ev.target.label = "Save";
	deleteProperty_btn.label = "Cancel";
	deleteProperty_btn.enabled = true;
	classes_grid.enabled = false;
	newClass_btn.enabled = false;
	deleteClass_btn.enabled = false;
	classProperties_grid.dataProvider.addItemAt(0,{PROPERTY_NAME:"", PROPERTY_TYPE:"", PROPERTY_DEFAULT: "", PROPERTY_BSEARCHABLE: ""});
	classProperties_grid.selectedIndex = 0;
	classProperties_grid.editable = true;
	classProperties_grid.focusedCell = {columnIndex:1, itemIndex:0};
	dataType_sel.visible = true;
	dataType_sel.selectedIndex = 0;
	booleanType_sel.selectedIndex  = 0;
	}	
}

addClassProperty_Result = function(bPropertyAdded){
	if(bPropertyAdded){
		dataType_sel.visible = false;
		booleanType_sel.visible = false;
		objectType_sel.visible = false;
		classProperties_grid.editable = false;
		newClass_btn.enabled = true;
		classes_grid.enabled = true;
		deleteClass_btn.enabled = true;
		_root.application.status_txt.text = "";
		newProperty_btn.label = "New Property";
		deleteProperty_btn.label = "Delete Property";
		newProperty_btn.enabled = false;
		deleteProperty_btn.enabled = false;
		oClassControlService.getClassProperties(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classes_grid.selectedItem.CLASS_LABEL,
												_global.oGlobalData.profileSo.data.bFilterClassSystemProperties);

		}
	}


deleteProperty_btn.click = function(ev) {
	if(ev.target.label == "Delete Property"){
		Alert.show("Are you sure you wish to delete the " + classProperties_grid.selectedItem.PROPERTY_NAME + " property?","Delete " + classProperties_grid.selectedItem.PROPERTY_NAME +" Property?",
				   Alert.OK | Alert.CANCEL, _parent,deletePropertyConfirm);
	}
	if(ev.target.label == "Cancel"){
		classProperties_grid.editable = false;
		ev.target.label = "Delete Property";
		newProperty_btn.label = "New Property";
		classProperties_grid.dataProvider.removeItemAt(0);
		newClass_btn.enabled = true;
		classes_grid.enabled = true;
		deleteClass_btn.enabled = true;
		dataType_sel.visible = false;
		booleanType_sel.visible = false;
		objectType_sel.visible = false;		
	}
}

function deletePropertyConfirm(ev) {
	if (ev.detail == Alert.OK) {
		_root.application.status_txt.text = 'Deleting Property...';
		oClassControlService.removeClassProperty(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,
												 classProperties_grid.selectedItem.PROPERTY_NAME,classes_grid.selectedItem.TABLE_NAME,0,'');
		deleteProperty_btn.enabled = false;
		classes_grid.enabled = true;
		newClass_btn.enabled = true;
		deleteClass_btn.enabled = true;
		deleteProperty_btn.enabled = false;
	}
}

removeClassProperty_Result = function(bPropertyDeleted) {
	_root.application.status_txt.text = '';
	oClassControlService.getClassProperties(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,classes_grid.selectedItem.CLASS_LABEL,
											_global.oGlobalData.profileSo.data.bFilterClassSystemProperties);
}


classProperties_grid.change = function(ev) {
	if(this.selectedItem.PROPERTY_TYPE == 'System'){
		deleteProperty_btn.enabled = false;
		}
	else{
		deleteProperty_btn.enabled = true;
		}	
}

classes_grid.change = function(ev) {
	oClassControlService.getClassProperties(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,this.selectedItem.CLASS_LABEL,
											_global.oGlobalData.profileSo.data.bFilterClassSystemProperties);
	deleteClass_btn.enabled = true;
}

getClassProperties_Result = function(qClassProperties) {
	classProperties_grid.dataProvider = qClassProperties;
	newProperty_btn.enabled =true;
	for (var i=0;i < classProperties_grid.dataProvider.length;i++) {
	if(classProperties_grid.dataProvider[i].PROPERTY_TYPE == 'System'){
		classProperties_grid.setPropertiesAt(i,{backgroundColor:_global.boundingBoxFillColor});
		}
	}
}

//general functions
this.tabClick = function(ev) {
	_global.hideAllBelow(_root.application);
	this.visible = true;
}

this.classes_grid.getClasses = function(event) {
	var aClasses = event.target.concat();
	classes_grid.dataProvider = aClasses;
	
	if (classes_grid.length > 0) {
		classes_grid.selectedIndex = 0;
		oClassControlService.getClassProperties(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,this.selectedItem.CLASS_LABEL,
												_global.oGlobalData.profileSo.data.bFilterClassSystemProperties);
	}
	//classes_grid.sortItemsBy("label","ASC");
}

this.objectType_sel.getClasses = function(event) {
	var aClasses = event.target.concat();
	objectType_sel.dataProvider = aClasses;
	objectType_sel.labelField = 'CLASS_LABEL';
}

function getDataTypes() {
	oClassControlService.getDataTypes(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName);
}

getDataTypes_Result = function(aDataTypes){

	for (var i=0; i < aDataTypes.length; i++) {
  // these changes to the DataProvider will be broadcast to the list
  dataType_sel.addItem({ label: aDataTypes[i].DATATYPENAME,
                 dataTypeID:  aDataTypes[i].DATATYPEID }); 
	}
}

//build columns
function setupGrid() {
	//classes_grid
	classes_grid.editable = false;
	classes_grid.resizableColumns = false; 
	classes_grid.addEventListener("change",classes_grid);

	
	var column = new DataGridColumn("CLASS_ICON");
	column.headerText = "";
	column.editable = false;
	column.width = 20;
	column.cellRenderer = "ClassIconCellRenderer";
	classes_grid.addColumn(column);
	
	var column = new DataGridColumn("CLASS_LABEL");
	column.headerText = "Class";
	column.width = 85;
	classes_grid.addColumn(column);

	var column = new DataGridColumn("bCacheClass");
	column.headerText = "Cache?";
	column.editable = false;
	column.width = 45;
	column.cellRenderer = "CheckCellRenderer";
	classes_grid.addColumn(column);

	//classProperties_grid
	classProperties_grid.editable = false;
	classProperties_grid.resizableColumns = false; 
	classProperties_grid.addEventListener("change",classProperties_grid);

	var column = new DataGridColumn("PROPERTY_ICON");
	column.headerText = "";
	column.editable = false;
	column.width = 20;
	column.cellRenderer = "ClassPropertyIconCellRenderer";
	classProperties_grid.addColumn(column);
	
	var column = new DataGridColumn("PROPERTY_NAME");
	column.headerText = "Property";
	column.width = 114;
	classProperties_grid.addColumn(column);
	
	var column = new DataGridColumn("PROPERTY_TYPE");
	column.headerText = "Type";
	column.width = 114;
	classProperties_grid.addColumn(column);
	
	var column = new DataGridColumn("PROPERTY_DEFAULT");
	column.headerText = "Default";
	column.width = 111;
	classProperties_grid.addColumn(column);

	var column = new DataGridColumn("PROPERTY_BSEARCHABLE");
	column.headerText = "Searchable?";
	column.editable = false;
	column.width = 70;
	column.cellRenderer = "CheckCellRenderer";
	classProperties_grid.addColumn(column);
}

//