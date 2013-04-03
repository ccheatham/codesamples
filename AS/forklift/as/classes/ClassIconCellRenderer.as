//****************************************************************************
//Copyright (C) 2003 Macromedia, Inc. All Rights Reserved.
//The following is Sample Code and is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying
//this product.
//****************************************************************************

class as.classes.ClassIconCellRenderer extends MovieClip
{

	var classIcon : MovieClip;

	function ClassIconCellRenderer()
	{
		this.createEmptyMovieClip("classIcon",100);
	}

	function setValue(str:String, item:Object, sel:Boolean) : Void
	{
		
		if(item==undefined)
			{
			this.classIcon.unloadMovie();
			}
		else
			{
			this.classIcon.attachMovie("mc_Object","mcObject",100); //fixed icon not dropping in grid - ACM
			this._width = 13;
			this._height = 12.7;
			this._x = 2;
			this._y = 2;
			}
	}

}
