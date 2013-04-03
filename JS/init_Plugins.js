<!---
    FILE INFO: (init_Plugins.cfm) 
    DESCRIPTION: JavaScript init function for Ext2 dataStores
    PARAMETERS: 
    USAGE:  cfinclude
    CHANGE HISTORY:  
        created - bsh/cmb
        0007243,prg; 
        0007281,prg
 --->
<script language="JavaScript1.2">
function loadPlugins() {
	
	//Opens the requirements records to view expanded detail
	
	Ext.app.rowexpander_req = new Ext.grid.RowExpander({
			 tpl : new Ext.Template(
				'<br><p><b>Source:</b> {document_name}</p>',
				'<br><p><b>Paragraph:</b><p>{requirement_text}</p><br>' 
			 	)
			})
	
	Ext.app.rowexpander_link_req = new Ext.grid.RowExpander({
			 tpl : new Ext.Template(
				'<br><p><b>Source:</b> {document_name}</p>',
				'<br><p><b>Paragraph:</b><p>{requirement_text}</p><br>' 
			 	)
			})
			
	Ext.app.rowexpander_issue = new Ext.grid.RowExpander({
			 tpl : new Ext.XTemplate(
				'<br><p><b>Document Name:</b> {document_name}</p>',
				'<br><p><b>Document Title:</b><p>{document_title}</p><br>', 
				'<br><p><b>Resolution:</b>',
				'<div style=\'border: 1px solid #ccc;padding:2px;padding:5px 15px 15px 5px\'>',
					'<p>{issue_resolution}</p><br>',
				'</div>',
				'<tpl if="comments.length &gt; 0">',
					'<br><p><b>Comments:</b></p>',
					'<div style=\'border: 1px solid #ccc;padding:2px;\'>',
					    '<tpl for="comments">',
							'<div style=\'border-left: 1px solid #ccc;border-bottom: 1px solid #eee;padding:5px 15px 15px 15px\'><div style=\'float:left\'><p><b>Submitted by:</b> {comment_person}<p></div><div style=\'float:right\'><p><b>Date:</b> {comment_datestamp}</p></div></div>',
							'<div style=\'border-left: 1px solid #ccc;border-bottom: 1px solid #ccc;padding:5px 15px 15px 15px\'><div><p>{comment_text}<p></div></p></div>',
					    '</tpl>', 
					'</div>',
				 '</tpl>',
				 '<tpl if="comments.length &lt; 1">',
					'<div></div>',
				 '</tpl>'
			 	)
			})
			

	//used to create a dual-button search field at top of grid
	Ext.app.SearchField = Ext.extend(Ext.form.TwinTriggerField, {
	    initComponent : function(){
	       var task = new Ext.util.DelayedTask(this.onTrigger2Click,this);
	       Ext.app.SearchField.superclass.initComponent.call(this);
	       this.on('keyup', function(f,e){
	        		      task.delay(500);
	            	},this);

<!--- 	            this.on('keypress', function(f,e){
	            		if(this.id == 'att_value_search')
	            			Ext.getCmp("panel_main_tabs").setActiveTab(1);
	            	},this); --->
	    },

	    fireKey : function(e) 
	    {
            this.fireEvent(e.type, this, e);    
         },

		initEvents : function() 
		{
			this.el.on("focus", this.onFocus,  this);
			this.el.on("blur", this.onBlur,  this);
			this.el.on("keydown", this.fireKey, this);
			this.el.on("keypress", this.fireKey, this);
			this.el.on("keyup", this.fireKey, this);
        },
		
	    validationEvent:false,
	    validateOnBlur:false,
	    trigger1Class:'x-form-clear-trigger',
	    trigger2Class:'x-form-search-trigger',
	    hideTrigger1:true,
	    width:180,
	    hasSearch : false,
	    paramName : 'query',
	
	    onTrigger1Click : function(){
	        if(this.hasSearch){
	            var masterDocTreeSelectedNodeId = Ext.getCmp('master_doc_tree').getSelectionModel().getSelectedNode().id;
	            this.el.dom.value = '';
	            
	            
		        if(Ext.getCmp("panel_main_tabs").getActiveTab().id == 'panel_document')
		        {
					this.store = store_docs;
					var o = {start: 0};
				}	
				else
				{
					this.store = store_docs_all_assigned;
					var o = {start: 0,document_id:masterDocTreeSelectedNodeId};
		        }
		        
	            this.store.baseParams = this.store.baseParams || {};
	            this.store.baseParams[this.paramName] = '';
	            this.store.reload({params:o});
	            this.triggers[0].hide();
	            this.hasSearch = false;
	        }
	    },
	
	    onTrigger2Click : function(){
			var masterDocTreeSelectedNodeId = Ext.getCmp('master_doc_tree').getSelectionModel().getSelectedNode().id;	    	
	        var v = this.getRawValue();
	        
	        if(v.length < 1){
	            this.onTrigger1Click();
	            return;
	        }
	        
	        
	        if(Ext.getCmp("panel_main_tabs").getActiveTab().id == 'panel_document')
	        {
				this.store = store_docs;
				var o = {start: 0};
			}	
			else
			{
				this.store = store_docs_all_assigned;
				var o = {start: 0,document_id:masterDocTreeSelectedNodeId};
	        }
	        
	        this.store.baseParams = this.store.baseParams || {};
	        this.store.baseParams[this.paramName] = v;
	        this.store.reload({params:o});
	        this.hasSearch = true;
	        this.triggers[0].show();
	    }
	});

	
	
	Ext.ux.FileSelector = Ext.extend(	Ext.form.TwinTriggerField, {
	
		initComponent : function(){
		     Ext.ux.FileSelector.superclass.initComponent.call(this);
		          
		     this.triggerConfig = {
			          tag:'span', cls:'x-form-twin-triggers', cn:[
			          {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger1Class},
			          {tag:'span', cls:'ux-cabinet ', cn:[
			              {tag: "img", id: this.name + "Selector", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger2Class},                          
			              {tag: "div", id: this.name + "Wrapper", cls: "ux-input-file-wrapper ", cn: [
			                  {tag: "input", name: this.name + "FILE", type: "file", cls: "ux-file", id: this.name + "File"}
			              ]}
			      ]},
			      {tag: "input", name: this.name + "Keep", type: "checkbox", cls:"x-hidden", id: this.name + "Keep", value: 1}
		      
		      ]};         
		            
		      var v = this.getRawValue();
		      if(v.length > 0){
		          this.hasValue = true;
		        this.uxInitialValue = v;                                                      
		        }          
		    
		    this.on("render", this.uxStylizeTrigger, this);        
		},

	    uxInitialValue: false,
	
	    name: 'file',
	    readOnly: true,
	    validationEvent:false,
	    validateOnBlur:false,
	    trigger1Class:'x-form-clear-trigger',
	    trigger2Class:'x-form-search-trigger',
	    hideTrigger1:true,
	    width:180,
	    hasValue : false,
	    paramName : false,
    
    

	    onTrigger1Click : function(){
	        if(this.hasValue){            
	            this.triggers[0].hide();
	            this.hasValue = false;
	            
	            if(this.uxInitialValue) {
	            var keep = Ext.get(this.name + "Keep");
	            keep.dom.checked = true;
	            
	            this.setValue(this.uxInitialValue);
	        } else {
	            this.setValue('');    
	        }
	        
	        
	        var input = Ext.get(this.name + "File");        
	        input.remove();
	                    
	        var wrapper = Ext.get(this.name + "Wrapper");
	        Ext.DomHelper.append(wrapper, {tag: "input", name: this.name + "FILE", type: "file", cls: "ux-file", id: this.name + "File"});        
	                
	        var input_new = Ext.get(this.name + "File");            
	        input_new.on("change", this.uxHandleFile, this);          
	        }
	    },
	
	    onTrigger2Click : function(){
	      this.hasValue = true;  
	      this.triggers[0].show();    
	      
	
	        var keep = Ext.get(this.name + "Keep");
	        keep.dom.checked = false;                    
	      
	            
	    },
	    
	    uxHandleFile : function() {
	
	        var input = Ext.get(this.name + "File");                                  
	                     
	            //if this is unix style structure replace / with \
	            var filePath = input.dom.value;        
	            
	            //extract the filename from the value
	            var indexPos = filePath.lastIndexOf('\\');
	            var fileName = filePath.substring(indexPos + 1);
	
	            this.setValue(fileName);           
	            
	            search = /(zip|tar|gz)$/i;
	            
	            if(search.test(fileName)) {
	                  //will add the possibility to extract on server
	                  //createArchiveCheck(input);
	            }
	            
	            this.onTrigger2Click();                  
	    },
	    
	    uxStylizeTrigger : function(){
	        
			if(this.hasValue) {
	            	var keep = Ext.get(this.name + "Keep");
	            	keep.dom.checked = true;                    
			}
	        
	        var trigger = Ext.get(this.name + "Selector");
	        var wrapper = Ext.get(this.name + "Wrapper");
	        var input = Ext.get(this.name + "File");
	                    
	        input.on("change", this.uxHandleFile, this);
	        
	        trigger.file = wrapper;        
	        trigger.on("mousemove", function(e) {                                                
	                        
	            var pageX = e.xy[0];
	            var pageY = e.xy[1];            
	            
	            ox = this.getX();
	            oy = this.getY();
	
	            var x = pageX - ox;
	            var y = pageY - oy;
	            var w = this.file.getWidth();
	            var h = this.file.getHeight();
	                                            
	            this.file.setTop(y - (h / 2) + 'px');
	            this.file.setLeft(x - (w - 15) + 'px');
	        });                    
	    }
	});  


	
};

</script>