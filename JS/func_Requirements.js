<!---
    FILE INFO: (init_Plugins.cfm) 
    DESCRIPTION: JavaScript init function for Ext2 dataStores
    PARAMETERS: 
    USAGE:  cfinclude
    CHANGE HISTORY:  
        created - bsh/cmb
 --->

<script language="JavaScript1.2">
	function loadFunctions_Requirements() {

	//document editing functionality - submission
	<cfoutput>	
	grid_doc_edit.on('afteredit', function (e){
            Ext.Ajax.request(
                {
                    //waitMsg: 'Saving changes, please wait...',
                    <!--- url:'update.php?ac=saveData&field='+oGrid_event.field+'&row='+oGrid_event.row+'&value='+oGrid_event.value, //php function that saves the data --->
					url:'#mvclink('DataAccess.updateUDData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
					params:{doc_id:e.record.data.document_id, action:"updateField", field:e.field, value:(e.value.format)? e.value.format('m/d/Y'):e.value },
                    success:function(form, action) {
                        e.record.commit();
                    },
                    failure: function(form, action) {
                        Ext.MessageBox.alert("Save Error","Your edit was not saved.");
                    }
                }
            );
        });
	</cfoutput>
	
			
	// grid_doc listeners
<!--- 	gsm_doc = grid_doc.getSelectionModel();
	gsm_doc.on('rowselect', function(selectionModel){gridOnRowSelect(selectionModel,'document_id','doc');}); --->
	
	
	//grid_edit_doc listeners
	
	
/* 	//grid_doc_edit selection model listener
	gsm_doc_edit = grid_doc_edit.getSelectionModel();
	grid_doc_edit.store.on('load', gsm_doc_edit.selectFirstRow, gsm_doc_edit);
	gsm_doc_edit.on('rowselect', function(selectionModel){gridOnRowSelect(selectionModel,'document_id','doc');}); */
	
	

	function gridOnRowSelect(selectionModel,field_name,mode)
	{
		var curRecord = selectionModel.getSelected();
		var rec_id = curRecord.data[field_name];
		
		store_attribs.load({params:{start:0, limit:25, xid:rec_id, mode:mode}});
		store_attribs.setDefaultSort('record_id', 'asc');
	}
	
	
	function gridOnDblClick(obj,rowIndex,event,field_name,mode)
	{
		var curRow = obj.view.getRow(rowIndex);
        var curRecord = obj.store.getAt(rowIndex);
		var rec_id = curRecord.data[field_name];
		
		//alert(rec_id);
		if(mode == 'req')
		{
			store_reqs.load({params:{start:0, limit:25, xid:rec_id, mode:mode}});
			Ext.getCmp('panel_main_tabs').setActiveTab(1);
			//panel_main_tabs.gettActiveTab().title;
		};
		//alert(mode);
	}
	
	form_new_master_doc.on({
		actioncomplete: function(form, action){
			if(action.type == 'load'){
				Ext.getCmp('form_new_master_doc_submit').enable();
				form_new_master_doc.show();
			}
		} 
	});
	
	form_edit_master_doc.on({
		actioncomplete: function(form, action){
			if(action.type == 'load'){
				Ext.getCmp('form_edit_master_doc_submit').enable();
				form_edit_master_doc.show();
			}
		} 
	});
	
	
	document_form.on({
		actioncomplete: function(form, action){
			if(action.type == 'load'){
				Ext.getCmp('document_form_submit').enable();
				document_form.show();
			}
		} 
	});
	
	grid_attrib.startEditing = function(row, col)
	{
		//goes first
		grid_attrib.stopEditing();
		if(grid_attrib.colModel.isCellEditable(col, row))
		{
			//goes 2nd
			grid_attrib.view.focusCell(row, col);
			var r = grid_attrib.getSelectionModel().getSelected();
			var field = grid_attrib.colModel.getDataIndex(col);
			var type = r.data['attribute_type'];
			var store = r.data['attribute_store'];
			
			var e = {
				grid: this,
				record: r,
				field: field,
				value: r.data[field],
				row: row,
				column: col,
				cancel:false
			};
		
			if(grid_attrib.fireEvent("beforeedit", e) !== false && !e.cancel)
			{
				grid_attrib.editing = true; // flag for buffering of orphan key strokes
				(function()	{ // complex but required for focus issues in safari, ie and opera
					var ed ;
					//goes last
					//alert(type)
					if(type == 'select')
					{
						hstore = eval("store_"+ store);
					}
					// Get editor based on the 'type' field
					switch(type){
						default:
						case 'text' : ed = new Ext.grid.GridEditor(new Ext.form.TextField({})); break;
						case 'string' : ed =  (r.data.attribute_editable == 1  ?  new Ext.grid.GridEditor(new Ext.form.TextField({}))    :   new Ext.grid.GridEditor(new Ext.form.TextField({readOnly:true})) ); break;
						case 'longtext' : ed = new Ext.grid.GridEditor(new Ext.form.TextArea({})); break;
						case 'decimal' : ed = new Ext.grid.GridEditor(new Ext.form.NumberField({})); break;
						case 'number' : ed = new Ext.grid.GridEditor(new Ext.form.NumberField({})); break;
						case 'boolean' : ed = new Ext.grid.GridEditor(new Ext.form.Checkbox({})); break;
						case 'date' : ed = new Ext.grid.GridEditor(new Ext.form.DateField({format:'m/d/Y'})); break;
						case 'select' : ed = new Ext.grid.GridEditor(new Ext.form.ComboBox({typeAhead:false,triggerAction:'all',lazyRender:true,store:hstore,displayField:'type_name',valueField:'type_id'})); break;
					}						 	
					
						
						ed.row = row;
						ed.col = col;
						ed.record = r;
						ed.on("complete", grid_attrib.onEditComplete, this, {single: true});
						ed.on("specialkey", grid_attrib.selModel.onEditorKey, grid_attrib.selModel);
						grid_attrib.activeEditor = ed;
						var v = r.data[field];
						ed.startEdit(grid_attrib.view.getCell(row, col), v);
				}).defer(50, this);
			}
		}
	} // end of attrib startediting
	
	<cfoutput>
	//document editing functionality - submission
	
	grid_attrib.on('afteredit', function (e){
            Ext.Ajax.request(
                {
					url:'#mvclink('DataAccess.updateAttributeData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
					params:{attrib_id:e.record.data.attribute_prototype_id,entity_id:e.record.data.entity_id, action:"updateField", field:e.field, value:(e.value.format)? e.value.format('m/d/Y'):e.value },
                    success:function(response) {
                        e.record.commit();
                       	if(e.record.data.attribute_name == 'Status')
                       	{
                     		 
                       		  var oResponse = Ext.decode(response.responseText);
                       		  var working_grid = Ext.getCmp('panel_main_tabs').getActiveTab().getComponent(0);
                       		  var thisrecord = working_grid.store.getById(oResponse.record_id);
                       		  thisrecord.set('icon',oResponse.icon);
                       		  thisrecord.commit();	  
                       	}
                    },
                    failure: function(response) {
                        Ext.MessageBox.alert("Save Error","Your edit was not saved.");
                    }
                }
            );
        });
	}	
</cfoutput>
</script>