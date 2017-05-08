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
<!-- Top Navigation End -->

<!-- Banner Start-->
<div class="container">
        <!-- Inner Layout Start -->
    <div class="container-fluid inner">
        <div class="row">
            <!-- Inner Content Start -->
            <div class="">
                <div class="drawer-overlay">
                    <style type="text/css">
						#map-canvas{min-height: 400px; margin:0 0 20px 0; padding:0;}
						#map-tab input{margin:5px 0;}
					</style>
					<div class="module">
   						<div class="col-md-12 col-sm-8">
        					<!-- info block -->
            				<h1>${td.tourname}&nbsp; <span style="display:${book}"><a href="/easytrip/book?tourid=${td.tourid}" class="btn btn-global btn-lg"><i class="fa fa-shopping-cart"></i> Book Now</a></span></h1>
    						<div class="well col-md-12" style="display:${display}">
    							<div class="row col-md-6">
    							<script type="text/javascript">
							    $(document).ready(function(){
							    $("#adult_no").change(function(){
							        var an=$("#adult_no").val();
							        var cn=$("#child_no").val();
							        var cpp=$("#cpp").text();
							        var cpc=$("#cpc").text();
							        var total;
							        
							        if(an>0){
							        	if(cn<=0){
							        		$("#child_no").html("<option value='0'>0</option>"+
						                    "<option value='1'>1</option>"+
						                    "<option value='2'>2</option>"+
						                    "<option value='3'>3</option>"+
						                    "<option value='4'>4</option>"+
						                    "<option value='5'>5</option>");}
									        $("#adultnum").html("</label><label id='adultnum' name='an'>"+an+"</label>");
									        $("#adultcost").html("</label><label id='adultcost'>"+an*cpp+"</label>");
									        total=parseInt(an*cpp) + parseInt(cn*cpc);
									        $("#totalcost").html("</label><label id='totalcost'>"+total+"</label>");
									         $("#ani").val(an);
									        $("#cni").val(cn); 
							        }
							        else{
							        	$("#child_no").html("<option value='0'>Select Adult</option>");
										$("#adultnum").html("</label><label id='adultnum' name='an'>0</label>");							        
							       		$("#adultcost").html("</label><label id='adultcost'>0</label>");
							       		$("#childnum").html("<label id='childnum' name='cn' >0</label>")
							       		$("#childcost").html("<label id='childcost' >0</label>")
							        	$("#totalcost").html("</label><label id='totalcost'>0</label>");
							       		 $("#ani").val("0");
								        $("#cni").val("0"); 
							       		//$("#ani").html("<input type='hidden' id='ani' value='0' name='ani'>");
								        //$("#cni").html("<input type='hidden' id='cni' value='0' name='ani'>");
								        }
							        	
								    });
							    $("#child_no").change(function(){
							        var an=$("#adult_no").val();
							        var cn=$("#child_no").val();
							        var cpp=$("#cpp").text();
							        var cpc=$("#cpc").text();
							        var total;
							        
							        if(an>0){
							        $("#adultnum").html("</label><label id='adultnum' name='an'>"+an+"</label>");							        
							        $("#adultcost").html("</label><label id='adultcost'>"+parseInt(an)*parseInt(cpp)+"</label>");
							        $("#childnum").html("</label><label id='childnum'name='cn'>"+cn+"</label>");	
							        $("#childcost").html("</label><label id='childcost'>"+parseInt(cn)*parseInt(cpc)+"</label>");
							        total=parseInt(an*cpp) + parseInt(cn*cpc);
							        $("#totalcost").html("</label><label id='totalcost'>"+total+"</label>");
							         $("#ani").val(an);
							        $("#cni").val(cn); 
							        }
							        else{
							        	 $("#child_no").html("<option value='0'>Select Adult</option>");
										 $("#adultnum").html("</label><label id='adultnum' name='an'>0</label>");							        
							       		 $("#adultcost").html("</label><label id='adultcost'>0</label>");
							       		 $("#childnum").html("<label id='childnum' name='cn' >0</label>")
							       		 $("#childcost").html("<label id='childcost' >0</label>")
							        	 $("#totalcost").html("</label><label id='totalcost'>0</label>");
							       		 $("#ani").val("0");
								         $("#cni").val("0"); 
							        }
							        	
								    });
							    	
								});
							    </script>
							    	<h3>Book Your Tour</h3>
							    	<br>
							    <div class="">
							    <form action="/easytrip/book" method="post">
							    <input type="hidden" value="${tourid}" name="tourid">
							        <div class="col-md-6 col-sm-6 col-xs-6">
							            <div class="form-group">
							                <label for="adult_no">Adult (17+)</label><br>
							                <select name="adult_no" id="adult_no" class="form-control">
							                	<option value="0">Select A value</option>
							                    <option value="1">1</option>
							                    <option value="2">2</option>
							                    <option value="3">3</option>
							                    <option value="4">4</option>
							                    <option value="5">5</option>
							                    <option value="6">6</option>
							                    <option value="7">7</option>
							                    <option value="8">8</option>
							                    <option value="9">9</option>
							                    <option value="10">10</option>
							                </select>
							            </div>
							        </div>
							
							        <div class="col-md-6 col-sm-6 col-xs-6">
							            <div class="form-group">
							                <label for="child_no">Child (5 - 16) </label>
							                <select name="child_no" id="child_no" class="form-control">
							                    <option value="0">Select Adult</option>
							                </select>
							            </div>
							        </div>
							    </div>
							    </div>
								    <div class="col-md-6">
								    	<div class="col-md-6 col-sm-6" style="font-size:16px;">
								    	
								    	<label>Adult :</label><label id="adultnum" name="an" >0</label>* <lable id="cpp" value="${td.costperperson}">${td.costperperson}</lable> = <label id="adultcost">0</label>
								   		
								   		<br>
								   		<label>Child :</label><label id="childnum" name="cn" >0</label>* <lable id="cpc" value="${td.costperchildren}">${td.costperchildren}</lable> = <label id="childcost">0</label>
								    	<hr style="border-top: 2px solid #444;">
								    	<label>Total Cost :</label><label id="totalcost" style="padding-left: 40px;">0</label>
								    </div>
								   <input type="hidden" id="ani" value="0" name="ani"></input>
								   <input type="hidden" id="cni" value="0" name="cni">
								    <div class="col-md-3">
								    <input type="submit" class="btn btn-global btn-lg fa fa-shopping-cart" value="Book" style="margin-top: 100px;margin-left: 120px;">
								    </div>
								     </form>
							    </div>
							</div>
    						<br>
        					<!-- Info Start -->
							<div class="price">Tk: ${td.costperperson} / person</div>
    						<br>
    							<div class="row">
        							<div class="col-md-6">
							            <ul class="list-group">
							                <li class="list-group-item"><i class="fa fa-qrcode"></i> Tour Date: <strong>${td.tourdate}</strong></li>
							                <li class="list-group-item"><i class="fa fa-calendar-check-o"></i> Duration of Tour: ${td.totalday} Days ${td.totalnight} Nights</li>
							            </ul>
        							</div>
									<div class="col-md-6">
							            <ul class="list-group">
							                <li class="list-group-item"><i class="fa fa-arrow-circle-down"></i> Start City: ${td.startcity }</li>
							                <li class="list-group-item"><i class="fa fa-arrow-circle-up"></i> End City: ${td.endcity }</li>
							            </ul>
							        </div>
    							</div>
    							<br>
    							<div class="text-left">
                				<hr>
							        <div class="row">
	            						<div class="col-md-6">
	                             		</div>
	            						<div class="col-md-6">
							                <link href="../templates/frontend/tour_default/vendor/unite-gallery/css/unite-gallery.min.css" media="screen" rel="stylesheet" type="text/css">
											<link href="/easytrip/PUBLIC/templates/frontend/tour_default/vendor/unite-gallery/themes/default/ug-theme-default.min.css" media="screen" rel="stylesheet" type="text/css">
											<link href="/easytrip/PUBLIC/templates/frontend/tour_default/vendor/grid-gallery/css/grid-component.min.css" media="screen" rel="stylesheet" type="text/css">
											<link href="/easytrip/PUBLIC/templates/frontend/tour_default/vendor/drawer/css/drawer.min.css" media="screen" rel="stylesheet" type="text/css">
											<link href="/easytrip/PUBLIC/module/Vote/css/vote.css" media="screen" rel="stylesheet" type="text/css">
	           							</div>
	        						</div>
									<!-- info block -->
	        						<br>
									<!-- Details Tab Start-->
	        						<div id="details-tab" class="clearfix" style="display: block; width: 100%; margin: 0px;">
	            						<!-- Tab 1 start -->
	            						<div class="resp-tabs-container">
											<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span></h2><h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span></h2><div class="resp-tab-content resp-tab-content-active" style="display:block" aria-labelledby="tab_item-0">
	                    					<div class="row">
												<div class="col-md-6 col-sm-6">
	        										<table class="table table-bordered table-hover table-striped">
	           											<tbody>
	           												<tr>
	           													<td colspan="2"><h4>Tour Details</h4></td>
	           												</tr>
	                        								<tr>
	                        									<td>Visiting Cities :</td>
	                        									<td>${td.visitingcities}</td>
	                        								</tr>
	                        								<tr>
												                <td>Scheduled / Operates on :</td>
												                <td>${td.tourdate} to ${enddate}</td>
												            </tr>
	                        								<tr>
												                <td>Pick-Up :</td>
												                <td>${td.pickup}</td>
												            </tr>
	                        								<tr>
												                <td>Drop-Off :</td>
												                <td>${td.dropoff }</td>
												            </tr>
	                        								<tr>
												                <td>Guide :</td>
												                <td>${td.guide}</td>
												            </tr>
	                    								</tbody>
	                   								 </table>
											    </div>
											    <div class="col-md-6 col-sm-6">
											    	<table class="table table-bordered table-hover table-striped">
											        	<tbody>
											        	<tr>
											            	<td colspan="2"><h4>Tour Details</h4></td>
											            </tr>
											          	<tr>
											                <td>Cost Per Child :</td>
											                <td>${td.costperchildren}</td>
											            </tr>										            
											            <tr>
											                <td>Breakfast :</td>
											                <td>${td.breakfast}</td>
											            </tr>										            
											            <tr>
											                <td>Lunch :</td>
											                <td>${td.lunch}</td>
											            </tr>										            
											            <tr>
											                <td>Dinner :</td>
											                <td>${td.dinner}</td>
											            </tr>										            
											            <tr>
											                <td>Destination Division :</td>
											                <td>${td.tourdivision}</td>
											            </tr>										            
											            
										      		</tbody>
										      	</table>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
										    	<h4>Place Summary</h4>
										    </div>
										    <div class="panel-body">
										    ${td.placedetails}
										    </div>
										</div>                
									</div>
										</div>
									</div>
								</div>
						</div>
						<!-- Comments start -->
				    	<style type="text/css">
							.clikable_final:hover {
						    cursor: pointer;
						    cursor: hand;}
						</style>
						<div id="click_comment" class="clikable_final"><a><i class="fa fa-commenting"></i> Comments</a></div>
							<div id="hide_section" style="display:none">
						   		<div id="show_comment">
						   		</div>
						  		<input type="hidden" id="limit_value" name="user" value="2">
								<div class="clearfix">   
								</div>
					    		<!-- <h3><i class="fa fa-commenting"></i> </h3> -->
					    		<br>
					    		<div class="comments_start comments">
					            </div>
								<div class="clearfix">
								</div>
    							<div class="comment-form">
        							<div id="actionMessage">
        							</div>
								        <a href="#" class="save_comment_btn btn btn-primary">Comment</a>
        
    							</div>
   

 



    

<div id="dialog_msg" title="Add Comment Dialog">
</div>

</div>
     <!-- Comments end -->                
     </div>
            </div>
            <!-- Inner Content End -->
        </div>
    </div>
    <!-- Inner Layout End -->
    </div>

<!-- Body End-->

<!-- Footer Start -->
<jsp:include page="/PUBLIC/footer.jsp"></jsp:include>

