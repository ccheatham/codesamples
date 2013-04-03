//****************************************************************************
//Copyright (C) 2003 Macromedia, Inc. All Rights Reserved.
//The following is Sample Code and is subject to all restrictions on
//such code as contained in the End User License Agreement accompanying
//this product.
//****************************************************************************

class as.classes.RelationshipIconCellRenderer extends MovieClip
{

	var relationshipIcon : MovieClip;

	function RelationshipIconCellRenderer()
	{
		this.createEmptyMovieClip("relationshipIcon",100);
	}

	function setValue(str:String, item:Object, sel:Boolean) : Void
	{
		
		if(item==undefined)
			{
			this.relationshipIcon.unloadMovie();
			}
		else
			{
			this.relationshipIcon.attachMovie("mc_Relationship","mcRelationship",100);
			this._width = 18.1;
			this._height = 6.4;
			this._x = 2;
			this._y = 6;
			}
	}

}
