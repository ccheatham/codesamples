import mx.events.EventDispatcher;

[Event("loadApplications")]
[Event("loadDataSources")]
[Event("loadDbPersistors")]
[Event("loadForkliftSettings")]
[Event("getClasses")]

class  as.classes.GlobalDataBinder {
	private var aApplications:Array;
	private var aDataSources:Array;
	private var aDbPersistors:Array;
	private var aClasses:Array;
	private var oForkliftSettings:Object;
	private var oFlashServerVarsService:Object;
	private var oClassControlService:Object;
	public var testString:String;

	public var addEventListener:Function;
	public var removeEventListener:Function;
	private var dispatchEvent:Function;
	public var profileSo:Object;
	
	function GlobalDataBinder() {
		//enable for dispatch
		EventDispatcher.initialize(this);
		//get shared profile object
		profileSo = SharedObject.getLocal("profile");
		if(profileSo.data.applicationName == undefined){
			profileSo.data.applicationName = '';
			profileSo.data.password = '';
			profileSo.flush();	
			}
		if(profileSo.data.bFilterClassSystemProperties == undefined){
		   profileSo.data.bFilterClassSystemProperties = false;
		   }
		
		oFlashServerVarsService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.flash.flashServerVars",this);
		oClassControlService = _global.gatewayObj.getService(_global.cfcPath + "persistence.admin.classcontrol",this);
	}
	
	public function getClasses() {
		oClassControlService.getClasses(_global.oGlobalData.profileSo.data.password,_global.oGlobalData.profileSo.data.applicationName);
	}
	
	private function getClasses_Result (results) {
		aClasses = results;
		dispatchEvent({type:"getClasses",target:aClasses});
	}
	
	public function loadForkliftSettings() {
		oFlashServerVarsService.getServerVars(profileSo.data.password);
	}
	
	private function getServerVars_Result (results) {
		oForkliftSettings = results;
		dispatchEvent({type:"loadForkliftSettings",target:oForkliftSettings});
		dispatchEvent({type:"loadApplications",target:oForkliftSettings.AAPPLICATIONS});
		dispatchEvent({type:"loadDbPersistors",target:oForkliftSettings.APERSISTENCETYPES});
		dispatchEvent({type:"loadDataSources",target:oForkliftSettings.ADATASOURCES});
	}
}