package com.pimsol.components
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	
	import mx.graphics.SolidColor;
	
	import skins.RetryButton;
	
	import spark.components.BorderContainer;
	import spark.components.Button;
	import spark.components.RichEditableText;

	
	[Event(name="retry", type="flash.events.MouseEvent")]	
	[Event(name="close", type="flash.events.MouseEvent")]
	public class FileContainer extends BorderContainer
	{
		
		private var _file:File;
		private var _type:String;
		private var _message:String = '';
		
		
		
		public function FileContainer()
		{
			this.height = 30;
			super();
		}
		
		public function get message():String
		{
			return _message;
		}

		public function set message(value:String):void
		{
			_message = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get file():File
		{
			return _file;
		}

		public function set file(value:File):void
		{
			_file = value;
		}

		public function create():void
		{
			
			this.height = 35;
			
			var label:RichEditableText = new RichEditableText();
			var maxStrLen:int = 32;
			var strLabel:String = file.name;
			this.styleName = "fileBorderContainer";
			
			label.verticalCenter = 0;
			label.left = 5;
			label.editable = false;
			label.selectable = true;
			
			if(this.type=='complete')
			{
				label.text = 'COMPLETE! ' + (strLabel.length >=  maxStrLen ? strLabel.slice(0,maxStrLen) + '... ' : strLabel) +  ' successfully uploaded. \nMD5 Signature: ' + this.message;
				this.toolTip = 'COMPLETE! ' + strLabel +  ' successfully uploaded.';
				this.backgroundFill = new SolidColor(0x4F8C07,.5);
				var closeBtn:spark.components.Button = new spark.components.Button();
				closeBtn.right = 5;
				closeBtn.styleName="darkText";
				closeBtn.setStyle("skinClass", skins.CloseButton);
				closeBtn.verticalCenter=0;
				closeBtn.addEventListener(MouseEvent.CLICK,closeBtnHandler);
				this.addElement(closeBtn);
			}
			
			if(this.type=='loading')
			{
				label.text =(strLabel.length >=  maxStrLen ? strLabel.slice(0,maxStrLen) + '... ' : strLabel) +  '';
				this.toolTip = 'LOADING ' + strLabel +  '...';
				label.verticalCenter = -2;
				this.backgroundFill = new SolidColor(0x0071BC,.5);
			}
			
			
			if(this.type=='cancelled')
			{
				label.text = 'CANCELLED! ' + (strLabel.length >=  maxStrLen ? strLabel.slice(0,maxStrLen) + '... ' : strLabel) +  ' already exists. \nMD5 Signature: ' + this.message;
				this.toolTip = 'CANCELLED! ' + strLabel +  ' already exists.';
				this.backgroundFill = new SolidColor(0xFFCF0F,.5);
				var cancelledCloseBtn:spark.components.Button = new spark.components.Button();
				cancelledCloseBtn.right = 5;
				cancelledCloseBtn.styleName="darkText";
				cancelledCloseBtn.setStyle("skinClass", skins.CloseButton);
				cancelledCloseBtn.verticalCenter=0;
				cancelledCloseBtn.addEventListener(MouseEvent.CLICK,closeBtnHandler);
				this.addElement(cancelledCloseBtn);
			}
			
			if(type=='incomplete')
			{
				label.text = 'ERROR! ' + (strLabel.length >=  maxStrLen ? strLabel.slice(0,maxStrLen) + '... ' : strLabel) +  '  unsuccessful load.';
				this.toolTip = 'ERROR! ' + strLabel +  ' unsuccessful load.';
				this.backgroundFill = new SolidColor(0xC1272D,.5);
				var errorCloseBtn:spark.components.Button = new spark.components.Button();
				errorCloseBtn.right = 5;
				errorCloseBtn.styleName="darkText";
				errorCloseBtn.setStyle("skinClass", skins.CloseButton);
				errorCloseBtn.verticalCenter=0;
				errorCloseBtn.addEventListener(MouseEvent.CLICK,closeBtnHandler);
				var retryBtn:spark.components.Button = new spark.components.Button();
				retryBtn.label = 'retry';
				retryBtn.right = 25;
				retryBtn.styleName="darkText";
				retryBtn.setStyle("skinClass", skins.RetryButton);
				retryBtn.verticalCenter=0;
				retryBtn.addEventListener(MouseEvent.CLICK,retryBtnHandler);
				this.addElement(retryBtn);
				this.addElement(errorCloseBtn);
			}
			
			this.addElement(label);

		}
		
		protected function closeBtnHandler(event:MouseEvent):void
		{
			var clsEvent:Event = new MouseEvent("close");
			dispatchEvent(clsEvent);
		}
		
		protected function retryBtnHandler(event:MouseEvent):void
		{
			var retryEvent:Event = new MouseEvent("retry");
			dispatchEvent(retryEvent);
		}
	}
}