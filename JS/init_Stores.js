<!---
    FILE INFO: (init_Stores.cfm) 
    DESCRIPTION: JavaScript init function for Ext2 dataStores
    PARAMETERS: 
    USAGE:  cfinclude
    CHANGE HISTORY:  
        created - bsh/cmb
        0007243,prg; 
        0007281,prg
 --->
 
  <cfquery name="getSelectTypes" datasource="#aries.getDSN()#">
 	Select distinct data_type
	from attribute_prototype
	where data_type like 'select_%'
	And system_id = #currentSystem#
 </cfquery>
<!---  <cfquery name="getSelectIssue" datasource="#aries.getDSN()#">
 	Select distinct type_code
	from type_table
	where type_code like 'issue%'
	And system_id = #currentSystem#
 </cfquery> --->

<cfoutput>

   <!--- <cfdocument filename="top_default_#TimeFormat(Now(),"HH_mm_ss")#.pdf" format="PDF" overwrite="Yes">
      <!--- <cfoutput>#whichMVC#</cfoutput> --->
         <cfdump var="#form#" label="Form">
         <cfdump var="#url#" label="URL">
   </cfdocument> --->

<script language="JavaScript1.2">

   function dumpProps(obj, parent) {
      // Go through all the properties of the passed-in object 
      for (var i in obj) {
         // if a parent (2nd parameter) was passed in, then use that to 
         // build the message. Message includes i (the object's property name) 
         // then the object's property value on a new line 
         if (parent) { var msg = parent + "." + i + "\n" + obj[i]; } else { var msg = i + "\n" + obj[i]; }
         // Display the message. If the user clicks "OK", then continue. If they 
         // click "CANCEL" then quit this level of recursion 
         if (!confirm(msg)) { return; }
         // If this property (i) is an object, then recursively process the object 
         if (typeof obj[i] == "object") { 
            if (parent) { dumpProps(obj[i], parent + "." + i); } else { dumpProps(obj[i], i); }
         }
      }
   }

loadStores = function(){ ///goes to ~line 369

	<!---  loop through the supporting stores  --->
	<!--- need to load these first so when the attributes display they will show correctly --->
	<cfloop query="getSelectTypes">
		<cfset storename = listgetat(getselecttypes.data_type,2,"_")>
		//supporting stores for attributes

		//Store for Editor Pulldown list for Document Type
		store_#storename# = new Ext.data.Store({
		        // load using HTTP
		        url: '#mvclink('DataAccess.getAttributeData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#&mode=support&typecode=#storename#',
				id:'store_#storename#',
		        // the return will be XML, so lets set up a reader
		        reader: new Ext.data.XmlReader({
		               // records will have an "Item" tag
		               record: 'rec',
		               id: 'type_id',
		               totalRecords: 'maxrows'
		           }, [
		               // set up the fields mapping into the xml doc
						{name: 'type_id', type: 'int'},
						{name: 'type_name', type: 'string'}
		           ])
		    });
		store_#storename#.load();
	</cfloop>

	  //Store for Saved Searches
   store_saved_searches = new Ext.data.Store({
           // load using HTTP
           url: '#mvclink('DataAccess.getSavedSearches')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
           id:'store_saved_searches',
           // the return will be XML, so lets set up a reader
           reader: new Ext.data.XmlReader({
                  // records will have an "Item" tag
                  record: 'rec',
                  id: 'search_id',
                  totalRecords: 'maxrows'
           }, [
                 // set up the fields mapping into the xml doc
                 {name: 'search_id'  , type: 'int'},
                 {name: 'user_name'  , type: 'string'},
                 {name: 'user_id'    , type: 'int'},
                 {name: 'is_global'  , type: 'string'},
                 {name: 'search_name', type: 'string'},
                 {name: 'params'     , type: 'string'}
              ])
       });

   store_saved_searches.load();

   //alert(store_saved_searches.data.getCount());

	//dumpProps(store_saved_searches);

	//Store for Editor Pulldown list for Document Type
	store_doctypes = new Ext.data.Store({
	        // load using HTTP
	        url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#&mode=doctypes',
			  id:'store_doctypes',
	        // the return will be XML, so lets set up a reader
	        reader: new Ext.data.XmlReader({
	               // records will have an "Item" tag
	               record: 'rec',
	               id: 'type_id',
	               totalRecords: 'maxrows'
	         }, [
	               // set up the fields mapping into the xml doc
					  {name: 'type_id', type: 'int'},
					  {name: 'type_name', type: 'string'}
	            ])
	    });
	store_doctypes.load();

	
	//Store for Editor Pulldown list for Document Type
	store_doctypes_filter = new Ext.data.Store({
	        // load using HTTP
	        url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#&mode=doctypesfilter',
			id:'store_doctypes_filter',
	        // the return will be XML, so lets set up a reader
	        reader: new Ext.data.XmlReader({
	               // records will have an "Item" tag
	               record: 'rec',
	               id: 'type_id',
	               totalRecords: 'maxrows'
	           }, [
	               // set up the fields mapping into the xml doc
					{name: 'type_id', type: 'int'},
					{name: 'type_name', type: 'string'}
	           ])
	    });
	
	store_doctypes_filter.load();

	datetypes = [["ko_received_date","KO Received Date"],["ko_response_date","KO Response Date"],["aed_received_date","AED Received Date"],["aed_complete_date","AED Completed Date"]];

	store_doc_date_types = new Ext.data.SimpleStore({
	    fields: ['fieldname', 'fieldlabel'],
   		data : datetypes
	});


	//store for Document listing (UNASSIGNED - CBC 13JAN09)
	store_docs = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
		id:'store_docs',
		remoteSort : true,
		
		listeners:{
			'beforeload':function()
			{
				Ext.getCmp("panel_assigned_document").disable();
			}
 			,
			'load':function(){		
					Ext.getCmp("panel_assigned_document").enable();
			} 
		},		

		baseParams:{mode:'doc',unassignedToMasterOnly:1,document_type:'KO Letter',whichTab:'unassignedToMasterOnly'}, //PRG
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'document_id',
               totalRecords: 'maxrows'
           }, [
               // set up the fields mapping into the xml doc
				{name: 'document_id', type: 'int'},
				//onload of records convert the data to htmlformat
				{name: 'document_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'file_title', mapping:'document_title',  type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'document_version', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },

				{name: 'document_date', type:'date'},
				{name: 'document_type_id', type:'int'},
				{name: 'type_name', type:'string'},
				{name: 'file_mime_type', type:'string'},
				{name: 'icon', type:'string'},
				{name: 'open_document', type:'string'}

           ])
    });
	store_docs.setDefaultSort('document_name', 'asc');
	//store_docs.load({params:{start:0, limit:25}});

	store_docs_all = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#&mode=doc',
		id:'store_docs_all',
		//remoteSort : true,
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'document_id',
               totalRecords: 'maxrows'
           }, [
               // set up the fields mapping into the xml doc
				{name: 'document_id', type: 'int'},
				//onload of records convert the data to htmlformat
				{name: 'document_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'document_title', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'document_version', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				
				{name: 'document_date', type:'date'},
				{name: 'document_type_id', type:'int'},
				{name: 'type_name', type:'string'}
				
           ])
    });
	
	//Attribute Store
	store_attribs = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getAttributeData')#&layout_type=xml&t=' + Math.floor(Math.random()*101),
		id:'store_attribs',
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'record_id',
               totalRecords: 'maxrows'
           }, [
               // set up the fields mapping into the xml doc
			    {name: 'record_id', type: 'int'},
				{name: 'attribute_id', type: 'int'},
				//onload of records convert the data to htmlformat
				{name: 'attribute_type', type: 'string'},
				{name: 'attribute_editable', type: 'int'},
				{name: 'attribute_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'attribute_value', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'attribute_store' },
				{name: 'entity_id' },
				{name:'attribute_prototype_id'}
           ])
	});

	//
	store_attribs.setDefaultSort('record_id', 'asc');


	//Attribute Prototype Store (Used to build document type fieldsets in Add New Document)
	store_attribute_prototype = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getAttributes')#&layout_type=xml&t=' + Math.floor(Math.random()*101),
		  id:'store_attribute_prototype',
		  autoLoad:false,
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'record_id',
               totalRecords: 'maxrows'
           }, [
			    {name: 'record_id', type: 'int'},
				{name: 'attribute_id'},
				{name: 'document_id'},
				{name: 'attribute_prototype_id'},
				{name: 'attribute_value'},
				{name: 'attribute_type', type: 'string'},
				{name: 'attribute_editable', type: 'int'},
				{name: 'attribute_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))}},
				{name: 'attribute_store'}
           ])
	});

// alert('getCount 1 in init_Stores = ' + store_attribute_prototype.getCount()); // this is also 0
//alert(store_attribute_prototype);

   //Attribute Prototype Store (Used to build document type fieldsets in Advanced Search panel)
   store_attribute_prototype2 = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getAttributes')#&layout_type=xml&t=' + Math.floor(Math.random()*101),
        id:'store_attribute_prototype2',
        autoLoad:false,
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'record_id',
               totalRecords: 'maxrows'
           }, [
            {name: 'record_id', type: 'int'},
            {name: 'attribute_id'},
            {name: 'document_id'},
            {name: 'attribute_prototype_id'},
            {name: 'attribute_value'},
            {name: 'attribute_type', type: 'string'},
            {name: 'attribute_editable', type: 'int'},
            {name: 'attribute_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))}},
            {name: 'attribute_store'}
           ])
   });

//alert('getCount 2 in init_Stores = ' + store_attribute_prototype2.getCount()); // this is 0
//alert(store_attribute_prototype2);
	
	//store_attribute_prototype.load();
	//store_attribute_prototype2.load();

	store_attribute_prototype.setDefaultSort('record_id', 'asc');

   store_attribute_prototype2.setDefaultSort('record_id', 'asc');

//var cboDocumentType2 = '';

		var connObj = new Ext.data.Connection({ 
		            timeout : 30*1000, 
		            url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#', 
		            method : 'POST'
		        });
	//store for Document listing (ALL ASSIGNED - CBC 13JAN09)

		store_docs_all_assigned = new Ext.data.Store({
        // load using HTTP
        
		id:'store_docs_all_assigned',
		remoteSort : true,
		proxy : new Ext.data.HttpProxy(connObj),
		listeners:{
			'beforeload':function()
			{
				<cfif aries.security.userhasaccess("_viewUnassignedDocuments")>
					Ext.getCmp("panel_document").disable();
				</cfif>
			}
 			,
			'load':function(){
				<cfif aries.security.userhasaccess("_viewUnassignedDocuments")>
					Ext.getCmp("panel_document").enable();
				</cfif>
			} 
		},
	
		baseParams:{mode:'doc',assignedToMasterOnly:1,whichTab:'assignedToMasterOnly'}, //PRG
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'document_id',
               totalRecords: 'maxrows'
           }, [
               // set up the fields mapping into the xml doc
				{name: 'document_id', type: 'int'},
				//onload of records convert the data to htmlformat
				{name: 'document_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'file_title', mapping:'document_title',  type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'document_version', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				
				{name: 'document_date', type:'date'},
				{name: 'document_type_id', type:'int'},
				{name: 'type_name', type:'string'},
				{name: 'file_mime_type', type:'string'},
				{name: 'icon', type:'string'},
				{name: 'open_document', type:'string'}
				
           ])
    });

	store_docs_all_assigned.setDefaultSort('document_name', 'asc');
	//store_docs_all_assigned.load({params:{start:0, limit:25,document_id:6}});
	
		//This store is used by the Master Document Edit Panel to house documents associated to a given Master Doc
	store_docs_assigned = new Ext.data.Store({
        // load using HTTP
        url: '#mvclink('DataAccess.getData')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
		id:'store_docs_assigned',
		remoteSort : false,
		

		baseParams:{document_id:null,mode:'doc',assignedOnly:1},
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'document_id',
               totalRecords: 'maxrows'
           }, [
               // set up the fields mapping into the xml doc
				{name: 'document_id', type: 'int'},
				//onload of records convert the data to htmlformat
				{name: 'document_name', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'file_title', mapping:'document_title',  type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				{name: 'document_version', type: 'string', convert:function(v) {return Ext.util.Format.htmlDecode(unescape(v))} },
				
				{name: 'document_date', type:'date'},
				{name: 'document_type_id', type:'int'},
				{name: 'type_name', type:'string'},
				{name: 'file_mime_type', type:'string'},
				{name: 'open_document', type:'string'}
				
           ])
    });

	store_docs_assigned.setDefaultSort('document_date', 'desc');
	
}  //End of loadStores function

	//This store is used to populate the groups for checkboxes in the Set Permissions option of the MD tree's context menu
	store_doc_groups = new Ext.data.Store({
		url:'#mvclink('DocumentSecurity.getAllDocumentGroups')#&layout_type=xml&t=#replace(createuuid(),"-","","ALL")#',
		id:'store_doc_groups',
        // the return will be XML, so lets set up a reader
        reader: new Ext.data.XmlReader({
               // records will have an "Item" tag
               record: 'rec',
               id: 'record_id',
               totalRecords: 'maxrows'
           }, [
           		{name: 'record_id', type: 'int'},
           		{name: 'group_id', type: 'int'},
				{name: 'group_name', type: 'string'}
           ])
	});

</script>
</cfoutput>

