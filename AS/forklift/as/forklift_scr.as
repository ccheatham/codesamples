//set up code
serverInfo_txt.text = _global.serverInfo;
cfcPath_txt.text = _global.cfcPath;
//event handlers

//general functions
this.tabClick = function(ev) {
	_global.hideAllBelow(_root.application);
	this.visible = true;
}