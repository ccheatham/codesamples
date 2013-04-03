//set up code
import mx.controls.Alert;
changePassword_btn.addEventListener("click",changePassword_btn);
saveSettings_btn.addEventListener("click",saveSettings_btn);
my_color = new Color(newPasswordBounder_mc);
my_color.setRGB(0xffffff);

oFlashServerVarsService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.flash.flashServerVars",this);

createEmptyMovieClip ("forkLiftSettings_mc", 1);
with (forkLiftSettings_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (540, 0);
lineTo (540, 175);
lineTo (0, 175);
lineTo (0, 0);
endFill();
_x = 71;
_y = 88;
swapDepths(flClassURI_txt.getDepth() - 1);
}

createEmptyMovieClip ("passwordSquare_mc", 1);
with (passwordSquare_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (540, 0);
lineTo (540, 138);
lineTo (0, 138);
lineTo (0, 0);
endFill();
_x = 71;
_y = 285;
swapDepths(newPassword_txt.getDepth() - 1);
}

//event handlers
this.tabClick = function(ev) {
	_global.hideAllBelow(_root.application);
	this.visible = true;
}

function createBoundingBox (movieClipInstanceName, xCoordinate,yCoordinate,boxWidth,boxHeight,lowestClip) {
	createEmptyMovieClip ("forkLiftSettings_mc", 1);
	with (forkLiftSettings_mc) {
    lineStyle (.5,0x000000 , 100);
    beginFill( 0xFFFFFF );
    lineTo (500, 0);
	lineTo (500, 185);
	lineTo (0, 185);
	lineTo (0, 0);
	endFill();
	_x = 91;
	_y = 55;
	swapDepths(newPassword_txt.getDepth()-1);
	}
}

this.loadForkliftSettings = function(event) {
	oForkliftSettings = event.target;
	flAdminURL_txt.text = event.target.ADMINWEBHTTP;
	flInstallLocation_txt.text = event.target.INSTALLLOCATION;
	flClassURI_txt.text = event.target.FLASHCOMURI;
	installError_txt.text = "";
	URIError_txt.text = "";
	URLError_txt.text = "";
}

changePassword_btn.click = function(event){
	if(newPassword_txt.text != "" && newPassword_txt.text == confirmNewPassword_txt.text){
		_root.application.status_txt.text = 'Setting new password...';
		oFlashServerVarsService.changePassword(oForkliftSettings.ADMINPASSWORD,newPassword_txt.text);
		}
	else{
		Alert.show('Passwords do not match or are blank','Password Error',Alert.OK);
		}
}

saveSettings_btn.click = function(event) {
	if (flClassURI_txt.text != "" &&  flInstallLocation_txt.text != "" && flAdminURL_txt.text != "") {
		_root.application.status_txt.text = 'Updating Forklift Server Settings...';
		installError_txt.text = "";
		URIError_txt.text = "";
		URLError_txt.text = "";
		oFlashServerVarsService.updateServerSettings(oForkliftSettings.ADMINPASSWORD,flAdminURL_txt.text,flInstallLocation_txt.text,flClassURI_txt.text);
	}
	else {
		Alert.show('Settings can not be blank.','Settings Error',Alert.OK);
	}
}


//general functions
function changePassword_Result (passwordChanged) {
	if(passwordChanged){
		Alert.show('Password change successfull.','Password Changed',Alert.OK);
		_global.oGlobalData.profileSo.data.password = newPassword_txt.text;
		_global.oGlobalData.profileSo.flush();
		oForkliftSettings.ADMINPASSWORD = _global.oGlobalData.profileSo.data.password;
		confirmNewPassword_txt.text = '';
		newPassword_txt.text = '';
		_root.application.status_txt.text = '';
		}
}

function updateServerSettings_Result (aResults) {
	_root.application.status_txt.text = '';
	if(aResults[0] == "error") {
		Alert.show('Settings update unsuccessfull.','Settings Error',Alert.OK);
		for (var i=1;i < aResults.length;i++) {
			if (aResults[i].indexOf("directory") > -1) {
				installError_txt.text = aResults[i];
			}
			else if (aResults[i].indexOf("URI")  > -1) {
				URIError_txt.text = aResults[i];
			}
			else if (aResults[i].indexOf("URL")  > -1) {
				URLError_txt.text = aResults[i];
			}
		}
	}
	else {
		Alert.show('Settings saved successfully.','Settings Saved',Alert.OK);
	}
}