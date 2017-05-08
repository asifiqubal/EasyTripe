<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/PUBLIC/top.jsp"></jsp:include>
<div id="top-bar">
    <div class="container">
        <a href="#" class="menu button"><i class="fa fa-navicon"></i></a>
        <ul class="nav">
            <li class="active"><a><span>Welcome Easy Trip</span></a></li>
            <li><a href="${link1}"><span>${value1}</span></a></li>
            <li><a href="${link2}"><span>${value2}</span></a></li>
        </ul>
    </div>
</div>
<jsp:include page="/PUBLIC/header.jsp"></jsp:include>

<div class="container">
        <!-- Inner Layout Start -->
    <div class="container-fluid inner">
        <div class="row">
            <!-- Inner Content Start -->
            <div class="col-md-12">
                <div class="drawer-overlay">
                     

<div class="module">

    <div class="col-md-3 col-sm-4">
	<form name="formBlockSearch" id="formBlockSearch" method="post" action="/Search-Tour-List">
        <div class="block block-sidebar-search">
            <div class="block-body">
                <div id="sidebar-search-tab" class="resp-easy-accordion" style="display: block; width: 100%; margin: 0px;">
                    <ul class="resp-tabs-list" style="display: none;">
                        <li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab">Refine Your Search</li>
                    </ul>

                    <div class="resp-tabs-container">
                        <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0">Search your ture</h2><div class="resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display: block;">
                            <div class="block-content">
                                

                                <div class="form-group">
                                    <input type="text" name="post_code" id="search_field" placeholder="Any" value="" class="form-control ui-autocomplete-input" autocomplete="off">
                                    <input type="hidden" name="block_search" value="search">
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        



<div></div>
        	</form></div>

    <div class="col-md-9 col-sm-8">
        <h1>SEARCH PACKAGES</h1>
		<!--
Created using JS Bin
http://jsbin.com

Copyright (c) 2017 by anonymous (http://jsbin.com/lakodeqito/1/edit)

Released under the MIT license: http://jsbin.mit-license.org
-->
<meta name="robots" content="noindex">
<style id="jsbin-css">
.panel-table .panel-body{
  padding:0;
}
.table-responsive {height:200px;}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 100px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
}


</style>
</script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-2.2.4.js">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<div class="container">
    <div class="row">
    

            <div class="col-md-8 col-sm-8 panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Tour List</h3>
                  </div>
                  
                </div>
              </div>
              <div class="">
                <table class="table table-striped table-bordered table-list livesearch">
                  <thead>
                    <tr>
                        <th class="hidden-xs">Tour Name</th>
                        <th>Visiting City</th>
                        <th>Division</th>
                        <th>Cost</th>
                        <th>Tour Date</th>
                        <th>Tour Duration</th>
                    </tr> 
                  </thead>
                  <tbody id="myTable">
                <c:forEach var="tl" items="${tourlist}">
                          <tr>
                            <td class="hidden-xs"><a href="/easytrip/tourdetails?tourid=${tl.tourid}" class="preview" >${tl.tourname}</a></td>
                            <td>${tl.visitingcities}</td>
                            <td>${tl.tourdivision}</td>
                            <td>${tl.costperperson}</td>
                            <td>${tl.tourdate}</td>
                            <td>${tl.totalday} Day(s) ${tl.totalnight} Night(s)</td>
                          </tr>
                        </c:forEach> 
                        </tbody>
                </table>
            
              </div>
              <div class="panel-footer">
                <div class="row">
                  
                  
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right" id="myPager">
                    </ul>
                    <ul class="pagination visible-xs pull-right">
                        <li><a href="#">«</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
</div></div>
<script type="text/javascript">
$('#search_field').on('keyup', function() {
  var value = $(this).val();
  var patt = new RegExp(value, "i");

  $('#myTable').find('tr').each(function() {
    if (!($(this).find('td').text().search(patt) >= 0)) {
      $(this).not('.myHead').hide();
    }
    if (($(this).find('td').text().search(patt) >= 0)) {
      $(this).show();
    }
  });

});
</script>
<script id="jsbin-javascript">
$.fn.pageMe = function(opts){
    var $this = this,
        defaults = {
            perPage: 10,
            showPrevNext: false,
            hidePageNumbers: false
        },
        settings = $.extend(defaults, opts);
    
    var listElement = $this;
    var perPage = settings.perPage; 
    var children = listElement.children();
    var pager = $('.pager');
    
    if (typeof settings.childSelector!="undefined") {
        children = listElement.find(settings.childSelector);
    }
    
    if (typeof settings.pagerSelector!="undefined") {
        pager = $(settings.pagerSelector);
    }
    
    var numItems = children.size();
    var numPages = Math.ceil(numItems/perPage);

    pager.data("curr",0);
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
    }
    
    var curr = 0;
    while(numPages > curr && (settings.hidePageNumbers==false)){
        $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo(pager);
        curr++;
    }
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
    }
    
    pager.find('.page_link:first').addClass('active');
    pager.find('.prev_link').hide();
    if (numPages<=1) {
        pager.find('.next_link').hide();
    }
      pager.children().eq(1).addClass("active");
    
    children.hide();
    children.slice(0, perPage).show();
    
    pager.find('li .page_link').click(function(){
        var clickedPage = $(this).html().valueOf()-1;
        goTo(clickedPage,perPage);
        return false;
    });
    pager.find('li .prev_link').click(function(){
        previous();
        return false;
    });
    pager.find('li .next_link').click(function(){
        next();
        return false;
    });
    
    function previous(){
        var goToPage = parseInt(pager.data("curr")) - 1;
        goTo(goToPage);
    }
     
    function next(){
        goToPage = parseInt(pager.data("curr")) + 1;
        goTo(goToPage);
    }
    
    function goTo(page){
        var startAt = page * perPage,
            endOn = startAt + perPage;
        
        children.css('display','none').slice(startAt, endOn).show();
        
        if (page>=1) {
            pager.find('.prev_link').show();
        }
        else {
            pager.find('.prev_link').hide();
        }
        
        if (page<(numPages-1)) {
            pager.find('.next_link').show();
        }
        else {
            pager.find('.next_link').hide();
        }
        
        pager.data("curr",page);
      	pager.children().removeClass("active");
        pager.children().eq(page+1).addClass("active");
    
    }
};

$(document).ready(function(){
    
  $('#myTable').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:10});
    
});
</script>
	</div>


</div>


<div id="dialog_msg"></div>
                </div>
            </div>
            <!-- Inner Content End -->
        </div>
    </div>
    <!-- Inner Layout End -->
    </div>
<jsp:include page="/PUBLIC/footer.jsp"></jsp:include>