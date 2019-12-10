<%@page import="com.product.operation.CategoryOperation"%>
<%@page import="com.model.product.Category"%>
<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.jdbc.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!doctype html>
<html lang="en">

<!-- Mirrored from theme.innovatory.in/Graby-shop/product-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Oct 2018 05:53:54 GMT -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--BOOTSTRAP-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!--fonts-->
<link href="https://fonts.googleapis.com/css?family=Karla:400,700" rel="stylesheet">
<link href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="fonts/font/flaticon.css" rel="stylesheet" type="text/css">
<!--thumbnail-slider-->
<link href="css/lightslider.css" rel="stylesheet" type="text/css">
<!--range-slider-->
<link href="css/range-slider.css" rel="stylesheet" type="text/css">
<!--slider-->
<link href="css/owl.carousel.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<title>Exchange</title>
<link rel="icon" href="img/index/favicon.png" sizes="16x16">
<!--css-->
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/range-select.css" rel="stylesheet" type="text/css">



<script src="userBootstrap/js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="userBootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="userBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<!-- Font awesome 5 -->
<link href="userBootstrap/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">
        
<!-- plugin: owl carousel  -->
<link href="userBootstrap/plugins/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="userBootstrap/plugins/owlcarousel/assets/owl.theme.default.css" rel="stylesheet">
<script src="userBootstrap/plugins/owlcarousel/owl.carousel.min.js"></script>

<!-- custom style -->
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />





<style>
	
	.img-sm 
	{
  		width:auto;
  		height:100%; 
  	}
  	
  	a
  	{
  	color:black;
  	}
  	
  	
  	
  	
  	
  	

.w3-btn,.w3-button{-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none; position:relative; left:1100px; height:50px; width:50px;}   

.w3-teal,.w3-hover-teal:hover{color:#fff!important;background-color:#009688!important}


</style>

<script type="text/javascript">
function callit()
{
alert("You must be logged on to add the product :");
}

</script>

</head>

<body>
 <% if(request.getParameter("msg") !=null){ %>

	<script type="text/javascript">
	alert('<%= request.getParameter("msg") %>');

</script>
<%} %>


<div class="product-list grid-page"><!--page wrap-->

<a href="javascript:" id="return-to-top"><i class="fa fa-angle-up"></i></a>



  <%@include file="userheader.jsp" %>
  <form method="get" action="addProductExchange.jsp">
  <button type="submit" class="button btn-primary" style="position:relative !important;left:1020px !important;top:20px !important;height:40px !important;width:100px !important;" >Add Product</button>
   </form>
<!--   <form method="get" action="/addProductOriginal.jsp">
 <button type="submit" class="button button5">PRODUCT</button>
  </form> -->
   
<!--product-list-->
<div class="container padd-80 product-list-sec"  style="color:black !important;">

<div class="col-md-9 col-md-push-3 show-product">

	<!-- <div class="product-top-bar">
    	<ul style="color:black !important;">
        	<li><a href="#" class="show-list">Showing of 1-12 of 125 results</a></li>
        	<li><a href="#" ><span>Short by</span></a></li>
        	<li><a href="#">Price</a></li>
        	<li><a href="#">Name</a></li>
        	<li><a href="#">Date</a></li>
        	<li><a href="#">Popular</a></li>
            <div class="pull-right">
            <li><a href="product-grid.html" class="menu-btn text-right"><i class="flaticon-1-squares"></i></a></li>
            <li><a href="#" class="menu-btn active text-right"><i class="flaticon-1-menu"></i></a></li>
            </div>
        </ul>
    </div> -->
    <div class="clearfix"></div>
    
 
 
 <%
    int idp;
    	if(request.getParameter("id")!=null)
    	{
    		 idp =	Integer.parseInt(request.getParameter("id"));
    	}
    	else
    	{
    		idp=15;
    	}
    	
    %>
    
   <%
     
   List<Product> l = ProductOperation.getByCategoryAndType(idp, 4);
                                	for(Product p : l)
                                	{
                                %>
                                   
                                
   <%--  <% p.seImage1( ""+p.getImage1()); %> --%>
    <a href="ExchangeDetails.jsp?id=<%=p.getId()%>">
    <div class="col-md-12 product-list-detail popular-product product mt-30">
    
		<div class="product-list-img">	
   <%--      	<a href="#"><img  src="<%=p.getImage1()%>" alt="IMG PRODUCT" class="img-responsive" style="width:100px;"/></a> --%>
   	
	<div class="img-wrap"><%-- <a href="RentDetails.jsp?id=<%=p.getId()%>"> --%>  <img style="height:235px !important;width:265px !important;  " src="<%= p.getImage1()%>" ><!-- </a> --></div>        
            <div class="sale-heart-hover"><!-- <a href="#"><i class="flaticon-heart"></i></a> --></div>
            <!-- <div class="product-list-labal product-list-labal1">New</div>
        	<div class="product-list-labal">-15%</div> -->
       </div>
        
        <div class="list product-body">
        <h1 style="color:red !important;"> <%= p.getName() %> </h1>
    <!--     <span class="stock"><i class="fa fa-check-circle"></i> In stock</span> -->
      <%--   <div class="icon">
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <i class="fa fa-star" aria-hidden="true"></i>
            <h6>(12 reviews)</h6>
        </div>
        <h4><%=p.getPrice() %></h4>
        <h5>$650.20</h5> --%>
        <span><%=p.getDescription()%>  </span>
        
       <%--  <b>Duration</b>
        <span style=color:red;!important><%=p.getDuration()%>  </span>
        <div class="product-hover">
           <div class="add-cart-hover"><a href="#"><h6>Add to cart</h6> <i class="flaticon-3-signs" aria-hidden="true"></i></a></div>
           <div class="quick-view">
           	<a href="#" data-toggle="modal" data-target="#quick-modal"><i class="fa fa-search-plus" aria-hidden="true"></i></a>
           </div>
        </div> --%>
        </div>
        
    </div>
    </a>
    <%
                                	}
                                 %>
    
    <div class="clearfix"></div>
    
    
</div>

<div class="col-md-3 col-md-pull-9 main-side-bar">
    	
     	<ul>
       		<li class="sub-menu"><a class="main-a" href="javascript:void(0)">CATEGORIES <div class="icon-plus"><i class='fa flaticon-3-signs'></i></div></a>
            
            	<ul>
            	
            	<%
			List<Category> list = CategoryOperation.getAllByType(4);
			for(Category c:list)
			{
			
		%>
            
                    <li> <a href="exchage.jsp?id=<%=c.getCategoryid()%>"><%=c.getCategoryname() %></a></li>
		<%} %>
                </ul>
            
            </li>
       </ul>
       
       	
       
  <!--      	<ul class="shop-size">
       		<li class="sub-menu"><a class="main-a" href="javascript:void(0)">Brands <div class="icon-plus"><i class='fa flaticon-3-signs'></i></div></a>
            
            	<ul>
                	<li><input type="checkbox" id="ap" /><label for="ap"> Apple <span>(8)</span></label><div class="clearfix"></div></li>
                    <li><input type="checkbox" id="de" /><label for="de"> Dell <span>(15)</span></label></li>
                    <li><input type="checkbox" id="le" /><label for="le"> Lenovo<span>(3)</span></label></li>
                    <li><input type="checkbox" id="pa" /><label for="pa"> Panasonic<span>(3)</span></label></li>
                    <li><input type="checkbox" id="no" /><label for="no"> Nokia <span>(15)</span></label></li>
                    <li><input type="checkbox" id="sa" /><label for="sa"> Samsung<span>(3)</span></label></li>
                    <li><input type="checkbox" id="zi" /><label for="zi"> Ziox<span>(3)</span></label></li>
                </ul>
            
            </li>
       </ul>
       
       	<ul class="shop-size">
       		<li class="sub-menu"><a class="main-a" href="javascript:void(0)">Shop by color <div class="icon-plus"><i class='fa flaticon-3-signs'></i></div></a>
            
            	<ul>
                	<li><input type="checkbox" id="br" /><label for="br"> Brown <span>(8)</span></label><div class="clearfix"></div></li>
                    <li><input type="checkbox" id="wh" /><label for="wh"> White <span>(15)</span></label></li>
                    <li><input type="checkbox" id="bl" /><label for="bl"> Black<span>(3)</span></label></li>
                    <li><input type="checkbox" id="blu" /><label for="blu"> Blue<span>(3)</span></label></li>
                    <li><input type="checkbox" id="ro" /><label for="ro"> Rosegold <span>(15)</span></label></li>
                    <li><input type="checkbox" id="si" /><label for="si"> Silver<span>(3)</span></label></li>
                    <li><input type="checkbox" id="pi" /><label for="pi"> Pink<span>(3)</span></label></li>
                </ul>
            
            </li>
       </ul>
       
       	<ul class="shop-size">
       		<li class="sub-menu"><a class="main-a" href="javascript:void(0)">Shop by Size <div class="icon-plus"><i class='fa flaticon-3-signs'></i></div></a>
            
            	<ul>
                	<li><input type="checkbox" id="s" /> <label for="s">S <span>(8)</span></label><div class="clearfix"></div></li>
                    <li><input type="checkbox" id="m" /><label for="m">  M <span>(15)</span></label></li>
                    <li><input type="checkbox" id="l" /><label for="l"> L<span>(3)</span></label></li>
                    <li><input type="checkbox" id="xl" /><label for="xl"> XL<span>(3)</span></label></li>
                    <li><input id="xxl" type="checkbox" /><label for="xxl">XXL<span>(15)</span></label></li>
                </ul>
            
            </li>
       </ul>
        -->
       	<!-- <ul>
       		<li class="sub-menu"><a class="main-a" href="javascript:void(0)">Latest products <div class="icon-plus"><i class='fa flaticon-3-signs'></i></div></a>
            
            	<ul>
					<li class="new-list">
                    	<img src="img/grid/new-1.jpg" class="img-responsive" alt="" />
                        <h2>iPhone 6s rose gold 126GB</h2>
                        <h3>895.50$ <span>$920.20</span></h3>
                    </li>
                    <li class="new-list">
                    	<img src="img/grid/new-2.jpg" class="img-responsive" alt="" />
                        <h2>SAMSUNG RFG23UERS Classic Style</h2>
                        <h3>895.50$ <span>$920.20</span></h3>
                    </li>
                    <li class="new-list">
                    	<img src="img/grid/new-3.jpg" class="img-responsive" alt="" />
                        <h2>PQi iConnect USB OTG iPhone/iPad USB</h2>
                        <h3>895.50$ <span>$920.20</span></h3>
                    </li>
				</ul>
            
            </li>
       </ul> -->
 
</div>

</div>

<!--top-rated-product-->
<!-- <div class="container top-rated"  style="color:black !important;">

    <div class="col-md-4 col-sm-6 top-rated-product pt-60">
    	<h3><a href="#">Featured Product</a></h3>
        <span></span>
        <div class="tranding">
        	<div class="owl-carousel special-offer" id="topproduct">
        
              <div class="thumbnail no-border no-padding">
                     <div class="popular-product col-xs-12 sale col-md-12">
            <a href="#"><img src="img/product/top_product_phone.jpg" alt="" class="img-responsive" /></a>        
            <h2><a href="#">iPhone 6s rose gold 126GB</a></h2>
            <h4>750.50$</h4> 
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 sale col-md-12">
                        <a href="#"><img src="img/product/watch.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">iWatch Apple</a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/otg.jpg" alt="" class="img-responsive"></a>
                        <h2><a href="#">PQi iConnect USB OTG </a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>   
              </div>
              
              <div class="thumbnail no-border no-padding">
                    <div class="popular-product col-xs-12 col-md-12 sale">
            <a href="#"><img src="img/product/top_product_fridge.jpg" alt="" class="img-responsive" /></a>
            <h2><a href="#">SAMSUNG RFG23UERS</a> </h2>
            <h4>750.50$</h4>
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale">
                        <a href="#"><img src="img/product/top_product_laptop.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">HP Stream 14" Laptop</a></h2>
                        <h4>650.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/top_product_speaker.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Home Theater System</a></h2>
                        <h4>570.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div> 
              </div>
             
              <div class="thumbnail no-border no-padding">
                    <div class="popular-product col-xs-12 col-md-12 sale">
            <a href="#"><img src="img/product/top_product_camera.jpg" alt="" class="img-responsive" /></a>
            <h2><a href="#">OLYMPUS Stylus TG-5</a> </h2>
            <h4>755.50$</h4>
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
        </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale">
                        <a href="#"><img src="img/product/top_product_cell-phone.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Samsung Galaxy S8</a> </h2>
                        <h4>580.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/top_product_tv.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Sony KDL43W7 43"(108cm)</a></h2>
                        <h4>540.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class=" clearfix"></div>
              </div>
                     
            </div>
      	</div>    
    </div>

    <div class="col-md-4 col-sm-6 top-rated-product pt-60">
    <h3><a href="#">Top Rated</a></h3>
        <span></span>
        <div class="tranding">
        	<div class="owl-carousel special-offer" id="featureproduct">
        
              <div class="thumbnail no-border no-padding">
              		
                     <div class="popular-product col-xs-12 col-md-12 sale">
            <a href="#"><img src="img/product/top_product_fridge.jpg" alt="" class="img-responsive" /></a>
            <h2><a href="#">SAMSUNG RFG23UERS</a> </h2>
            <h4>750.50$</h4>
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale">
                        <a href="#"><img src="img/product/top_product_laptop.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">HP Stream 14" Laptop</a></h2>
                        <h4>650.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/top_product_speaker.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Home Theater System</a></h2>
                        <h4>570.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
              </div>
              
              <div class="thumbnail no-border no-padding">
              
                     <div class="popular-product col-xs-12 sale col-md-12">
            <a href="#"><img src="img/product/top_product_phone.jpg" alt="" class="img-responsive" /></a>        
            <h2><a href="#">iPhone 6s rose gold 126GB</a></h2>
            <h4>750.50$</h4> 
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 sale col-md-12">
                        <a href="#"><img src="img/product/watch.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">iWatch Apple</a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/otg.jpg" alt="" class="img-responsive"></a>
                        <h2><a href="#">PQi iConnect USB OTG </a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
              </div>
             
              <div class="thumbnail no-border no-padding">
                    <div class="popular-product col-xs-12 col-md-12 sale">
            <a href="#"><img src="img/product/top_product_camera.jpg" alt="" class="img-responsive" /></a>
            <h2><a href="#">OLYMPUS Stylus TG-5</a> </h2>
            <h4>755.50$</h4>
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
        </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale">
                        <a href="#"><img src="img/product/top_product_cell-phone.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Samsung Galaxy S8</a> </h2>
                        <h4>580.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/top_product_tv.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Sony KDL43W7 43"(108cm)</a></h2>
                        <h4>540.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class=" clearfix"></div>
              </div>
                     
            </div>
      	</div>
    </div>
    
    <div class="col-sm-6 col-md-offset-0 col-md-4  top-rated-product pt-60 pb-60">
    	<h3><a href="#">Popular Products</a></h3>
        <span></span>
        <div class="tranding">
        	<div class="owl-carousel special-offer" id="popularproduct">
            
              <div class="thumbnail no-border no-padding">
                        <div class="popular-product col-xs-12 col-md-12 sale">
                <a href="#"><img src="img/product/top_product_camera.jpg" alt="" class="img-responsive" /></a>
                <h2><a href="#">OLYMPUS Stylus TG-5</a> </h2>
                <h4>755.50$</h4>
                
                <div class="hover-product">
                    <div class="hover-product-body">
                    <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                    <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                    <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                    </div>
                </div>
                
            </div>
                        <div class="clearfix"></div>
                        
                        <div class="popular-product col-xs-12 col-md-12 sale">
                            <a href="#"><img src="img/product/top_product_cell-phone.jpg" alt="" class="img-responsive" /></a>
                            <h2><a href="#">Samsung Galaxy S8</a> </h2>
                            <h4>580.50$</h4>
                            
                            <div class="hover-product">
                                <div class="hover-product-body">
                                <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                                <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                                <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="clearfix"></div>
                        
                        <div class="popular-product col-xs-12 col-md-12 sale connect">
                            <a href="#"><img src="img/product/top_product_tv.jpg" alt="" class="img-responsive" /></a>
                            <h2><a href="#">Sony KDL43W7 43"(108cm)</a></h2>
                            <h4>540.50$</h4>
                            
                            <div class="hover-product">
                                <div class="hover-product-body">
                                <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                                <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                                <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                                </div>
                            </div>
                            
                        </div>
                        <div class=" clearfix"></div>
              </div>
        
              <div class="thumbnail no-border no-padding">
              		
                     <div class="popular-product col-xs-12 col-md-12 sale">
            <a href="#"><img src="img/product/top_product_fridge.jpg" alt="" class="img-responsive" /></a>
            <h2><a href="#">SAMSUNG RFG23UERS</a> </h2>
            <h4>750.50$</h4>
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale">
                        <a href="#"><img src="img/product/top_product_laptop.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">HP Stream 14" Laptop</a></h2>
                        <h4>650.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/top_product_speaker.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">Home Theater System</a></h2>
                        <h4>570.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
              </div>
              
              <div class="thumbnail no-border no-padding">
              
                     <div class="popular-product col-xs-12 sale col-md-12">
            <a href="#"><img src="img/inner-page/top_product_phone.html" alt="" class="img-responsive" /></a>        
            <h2><a href="#">iPhone 6s rose gold 126GB</a></h2>
            <h4>750.50$</h4> 
            
            <div class="hover-product">
            	<div class="hover-product-body">
            	<div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
            	<div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
            	<div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                </div>
            </div>
            
		</div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 sale col-md-12">
                        <a href="#"><img src="img/product/watch.jpg" alt="" class="img-responsive" /></a>
                        <h2><a href="#">iWatch Apple</a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
                    
                    <div class="popular-product col-xs-12 col-md-12 sale connect">
                        <a href="#"><img src="img/product/otg.jpg" alt="" class="img-responsive"></a>
                        <h2><a href="#">PQi iConnect USB OTG </a></h2>
                        <h4>700.50$</h4>
                        
                        <div class="hover-product">
                            <div class="hover-product-body">
                            <div class="hover-icon heart"><a href="#"><i class="flaticon-heart"></i></a></div>
                            <div class="hover-icon"><a href="#" data-toggle="modal" data-target="#quick-modal"><i class="flaticon-4-search"></i></a></div>
                            <div class="hover-icon"><a href="#"><i class="flaticon-3-signs"></i></a></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
              </div>
            </div>
      	</div>
    </div>
</div>

 --><!--footer--><!-- 
<div class="container-fluid footer-sec">
<div class="container padd-60">
	<div class="col-md-12 footer-top-sec">
    	<div class="col-md-4 col-sm-5 payment">
        	<img src="img/footer/paypal.png" alt="" class="img-responsive" />
            <img src="img/footer/visa.png" alt="" class="img-responsive" />
            <img src="img/footer/mastercard.png" alt="" class="img-responsive" />
        </div>
        <div class="col-md-4 col-sm-2 footer-logo"><img src="img/index/logo.png" alt="" class="img-responsive" /></div>
        <div class="col-md-4 col-sm-5 social-sec text-center">
        <div class="social">
        	<div class="social-circle"><a href="#"><i class="fa fa-facebook-f" aria-hidden="true"></i></a></div>
        	<div class="social-circle"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></div>
        	<div class="social-circle"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></div>
        	<div class="social-circle"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></div>
        </div>
        </div>
        <div class="clearfix"></div>
    </div>
    
    <div class="col-md-12 call">
    	<h3>CONTACT INFORMATION</h3>
        <div class="col-md-4 col-sm-4 email">
        	<i class="flaticon-phone-call"></i>
        	<h3>CALL</h3>
            <p>+01 (9876) 543 210</p>
            <p>+01 (9876) 543 211</p>
        </div>
        <div class="col-md-4 col-sm-4 email">
        	<i class="flaticon-placeholder-1"></i>
        	<h3>FIND US</h3>
            <p>Hahnenmoos strasse 20C, 3715</p>
            <p> Adelboden, Switzerland</p>
        </div>
        <div class="col-md-4 col-sm-4 email">
        	<i class="flaticon-e-mail-envelope"></i>
        	<h3>EMAIL</h3>
            <p>Info@grabyshop.com</p>
            <p>contact@grabyshop.com</p>
        </div>
    </div>
</div>
</div>

<div class="container-fluid copy-right">
	<div class="container">
    	<div class="col-md-4 col-sm-3 copy-text">
        	<p>© 2018 <a href="#">Graby shop</a>.</p>
        </div>
        <div class="col-md-8 col-xs-12 col-sm-9 terms-condition text-right">
        	<ul>
            	<li><a href="#">About</a></li>
                <li><a href="#">Legal information</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Term of service</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>
    </div>
</div>
 -->
 
  <%@include file="userFooter.jsp" %> 
 
 
<!--modal-->
<div class="modal fade quick-modal in" id="quick-modal" tabindex="-1" role="dialog">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <div class="col-md-5 detail-left text-center">
                            <ul class="color-var">
                                <li><a href="#"><i class="fa fa-check"></i></a></li>
                                <li><a href="#" class="active"><i class="fa fa-check"></i></a></li>
                                <li><a href="#"><i class="fa fa-check"></i></a></li>
                                <li><a href="#"><i class="fa fa-check"></i></a></li>
                                <li><a href="#"><i class="fa fa-check"></i></a></li>
                            </ul>
                            <div id="carousel" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                <div class="item active" data-thumb="0"> <img src="img/product-list/quick-img-1.jpg" alt=""> </div>
                                <div class="item" data-thumb="1"> <img src="img/product-list/quick-img-2.jpg" alt=""> </div>
                                <div class="item" data-thumb="2"> <img src="img/product-list/quick-img-3.jpg" alt=""> </div>
                                <div class="item" data-thumb="3"> <img src="img/product-list/quick-img-4.jpg" alt=""> </div>
                                <div class="item" data-thumb="4"> <img src="img/product-list/quick-img-1.jpg" alt=""> </div>
                                <div class="item" data-thumb="5"> <img src="img/product-list/quick-img-2.jpg" alt=""> </div>
                                <div class="item" data-thumb="6"> <img src="img/product-list/quick-img-3.jpg" alt=""> </div>
                                <div class="item" data-thumb="7"> <img src="img/product-list/quick-img-4.jpg" alt=""> </div>
                              </div>
                            </div>
                            <div id="thumbcarousel" class="carousel thumbcarousel slide" data-interval="false">
                              <div class="carousel-inner">
                                <div class="item active">
                                  <div data-target="#carousel" data-slide-to="0" class="thumb"><img src="img/product-list/thumb-img-1.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="1" class="thumb"><img src="img/product-list/thumb-img-2.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="2" class="thumb"><img src="img/product-list/thumb-img-3.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="3" class="thumb"><img src="img/product-list/thumb-img-4.jpg" alt=""></div>
                                </div>
                                <!-- /item -->
                                <div class="item">
                                  <div data-target="#carousel" data-slide-to="4" class="thumb"><img src="img/product-list/thumb-img-1.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="5" class="thumb"><img src="img/product-list/thumb-img-2.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="6" class="thumb"><img src="img/product-list/thumb-img-3.jpg" alt=""></div>
                                  <div data-target="#carousel" data-slide-to="7" class="thumb"><img src="img/product-list/thumb-img-4.jpg" alt=""></div>
                                </div>
                                <!-- /item --> 
                              </div>
                              <!-- /carousel-inner --> 
                              <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> <span class="fa fa-angle-left"></span> </a> <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> <span class="fa fa-angle-right"></span> </a> </div>
        				<div class="clearfix"></div>
    					</div>
    
   						 <div class="col-md-7 detail-right">
                                <div class="detail-top">
                                    <h1>iPhone 7 128GB Rose Gold </h1>
                                    <div class="rating">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                        <span>( 12 reviews )</span>
                                        <a href="#">Write a review</a>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="rate">
                                        <h2>495.50$ <del>$520.20</del></h2>
                                        <label class="offer-label">-15%</label>
                                        <span><i class="fa fa-check-circle"></i> In stock</span>
                                        <div class="clearfix"></div>
                                    </div>            
                                </div>
                                <ul class="detail">
                                        <li class="sub-menu"><a class="main-a" href="javascript:void(0)">Description <div class="icon-plus"><i class="fa flaticon-3-signs"></i></div></a>
                                        
                                            <ul>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestib porttitor egestas orci, vitae ullamcorper risus  dolor sit amet, consectetur adium porttitor egestas orci, vitae ullamcorper risus consectetur id. </p>
                                            </ul>
                                        
                                        </li>
                                </ul>
                                <ul class="detail feature">
                                        <li class="sub-menu"><a class="main-a" href="javascript:void(0)">Features <div class="icon-plus"><i class="fa flaticon-3-signs"></i></div></a>
                                        
                                            <ul>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>12MP primary camera </li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>Quad-LED True Tone flash</li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>7MP front facing HD camera </li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>4.7-inch (diagonal) Retina HD</li>
                                            </ul>
                                            <ul>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>128GB internal memoryVestib</li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>single Nano-SIM </li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>Li-Ion 1960 mAh battery</li>
                                                <li><i class="fa fa-caret-right" aria-hidden="true"></i>1 year manufacturer warranty</li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        
                                        </li>
                                </ul>
                                <div class="detail-btm">
                                    <div class="detail-row">
                                        <p class="text-uppercase">Size</p>
                                        <ul class="size">
                                            <li><a href="#">32 GB</a></li>
                                            <li><a href="#">64 GB</a></li>
                                            <li class="active"><a href="#">128 GB</a></li>
                                        </ul>
                                    </div>
                                    <div class="detail-row quantity-box">
                                        <p class="text-uppercase">Quantity</p><div class="clearfix"></div>
                                        <div id="field1" class="input--filled">
                                          <button type="button" id="sub" class="sub"><i class="fa fa-minus" aria-hidden="true"></i></button>
                                          <input type="text" id="1" value="1" class="field">
                                          <button type="button" id="add" class="add"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                          <div class="clearfix"></div>
                                        </div>
                                        <a class="coupon" href="#">Add to cart</a>
                                        <div class="action-icon pull-right">
                                            <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>Wish list</a>
                                            <a href="#"><i class="flaticon-refresh"></i>Compare</a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="detail-row"><p><span>SKU:</span> N/A</p></div>
                                    <div class="detail-row"><p><span>Categories:</span> All, Featured, Shoes</p></div>
                                    <div class="detail-row"><p><span>Tags:</span> Black, Brown, Red, Shoes, £0.00 - £150.00</p></div>
                                    <div class="detail-row">
                                        <p><span>Share:</span></p>
                                        <div class="soc-icon">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook"><i class="fa fa-facebook-f"></i></a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Instagram"><i class="fa fa-instagram"></i></a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Dribble"><i class="fa fa-dribbble"></i></a>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest"><i class="fa fa-pinterest-p"></i></a>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
    					</div>
    					<div class="clearfix"></div>
                      </div>
                    </div>
                  </div>
                </div>
                
</div><!--/page wrap-->

<!--js-->
<script src="js/ajax.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--slider-->
<script src="js/owl.carousel.min.js"></script>
<script src="js/theme.js"></script>
<!--Range-validator-->
<script src="js/jquery-ui.min.js"></script>
<script src="js/product-custom.js"></script>
<!--index-->
<script src="js/index.js"></script>
<!--custom-->
<script src="js/custom.js"></script>
<script language=JavaScript>

$(document).keydown(function (event) {
    if (event.keyCode == 123) { // Prevent F12
        return false;
    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        return false;
    }
});

$(document).on("contextmenu", function (e) {        
    e.preventDefault();
});

</script>
</body>

<!-- Mirrored from theme.innovatory.in/Graby-shop/product-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 30 Oct 2018 05:54:13 GMT -->
</html>