<!DOCTYPE HTML>


<%@page import="com.product.operation.CartOperation"%>
<%@page import="com.model.product.Cart"%>

<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.user.User"%>
<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.jdbc.model.Product"%>
<%@page import="com.product.operation.CategoryOperation"%>
<%@page import="com.model.product.Category"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Product Rental and Exchange </title>

<link rel="shortcut icon" type="image/x-icon" href="userBootstrap/images/logo_zenith.png">

<!-- jQuery -->
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
<style>
	
	.img-sm 
	{
  		width:auto;
  		height:100%; 
  	}
</style>
<!-- custom javascript -->
<script src="userBootstrap/js/script.js" type="text/javascript"></script>


<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
	// jQuery code
	$('.Qtyhide').hide();
	var user = '<%=(String)session.getAttribute("uname")%>';
	if(user == "null")
	{
		$('.visitorHide').hide();
	}
	else
	{
		$('.visitorHide').show();
	}
	
	
	<%--   <%
  	String user = (String)session.getAttribute("uname");
  String resp = "Sesssion Expired!";
  	if(user == null)
  	{
  		response.sendRedirect("adminlogin.jsp?msg="+resp);
  	}
  %>
 --%>
	
	<%
		String s1 = (String)session.getAttribute("uname");
		User u1 = null;
		if(s1!=null)
		{
			u1 = UserOperation.GetUserByUserEmail(s1);
			
			List<Cart> ls1 = CartOperation.getAllById(u1.getId());
			for(Cart c : ls1)
			{
	%>
	if(document.getElementsByClassName('input<%= c.getProductId()%>')[0] != null)
	{	
		document.getElementsByClassName('input<%= c.getProductId()%>')[0].value = <%= c.getQuantity()%>;
		$('.<%= c.getProductId()%>'+"Label").text('<%= c.getQuantity()%>');
		$('.product'+'<%= c.getProductId()%>').hide();
		$('.show'+'<%= c.getProductId()%>').show();
	}
	<% 
			}
		}
	%>
	

}); 
</script>

</head>
<body>

 <%@include file="userheader.jsp" %> 

<section class="section-main bg padding-y-sm">
<div class="container">
<div class="card">
	<div class="card-body">
<div class="row row-sm">
	<aside class="col-md-3">
<h5 class="text-uppercase">Categories</h5>
	<ul class="menu-category">
	
		<%
			List<Category> list = CategoryOperation.getAllByType(1);
			for(Category c:list)
			{
			
		%>
		<li> <a href="product-list.jsp?id=<%=c.getCategoryid()%>"><%=c.getCategoryname() %></a></li>
		<%} %>
	</ul>

	</aside> <!-- col.// -->
	<div class="col-md-9">

<!-- ================= main slide ================= -->
<div id="carousel2_indicator" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner" style="height:350px;">
    
    <%
    int idp;
    	if(request.getParameter("id")!=null)
    	{
    		 idp =	Integer.parseInt(request.getParameter("id"));
    	}
    	else
    	{
    		idp=1;
    	}
    
    
    
    List<Product> listp = ProductOperation.getAllByCategory(2);
    int i=0;
    	for(Product c:listp)
    	{
    		if(i==0)
    		{
    %>
    <div class="carousel-item active">
     <a href="product-detail.jsp?id=<%=c.getId()%>"> <img class="d-block w-100" src="<%=c.getImage1() %>" alt="<%=c.getName() %>" width="900px" height="345px"></a>
      <article class="carousel-caption d-none d-md-block">
	    
	  </article> <!-- carousel-caption .// -->
    </div>
    <%
    		}
    		else
    		{
    %>
    <div class="carousel-item">
     <a href="product-detail.jsp?id=<%=c.getId()%>"> <img class="d-block w-100" src="<%=c.getImage1() %>" alt="<%=c.getImage1() %>"width="900px" height="345px"></a>
      <article class="carousel-caption d-none d-md-block">
	    
	  </article> <!-- carousel-caption .// -->
    </div>
    <%
    		}
    		i++;
    	}
    %>
  </div>
  <a class="carousel-control-prev" href="#carousel2_indicator" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only" style="background-color:black !important;">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel2_indicator" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only" style="background-color:black !important;">Next</span>
  </a>
</div> 
<!-- ============== main slidesow .end // ============= -->

	</div> <!-- col.// -->
	</div> <!-- row.// -->
	</div> <!-- card-body .// -->
</div> <!-- card.// -->

<figure class="mt-3 banner p-3 bg-secondary">
	<div class="text-lg text-center white">Useful banner can be here</div>
</figure>

</div> <!-- container .//  -->
</section>

<!-- ========================= SECTION MAIN END// ========================= -->

.
<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content padding-y-sm bg">
<div class="container">

<header class="section-heading heading-line">
	<h4 class="title-section bg">Products</h4>
</header>

<div class="card">
<div class="row no-gutters">
<!-- 	<div class="col-md-3">
	
<article href="#" class="card-banner h-100 bg2">
	<div class="card-body zoom-wrap">
		<h5 class="title">Machinery items for manufacturers</h5>
		<p>Consectetur adipisicing elit, sed do eiusmod
		tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, cLorem ipsum dolor sit amet, c</p>
		<a href="#" class="btn btn-warning">Explore</a>
		<img src="images/items/item-sm.png" height="200" class="img-bg zoom-in">
	</div>
</article>

	</div> col.// -->
	<div class="col-md-12">
<ul class="row no-gutters border-cols">
	<%
		List<Product> ls = ProductOperation.getAllBuyByCategory(idp);
		i=0;
		for(Product p:ls)
		{
			i++;
	%>
	<li class="col-12 col-md-3">
 
	<div class="card-body">
	 <a href="product-detail.jsp?id=<%=p.getId()%>">
		<p class="word-limit"><%-- <%= p.getBrand()%>&nbsp; --%><%=p.getName() %></p>
		<div style="height:150px;">
			<img class="img-sm" src="<%=p.getImage1() %>" width="100%" height="100%">
		</div>
		<div class="price-wrap">
				<b> <span class="price-new"><%=p.getPrice() %></span>
				<!-- <del class="price-old"></del> --></b>
		</div>
		</a>
		<br/>
		<div class="price-wrap">
				<div class="price-wrap visitorHide product<%=p.getId() %>">
				<button class="btn btn-primary" style="padding-right:8px;padding-left:8px;">Buy Now</button>
				<button class="btn btn-outline-primary" onclick="addToCart(<%=p.getId() %>,1);"><i class="fa fa-shopping-cart"></i>&nbsp;Add to Cart</button>
		</div>
		<div class="input-group Qtyhide show<%=p.getId() %>">
         	<i onclick="minus('<%=p.getId() %>')" class="fa fa-minus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
            <input type="hidden" class="form-control input-number input<%=p.getId() %>" value="1" style="text-align:center;font-weight:bold;border:none;" disabled />
            <label class="<%=p.getId() %>Label" style="text-align:center; font-weight:bolder;width:50px;">1</label>
                <i onclick="plus('<%=p.getId() %>')" class="fa fa-plus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
       	</div>	
		</div>
	</div>			

	</li>
	<%
			if(i%4 == 0)
			{
			%>	</ul>
				<ul class="row no-gutters border-cols">
			<%			
			}
		}
	%>
</ul>
	</div> <!-- col.// -->
</div> <!-- row.// -->
	
</div> <!-- card.// -->

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content padding-y-sm bg">
<div class="container">

<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Best Picks For you</h4>
</header>

<div class="card">
<div class="row no-gutters">
<!-- 	<div class="col-md-3">
	
<article href="#" class="card-banner h-100 bg2">
	<div class="card-body zoom-wrap">
		<h5 class="title">Good equipments for cooking food and cakes</h5>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
		tempor incididunt ut labore et dolore magna aliqua. </p>
		<a href="#" class="btn btn-warning">Explore</a>
		<img src="images/items/item-sm.png" height="200" class="img-bg zoom-in">
	</div>
</article>

	</div>  --><!-- col.// -->
	<div class="col-md-12">
<ul class="row no-gutters border-cols">
	<%
		List<Product> lst = ProductOperation.getRange(20000,200000);
		i=0;
		for(Product p:lst)
		{
			i++;
	%>
	<li class="col-12 col-md-3">
	<div class="card-body">
	<a href="product-detail.jsp?id=<%=p.getId()%>">
		<p class="word-limit"><%-- <%= p.getBrand()%>&nbsp; --%><%=p.getName() %></p>
		<div style="height:150px;">
			<img class="img-sm" src="<%=p.getImage1() %>" width="100%" height="100%">
		</div>
		<div class="price-wrap">
				<b> <span class="price-new"><%=p.getPrice() %></span> 
				<del class="price-old"></del></b>
		</div>
		</a>
		<br/>
		<div class="price-wrap visitorHide product<%=p.getId() %>">
				<button class="btn btn-primary" style="padding-right:8px;padding-left:8px;">Buy Now</button>
				<button class="btn btn-outline-primary" onclick="addToCart(<%=p.getId() %>,1);"><i class="fa fa-shopping-cart"></i>&nbsp;Add to Cart</button>
		</div>
		<div class="input-group Qtyhide show<%=p.getId() %>">
         	<i onclick="minus('<%=p.getId() %>')" class="fa fa-minus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
            <input type="hidden" class="form-control input-number input<%=p.getId() %>" value="1" style="text-align:center;font-weight:bold;border:none;" disabled />
            <label class="<%=p.getId() %>Label" style="text-align:center; font-weight:bolder;width:50px;">1</label>
                <i onclick="plus('<%=p.getId() %>')" class="fa fa-plus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
       	</div>	
	</div>	

	</li>
	<%
			if(i%4 == 0)
			{
			%>	</ul>
				<ul class="row no-gutters border-cols">
			<%			
			}
			if(i%12 == 0)
			{
				break;
			}
		}
	%></ul>
	</div> <!-- col.// -->
</div> <!-- row.// -->
	
</div> <!-- card.// -->

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION REQUEST ========================= -->
<%-- <section class="section-request bg padding-y-sm">
<div class="container">
<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Request for Quotation</h4>
</header>

<div class="row">
	<div class="col-md-8">
<figure class="card-banner banner-size-lg">
	<figcaption class="overlay left">
		<br>
		<h2 style="max-width: 300px;">Big boundle or collection of featured items</h2>
		<br>
		<a class="btn btn-warning" href="#">Detail info » </a>
	</figcaption>
	<img src="images/banners/banner-request.jpg">
</figure>
	</div> <!-- col // -->
	<div class="col-md-4">

<div class="card card-body">
	<h5 class="title py-4">One Request, Multiple Quotes.</h5>
	<form>
		<div class="form-group">
			<input class="form-control" name="" type="text">
		</div>
		<div class="form-group">
			<div class="input-group">
				<input class="form-control" name="" type="text">
				<span class="input-group-btn" style="border:0; width: 0;"></span>
				<select class="form-control">
					<option>Pieces</option>
					<option>Litres</option>
					<option>Tons</option>
					<option>Gramms</option>
				</select>
			</div>
		</div>
		<div class="form-group text-muted">
			<p>Select template type:</p>
			<label class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" value="option1">
			  <span class="form-check-label">Request price</span>
			</label>
			<label class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" value="option2">
			  <span class="form-check-label">Request a sample</span>
			</label>
		</div>
		<div class="form-group">
			<button class="btn btn-warning">Request for quote</button>
		</div>
	</form>
</div>

	</div> <!-- col // -->
</div><!-- row // -->

</div><!-- container // -->
</section>
<!-- ========================= SECTION REQUEST .END// ========================= -->

<!-- ========================= SECTION ITEMS ========================= -->
<section class="section-request bg padding-y-sm">
<div class="container">
<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Recommended items</h4>
</header>

<div class="row-sm">
<%
	List<Product> lsp = ProductOperation.getRange(50000,150000);
	for(Product p:lsp)
	{
%>

<div class="col-md-3">
	<figure class="card card-product">
		<div class="img-wrap"> <img src="<%= p.getImage1()%>"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><a href="#"><%=p.getBrand() %>&nbsp;<%=p.getName() %></a></h6>
			
			<div class="price-wrap">
				<span class="price-new"><%=p.getB2bPrice() %></span>
				<del class="price-old"><%=p.getPrice() %></del>
			</div> <!-- price-wrap.// -->
			<br/>
			<div class="price-wrap">
				<button class="btn btn-primary" style="width:100px;padding-right:8px;padding-left:8px;">Buy Now</button>
				<button class="btn btn-primary" style="margin-left:18%;padding-right:8px;padding-left:8px;"><i class="fa fa-plus-circle"></i>&nbsp;Add to Cart</button>
			</div>
			
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<%
	}
%>
</div> <!-- row.// -->


</div><!-- container // -->
</section>
<!-- ========================= SECTION ITEMS .END// ========================= -->

<!-- ========================= SECTION LINKS ========================= -->
<section class="section-links bg padding-y-sm">
<div class="container">
<div class="row">
	<div class="col-sm-6">
<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Suppliers by Region</h4>
</header>

<ul class="list-icon row">
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-usa.png"><span>United States</span></a></li>
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-in.png"><span>India</span></a></li>
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-tr.png"><span>Turkey</span></a></li>
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-kr.png"><span>Korea</span></a></li>
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-tr.png"><span>Turkey</span></a></li>
	<li class="col-md-4"><a href="#"><img src="images/icons/flag-kr.png"><span>Korea</span></a></li>
</ul>
	</div> <!-- col // -->

	<div class="col-sm-6">
<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Trade services</h4>
</header>
<ul class="list-icon row">
	<li class="col-md-4"><a href="#"><i class="icon fa fa-comment"></i><span>Trade Assistance</span></a></li>
	<li class="col-md-4"><a href="#"><i class="icon  fa fa-suitcase"></i><span>Business Identity</span></a></li>
	<li class="col-md-4"><a href="#"><i class="icon fa fa-globe"></i><span>Worldwide delivery</span></a></li>
	<li class="col-md-4"><a href="#"><i class="icon fa fa-phone-square"></i><span>Customer support</span></a></li>
	<li class="col-md-4"><a href="#"><i class="icon fa fa-globe"></i><span>Worldwide delivery</span></a></li>
	<li class="col-md-4"><a href="#"><i class="icon fa fa-phone-square"></i><span>Customer support</span></a></li>
</ul>
	</div> <!-- col // -->
</div><!-- row // -->

<figure class="mt-3 banner p-3 bg-secondary">
	<div class="text-lg text-center white">Another banner can be here</div>
</figure>

</div><!-- container // -->
</section>
<!-- ========================= SECTION LINKS END.// ========================= -->

<!-- ========================= SECTION SUBSCRIBE ========================= -->
<section class="section-subscribe bg-secondary padding-y-lg">
<div class="container">

<p class="pb-2 text-center white">Delivering the latest product trends and industry news straight to your inbox</p>

<div class="row justify-content-md-center">
	<div class="col-lg-4 col-sm-6">
<form class="row-sm form-noborder">
		<div class="col-8">
		<input class="form-control" placeholder="Your Email" type="email">
		</div> <!-- col.// -->
		<div class="col-4">
		<button type="submit" class="btn btn-block btn-warning"> <i class="fa fa-envelope"></i> Subscribe </button>
		</div> <!-- col.// -->
</form>
<small class="form-text text-white-50">We’ll never share your email address with a third-party. </small>
	</div> <!-- col-md-6.// -->
</div>
	

</div> <!-- container // -->
</section>
 --%><!-- ========================= SECTION SUBSCRIBE END.//========================= -->

<!-- ========================= FOOTER ========================= -->
 <%@include file="userFooter.jsp" %> 
<!-- ========================= FOOTER END // ========================= -->
<script>

//jquery end
function deleteFromCart(i)
{
	$.ajax({	
		type: 'POST',
        url:"../DeleteCartServlet",
        data:{id:i},
		success: function()
		{
			location.reload();
		},
		error:function()
		{
			
		}
	});
	
}

function addToCart(i,qty)
{
	$.ajax({	
		type: 'POST',
        url:"../AddToCartServlet",
        data:{id:i,quantity:qty},
		success: function(result)
		{
			$('.product'+i).hide();
			$('.show'+i).show();
		},
		error:function()
		{
			
		}
	});	
}

function updateCart(i,qty)
{
	$.ajax({	
		type: 'POST',
        url:"../UpdateCartServlet",
        data:{id:i,quantity:qty},
		success: function(result)
		{
			$('.product'+i).hide();
			$('.show'+i).show();
		},
		error:function()
		{
			
		}
	});
}

function plus(id)
{
	var qty = document.getElementsByClassName('input'+id)[0].value;
	qty++;
	document.getElementsByClassName('input'+id)[0].value = qty;
	$('.'+id+"Label").text(qty);
	updateCart(id,qty);
	
}
function minus(id)
{
	var qty = document.getElementsByClassName('input'+id)[0].value;
	if(qty>0){
		qty--;
		document.getElementsByClassName('input'+id)[0].value = qty;
		$('.'+id+"Label").text(qty);
	}
	if(qty==0)
	{
		deleteFromCart(id);
	}
	else
	{
		updateCart(id,qty);
	}
}

function swap(id)
{
	$("#main-img").attr("src",id);
	$("#main-img-div").attr("href",id);
	
}

</script>

</body>
</html>