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
<!-- Banner Start-->
<div class="container">
    <div class="banner">
        <link href="/easytrip/PUBLIC/templates/frontend/tour_default/pc/css/banner-slideshow.min.css" media="screen" rel="stylesheet" type="text/css">
        <link href="PUBLIC/templates/frontend/tour_default/pc/css/rs-slides.min.css" media="screen" rel="stylesheet" type="text/css">
		<div class="callbacks_container hidden-xs">
		    <ul class="rslides" id="slider4">
		            <li>
		            <img  src="/easytrip/PUBLIC/2.jpg" alt="Image miss" height="400" width="1140"/>
		        </li>
		        <li>
		            <img  src="PUBLIC/3.jpg" alt="Image miss" height="400" width="1140"/>
		        </li>
		        </ul>
		</div>


<!-- Body Start-->
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


                <div id="featured-tab">
                    <ul class="resp-tabs-list">
                      <li>Popular Tour Packages</li>
                       <li>Recently Added Tours</li>
                    </ul>
                    <div class="resp-tabs-container">
                      <div>
                        <div class="block block-popular">
                        <c:forEach var="pl" items="${popularlist}">
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
                                        
                      <div>
                        <div class="block block-popular">

                          <c:forEach var="rl" items="${recentlist}">
                          <figure>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="thumb">
                                        <img src="PUBLIC/data/frontFiles/tours/tours_image/${rl.imeagelink }"border="0"   class="img-responsive"></a>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <h6><a href="/easytrip/tourdetails?tourid=${rl.tourid}" class="preview" link="" title="${rl.tourname}">${rl.tourname}</a></h6>
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;<i class="fa fa-star-o"></i>&nbsp;                </div>
                                    <i class="fa fa-map-marker"></i> ${rl.visitingcities} <a href="#"></a><br>
                                    <p>${rl.placedetails} </p>            </div>

                                <div class="col-md-3">
                                    <div class="info">
                                        <div class="duration"><span class="day"><i class="fa fa-sun-o"></i>${rl.totalday} Day(s)</span><span class="night"><i class="fa fa-moon-o"></i>${rl.totalnight} Night(s)</span></div>
                                        <br>
                                        <span class="price">${rl.costperperson}</span>

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

<!-- Body End-->

<!-- Footer Start -->


<footer>
    <div class="top">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <ul class="list-inline">
                                                <li><a href="Help.html">Help</a></li>
                                                <li><a href="About-Our-Company.html">About Us</a></li>
                                                <li><a href="TERMS-AND-CONDITIONS-349.html">TERMS AND CONDITIONS</a></li>
                                                <li><a href="Frontend-Login.html">My Account</a></li>
                                                <li><a href="Sign-In.html">Login</a></li>
                                                <li><a href="Packages.html">Membership Packages</a></li>
                                            </ul>

                    <hr>
                    <div rel="nofollow" class="copyright">
                        Copyright&copy;2017 Easytrip is fully responsive and ready&trade; All Rights Reserved &nbsp;
                        <a href="#" rel="nofollow" target="_blank" title="">Easytrip</a>&nbsp;
                        Powered by AIUB (SP2)&nbsp;
                        Version: 1.00.00                   </div>
                </div>

                <div class="col-md-4">
                    <div class="social">
                        Always stay connected with us..<br><br>
                        <a rel="nofollow" href="https://www.facebook.com/" target="_blank" class="facebook" title="Facebook" rel="nofollow"><span><i class="fa fa-facebook"></i></span></a>
                        <a rel="nofollow" href="http://www.twitter.com/" target="_blank" class="twitter" title="Twitter" rel="nofollow"><span><i class="fa fa-twitter"></i></span></a>
                        <a rel="nofollow" href="https://plus.google.com/" target="_blank" class="googleplus" title="Google Plus" rel="nofollow"><span><i class="fa fa-google-plus"></i></span></a>
                        <a rel="nofollow" href="https://www.youtube.com/" target="_blank" class="youtube" title="You Tube" rel="nofollow"><span><i class="fa fa-youtube"></i></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</div>
</div>
<div class="go-top"><a href="#top" id="scroll-top"><i class="fa fa-angle-up"></i></a></div>


<jsp:include page="/PUBLIC/scripthome.jsp"></jsp:include>


</body>
</html>