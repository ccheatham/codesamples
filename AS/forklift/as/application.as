#include "forkliftStyles.as"
#include "NetServices.as"
#include "NetDebug.as"

//set up application level styles
setApplicationStyles();
_global.boundingBoxFillColor = 0xDFE6CA;
_global.boundingBoxBorderColor = 0x000000;
//status text blank
status_txt.autoSize = true;
status_txt.text = "Loading Application... Please wait...";

//set up gateway information
if (_root.serverInfo == undefined)
	_global.serverInfo = "127.0.0.1";
else
	_global.serverInfo = _root.serverInfo;
	
if (_root.cfcPath == undefined)
	_global.cfcPath = "forklift.forkliftComponents.";
else
	_global.cfcPath = _root.cfcPath;
	
NetServices.setDefaultGatewayUrl("http://" + serverInfo + "/flashservices/gateway/");
_global.gatewayObj = NetServices.createGatewayConnection();
_global.oGlobalData = new as.classes.GlobalDataBinder();

//global functions
function filterObjectArray (aArrayToFilter,selectedOption,propertyToCheck,bBoolean,bData) {
	var aFiltered = new Array();
	var index = 0;
	
	if (selectedOption != "all") {
		for (var i=0;i<aArrayToFilter.length;i++) {
			if (bBoolean) {
				if (aArrayToFilter[i][propertyToCheck] && selectedOption) {
					aFiltered[index] = aArrayToFilter[i];
					index++;
				}
				else if (! aArrayToFilter[i][propertyToCheck] && ! selectedOption) {
					aFiltered[index] = aArrayToFilter[i];
					index++;
				}
			}
			else if (bData){
				if (aArrayToFilter[i].data[propertyToCheck] == selectedOption) {
					aFiltered[index] = aArrayToFilter[i];
					index++;
				}
				
				}
			else {
				if (aArrayToFilter[i][propertyToCheck] == selectedOption) {
					aFiltered[index] = aArrayToFilter[i];
					index++;
				}		
			}
		}
	}
	else
		aFiltered = aArrayToFilter;
	
	return aFiltered;
}

_global.filterObjectArray = filterObjectArray;

function hideAllBelow(currentForm) {
	//trace(currentForm.numChildForms);
	if (currentForm.numChildForms > 0) {
		for(var i = 0;i < currentForm.numChildForms;i++) {
			currentForm.getChildForm(i).visible = false;
			if (currentForm.getChildForm(i).numChildForms > 0)
				hideAllBelow(currentForm.getChildForm(i));
		}		
	}
}
_global.hideAllBelow = hideAllBelow;

login_scr.tabsSecurity_btn._x = 15.9;

forkliftTab_mc.tabLabel_txt.text = 'Forklift';
settingsTab_mc.tabLabel_txt.text = 'Settings';
applicationsTab_mc.tabLabel_txt.text = 'Applications';
classesTab_mc.tabLabel_txt.text = 'Classes';
relationshipsTab_mc.tabLabel_txt.text = 'Relationships';

_global.oGlobalData.addEventListener("loadForkliftSettings",this.settings_scr);

_global.oGlobalData.addEventListener("loadApplications",this.applications_scr);
_global.oGlobalData.addEventListener("loadDbPersistors",this.applications_scr);
_global.oGlobalData.addEventListener("loadDataSources",this.applications_scr);

_global.oGlobalData.addEventListener("getClasses",this.classes_scr.classes_grid);
_global.oGlobalData.addEventListener("getClasses",this.classes_scr.objectType_sel);

_global.oGlobalData.addEventListener("getClasses",this.relationships_scr.objectID1_sel);
_global.oGlobalData.addEventListener("getClasses",this.relationships_scr.objectID2_sel);

forkliftTab_mc.addEventListener('tabClick',this);
forkliftTab_mc.addEventListener('tabClick',forklift_scr);
settingsTab_mc.addEventListener('tabClick',this);
settingsTab_mc.addEventListener('tabClick',settings_scr);
applicationsTab_mc.addEventListener('tabClick',this);
applicationsTab_mc.addEventListener('tabClick',applications_scr);
classesTab_mc.addEventListener('tabClick',this);
classesTab_mc.addEventListener('tabClick',classes_scr);
relationshipsTab_mc.addEventListener('tabClick',this);
relationshipsTab_mc.addEventListener('tabClick',relationships_scr);

var selectedTabDepth = forkliftTab_mc.getDepth();
var selectedTab = forkliftTab_mc;

this.tabClick = function(event){
	event.target.swapDepths(selectedTabDepth);
	event.target.swapSelected();
	selectedTab.swapSelected();
	selectedTab = event.target;
}
