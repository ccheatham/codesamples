import mx.controls.Alert;
login_btn.addEventListener('click',login_btn);
tabsSecurity_btn.useHandCursor = false;

createEmptyMovieClip ("loginBoundBox_mc", 1);
with (loginBoundBox_mc) {
lineStyle (.5,_global.boundingBoxBorderColor, 100);
beginFill(_global.boundingBoxFillColor);
lineTo (540, 0);
lineTo (540, 128.0);
lineTo (0, 128.0);
lineTo (0, 0);
endFill();
_x = 71;
_y = 207;
swapDepths(login_btn.getDepth() - 1);
}
///////////////////////////////////////////////////////////////

login_btn.click =  function(oEvent){
	
	if(password_txt.text != ''){
		serverVarsService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.flash.flashServerVars", login_btn);
		_root.application.status_txt.text = 'Authenticating...';
		serverVarsService.checkPassword(password_txt.text);
		} 
	else{
		
		Alert.show('message','Incorrect Password',Alert.OK);
		}	
	}
	
login_btn.checkPassword_Result = function(results){
	_root.application.status_txt.text = '';
	if(!results){
		Alert.show('message','Incorrect Password',Alert.OK);	
		password_txt.text = '';
		} 
	else{
			_global.hideAllBelow(_root.application);
			_root.application.login_scr.tabsSecurity_btn._x = 1000;
			//_root.application.login_scr.visible = false;
			_root.application.forklift_scr.visible = true;
			_global.oGlobalData.profileSo.data.password = password_txt.text;
			_global.oGlobalData.loadForkliftSettings();
			_global.oGlobalData.getClasses();
		}
	}