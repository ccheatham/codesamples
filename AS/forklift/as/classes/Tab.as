import mx.events.EventDispatcher;

[Event("tabClick")]

class as.classes.Tab extends MovieClip {
	private var aClasses:Array;
	public var addEventListener:Function;
	public var removeEventListener:Function;
	private var dispatchEvent:Function;
	
public function Tab() {
	//enable for dispatch
	EventDispatcher.initialize(this);
	}

public function onPress(){
	dispatchEvent({type:"tabClick",target:this});
	}

public function swapSelected(){
	if(this._alpha == 50)
	this._alpha = 100;
	else
	this._alpha = 50;
	}
}