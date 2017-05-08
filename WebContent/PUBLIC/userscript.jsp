<script type="text/javascript">
    //<!--
    function qToolTipFunctions()
  {
	  $( document ).tooltip({
	  	  items: "input[title],textarea[title],div[title],td[title],span[title],img[title],a[title],li[title]",
		  //show: { effect: "slide" },
		  tooltipClass: "jui-tooltip", 
		  content: function() {
				var element = $( this );				
				if ( element.is( "[title]" )  && !element.hasClass('noTitle')) 
				{
					return element.attr( "title" );
				}			
			},
		  track: true
	  });				
  }
  $(document).ready(function(){
	  //kendo.culture("<?php echo str_ireplace('_', '-', $locale); ?>");
	  qToolTipFunctions();
  });	
    //-->
</script>
<script type="" src="/easytrip/PUBLIC/module/Portfolio/js/uploader.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/jui/jui-1-11-0/eicra/jquery-ui.custom.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/js/backend/common.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/vendor/scripts/js/slicker.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/vendor/scripts/js/dropdown.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/js/backend/jquery.hoverpulse.js"></script>
<script type="text/javascript" src="/easytrip/PUBLIC/templates/backend/default/vendor/scripts/js/ddslick.js"></script>
<script type="text/javascript" src="/easytrip/PUBLIC/templates/backend/default/vendor/scripts/js/easyResponsiveTabs.js"></script>
<script type="text/javascript" src="/easytrip/PUBLIC/js/bootstrap-filestyle.min.js"> </script>
<script type="text/javascript">
    //<!--
    var settingObj = {}
$(document).ready(function() {
    floatingbar('#floatingbar',"#button_top_bar",null);
});
var settingInvoiceObj = {
		grid_id : 'grid-invoice',
		dest_url : "/Administrator/invoice/find",
		no_browse_url: true,
		pageSize : '30',
        page: '',

		calendar: {
			culture: "",
			value: ''
		},
		search_action: {
			search_form_id : 'searchForm',
			search_form_btn : 'search_btn',
			hasTinyMCE 	: false
		},
		common_action : {},

		search_data : {},
		batch:		false,
		editable:	{	confirmation: false },
		scrollable: false,
		detailInit:	false,
		dataBound: function(e) {
				var self = this;
				self.tbody.find("tr").children('td:nth-child(7)').css({'overflow' : 'visible'});

        },
		filterable:{
            extra: true,
            messages: {
                info: "Show Items with value that:", // sets the text on top of the filter menu
                filter: "Filter", // sets the text for the "Filter" button
                clear: "Clear", // sets the text for the "Clear" button

                // when filtering boolean numbers
                isTrue: "custom is true", // sets the text for "isTrue" radio button
                isFalse: "custom is false", // sets the text for "isFalse" radio button

                //changes the text of the "And" and "Or" of the filter menu
                and: "And",
                or: "Or",

                selectValue: "Select...."
            },
            operators: {
                string: {
                    startswith     : "Starts with",
                    contains       : "Contains",
                    doesnotcontain : "Does not contain",
                    endswith       : "Ends with",
                    eq             : "Is equal to",
                    neq            : "Is not equal to"
                },
                number: {
                    eq  : "Is equal to",
                    neq : "Is not equal to",
                    gte : "Is greater than or equal to",
                    gt  : "Is greater than",
                    lte : "Is less than or equal to",
                    lt  : "Is less than"
                },
                date: {
                    gte : "Is after than or equal to",
                    gt  : "Is after than",
                    lte : "Is before than or equal to",
                    lt  : "Is before than",
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                },
                enums: {
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                }
            }
        },
		model: {
                    fields: {
						id: { type: "number", editable: false },
                        module_name: { type: "string", editable: false },
                        full_name: { type: "string", editable: false },
                        total_amount: { type: "number", editable: false },
                        now_payable: { type: "number", editable: false },
                        entry_date: { type: "date", editable: false },
						status: { type: "enums", editable: false },
						payment_method: { editable: true },
						common_action: { editable: false }
                    }
                },
		column_fields: [
							{
								field: "id",
								title: 	"Invoice #",
								template: "#= id_format #",
								width: 50,
								filterable: {
									ui: function(element) {
										element.kendoNumericTextBox({
											culture: "",
											format: "0",
											min: 0,
											placeholder: "Selecte a value",
				                            upArrowText: "Increase value",
				                            downArrowText: "Decrease value"
										});
									}
								}
							},
							{ field: "module_name", title: "Item(s)", width: 100 },
							{ field: "full_name", title: "Client Name" },
							{
								field: "entry_date",
								title:	"Invoice Date",
								format: "{0:MM/dd/yyyy}",
								template: '<div title="Date : ${entry_date_format}">#= kendo.toString(entry_date,\'dd/MM/yyyy\') #</div>',
								width: 100,
								attributes:{ 'align' : 'center' },
								filterable: {
									ui: function(element) {
										kendoDateTimeCalendar(element, settingObj);
									}
								}
							},
							{
								field: "total_amount",
								title:	"Total",
								headerTemplate: "Total ( USD )",
								template: '<div class="text-right">$ #= total_amount_format #</div>',
								width: 105,
								filterable: {
									ui: function(element) {
										element.kendoNumericTextBox({
											culture: "",
											format: "c",
											min: 0,
											placeholder: "Selecte a value",
				                            upArrowText: "Increase value",
				                            downArrowText: "Decrease value"
										});
									}
								}
							},


							{
                                field: "status",
                                title:  "Status",
                                width: 80,
                                template: '#= invoice_status_format #',
                                attributes:{ 'align' : 'center' },
                                filterable: {
                                    ui: function(element) {
                                        element.kendoDropDownList({
                                            dataSource: [
                                                {
                                                    Id: 1,
                                                    Title: "Paid"
                                                },
                                                {
                                                    Id: 2,
                                                    Title: "Unpaid"
                                                },
                                                {
                                                    Id: 0,
                                                    Title: "Cancelled"
                                                },
                                                {
                                                    Id: 3,
                                                    Title: "Refunded"
                                                },
                                                {
                                                    Id: 4,
                                                    Title: "Overdue"
                                                },
                                                {
                                                    Id: 5,
                                                    Title: "Collections"
                                                }
                                            ],
                                            dataTextField: "Title",
                                            dataValueField: "Id",
                                            optionLabel: "Select..........."
                                        });
                                    }
                                }
                            },
							{
								field: "common_action",
								title:	"Action",
								width: 100,
								template:'<div class="btn-group">'+
											'<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">'+
												'Action <span class="caret"></span>'+
												'<span class="sr-only">Toggle Dropdown</span>'+
											'</button>'+
											'<ul class="dropdown-menu dropdown-menu-right" role="menu">'+

												'<li><a href="/Administrator/invoice/details/${id}" title="View Details"><i class="fa fa-file-text-o blue"></i> View Details</a></li>'+

											'</ul>'+
										 '</div>',
								attributes:{ 'align' : 'center' },
								filterable: false,
								sortable: false,
								columnMenu: false
							}
						],
		columnMenu:	{
			columns: true,
			messages: {
					sortAscending : "Sort Ascending",
                    sortDescending : "Sort Descending",
                    filter : "Filter",
                    columns : "Columns"
				}
		},
		messages: {
						display             :   '{0} - {1} of {2} items',
                        empty               :   'No items to display',
                        page                :   'Page',
                        of                  :   'of {0}',
                        itemsPerPage        :   'items per page',
                        first               :   'Go to the first page',
                        previous            :   'Go to the previous page',
                        next                :   'Go to the next page',
                        last                :   'Go to the last page',
                        refresh             :   'Refresh',

                        common_msg_dialog_id     : 'dialog_msg',
                        common_confirn_dialog_id : 'dialog-confirm',
                        common_ok                : "Ok",
                        common_delete_selected   : "Delete",
                        common_cancel            : "Cancel",
                        common_delete_confirm    : "Are You Sure to delete selected invoice(s)?",
                        common_publish_title     : "Click To Publish",
                        common_unpublish_title   : "Click To Un-Publish",
                        common_publish_selected  : "Publish",
                        common_unpublish_selected: "Unpublish",
                        common_publish_perm      : "You do not have enough access privileges to publish or unpublish this.",
                        common_perm_err          : "You do not have enough access privileges to perform this action.",
                        common_selected_err      : "<span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>Please Select at least One Item."
					}
	};
var settingCommentObj = {
	grid_id: 'grid-comment',
	no_browse_url: true,
	dest_url: "/Administrator/comment/find",
	pageSize : '30',
    page: '',
	common_action: {

	   },
	detailInit_action: {},
	search_data: {},
	batch: false,
	editable: false,
	scrollable: false, //{ virtual: false },
	detailInit: false,
	dataBound: function (e) {
		var self = this;
		self.tbody.find("tr").children('td:nth-child(8)').css({'overflow': 'visible'});
		self.tbody.find("tr").children('td:nth-child(4)').css({'overflow': 'visible'});
	},
	filterable:{
            extra: true,
            messages: {
                info: "Show Items with value that:", // sets the text on top of the filter menu
                filter: "Filter", // sets the text for the "Filter" button
                clear: "Clear", // sets the text for the "Clear" button

                // when filtering boolean numbers
                isTrue: "custom is true", // sets the text for "isTrue" radio button
                isFalse: "custom is false", // sets the text for "isFalse" radio button

                //changes the text of the "And" and "Or" of the filter menu
                and: "And",
                or: "Or",

                selectValue: "Select...."
            },
            operators: {
                string: {
                    startswith     : "Starts with",
                    contains       : "Contains",
                    doesnotcontain : "Does not contain",
                    endswith       : "Ends with",
                    eq             : "Is equal to",
                    neq            : "Is not equal to"
                },
                number: {
                    eq  : "Is equal to",
                    neq : "Is not equal to",
                    gte : "Is greater than or equal to",
                    gt  : "Is greater than",
                    lte : "Is less than or equal to",
                    lt  : "Is less than"
                },
                date: {
                    gte : "Is after than or equal to",
                    gt  : "Is after than",
                    lte : "Is before than or equal to",
                    lt  : "Is before than",
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                },
                enums: {
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                }
            }
	},
	model: {
		fields: {

			id: {type: "number"},
			table_name: {type: "string"},
			entry_by: {type: "enums"},
			page_title:{type:"string"},
			page_url:{type:"string"},
			comment_title:{type:"string"},
			comment_desc:{type:"string"},
			comment_date:{type:"date"},
			active: {type: "enums"}

		}
	},
	column_fields: [
		{
			field: "id",
			template: '#= id_format #',
			title: "ID",

			filterable: {
				ui: function (element) {
					element.kendoNumericTextBox({
						culture: "",
						format: "0",
						min: 1,
						placeholder: "Selecte a value",
                        upArrowText: "Increase value",
                        downArrowText: "Decrease value"

					});
				}
			}
		},
		{
		field: "table_name",
		title: "Module",
		template:'#= table_name_format #',
		},

		{
			field: "page_title",
			title: "Page Title",
			width: 90,
			//template: '# if(page_title_format){ #<a href="#= page_url #" target="_blank" class="td_pad category_link_1" />${page_title_format}</a># } #',
			filterable: false,
			sortable: false,
			columnMenu: false
		},

		{
			field: "user_thumb",
			title: "Images",
			template: '# if(user_thumb_format){ #<img src="#=user_thumb_format #" width="30" height="20" class="img-thumbnail img-hover" /> # } #',
			attributes: {'align': 'center'},
			filterable: false,
			sortable: false,
			columnMenu: false

		},
		{
			field: "comment_title", title: "Title"
		},
		{
			field: "comment_date",
			title: "Date",
			format: "{0:MM/dd/yyyy}",
			template: '#= comment_date_lang_format #',
			attributes: {
				'align': 'center',
				'title': 'Date : ${comment_date_format}<br>Entry By : ${username}'
			},

			filterable: {
				ui: function (element) {
					kendoDateTimeCalendar(element, settingObj);
				}
			}
		},
		{
		field: "active",
		optionLabel: "Select",
		values: [{text: "Unpublished",
		value: 0}, {text: "Published", value: 1}],


		title: "Publish",
		template: '<a rel="${id}_${table_name}_#= (active == 1) ? \'unpublish\' : \'publish\' #" title="#= (active == 1) ? \'Published\' : \'Unpublished\' #">#= (active == 1) ? \'<i class="fa fa-check-circle green"></i>\' : \'<i class="fa fa-minus-circle red"></i>\' #</a>',
		attributes: {'align': 'center'},
		filterable: {
			ui: function (element) {
				element.kendoDropDownList({
					dataSource: [{Id: 0, Title: "Unpublished"}, {Id: 1, Title: "Published"}],
					dataTextField: "Title",
					dataValueField: "Id",
					optionLabel: "Select....."
				});
			}
		}
		},
		{
			field: "common_action",
			title: "Action",
			width:50,
			attributes: {'align': 'center'},
			template: '# if(edit_enable){ #<a href="/Administrator/comment/edit/id/${id}" title="Edit"><i class="fa fa-pencil green"></i></a> # } #',
			filterable: false,
			sortable: false,
			columnMenu: false
		    }
	    ],
		columnMenu:	{
			columns: true,
			messages: {
					sortAscending : "Sort Ascending",
                    sortDescending : "Sort Descending",
                    filter : "Filter",
                    columns : "Columns"
				}
		},
		messages: {
						display             :   '{0} - {1} of {2} items',
                        empty               :   'No items to display',
                        page                :   'Page',
                        of                  :   'of {0}',
                        itemsPerPage        :   'items per page',
                        first               :   'Go to the first page',
                        previous            :   'Go to the previous page',
                        next                :   'Go to the next page',
                        last                :   'Go to the last page',
                        refresh             :   'Refresh',

                        common_msg_dialog_id     : 'dialog_msg',
                        common_confirn_dialog_id : 'dialog-confirm',
                        common_ok                : "Ok",
                        common_delete_selected   : "Delete",
                        common_cancel            : "Cancel",
                        common_delete_confirm    : "Are You Sure to delete selected Comment(s)?",
                        common_publish_title     : "Click To Publish",
                        common_unpublish_title   : "Click To Un-Publish",
                        common_publish_selected  : "Publish",
                        common_unpublish_selected: "Unpublish",
                        common_publish_perm      : "You do not have enough access privileges to publish or unpublish this.",
                        common_perm_err          : "You do not have enough access privileges to perform this action.",
                        common_selected_err      : "<span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>Please Select at least One Item."
					}
	 };
var settingVoteObj = {
		grid_id : 'grid-vote',
		dest_url : "/Administrator/vote/find",
		no_browse_url: true,
		pageSize : '30',
        page: '',
		calendar: {
			culture: "",
			value: ''
		},
		search_action: {},
		common_action : {
				permission_arr : {

				}
		},
		search_data : {},
		batch:		false,
		editable:	false,
		scrollable: false,
		dataSource_transport_parameterMap: function(options, operation) {

					//alert (options.toSource());
					if (operation !== "read" && options.models) {
						commonOpenLoaderDialog(settingObj);
                        return {models: options.models};
                    }
					else
					{
						return options;
					}
                },
		detailInit:	false,
		dataBound: function(e) {
				var self = this;
				self.tbody.find("tr").children('td:nth-child(8)').css({'overflow' : 'visible'});
				$(".pollpercent").tipsy({gravity:'south'});
				$(".weight").each(function(){
					interval = 3000; // the time (in ms) to animate the results
					lp = $(this).attr("data-lp");
					$(this).css({width:"0%"}).animate({width:lp+"%"}, interval);
				});
        },
		filterable:{
            extra: true,
            messages: {
                info: "Show Items with value that:", // sets the text on top of the filter menu
                filter: "Filter", // sets the text for the "Filter" button
                clear: "Clear", // sets the text for the "Clear" button

                // when filtering boolean numbers
                isTrue: "custom is true", // sets the text for "isTrue" radio button
                isFalse: "custom is false", // sets the text for "isFalse" radio button

                //changes the text of the "And" and "Or" of the filter menu
                and: "And",
                or: "Or",

                selectValue: "Select...."
            },
            operators: {
                string: {
                    startswith     : "Starts with",
                    contains       : "Contains",
                    doesnotcontain : "Does not contain",
                    endswith       : "Ends with",
                    eq             : "Is equal to",
                    neq            : "Is not equal to"
                },
                number: {
                    eq  : "Is equal to",
                    neq : "Is not equal to",
                    gte : "Is greater than or equal to",
                    gt  : "Is greater than",
                    lte : "Is less than or equal to",
                    lt  : "Is less than"
                },
                date: {
                    gte : "Is after than or equal to",
                    gt  : "Is after than",
                    lte : "Is before than or equal to",
                    lt  : "Is before than",
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                },
                enums: {
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                }
            }
        },
		model: {
                    fields: {
                        article_title: { type: "string" },
                        table_name: { type: "string" },
						total_votes: { type: "number" },
						ActionCount: { type: "number" },
                        like_percent: { type: "string" },
						active: { type: "enums" },
						module_name: { editable: false },
						article_title_short_format: { editable: false },
						common_action: { editable: false }
                    }
                },
		column_fields: [
							{
								field: "article_title",
								title:	"Page Title",
								template: "#= article_title_short_format #"	,
								width: 250,
								attributes:{
									'title' :  '#= article_title #'
								}
							},
							{
								field: "table_name",
								title:	"Module",
								template: '#= module_name #',
								width: 110
							},
							{
								field: "like_percent",
								title:	"Percent",
								headerTemplate: "<center>Percent</center>",
								template: '<div class="pollpercent" title="#= like_percent_format # %"><div class="weight" data-lp="#= like_percent #"></div></div>',
								attributes:{ 'align' :  'center' },
								width: 150,
								filterable: false,
								sortable: false,
								columnMenu: false
							},
							{
								field: "total_votes",
								title:	"Vote(s)",
								width: 80,
								attributes:{ 'align' :  'center' },
								filterable: {
									ui: function(element) {
										element.kendoNumericTextBox({
											culture: "",
											format: "0",
											    placeholder: "Select a value",
					                            upArrowText: "Increase value",
					                            downArrowText: "Decrease value"
										});
									}
								}
							},
							{
								field: "ActionCount",
								title:	"User Interactions",
								width: 180,
								attributes:{ 'align' :  'center' },
								filterable: {
									ui: function(element) {
										element.kendoNumericTextBox({
											culture: "",
											format: "0",
											min: 1,
											    placeholder: "Select a value",
					                            upArrowText: "Increase value",
					                            downArrowText: "Decrease value"
										});
									}
								}
							},
							{
								field: "active",
								title:	"Publish",
								width: 110,
								template: '<a rel="${table_id}_${publish_status_table_name}_#= (active == 1) ? \'unpublish\' : \'publish\' #" title="#= (active == 1) ? \'Published\' : \'Unpublished\' #">#= (active == 1) ? \'<i class="fa fa-check-circle green"></i>\' : \'<i class="fa fa-minus-circle red"></i>\' #</a>',
								attributes:{ 'align' :  'center' },
								filterable: {
									ui: function(element) {
										element.kendoDropDownList({
											dataSource: [ { Id: 0, Title: "Unpublished" }, { Id: 1, Title: "Published" } ],
											dataTextField: "Title",
											dataValueField: "Id",
											optionLabel: "Select...."
										});
									}
								}
							}
						],
		columnMenu:	{
			columns: true,
			messages: {
					sortAscending : "Sort Ascending",
                    sortDescending : "Sort Descending",
                    filter : "Filter",
                    columns : "Columns"
				}
		},
		messages: {
				display             :   '{0} - {1} of {2} items',
                empty               :   'No items to display',
                page                :   'Page',
                of                  :   'of {0}',
                itemsPerPage        :   'items per page',
                first               :   'Go to the first page',
                previous            :   'Go to the previous page',
                next                :   'Go to the next page',
                last                :   'Go to the last page',
                refresh             :   'Refresh',

                common_msg_dialog_id     : 'dialog_msg',
                common_confirn_dialog_id : 'dialog-confirm',
                common_ok                : "Ok",
                common_delete_selected   : "Delete",
                common_cancel            : "Cancel",
                common_delete_confirm    : "Are You Sure to delete selected User(s)?",
                common_publish_title     : "Click To Publish",
                common_unpublish_title   : "Click To Un-Publish",
                common_publish_selected  : "Publish",
                common_unpublish_selected: "Unpublish",
                common_publish_perm      : "You do not have enough access privileges to publish or unpublish this.",
                common_perm_err          : "You do not have enough access privileges to perform this action.",
                common_selected_err      : "<span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>Please Select at least One Item."
			}
	};
var settingUserObj = {
		grid_id : 'grid-user',
		dest_url : "/Administrator/members/find",
		no_browse_url: true,
		pageSize : '30',
        page: '',
		calendar: {
			culture: "",
			value: ''
		},

		search_action: {
			search_form_id : 'formUserSearch',
			search_form_btn : 'user_search_btn',
			hasTinyMCE 	: false,
			show_loader_on_search_button: true
		},
		common_action : {},
		search_data : {},
		batch:		false,
		editable:	false,
		scrollable: false,// { virtual: false },
		detailInit:	false,
		dataBound: function(e) {
				var self = this;
				self.tbody.find("tr").children('td:nth-child(5)').css({'overflow' : 'visible'});
        },
		filterable:{
            extra: true,
            messages: {
                info: "Show Items with value that:", // sets the text on top of the filter menu
                filter: "Filter", // sets the text for the "Filter" button
                clear: "Clear", // sets the text for the "Clear" button

                // when filtering boolean numbers
                isTrue: "custom is true", // sets the text for "isTrue" radio button
                isFalse: "custom is false", // sets the text for "isFalse" radio button

                //changes the text of the "And" and "Or" of the filter menu
                and: "And",
                or: "Or",

                selectValue: "Select...."
            },
            operators: {
                string: {
                    startswith     : "Starts with",
                    contains       : "Contains",
                    doesnotcontain : "Does not contain",
                    endswith       : "Ends with",
                    eq             : "Is equal to",
                    neq            : "Is not equal to"
                },
                number: {
                    eq  : "Is equal to",
                    neq : "Is not equal to",
                    gte : "Is greater than or equal to",
                    gt  : "Is greater than",
                    lte : "Is less than or equal to",
                    lt  : "Is less than"
                },
                date: {
                    gte : "Is after than or equal to",
                    gt  : "Is after than",
                    lte : "Is before than or equal to",
                    lt  : "Is before than",
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                },
                enums: {
                    eq  : "Is equal to",
                    neq : "Is not equal to"
                }
            }
        },
		model: {
                    fields: {
                        user_id: { type: "number" },
                        username: { type: "string" },
                        full_name: { type: "string" },
                        role_name: { type: "string" },
                        last_access: { type: "date" },
                        register_date: { type: "date" }
                    }
                },
		column_fields: [
							{
								field: "user_id",
								template: '#= user_id_format #',
								title: 	"ID",
								width: 48,
								filterable: {
									ui: function(element) {
										element.kendoNumericTextBox({
											culture: "",
											format: "0",
											min: 0,
											placeholder: "Selecte a value",
				                            upArrowText: "Increase value",
				                            downArrowText: "Decrease value"

										});
									}
								}
							},
							{ field: "username", 		title: 	"Username/Email", width: 190},
							{ field: "full_name", 		title:	"Name" },
							{ field: "role_name", 		title:	"User Roles", width: 150 },

							{
								field: "common_action",
								title:	"Action",
								width: 100,
								attributes:{ 'align' : 'center' },
								template:'<div class="btn-group">'+
											'<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">'+
												'Action <span class="caret"></span>'+
												'<span class="sr-only">Toggle Dropdown</span>'+
											'</button>'+
											'<ul class="dropdown-menu dropdown-menu-right" role="menu">'+
												'# if(edit_enable){ #<li><a href="/Administrator/members/edit/${user_id}" title="Edit"><i class="fa fa-pencil green"></i> Edit</a></li># } #'+

											'</ul>'+
										 '</div>',
								filterable: false,
								sortable: false,
								columnMenu: false
							}
							//{ command: { text: "View Details", click: gridPublish }, title: " ", width: "140px" }
						],
		columnMenu:	{
			columns: true,
			messages: {
					sortAscending : "Sort Ascending",
                    sortDescending : "Sort Descending",
                    filter : "Filter",
                    columns : "Columns"
				}
		},
		messages: {
				display             :   '{0} - {1} of {2} items',
                empty               :   'No items to display',
                page                :   'Page',
                of                  :   'of {0}',
                itemsPerPage        :   'items per page',
                first               :   'Go to the first page',
                previous            :   'Go to the previous page',
                next                :   'Go to the next page',
                last                :   'Go to the last page',
                refresh             :   'Refresh',

                common_msg_dialog_id     : 'dialog_msg',
                common_confirn_dialog_id : 'dialog-confirm',
                common_ok                : "Ok",
                common_delete_selected   : "Delete",
                common_cancel            : "Cancel",
                common_delete_confirm    : "Are You Sure to delete selected User(s)?",
                common_publish_title     : "Click To Publish",
                common_unpublish_title   : "Click To Un-Publish",
                common_publish_selected  : "Publish",
                common_unpublish_selected: "Unpublish",
                common_publish_perm      : "You do not have enough access privileges to publish or unpublish this.",
                common_perm_err          : "You do not have enough access privileges to perform this action.",
                common_selected_err      : "<span class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span>Please Select at least One Item."
			}
	};
	$(document).ready(function(){
					$("#demoTab>ul>li:eq(1)").click(function() {
				var grid = $("#"+settingInvoiceObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingInvoiceObj.grid_id).html('');
				commonGrid(settingInvoiceObj);
			});
            $("#demoTab>div>h2:eq(1)").click(function() {
				var grid = $("#"+settingInvoiceObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingInvoiceObj.grid_id).html('');
				commonGrid(settingInvoiceObj);
			});
							$("#demoTab>ul>li:eq(2)").click(function() {
				var grid = $("#"+settingCommentObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingCommentObj.grid_id).html('');
				commonGrid(settingCommentObj);
			});
            $("#demoTab>div>h2:eq(2)").click(function() {
				var grid = $("#"+settingCommentObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingCommentObj.grid_id).html('');
				commonGrid(settingCommentObj);
			});
							$("#demoTab>ul>li:eq(3)").click(function() {
				var grid = $("#"+settingUserObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingUserObj.grid_id).html('');
				commonGrid(settingUserObj);
			});
            $("#demoTab>div>h2:eq(3)").click(function() {
				var grid = $("#"+settingUserObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingUserObj.grid_id).html('');
				commonGrid(settingUserObj);
			});
				
			$("#demoTab>ul>li:eq(4)").click(function() {
				var grid = $("#"+settingVoteObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingVoteObj.grid_id).html('');
				commonGrid(settingVoteObj);
			});
            $("#demoTab>div>h2:eq(4)").click(function() {
				var grid = $("#"+settingVoteObj.grid_id).data("kendoGrid");
				if(grid){ grid.destroy(); }
				$("#"+settingVoteObj.grid_id).html('');
				commonGrid(settingVoteObj);
			});

		$(".pollpercent").tipsy({gravity:'south'});
		$(".weight").each(function(){
			interval = 3000; // the time (in ms) to animate the results
			lp = $(this).attr("data-lp");
			$(this).css({width:"0%"}).animate({width:lp+"%"}, interval);
		});
		
		$("table.highlighter tr:nth-child(even)").addClass("even");
   		$("table.highlighter tr:nth-child(odd)").addClass("odd");
	});


	$("#demoTab").easyResponsiveTabs({
		type: 'vertical', //Types: default, vertical, accordion
		width: 'auto', //auto or any custom width
		fit: true   // 100% fits in a container
	});



    //-->
</script>
<script type="" src="/easytrip/PUBLIC/module/Vote/js/jquery.tipsy.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/colorbox/jquery.colorbox.js"></script>
<script type="text/javascript" src="/easytrip/PUBLIC/vendor/scripts/js/backend/jquery.scrollTo.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/kendo/src/js/kendo.web.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/kendo/js/cultures/kendo.culture.en.min.js"></script>
<script type="" src="/easytrip/PUBLIC/vendor/scripts/kendo/js/cultures/kendo.culture.en-US.min.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/gsap/TweenMax.min.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/api.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/resizeable.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/joinable.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/custom.js"></script>
<script type="" src="/easytrip/PUBLIC/templates/backend/default/assets/js/demo.js"></script>
<script type="text/javascript">
    //<!--
    $(document).ready(function() { //on DOM ready
				$("a.change_lang").click(function() {
					var self = this;
					var lang = $(self).attr('rel');

					$.ajax({
						url: '/Administrator/Settings/language/update',
							type: 'POST',
							data: { lang_name : lang },
							beforeSend: function(){
								$(self).children("span:nth-child(1)").children("img:nth-child(1)").attr('src','data/adminFiles/commonImages/flag_loader.gif');
								$(self).children("span:nth-child(1)").children("img:nth-child(1)").attr('height','15');
							 },
							success: function(response)
							{
								//alert(response);
								var json_arr = eval("("+response+")");
								var url = 'http://demo.phptourscript.com/Administrator';
								var baseUrl = '';
								var ckUrl = 'Administrator/login';
								var match_res = url.match(/Administrator\/login/g);
								var tmp = false;
								for (i in match_res)
								{
									if(match_res[i] == ckUrl){ tmp = true;  }
								  //alert(i + ' : ' + match_res[i]);
								}
								if(tmp == true)
								{
									var rightUrl = baseUrl+'/Administrator';
								}
								else
								{
									var rightUrl = url;
								}

								if(json_arr.status == 'ok')
								{
									document.location.href=rightUrl;
								}
							}
					  });
				});

				$(".dropdown img.flag").addClass(""); //flagvisibility

				$(".dropdown dt a").click(function() {
					$(".dropdown dd ul").toggle();
				});

				$(".dropdown dd ul li a").click(function() {
					var text = $(this).html();
					$(".dropdown dt a span").html(text);
					$(".dropdown dd ul").hide();
					$("#result").html("Selected value is: " + getSelectedValue("sample"));
				});

				function getSelectedValue(id) {
					return $("#" + id).find("dt a span.value").html();
				}

				$("#flagSwitcher").click(function() {
					$(".dropdown img.flag").toggleClass("flagvisibility");
				});
			});
			
    //-->
</script></body>
</html>