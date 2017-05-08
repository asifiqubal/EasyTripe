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
  <section class="content">
      <div class="row">
            <div class="col-md-9">
                <!-- Content Start -->
                <link href="PUBLIC/templates/frontend/tour_default/pc/css/resp-carousel.min.css" media="screen" rel="stylesheet" type="text/css">
                <link href="PUBLIC/templates/frontend/tour_default/pc/css/resp-theme.min.css" media="screen" rel="stylesheet" type="text/css">
                <style>
                	.owl-carousel{direction:ltr;}
                	#owl-demo{max-height:550px; overflow:hidden;}
                	#owl-demo .item{margin: 3px;}
                	#owl-demo .item a > img{display: inline;/*height:100px;*/}
                </style>


                <div id="featured-tab" >
                    <ul class="resp-tabs-list" style="background-color:#0773E0;">
                      <li style="display: block; width: 100%; margin: 0px; background-color:#0773E0;">${tourdivision} Division's Tour List</li>
                    </ul>
                    <div class="resp-tabs-container">
                      <div>
                        <div class="block block-popular">
                        <c:forEach var="pl" items="${tourlist}">
                          <figure>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="thumb">
                                        <img src="PUBLIC/data/frontFiles/tours/tours_image/${pl.imeagelink }"border="0"   class="img-responsive"></a>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <h6><a href="/easytrip/tourdetails?tourid=${pl.tourid}" class="preview" link="" title="${pl.tourname}">${pl.tourname}</a></h6>
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;                </div>
                                    <i class="fa fa-map-marker"></i> ${pl.visitingcities} <a href="#"></a><br>
                                    <p>${pl.placedetails} </p>            </div>

                                <div class="col-md-3">
                                    <div class="info">
                                        <div class="duration"><span class="day"><i class="fa fa-sun-o"></i>${pl.totalday} Day(s)</span><span class="night"><i class="fa fa-moon-o"></i>${pl.totalnight} Night(s)</span></div>
                                        <br>
                                        <span class="price">${pl.costperperson}</span>

                                        <br>
                                           
                                    </div>
                                </div>
                            </div>
                          </figure>
                          </c:forEach>
 
                        </div>
                      </div>
                                        
                      
                    </div>
                </div>
                <!-- Content End -->
            </div>
            <div class="col-md-3">
              <!-- Sidebar Start -->
              <div class="block block-accordion">
                <div id="accordion-tab">
                    <ul class="resp-tabs-list">
                      <li>DESTINATIONS </li>
                    </ul>
                    <div class="resp-tabs-container">
                      <div>
                        <div class="list-group">
                        <c:forEach var="dl" items="${divlist}">
                          <a href="/easytrip/tourlist?tourdivision=${dl.tourdivision}" class="list-group-item"><span>${dl.tourdivision } (${dl.count}) </span></a>
                         </c:forEach>
                        </div>
                      </div>
                    </div>
                </div>
              </div>

                  
              <div class="clearfix"></div>

                  <!-- Sidebar End -->
            </div>
      </div>
  </section>
</div>

<jsp:include page="/PUBLIC/footer.jsp"></jsp:include>