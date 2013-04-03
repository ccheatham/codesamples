//****************************************************************************
//Copyright (C) 2003 Macromedia, Inc. All Rights Reserved.
//The following is Sample Code and is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying
//this product.
//****************************************************************************

class as.classes.ClassPropertyIconCellRenderer extends MovieClip
{

	var propertyIcon : MovieClip;

	function ClassPropertyIconCellRenderer()
	{
		this.createEmptyMovieClip("propertyIcon",100);
	}

	function setValue(str:String, item:Object, sel:Boolean) : Void
	{
		
		if(item==undefined)
			{
			this.propertyIcon.unloadMovie();
			}
		else
			{
			this.propertyIcon.attachMovie("mc_Property","mcProperty",100);
			this._width = 7.2;
			this._height = 5.4;
			this._x = 4;
			this._y = 6;
			}
	}

}
