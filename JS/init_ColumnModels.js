<!---
    FILE INFO: (init_Stores.cfm) 
    DESCRIPTION: JavaScript init function for Ext2 dataStores
    PARAMETERS: 
    USAGE:  cfinclude
    CHANGE HISTORY:  
        created - bsh/cmb
 --->
<cfoutput>
<script language="JavaScript1.2">
function loadColumnModels() {
	 

function isArray(obj) {
   if (obj.constructor.toString().indexOf("Array") == -1)
      return false;
   else
      return true;
}


	 cm_masterdoc = new Ext.grid.ColumnModel
	 (
		 [
		 	{
			header: "Label",
	        dataIndex: 'document_label',
	        width:260
	        },
	        {
           header: "No. Versions",
           dataIndex: 'children',
		   width: 100,
		   align: 'center'

        }
		]
	);
    // by default columns are sortable
    cm_masterdoc.defaultSortable = true;
	 
	 
 	 cm_masterdoc_assigned_docs = new Ext.grid.ColumnModel
	 (
		 [
		 	{
			header: "Name",
	        dataIndex: 'document_name',
	        width:260,
	        fixed:true
	        },
	        {
           header: "Version Date",
           dataIndex: 'document_date',
		    width: 75,
			renderer: Ext.util.Format.dateRenderer('m/d/Y')
        },
 		{  
			header: '',
			fixed: true,
			width:50,
			resizable:false,
			draggable:false,
			//align:'center',
			renderer: function(v, params, record) {
			    // in the onclick of the following line the grid has to be active first before the store is available 
				// suspect - due to the panel is lazy rendering
			    // activate tab first 
			    // then load store   Ext.util.Format.lowercase(record.data.hasReq)
				//+  (record.data.document_type_id == 2)?"details":"clear" +
				var myButton = ""
				
					if(record.data.open_document == 'true')
					{
			     		var mimetype = Ext.util.Format.lowercase(record.data.file_mime_type);
						var layouttypestring = '';
						
						if (mimetype = 'TXT')
							{
								layouttypestring = 'PDF';
							}
						else
							{
								layouttypestring = '';
							}
						
						
						//link only the requirement docs that have requirements
						myButton = "<a class='details' href='##'  id='btn_" +record.data.document_id + "' value='..' onclick='{ Ext.getCmp(\"panel_main_tabs\").setActiveTab(1); Ext.getCmp(\"grid_req\").store.baseParams={mode:\"req\",xid:"+record.data.document_id+"}; Ext.getCmp(\"grid_req\").store.load({params:{start:0, limit:25,mode:\"req\",xid:"+record.data.document_id+"}}); }'><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></a>"
						myButton = myButton + "&nbsp;&nbsp;<a class='"+ Ext.util.Format.lowercase(record.data.file_mime_type) +"report' href='##'  id='preview_" +record.data.document_id + "' value='...' onclick='{ Ext.getCmp(\"win_form_edit_master_doc\").hide(); var p = new Ext.ux.ManagedIframePanel({frameConfig:{autoCreate: {id:\"frame" +record.data.document_id + "\"},disableMessaging:true,src:\"/servlet/content?document_id="+record.data.document_id + "&deliveryMethod=inline" +"\"},id:\"framePanel1" +record.data.document_id + "\",autoScroll:true,plain:true,title:\"" + Ext.util.Format.ellipsis(record.data.document_name,12)+"\"});  var xtab = Ext.getCmp(\"panel_main_tabs\").add(p);  Ext.getCmp(\"panel_main_tabs\").setActiveTab(xtab)  }' ><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></a>"
						
						
						
					}
					else
					{
						myButton = "<span class='clear' id='btn_" +record.data.document_id + "' value='..'><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></span>"
					}

			    return myButton;                     
			 		   
			   } 
		} 
		]
	);
    // by default columns are sortable
    cm_masterdoc_assigned_docs.defaultSortable = true;
	 

	 cm_doc = new Ext.grid.ColumnModel([{
		header: "",
        dataIndex: 'icon',
		width: 25,
		hidden: false,
		renderer: function(v, params, record) {
			    return "<img src=#aries.nav.srcURL()#/ext2/resources/icons/" + record.data.icon + " width='16'></a>";                     
			   } 
		},
		{header: "Document Number/Name",
        dataIndex: 'document_name',
		width: 170,
		hidden: false
		<cfif aries.security.userhasaccess("_editDoc")>
		,editor: new Ext.grid.GridEditor(
			new Ext.form.TextField({
				allowBlank: false
			})
		)
		</cfif>	
        },{
        
           header: "Document Title/Subject",
           dataIndex: 'file_title',
		   width: 300,
		   hidden: false
		   <cfif aries.security.userhasaccess("_editDoc")>
			,editor: new Ext.grid.GridEditor(
				new Ext.form.TextField(
					{
						allowBlank: false
					}
				)
			)
		   </cfif>
        },
		
		{
           header: "Doc Type",
           dataIndex: 'document_type_id',
		   width: 210
		  
		   <cfif aries.security.userhasaccess("_editDoc")>
		   ,editor: new Ext.grid.GridEditor(
		   
		   		new Ext.form.ComboBox(
						{
							typeAhead: false,
							triggerAction:'all',
							lazyRender: true,
							store: store_doctypes,
							displayField: 'type_name',
							valueField: 'type_id'
						} ) 
		  
		  )
		  </cfif>
		  
		  ,renderer: function(v, params, record) {
				record2 = store_doctypes.getById(v);
				if(record2){
					return record2.data.type_name;
				} else {
					return (record.data.type_name);
				}
			}
        } ,
		
		{
           header: "Date",
           dataIndex: 'document_date',
		    width: 150,
			renderer: Ext.util.Format.dateRenderer('m/d/Y')
			<cfif aries.security.userhasaccess("_editDoc")>
			,editor: new Ext.grid.GridEditor(
				new Ext.form.DateField(
					{
						format:'m/d/Y'
					}
				)
			)
			</cfif>
        },
 		{  //cm_doc
			header: '',
			fixed: true,
			width:50,
			resizable:false,
			draggable:false,
			//align:'center',
			renderer: function(v, params, record) {
			    // in the onclick of the following line the grid has to be active first before the store is available 
				// suspect - due to the panel is lazy rendering
			    // activate tab first 
			    // then load store   Ext.util.Format.lowercase(record.data.hasReq)
				//+  (record.data.document_type_id == 2)?"details":"clear" +
				var myButton = ""
				
					    var mimetype = Ext.util.Format.lowercase(record.data.file_mime_type);
						var layouttypestring = '';
					
						if (mimetype == 'TXT')
							{
								layouttypestring = 'PDF';
							}
						else
							{
								layouttypestring = '';
							}
				
				
					if(record.data.open_document == 'true')
					{
			     		//link only the requirement docs that have requirements
						myButton = "<a class='details' href='##'  id='btn_" +record.data.document_id + "' value='..' onclick='{ Ext.getCmp(\"panel_main_tabs\").setActiveTab(1); Ext.getCmp(\"grid_req\").store.baseParams={mode:\"req\",xid:"+record.data.document_id+"}; Ext.getCmp(\"grid_req\").store.load({params:{start:0, limit:25,mode:\"req\",xid:"+record.data.document_id+"}}); }'><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></a>"
						myButton = myButton + "&nbsp;&nbsp;<a class='"+ Ext.util.Format.lowercase(record.data.file_mime_type) +"report' href='##'  id='preview_" +record.data.document_id + "' value='...' onclick='{ var p = new Ext.ux.ManagedIframePanel({frameConfig:{autoCreate: {id:\"frame" +record.data.document_id + "\"},disableMessaging:true,src:\"/servlet/content?document_id="+ record.data.document_id + "&deliveryMethod=inline" + "\"},id:\"framePanel1" + record.data.document_id + "\",autoScroll:true,plain:true,title:\"" + Ext.util.Format.ellipsis(record.data.document_name,12)+"\"});  var xtab = Ext.getCmp(\"panel_main_tabs\").add(p);  Ext.getCmp(\"panel_main_tabs\").setActiveTab(xtab)  }' ><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></a>"
					}
					else
					{
						myButton = "<span class='clear' id='btn_" +record.data.document_id + "' value='..'><img src='#aries.nav.srcURL()#/ext2/resources/images/s.gif' width='16'></span>"
					}

			    return myButton;                     
			 		   
			   } 
		} 
		
		
		
	]);
    // by default columns are sortable
    cm_doc.defaultSortable = true;
	

	//Attribute Column Model
	cm_attrib = new Ext.grid.ColumnModel([
		
		{  
           header: "attribute_id",
           dataIndex: 'attribute_id',
           hidden: true,
		   width:10
        },
		{
           header: "Name",
           dataIndex: 'attribute_name',
		   width: 130
		   
        },
		{
           header: "Value",
           dataIndex: 'attribute_value',
           id: 'id_attribute_value',
		   width:170,
		   editor: new Ext.grid.GridEditor(
				new Ext.form.TextField(
					{
						allowBlank: true
					}
				)
			),
			
			renderer: function(v, params, record) {
				var type = record.data['attribute_type'];
				var store = record.data['attribute_store'];
				var hstore;
				var record2;
				if(store)
				{
					hstore = eval("store_"+ store);
					record2 = hstore.getById(v);
					if(record2){
						return (record2.data.type_name)
					} else {
						return (record.data.attribute_value);
					}
				}
				else
				{
					if(record.data.attribute_name == "TTS Tasking Number")
					{
						var aTTSNumbers = record.data.attribute_value.split(',');
						var returnStr = '';
							
						for (var i=0;i < aTTSNumbers.length;i++)
							{
								returnStr += '<a href="https://aed-tts.amrdec.army.mil/tts/frameset.asp?TN=' +  aTTSNumbers[i]  + '" target="_blank">' + aTTSNumbers[i] +  ' </a> '
								
								if(i < (aTTSNumbers.length-1))
									returnStr += ','
							}
						return returnStr;
					}
					else
					{
						return (record.data.attribute_value)
					}
				}
			}
        } 
	]);

    // by default columns are sortable
    cm_attrib.defaultSortable = true;

};



</script>
</cfoutput>