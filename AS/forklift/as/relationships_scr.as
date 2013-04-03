//set up code
import mx.controls.Alert;
import mx.controls.gridclasses.DataGridColumn;
oRelationshipControlService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.relationshipcontrol",this);
getRelationships();
setupGrid();
objectID1_sel.visible = false;
objectID2_sel.visible = false;

createRelationship_btn.addEventListener("click",createRelationship_btn);
deleteRelationship_btn.addEventListener("click",deleteRelationship_btn);

//general functions
this.tabClick = function(ev) {
	_global.hideAllBelow(_root.application);
	this.visible = true;
	deleteRelationship_btn.enabled = false;
}

createEmptyMovieClip ("relationshipGridBoundBox_mc", 1);
with (relationshipGridBoundBox_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (627.0, 0);
lineTo (627.0, 413.6);
lineTo (0, 413.6);
lineTo (0, 0);
endFill();
_x = 25.8;
_y = 56.3;
swapDepths(createRelationship_btn.getDepth() - 1);
}	

function getRelationships(){
	oRelationshipControlService.getRelationships(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,false);
}

getRelationships_Result = function(aRelationships) {
	relationships_grid.dataProvider = aRelationships;
}

//event handlers
createRelationship_btn.click = function(ev) {		
		if (ev.target.label == "Save") {
		relationships_grid.editable = false;
		oRelationshipControlService.createRelationshipType(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,
		relationships_grid.selectedItem.RELATIONSHIP_NAME,objectID1_sel.selectedItem.TABLE_NAME,objectID2_sel.selectedItem.TABLE_NAME,relationships_grid.selectedItem.DESCRIPTION);
		_root.application.status_txt.text = "Creating " + relationships_grid.selectedItem.RELATIONSHIP_NAME + " Relationship...";
		getRelationships();
		//
	}	
		if (ev.target.label == "New Relationship") {
		ev.target.label = "Save";
		deleteRelationship_btn.label = "Cancel";
		deleteRelationship_btn.enabled = true;
		relationships_grid.dataProvider.addItemAt(0,{RELATIONSHIP_NAME:"", PARENT_CLASS:"", RELATED_CLASS:"",DESCRIPTION:""});
		relationships_grid.selectedIndex = 0;
		relationships_grid.editable = true;
		relationships_grid.focusedCell = {columnIndex:1, itemIndex:0};
		objectID1_sel.visible = true;
		objectID1_sel.selectedIndex = 0;
		objectID2_sel.visible = true;
		objectID2_sel.selectedIndex = 0;
	}			
}

createRelationshipType_Result = function(bRelationshipCreated){
	ev.target.label = "New Relationship";
	_root.application.status_txt.text = "";
	objectID1_sel.visible = false;
	objectID1_sel.selectedIndex = 0;
	objectID2_sel.visible = false;
	objectID2_sel.selectedIndex = 0;
	relationships_grid.editable = false;
	deleteRelationship_btn.label = "Delete Relationship";
	deleteRelationship_btn.enabled = false;
	createRelationship_btn.label = "New Relationship";
	getRelationships();
	}

deleteRelationship_btn.click = function(ev) {		
	if (ev.target.label == "Delete Relationship") {
		Alert.show("Are you sure you wish to delete the " + relationships_grid.selectedItem.RELATIONSHIP_NAME + " relationship?","Delete " + relationships_grid.selectedItem.RELATIONSHIP_NAME +" Property?",
		Alert.OK | Alert.CANCEL, _parent,deleteRelationshipConfirm);
	}	
	
	if (ev.target.label == "Cancel") {
	relationships_grid.editable = false;
	deleteRelationship_btn.label = "Delete Relationship";
	createRelationship_btn.label = "New Relationship";
	objectID1_sel.visible = false;
	objectID1_sel.selectedIndex = 0;
	objectID2_sel.visible = false;
	objectID2_sel.selectedIndex = 0;
	relationships_grid.dataProvider.removeItemAt(0);
	_root.application.status_txt.text = "";
	}			
}

function deleteRelationshipConfirm(ev) {
	if (ev.detail == Alert.OK) {
		_root.application.status_txt.text = 'Deleting Relationship...';
		oRelationshipControlService.deleteRelationshipType(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName,
		relationships_grid.selectedItem.RELATIONSHIP_NAME);
		//relationships_grid.selectedItem.RELATIONSHIP_ICON.unloadMovie(mcRelationship);
		//relationships_grid.dataProvider.setPropertiesAt(relationships_grid.selectedIndex, {RELATIONSHIP_ICON:"", RELATIONSHIP_NAME:"", PARENT_CLASS:"", RELATED_CLASS:"",DESCRIPTION:""});
		//relationships_grid.dataProvider.replaceItemAt(relationships_grid.selectedIndex,{RELATIONSHIP_ICON:"", RELATIONSHIP_NAME:"", PARENT_CLASS:"", RELATED_CLASS:"",DESCRIPTION:""});
		relationships_grid.dataProvider.removeItemAt(relationships_grid.selectedIndex);
		
	}
}
deleteRelationshipType_Result = function(bRelationshipDeleted){
	getRelationships();
	relationships_grid.editable = false;
	deleteRelationship_btn.label = "Delete Relationship";
	createRelationship_btn.label = "New Relationship";
	deleteRelationship_btn.enabled = false;
	_root.application.status_txt.text = "";
	}

this.objectID1_sel.getClasses = function(event) {
	var aClasses = event.target.concat();
	objectID1_sel.dataProvider = aClasses;
	objectID1_sel.labelField = 'CLASS_LABEL';
	objectID1_sel.selectedIndex = 0;
}

this.objectID2_sel.getClasses = function(event) {
	var aClasses = event.target.concat();
	objectID2_sel.dataProvider = aClasses;
	objectID2_sel.labelField = 'CLASS_LABEL';
	objectID2_sel.selectedIndex = 0;
}

relationships_grid.change = function(ev) {
	deleteRelationship_btn.enabled = true;
}

function setupGrid() {

	//classProperties_grid
	relationships_grid.editable = false;
	relationships_grid.resizableColumns = false; 
	relationships_grid.addEventListener("change",relationships_grid);

	var column = new DataGridColumn("RELATIONSHIP_ICON");
	column.headerText = "";
	column.editable = false;
	column.width = 25;
	column.cellRenderer = "RelationshipIconCellRenderer";
	relationships_grid.addColumn(column);
	
	var column = new DataGridColumn("RELATIONSHIP_NAME");
	column.headerText = "Relationship Name";
	column.width = 130;
	relationships_grid.addColumn(column);
	
	var column = new DataGridColumn("PARENT_CLASS");
	column.headerText = "Parent Class";
	column.width = 114;
	relationships_grid.addColumn(column);
	
	var column = new DataGridColumn("RELATED_CLASS");
	column.headerText = "Related Class";
	column.width = 114;
	relationships_grid.addColumn(column);
	
	var column = new DataGridColumn("DESCRIPTION");
	column.headerText = "Description";
	column.width = 230;
	relationships_grid.addColumn(column);

}

//