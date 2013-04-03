<cfparam name="user" default="#aries.security.getuserinfo().username#">
<cfparam name="currentSystem" default="#aries.getParam('currentProject')#">


<cfoutput>
<script language="JavaScript1.2">

 <!--- TODO:Migrate BreadCrumbs and integrate with traversing the document tree  --->

	breadCrumbTextWidth = 25;	
	
	
	function BreadCrumb(elementId,nodeType,nodeId)
	{
		this.elementId = elementId;
		this.nodeType = nodeType;
		this.nodeId = nodeId;
	};
	
	BreadCrumb.prototype = 
	{
		getElementId: function()
		{
			return this.elementId;
		},
		getNodeType: function()
		{
			return this.nodeType;
		},
		getNodeId: function()
		{
			return this.nodeId;
		}
	};

	breadCrumbToolBar = new Ext.Toolbar
	(
		{
			region:'north',
			height:25,
			listeners:
			{
				'render' : function()
				{
					
					//var nodeId = Ext.getCmp('master_doc_tree').getRootNode().id;
					//var nodeText = Ext.getCmp('master_doc_tree').getRootNode().firstchild.text;
					var nodeId = 0;
					var nodeText = 'System Performance Specification AVNS-PRF-10750';
					
					var rootBreadCrumb = new Ext.Button
					(
						{
							id:'rootBreadCrumb',
							text:Ext.util.Format.ellipsis(nodeText,breadCrumbTextWidth),
							tooltip:nodeText,
							icon: '#aries.nav.srcUrl()#/ext2/resources/icons/page_key.png',
							cls: 'x-btn-text-icon', 
							handler:onClickRootBreadCrumb
			   	 		}	
			   	 	)
					addBreadCrumb(rootBreadCrumb,'',nodeId);
				}
			}
		}
	);
	
	function addBreadCrumb(toolBarItem,nodeType,nodeId){

		if(typeof(breadCrumbs) == 'undefined')
			breadCrumbs = new Array();	
			
		// maybe add creation of button here
		
		
		breadCrumbs.push(new BreadCrumb(toolBarItem.id,nodeType,nodeId));

		//add breadcrumb spacer
		if(breadCrumbs.length > 1)
		{
		 	var breadCrumbSpan = document.createElement("span");
  			breadCrumbSpan.innerHTML = "&nbsp;&nbsp;<img src='<cfoutput>#aries.nav.srcUrl()#</cfoutput>/ext2/resources/icons/arrow_right.png' />&nbsp;&nbsp;";
  			breadCrumbSpan.setAttribute('style', 'font-size:8px;');
  			breadCrumbSpan.setAttribute('id', 'breadCrumbSpan'+breadCrumbs.length);				
			breadCrumbToolBar.addElement(breadCrumbSpan);
		}		
		breadCrumbToolBar.add(toolBarItem);
		setRootNode(nodeId,nodeType);
	};
	
	function findPositionInArray(elementId){
		for (i=0;i < breadCrumbs.length;i++)
		{
			if(breadCrumbs[i].getElementId() == elementId){
				return i;
			}
		}
		return -1;
	}

	//	When this function gets called the removeFromToolbarItem should be passed
	//	this value should represent the object on the toolbar where you want the breadcrumbs 
	//	truncated up to.
	function removeBreadCrumbs(item){
		var removeFromPosition = findPositionInArray(item.id);
		for (i=breadCrumbs.length-1;i>removeFromPosition;i--)
		{
			Ext.getCmp(breadCrumbs[i].getElementId()).destroy();
			var repbreadCrumbSpan = document.createElement("span");
			var originalBreadCrumbSpan = document.getElementById('breadCrumbSpan'+(i+1));
			var rem_breadCrumbSpan = originalBreadCrumbSpan.parentNode.replaceChild(repbreadCrumbSpan,originalBreadCrumbSpan);
			breadCrumbs.pop(i);
		}
			var thisBreadCrumb = breadCrumbs[breadCrumbs.length-1];
			var nodeId = thisBreadCrumb.getNodeId();
			var nodeType = thisBreadCrumb.getNodeType();

			
			
			setRootNode(nodeId,nodeType);
		
	};
	
	function getCurrentBreadCrumb()
	{
		var thisBreadCrumb = breadCrumbs[breadCrumbs.length-1];
		return thisBreadCrumb;
	}
	
	function onClickRootBreadCrumb(item){
		removeBreadCrumbs(item);
	};
	
	function onItemClick(item){
		removeBreadCrumbs(item);
    };	
    
   function setRootNode(nodeId,nodeType)
	{
		var rootNode = Ext.getCmp('master_doc_tree').getRootNode();
		
			rootNode.id = nodeId;
			rootNode.reload();
			rootNode.select();
			rootNode.fireEvent('beforeclick',rootNode)

	}
   
   function arrayToList(array,item)
   {
	   var r_List = '';
	   for(var i=0; i < array.length; i++)
	   {
	    	r_List =  r_List + ((i + 1)  ==  array.length ?  array[i][item]  :  array[i][item] + ',');
	   }
   }
   
    function isdefined(variable){
    	if(typeof(variable) != 'undefined')
    	{
    		return true;
    	}
    	else
    	{
    		return false;
    	}
    };

</script>

</cfoutput>

