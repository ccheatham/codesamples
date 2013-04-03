<cfcomponent output="false">

<cffunction output="true" name="onHelp">
   <em>
      This is the main view for EAQMS data.</br>
   Functions:
     1.  insertTempParamRecord(): Inserts current form data into a temp record for later use in saving searches.
     2.  insertSavedSearch(): Deletes temp record data and inserts saved data information.
     3.  rptData(): Retrieves a list of saved searches.
     4.  render(): Main display.
   </em>
</cffunction>

<cffunction output="true" name="onChangeLog">
   <div><strong>09/30/2010, prg</strong> | version 0.0.0.1 | Issue 0007243 | Added Advanced Search capability.</div>
   <div><strong>11/19/2010, prg</strong> | version 0.0.0.1 | Issue 0007281 | Added Saved Search capability.</div>
   <div><strong>08/16/2011, prg</strong> | version 1.0.0.1 | Issue 0011641 | Resolved Date field error.</div>
   <div><strong>08/18/2011, prg</strong> | version 1.0.1.0 | Issue 0011651 | Added Required text to certain form fields.</div>
   <div><strong>08/25/2011, prg</strong> | version 1.0.1.1 | Issue 0011668 | Fixed Top-level XML error.</div>
   <div><strong>08/25/2011, prg</strong> | version 1.0.1.1 | Issue 0011680 | Fixed bottom bar navigation error on unassigned docs save.</div>
</cffunction>

<cffunction name="insertTempParamRecord" output="true">
   <cfparam name="search_params" default="">

   <cftry>

      <cfquery datasource="#aries.getDsn()#" name="clearTempTable1">
         DELETE
         FROM saved_searches_temp
         WHERE user_id =  #aries.getuserid()#
      </cfquery>

      <cfquery datasource="#aries.getDsn()#" name="insertTempRecord">
	      INSERT INTO SAVED_SEARCHES_TEMP
	      (user_id,
	       params)
	      VALUES
	      (#aries.getuserid()#,
	       '#search_params#')
      </cfquery>

   <cfcatch>
      <cfdocument filename="error.pdf" format="PDF" overwrite="Yes">
         <cfdump var="#cfcatch#" label="catch">
      </cfdocument>
   </cfcatch>
   </cftry>
</cffunction>

<cffunction name="insertSavedSearch" output="yes">
   <cfparam name="url.search_name" default="" />
   <cfparam name="form.search_name" default="url.search_name"  />
   <cfparam name="form.is_global" default="" />
   <cfparam name="search_params" default="" />

   <cfset var retVal = structnew()>
   <cfset retVal['success']=true>
   <cfset retVal['errorMsg']='success'> 
   <cftry>

      <cflock name="jsonlock_#aries.getuserid()#" timeout="10">

         <cfquery datasource="#aries.getDSN()#" name="getData" result="getDataResult">
            SELECT search_name FROM SAVED_SEARCHES
            WHERE search_name LIKE '#form.search_name#'
         </cfquery>

       <cfif getData.recordCount is 0>

            <cfset ariesUser = #aries.getuserid()#>

          <cfquery datasource="#aries.getDSN()#" name="getParams">
             SELECT params
             FROM saved_searches_temp
             WHERE user_id =  #aries.getuserid()#
          </cfquery>

          <cfquery datasource="#aries.getAriesDSN()#" name="getUserData">
             SELECT username, user_id FROM ARIES.ARIES_USER
             WHERE USER_ID = #ariesUser#
          </cfquery>

         <cfquery datasource="#aries.getDSN()#" name="saveReport">
            INSERT INTO SAVED_SEARCHES
            (user_name,
             user_id,
             is_global,
             search_name)
            VALUES
            ('#getUserData.username#',
             #getUserData.user_id#,
             '#form.is_global#',
             '#form.search_name#')
         </cfquery>

         <!--- Get search_id from last inserted SAVED_SEARCHES record --->
         <cfquery datasource="#aries.getDSN()#" name="get_search_id">
            SELECT IDENT_CURRENT('SAVED_SEARCHES') AS SEARCH_ID
            FROM SAVED_SEARCHES
         </cfquery>

         <cfset paramString = #getParams.params#>
         <cfloop index="i" list="#paramString#" delimiters=",">
            <cfset leftLimit = Find("|", i)-1>
            <cfset rightLimit = Find("|", i)+1>
            <cfset theName = #Mid(i, 1, leftLimit)#>
            <cfset theValue = #Mid(i, rightLimit, Len(i))#>

	         <cfquery datasource="#aries.getDSN()#" name="saveAttributeLookupData">
	            INSERT INTO SEARCH_ATTRIB_LOOKUP
	            (search_id,
	             column_name,
	             column_value)
	            VALUES
	            ('#get_search_id.search_id#',
	             '#theName#',
	             '#theValue#')
	         </cfquery>
         </cfloop>

         <cfquery datasource="#aries.getDsn()#" name="clearTempTable2">
            DELETE
            FROM saved_searches_temp
            WHERE user_id =  #aries.getuserid()#
         </cfquery>

       </cfif>
      </cflock>


      <cfcatch type="any">
         <cfset retval['success']=false>
         <cfset retval['errorMsg'] = cfcatch.Message>
      </cfcatch>

   </cftry>    

<cfreturn retval />
</cffunction>


<cffunction name="rptData" output="true"> 
         <cfquery datasource="#aries.getDSN()#" name="qry_rpt" result="rptDataResult">
            SELECT search_name FROM SAVED_SEARCHES
         </cfquery>

      <cfoutput>
         #aries.json.encode(qry_rpt,'array','lower')#
      </cfoutput>             
</cffunction>

<cffunction  name="render">

<cfparam name="user" default="#aries.security.getuserinfo().username#">
<cfparam name="currentSystem" default="#aries.getParam('currentProject')#">

<cfquery datasource="#aries.getDSN()#" name="docstypes">
   SELECT type_id,type_code,type_name
   FROM type_table
   WHERE type_code = 'document'
   And system_id = #currentSystem#
   ORDER BY type_name
</cfquery>

<cfquery datasource="#aries.getDsn()#" name="hasDocsInTrash">
   Select document_id
   From document 
   Where inTrash = 1
</cfquery>

   <cfquery name="getSelectTypes" datasource="#aries.getDSN()#">
    Select distinct data_type
    from attribute_prototype
    where data_type like 'select_%'
    And system_id = #currentSystem#
  </cfquery>

<cfoutput>
<body>

<link rel="stylesheet" type="text/css" href="#aries.nav.srcURL()#/ext2/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="#aries.nav.srcURL()#/ext2/resources/css/#aries.getSystemParam('ext_theme')#.css" />
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/ext-all.js"></script>
<!---<script type='text/javascript' src='http://getfirebug.com/releases/lite/1.2/firebug-lite-compressed.js'></script>--->
<!-- <script type="text/javascript" src="javascript/ext_extended.js"></script> -->
<script>
//override original Ext.data.XMLReader so a function can be passed in the mapping and an array of objects can be returned
Ext.data.XmlReader=function(A,B){A=A||{};Ext.data.XmlReader.superclass.constructor.call(this,A,B||A.fields)};
Ext.extend(Ext.data.XmlReader,Ext.data.DataReader,
   {
      read:function(A){
         var B=A.responseXML;if(!B){
         throw {message:"XmlReader.read: XML Document not available"}
         }
         return this.readRecords(B)
      },
      readRecords:function(T){
         this.xmlData=T;var N=T.documentElement||T;
         var I=Ext.DomQuery;
         var B=this.recordType,L=B.prototype.fields;
         var D=this.meta.id;
         var G=0,E=true;
         if(this.meta.totalRecords){
            G=I.selectNumber(this.meta.totalRecords,N,0)
         }
         if(this.meta.success){
            var K=I.selectValue(this.meta.success,N,true);
            E=K!==false&&K!=="false"
         }
         var Q=[];
         var U=I.select(this.meta.record,N);
         for(var P=0,R=U.length;P<R;P++){
            var M=U[P];
            var A={};
            var J=D?I.selectValue(D,M):undefined;
            for(var O=0,H=L.length;O<H;O++){
               var S=L.items[O];
               var F;
               if(typeof S.mapping == "function"){
                  F=S.mapping(M);
               }else{
                  F=I.selectValue(S.mapping||S.name,M,S.defaultValue);
               }
               F=S.convert(F);
               A[S.name]=F
            }
            var C=new B(A,J);
            C.node=M;
            Q[Q.length]=C
         }
            return{success:E,records:Q,totalRecords:G||Q.length}
      }
   }
);
</script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/mediapanel/mediapanel.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/miframe/miframe.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/rowexpander/RowExpander.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/menu/EditableItem.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/menu/RangeMenu.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/GridFilters.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/Filter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/StringFilter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/DateFilter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/ListFilter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/NumericFilter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/filter/ux/grid/filter/BooleanFilter.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/fusion/uxmedia.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/fusion/uxflash.js"></script>
<script type="text/javascript" src="#aries.nav.srcURL()#/ext2/plugins/fusion/uxfusion.js"></script>

<style>
   .ux-file{position: absolute; height: 22px; width: auto; right: 0px; opacity: 0; -moz-opacity: 0; filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);}
   .ux-cabinet {position: relative;}
   .ux-input-file-wrapper {position: absolute; display: block; height: 22px; width: 18px; overflow: hidden;}
   
   .pdfreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_acrobat.png);}
   .docreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_word.png);}
   .txtreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white.png);}
   .htmlreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_word.png);}
   .pptreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_powerpoint.png);}
   .xlsreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_excel.png);}
   .xlsxreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_excel.png);}
   .zipreport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/page_white_compressed.png);}
   .imagereport{background-image: url(#aries.nav.srcURL()#/ext2/resources/icons/image.png);}
   

   .context_menu_loading_icon {background-image: url(#aries.nav.srcUrl()#/coldext3/ext/images/SilverCherry/grid_loading.gif); }
   .context_menu_delete_icon {background-image: url(#aries.nav.srcUrl()#/ext2/resources/icons/page_delete.png); }
   .context_menu_no_delete_icon {opacity: 0.4; filter: alpha(opacity=40); background-image: url(#aries.nav.srcUrl()#/ext2/resources/icons/page_delete.png); }
</style>

<script language="JavaScript1.2">
   
  // top.maximizeTab("#url.tab_id#");
    function isdefined(variable){
         if(typeof(variable) != 'undefined')
         {
            return true;
         } else {
            return false;
         }
    };


   <!--- <cfdocument filename="top_default_#TimeFormat(Now(),"HH_mm_ss")#.pdf" format="PDF" overwrite="Yes">
         <cfdump var="#form#" label="Form">
         <cfdump var="#url#" label="URL">
   </cfdocument> --->

   //var advSearchTabJS = 'false';

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


   function rptSuccess()
   {
      Ext.Msg.alert('Success', 'Search saved.' );
      
   }
   function rptFailure()
   {
      Ext.Msg.alert('Fail', 'Problem saving search.' );
   }



</script>

<cfinclude template="../init_Plugins.cfm">
<cfinclude template="../init_Stores.cfm">
<cfinclude template="../init_ColumnModels.cfm">
<cfinclude template="../init_BreadCrumbBar.cfm">
<cfinclude template="../init_Components.cfm">
<cfinclude template="../func_Requirements.cfm">

<script type="text/javascript">

   Ext.onReady(function(){ // ends ~line 690

   var result = ''; //used in Ext.Ajax.request
   var result2 = [];


//This needs to be called elsewhere - look at similar stores in init_Stores.cfm
   var rptStore = new Ext.data.JsonStore({ 
      storeId:"rptStore",
      url:"#mvclink('default.rptData')#&layout_type=txt",
      root:"query.data",
      autoLoad:"true",
      remoteSort:"false"
   });            

      Ext.override(Ext.layout.FormLayout, {
    renderItem : function(c, position, target){
        if(c && !c.rendered && c.isFormField && c.inputType != 'hidden'){
            var args = [
                   c.id, c.fieldLabel,
                   c.labelStyle||this.labelStyle||'',
                   this.elementStyle||'',
                   typeof c.labelSeparator == 'undefined' ? this.labelSeparator : c.labelSeparator,
                   (c.itemCls||this.container.itemCls||'') + (c.hideLabel ? ' x-hide-label' : ''),
                   c.clearCls || 'x-form-clear-left' 
            ];
            if(typeof position == 'number'){
                position = target.dom.childNodes[position] || null;
            }
            if(position){
                c.formItem = this.fieldTpl.insertBefore(position, args, true);
            }else{
                c.formItem = this.fieldTpl.append(target, args, true);
            }

//          Remove the form layout wrapper on Field destroy.
            c.on('destroy', c.formItem.remove, c.formItem, {single: true});
            c.render('x-form-el-'+c.id);
        }else {
            Ext.layout.FormLayout.superclass.renderItem.apply(this, arguments);
        }
    }
});


      // overrides the cell selection model so when clicking on the row content it will not deselect all of the rows
      Ext.grid.RowSelectionModel.prototype.rsmHandleMouseDown = Ext.grid.RowSelectionModel.prototype.handleMouseDown;
      Ext.grid.CheckboxSelectionModel.override({handleMouseDown : function(g, rowIndex, e){}});


      //need to have this turned on so the htmleditor will display correctly
      Ext.QuickTips.init();

        //Ext.state.Manager.setProvider(new Ext.state.CookieProvider({     expires: new Date(new Date().getTime()+(0*0*0*0*0))}));

      Ext.BLANK_IMAGE_URL = "#aries.nav.srcURL()#/ext2/resources/images/s.gif";

      // turn on validation errors beside the field globally
       Ext.form.Field.prototype.msgTarget = 'side';

      Ext.SSL_SECURE_URL = "#aries.nav.formlinktomodule(aries.getmoduleid(),"blank")#";

      // header filters
       Ext.ux.menu.RangeMenu.prototype.icons = {
         gt: '#aries.nav.srcURL()#/ext2/plugins/filter/img/greater_then.png', 
            lt: '#aries.nav.srcURL()#/ext2/plugins/filter/img/less_then.png',
            eq: '#aries.nav.srcURL()#/ext2/plugins/filter/img/equals.png'
      };

      <cfset mvc.views.TreeView.render()>
      Ext.ux.grid.filter.StringFilter.prototype.icon = '#aries.nav.srcURL()#/ext2/plugins/filter/img/find.png';

      loadStores();
      loadPlugins();
      loadColumnModels();

      filters_doc = new Ext.ux.grid.GridFilters({
         buildQuery: function(filters){
            var p = {};
            for(var i=0, len=filters.length; i<len; i++){
               var f    = filters[i];
               var root = [this.paramPrefix, '[', i, ']'].join('');
               p[root + '[field]'] = f.field;
               var dataPrefix = root + '[data]';
               for(var key in f.data)
                  p[[dataPrefix, '[', key, ']'].join('')] = f.data[key];
            }
            p['FilterSize'] = filters.length;
            return p;
         },

         filters:[
            {type: 'string',  dataIndex: 'document_name'},
            {type: 'string',  dataIndex: 'file_title'},
            {type: 'string',  dataIndex: 'document_version'},
            {type: 'date',  dataIndex: 'document_date'},
            {type: 'list',  dataIndex: 'document_type_id', options: [<cfloop query="docstypes">'#type_name#'<cfif currentrow neq recordcount>,</cfif></cfloop> ],   phpMode: true}
         ]
      });   

      filters_doc_assigned = new Ext.ux.grid.GridFilters({
         buildQuery: function(filters){
            var p = {};
            for(var i=0, len=filters.length; i<len; i++){
               var f    = filters[i];
               var root = [this.paramPrefix, '[', i, ']'].join('');
               p[root + '[field]'] = f.field;
               var dataPrefix = root + '[data]';
               for(var key in f.data)
                  p[[dataPrefix, '[', key, ']'].join('')] = f.data[key];
            }
            p['FilterSize'] = filters.length;
            return p;
         },

         filters:[
            {type: 'string',  dataIndex: 'document_name'},
            {type: 'string',  dataIndex: 'file_title'},
            {type: 'string',  dataIndex: 'document_version'},
            {type: 'date',  dataIndex: 'document_date'},
            {type: 'list',  dataIndex: 'document_type_id', options: [<cfloop query="docstypes">'#type_name#'<cfif currentrow neq recordcount>,</cfif></cfloop> ],   phpMode: true}
         ]
      });

      loadComponents();
      loadFunctions_Requirements();

      viewport = new Ext.Viewport(
         {
            layout:"border",
            id:"viewAll",
            items:[

              breadCrumbToolBar, 
                {
                   xtype:"panel",
                   title:"Master Document Tree",
                   region:"west",
                   width:350,
                   split:true,
                   collapsible:true,
                   collapsed:false,
                   titleCollapse:true,
                   id:"panel_master_document_tree",
                   layout:"fit",
                   items:
                   [
                     master_doc_tree
                   ]
                   }
              ,

              {
                region:"east",
                title:"Attributes",
           //   id:"Attributes",
                width:300,
                split:true,
                collapsible:true,
                collapsed:false,
                titleCollapse:true,
                layout:"accordion",
                layoutConfig:{
                   animate:true
                },
                items:[{
                    xtype:"panel",
                    title:"Document Attributes",
                    id:"panel_attributes",
                    //lazyRender : false,
                    layout: 'fit',
                    tbar: [
                      'Value Search: ', ' ',
                      new Ext.app.SearchField({
                        id:'att_value_search',
                        width:150,
                          store: store_docs,
                          <cfif isDefined("url.piefilter")>
                           value:'#url.piefilter#',
                           hasSearch : true,
                           paramName: 'fltr_attribute_value_exact',
                        <cfelse>
                           paramName: 'fltr_attribute_value',
                        </cfif>

                        selectOnFocus: true
                      }),{xtype : 'tbfill'},

                     {
                        xtype:   'checkbox',
                        boxLabel : ' Exact ',
                        listeners:{
                           'check':function(t,c){
                              if(c){
                                 var hValue = Ext.getCmp('att_value_search').getRawValue();
                                 Ext.getCmp('att_value_search').onTrigger1Click();
                                 Ext.getCmp('att_value_search').setRawValue(hValue);
                                 Ext.getCmp('att_value_search').hasSearch= true;
                                 Ext.getCmp('att_value_search').paramName= 'fltr_attribute_value_exact';
                                 Ext.getCmp('att_value_search').onTrigger2Click();

                              }else{
                                 var hValue = Ext.getCmp('att_value_search').getRawValue();
                                 Ext.getCmp('att_value_search').onTrigger1Click();
                                 Ext.getCmp('att_value_search').setRawValue(hValue);
                                 Ext.getCmp('att_value_search').hasSearch= true;
                                 Ext.getCmp('att_value_search').paramName= 'fltr_attribute_value';
                                 Ext.getCmp('att_value_search').onTrigger2Click();
                              }

                           }
                        }

                     },{xtype : 'tbfill',width:20}
                  ],
                  items: [
                     grid_attrib
                  ]
                  },{
                    xtype:"panel",
                    title:"Advanced Search",
                    id:"adv_search_panel",
                    expanded: false,
                    autoScroll:true,
                  bbar:[{
                     text: 'Submit',
                     id:'form_filter_submit',
                     handler: function(){
                        if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_assigned_document'){
                           whichTab = 'assignedToMasterOnly';
                        } else {
                           whichTab = 'unassignedToMasterOnly';
                        }

                        store_docs.baseParams={};
                        if (Ext.get('cboDocumentType2').getValue() != ''){
                           var document_name2          =  Ext.get('document_name2').getValue();
                           var document_title2         =  Ext.get('document_title2').getValue();
                           var document_date2          =  Ext.get('document_date2').getValue();
                           var cboDocumentType2        =  Ext.get('cboDocumentType2').getValue();
                           var advSearchTabJS          =  Ext.get('advSearchTabJS').getValue();
                        }

                     //Create an array of structures, populate it based on the just-clicked Document Type, 
                     //     then assign the values to either store (Assigned or Unassigned tabs).
                     Ext.Ajax.request
                     ({
                        url:'#mvclink('DataAccess.getPrototypeIDs')#&cboDocumentType2=' + cboDocumentType2 + '&layout_type=txt&t=' + Math.floor(Math.random()*101),

                           success:function(response) {
                              <!--- Returning Data Format:
                              {
                                 "query":{"recordcount":12,
                                          "columnlist":"attribute_name,attribute_prototype_id",
                                          "data":[
                                                   {"document_type":"[cboDocumentType2]","attribute_name":"TTS_Request_Date","attribute_prototype_id":"A88","attribute_value":""},
                                                   {"document_type":"[cboDocumentType2]","attribute_name":"Customer_Need_Date","attribute_prototype_id":"A81","attribute_value":""},
                                                    ...
                                                   {"document_type":"[cboDocumentType2]","attribute_name":"TTS_Tasking_Number","attribute_prototype_id":"A68","attribute_value":""}
                                                 ]
                                         },
                                 "totalcount":12
                              }

                              Example: Ext.MessageBox.alert(result.query.data[0].attribute_prototype_id); returns 'A88'
                               --->
                              result = Ext.decode(response.responseText);
                              result2 = result.query.data.slice(0);

                              params = {
                                 start:0, 
                                 limit:25
                              };

                              var len=result2.length;
                              if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_assigned_document'){ //assignedToMasterOnly
	                              for(var i=0; i<len; i++) {
	                                 theValue = Ext.get(result2[i].attribute_prototype_id).getValue();
	                                 Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams[result2[i].attribute_name] = theValue;
	                              }
                                 Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.clearFilters = 'false';
                                 store_docs_all_assigned.load({params:params});     
                              } else if (Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_document'){ //unassignedToMasterOnly
                                 for(var i=0; i<len; i++) {
                                    //Line below returns: params.TTS_Request_Date = Ext.getCmp('A88').getValue();
                                    params[result2[i].attribute_name] = Ext.get(result2[i].attribute_prototype_id).getValue();
                                 }
                                 store_docs.load({params:params});
                              }

                             },
                             failure: function(response) {
                                 Ext.MessageBox.alert("Error","Connectivity to the data has been interrupted" + response.responseText);
                             }
                         });

                           // The form field names and IDs change for each different Document Type.
                           // getValue cannot use the form filed IDs here - only the form field 
                           // names (e.g., A349). The form field ID will change, but the ID will not.
                           // For translation for DB usage, underscores in the names later will become 
                           // spaces, and double underscores will become forward slashes.

                        var curRecord = Ext.getCmp('grid_doc_edit').getSelectionModel().getSelected();
                        if(curRecord != undefined) {
                           var rec_id = curRecord.data['document_id'];
                        } else{
                           var rec_id = 1;
                        }

                  <!--- alert('cboDocumentType2: ' + cboDocumentType2 + '\n' + 
                        '  document_name2: ' + document_name2   + '\n' + 
                        ' document_title2: ' + document_title2  + '\n' + 
                        '  document_date2: ' + document_date2   + '\n' + 
                        '          rec_id: ' + rec_id); --->


                        store_docs.baseParams={
                           fltr_type_id:(Ext.get('cboDocumentType2').getValue() != '')?Ext.get('cboDocumentType2').getValue(): null,
                           mode:'doc',
                           whichTab:whichTab,
                           advSearchTabJS:advSearchTabJS,
                           document_name:document_name2,
                           document_title:document_title2,
                           document_type:cboDocumentType2,
                           document_date:document_date2,
                           document_id:rec_id
                        }

                     //Assigned Documents:
                     //           grid: grid_doc_edit_assigned
                     //           panel ID: panel_assigned_document
                     //Unassigned Documents:
                     //          grid: grid_doc_edit
                     //          panel ID: panel_document


                //The Assigned Documents tab uses a different store, so it has to be reloaded.
                //Note: these fields are in the first form fieldset, so have to be handled separately here from the form fields in the 2nd fieldset.
                if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_assigned_document'){ //assignedToMasterOnly
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_type = cboDocumentType2;
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_name = document_name2;
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_title = document_title2;
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_date = document_date2;
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.advSearchTabJS = advSearchTabJS;
                     Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.clearFilters = 'false';
                }

                if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_document'){ //unassignedToMasterOnly
                     Ext.getCmp('grid_doc_edit').getStore().baseParams.document_name = document_name2;
                     Ext.getCmp('grid_doc_edit').getStore().baseParams.document_title = document_title2;
                     Ext.getCmp('grid_doc_edit').getStore().baseParams.document_type = cboDocumentType2;
                     Ext.getCmp('grid_doc_edit').getStore().baseParams.document_date = document_date2;
                     Ext.getCmp('grid_doc_edit').getStore().baseParams.advSearchTabJS = advSearchTabJS;
                     }

                  }
                  },'     ',{
                        //text: 'Clear Filters',
                        icon:"#aries.nav.srcUrl()#/ext2/resources/icons/cancel.png",
                        tooltip:'Clear Filters',
                        cls: 'x-btn-text-icon details', 
                        handler: function(){
                              // clear filters
                              clearDynamicFilters();

                              clearAssignedBaseParams();

                              store_docs.baseParams={mode:'doc',unassignedToMasterOnly:1,whichTab:'unassignedToMasterOnly',advSearchTabJS:'true'};
                              store_docs.load({params:{start:0, limit:25}});
                              store_docs_all_assigned.load({params:{start:0, limit:25,clearFilters:'true'}});

                              if (typeof fltr_document_type_id_field != 'undefined') {
                                 Ext.getCmp('fltr_document_type_id_field').setValue('');
                              }
                           }
                     },'   ','-','   ',{
                        //text: 'Save Search',
                        icon:"#aries.nav.srcUrl()#/ext2/resources/icons/script_save.png",
                        tooltip:'Save Search',
                        cls: 'x-btn-text-icon details', 
                        handler: function(){

                        if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_assigned_document'){
                           whichTab = 'assignedToMasterOnly';
                        } else {
                           whichTab = 'unassignedToMasterOnly';
                        }

                        //store_docs.baseParams={};
                        if (Ext.get('cboDocumentType2').getValue() != ''){
                           var document_name2          =  Ext.get('document_name2').getValue();
                           var document_title2         =  Ext.get('document_title2').getValue();
                           var document_date2          =  Ext.get('document_date2').getValue();
                           var cboDocumentType2        =  Ext.get('cboDocumentType2').getValue();
                           var advSearchTabJS          =  Ext.get('advSearchTabJS').getValue();
                        }


                     //Create an array of structures and populate it based on the Document Type.
                     Ext.Ajax.request
                     ({
                        url:'#mvclink('DataAccess.getPrototypeIDs')#&cboDocumentType2=' + cboDocumentType2 + '&layout_type=txt&t=' + Math.floor(Math.random()*101),

                        success:function(response, form, action) {
                           result = Ext.decode(response.responseText);
                           result2 = result.query.data.slice(0);
                           var len=result2.length;
                           var theString = '';

	                        if (cboDocumentType2 !=''){
	                           theString = theString + 'cboDocumentType2|' + cboDocumentType2 + ',';
	                        }
	                        if (document_name2 !=''){
	                           theString = theString + 'document_name2|' + document_name2 + ',';
	                        }
	                        if (document_title2 !=''){
	                           theString = theString + 'document_title2|' + document_title2 + ',';
	                        }
	                        if (document_date2 !=''){
	                           theString = theString + 'document_date2|' + document_date2 + ',';
	                        }

                           for(var i=0; i<len; i++) {
                              params[result2[i].attribute_name] = Ext.get(result2[i].attribute_prototype_id).getValue();
                              if (params[result2[i].attribute_name] != '') {
                                 theString = theString + result2[i].attribute_name + '|' + Ext.get(result2[i].attribute_prototype_id).getValue() + ',';
                              }
                           }

		                     Ext.Ajax.request
		                     ({
		                        url:'#mvclink('default.insertTempParamRecord')#&layout_type=txt&t=' + Math.floor(Math.random()*101),
		                        method      : 'post',
		                        //success     : rptSuccess,
		                        failure     : rptFailure,
		                        params      : {search_params:theString}
		
		                     });



                          },
                          failure: function(response) {
                              Ext.MessageBox.alert("Error","Connectivity to the data has been interrupted" + response.responseText);
                          }
                     });

                        var curRecord = Ext.getCmp('grid_doc_edit').getSelectionModel().getSelected();
                        if(curRecord != undefined) {
                           var rec_id = curRecord.data['document_id'];
                        } else{
                           var rec_id = 1;
                        }

                       <!--- alert('cboDocumentType2: ' + cboDocumentType2 + '\n' + 
                        '  document_name2: ' + document_name2   + '\n' + 
                        ' document_title2: ' + document_title2  + '\n' + 
                        '  document_date2: ' + document_date2   + '\n' + 
                        '  system_element: ' + Ext.get('A143').getValue()  + '\n' + 
                        '          rec_id: ' + rec_id); --->

                              saveWindow.show();
                        }
                     },'     ',{
                        //text: 'Load Search',
                        icon:"#aries.nav.srcUrl()#/ext2/resources/icons/script_go.png",
                        tooltip:'Load Search',
                        cls: 'x-btn-text-icon details', 
                        handler: function(){
                              loadWindow.show();
                        }
                     },'     ',{
                        //text: 'Delete Search',
                        icon:"#aries.nav.srcUrl()#/ext2/resources/icons/script_delete.png",
                        tooltip:'Delete Search',
                        cls: 'x-btn-text-icon details', 
                        handler: function(){
                              deleteWindow.show();
                        }
                     }], 

                  items: [
                      document_form2
                  ]

                  }
                 ]
              },{
                xtype:"tabpanel",
                activeTab:0,
                region:"center",
               id:"panel_main_tabs",
               enableTabScroll : true,
               listeners:{
                  <!---
                  1.  Tab Panel loads with Unassigned Documents panel activated.
                  2.  Switch to the Assigned Documents panel.
                  3.  Collapse the East Region.
                  4.  Switch back to the Unassigned Documents panel.
                  5.  Before the tabchange functionality was implemented, the grid 
                      within this panel's EditorGridPanel would not resize to the 
                      size of the panel.  
                  NOTE: This also happened with the Assigned Documents panel. 
                  SOLUTION: t.findById('gridName').getView().refresh(true); //t = tab 
                  --->
                  'tabchange': function(tp,t){
                     if(t.title == 'Unassigned Documents'){
                        t.findById('grid_doc_edit').getView().refresh(true);
                        gsm_doc_edit = t.findById('grid_doc_edit').getSelectionModel();

                        grid_doc_edit.store.on({
                           load: function()
                           {
                              gsm_doc_edit.selectFirstRow();
                              var curRecord = Ext.getCmp('grid_doc_edit').getSelectionModel().getSelected();
   
                              if(curRecord != undefined) {
                                 var rec_id = curRecord.data['document_id'];
                                 store_attribs.load({params:{start:0, limit:25, xid:rec_id, mode:'doc'}});
                                 store_attribs.setDefaultSort('record_id', 'asc');
                              }
                           }
                        });
                        //Reset the Unassigned tab to clear all filters:
                        store_docs.baseParams={mode:'doc',unassignedToMasterOnly:1,whichTab:'unassignedToMasterOnly',advSearchTabJS:'false'};
                        store_docs.load({params:{start:0, limit:25}})

                        Ext.getCmp('grid_doc_edit').fireEvent('rowselect');

                     }
                     else if(t.title == 'Assigned Documents'){
                        t.findById('grid_doc_edit_assigned').getView().refresh(true);

                        gsm_doc_edit_assigned = t.findById('grid_doc_edit_assigned').getSelectionModel();
                        gsm_doc_edit_assigned.selectFirstRow();

                        Ext.getCmp("grid_doc_edit_assigned").fireEvent('rowselect');
                     }
                  }
               },
                items:[
                 <cfset commaTest = false>
                 <cfif aries.security.userhasaccess("_viewDoc")>

                    {
                    xtype:"panel",
                    title:"Assigned Documents",
                    id:"panel_assigned_document",
                  layout:"fit",
                  items:
                  [
                     grid_doc_edit_assigned
                  ]
                  }
                 <cfset commaTest = true>
                 </cfif>

                 <cfif aries.security.userhasaccess("_viewUnassignedDocuments")>
                 <cfif commaTest>,</cfif><cfset commaTest = true>
                 {
                    xtype:"panel",
                    title:"Unassigned Documents",
                    id:"panel_document",
                    layout:"fit",
                    disabled:"true",
                    items:[
                       <!--- TODO: check for security --->
                       grid_doc_edit
                    ]
                  }
                 </cfif>

                ]
              }]
         }
      );


   loadWindow = new Ext.Window({
      id:'loadWindow',
      title:'Load Search',
      //layout:'fit',
      width:350,
      style: "margin:10px,0px,0px,15px;",
      closeAction:'hide',
      plain: true,
      items: [
         loadWindow_form
      ]
    });

   deleteWindow = new Ext.Window({
      id:'deleteWindow',
      title:'Delete Search',
      layout:'fit',
      width:350,
      height:280,
      style: "margin:10px,0px,0px,15px;",
      closeAction:'hide',
      plain: true,
      items: [
         deleteWindow_form
      ]
    });

   saveWindow = new Ext.Window({
      id:'saveWindow',
      title:'Save Search',
      //layout:'fit',
      width:350,
      style: "margin:10px,0px,0px,15px;",
      closeAction:'hide',
      plain: true,
      items: [
         saveWindow_form
      ]
    });

   store_attribute_prototype.on({
         load : function(){
            <!---  --->
         }
   });
   
      window.Ext = Ext;


    });
   
   
   // A reusable error reader class for XML forms
   Ext.form.XmlErrorReader = function(){
       Ext.form.XmlErrorReader.superclass.constructor.call(this, {
               record : 'field',
               success: '@success'
           }, [
               'id', 'msg'
           ]
       );
   };
   Ext.extend(Ext.form.XmlErrorReader, Ext.data.XmlReader);

   clearDynamicFilters = function(){
      var thisform2 = Ext.getCmp('document_form2');
      thisform2.remove('attribute_fieldset2');

      var thisform = Ext.getCmp('document_form2');
      thisform.getForm().reset();
   };

   clearAssignedBaseParams = function(){
      // Ajax call: cfquery for list of attribute names. Return that list.
      // JS: Loop over list here, set the baseParams to ''.

    Ext.Ajax.request
    ({
       url:'#mvclink('DataAccess.getAttributeNames')#&layout_type=txt&cboDocumentType2=&t=' + Math.floor(Math.random()*101),

          success:function(response) {
             result = Ext.decode(response.responseText);
             result2 = result.query.data.slice(0);

             if(Ext.getCmp('panel_main_tabs').getActiveTab().id == 'panel_assigned_document'){ //assignedToMasterOnly
                
                var len=result2.length;
                for(var i=0; i<len; i++) {
                   var evalName = result2[i].attribute_name;
                   //dumpProps(result2);
                   if (Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.evalName != ''){
                      Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.evalName = '';
                   }
                }

             }
          },
          failure: function(response) {
             Ext.MessageBox.alert("Error","baseParams could not be cleared. " + response.responseText);
          }
        });

       Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_name = '';
       Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_title = '';
       Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_type = '';
       Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.document_date = '';
       Ext.getCmp('grid_doc_edit_assigned').getStore().baseParams.clearFilters = 'true';
       Ext.getCmp('grid_doc_edit_assigned').getStore().load({params:{start:0, limit:25, clearFilters:'true'}});
      }

   </script>

</body>
</cfoutput>

</cffunction>
</cfcomponent>