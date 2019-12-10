<!DOCTYPE HTML>

<%@page import="com.product.operation.CartOperation"%>
<%@page import="com.model.product.Cart"%>
<%@page import="com.user.User"%>
<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.jdbc.UserOperation"%>

<%@page import="com.jdbc.model.Product"%>

<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Product Description</title>

<link rel="shortcut icon" type="image/x-icon" href="userBootstrap/images/logo_zenith.png">

<!-- jQuery -->
<script src="userBootstrap/js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Fancy box -->
<script src="userBootstrap/plugins/fancybox/fancybox.min.js" type="text/javascript"></script>
<link href="userBootstrap/plugins/fancybox/fancybox.min.css" type="text/css" rel="stylesheet">


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
		String s = (String)session.getAttribute("uname");
		User u = null;
		if(s!=null)
		{
			u = UserOperation.GetUserByUserEmail(s);
			
			List<Cart> ls1 = CartOperation.getAllById(u.getId());
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
// jquery end
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
			alert("error");
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
			alert("error");
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
			alert("error");
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
	

</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Product p = ProductOperation.getAllByID(id);

%>

<%@include file="userheader.jsp" %>

<section class="section-main bg padding-y-sm">
<div class="container">
		
<div class="card">
	<div class="row no-gutters">
		<aside class="col-sm-5 border-right">
<article class="gallery-wrap"> 
<div class="img-big-wrap">
  <div> <a href="<%= p.getImage1()%>" id="main-img-div"  data-fancybox=""><img id="main-img" src="<%= p.getImage2()%>" style="object-fit: scale-down;"></a></div>
</div> <!-- slider-product.// -->
<div class="img-small-wrap">
  <div class="item-gallery" onclick="swap('<%= p.getImage1()%>');"> <img src="<%= p.getImage1()%>" style="object-fit: scale-down;"></div>
  <div class="item-gallery" onclick="swap('<%= p.getImage2()%>');"> <img src="<%= p.getImage2()%>" style="object-fit: scale-down;"></div>
  <%
  	if(p.getImage3()!=null)
	{
  %>
  <div class="item-gallery" onclick="swap('<%= p.getImage3()%>');"> <img src="<%= p.getImage3()%>"></div>
 <%
	}
  	if(p.getImage4()!=null)
  	{
 %>
  <div class="item-gallery" onclick="swap('<%= p.getImage4()%>');"> <img src="<%= p.getImage4()%>"></div>
 <%
  	}
 %>
</div> <!-- slider-nav.// -->
</article> <!-- gallery-wrap .end// -->
		</aside>
		<aside class="col-sm-7">
<article class="p-5">
	<h3 class="title mb-3"><%=p.getName()%></h3>

<div class="mb-3"> 
	<var class="price h3 text-warning"> 
		<span class="currency">INR </span><span class="num"><%= p.getPrice()%></span>
	</var> 
	<!-- <span>/per piece</span>  -->
</div>
	<h3 class="title mb-3"><%="DURATION"%></h3>
<div class="mb-3"> 
	<var class="price h3 text-warning"> 
		<span class="num"><%= p.getDuration()%></span><span class="currency">(months) </span>
	</var> 
	<!-- <span>/per piece</span>  -->
</div>
 <!-- price-detail-wrap .// -->
<dl>
  <dt>Description</dt>
  <dd><p><%=p.getDescription() %> </p></dd>
</dl>

<dl>
  <dt>Contact Information</dt>
 Email : <dd><p><b><%=p.getEmail() %></b> </p></dd>
 Phone No:<dd><p><b><%=p.getPhone() %></b> </p></dd>
</dl>

<dl class="row">
  <!-- <dt class="col-sm-3">Model#</dt>
  <dd class="col-sm-9">12345611</dd> -->

<%--   <dt class="col-sm-3">Size</dt>
  <dd class="col-sm-9"><%=p.getSize() %></dd>
 --%>
  <!-- <dt class="col-sm-3">Delivery</dt>
  <dd class="col-sm-9">Russia, USA, and Europe </dd> -->
</dl>
<!-- <div class="rating-wrap">

	<ul class="rating-stars">
		<li style="width:80%" class="stars-active"> 
			<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
			<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
			<i class="fa fa-star"></i> 
		</li>
		<li>
			<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
			<i class="fa fa-star"></i> <i class="fa fa-star"></i> 
			<i class="fa fa-star"></i> 
		</li>
	</ul>
	<div class="label-rating">132 reviews</div>
	<div class="label-rating">154 orders </div>
</div> --> <!-- rating-wrap.// -->

	<!-- <div class="row">
		<div class="col-sm-12">
			<dl class="dlist-inline">
			  <dt>Quantity: </dt>
			  <dd> 
			  	<select class="form-control form-control-sm" style="width:70px;">
			  		<option> 1 </option>
			  		<option> 2 </option>
			  		<option> 3 </option>
			  	</select>
			  </dd>
			</dl>  item-property .//
		</div> col.//
	</div> --> <!-- row.// -->

			<%-- <div class="visitorHide product<%=p.getId() %>">
				<button class="btn btn-outline-primary" onclick="addToCart(<%=p.getId() %>,1);" style="padding-right:6px;padding-left:6px;"><i class="fa fa-shopping-cart"></i>&nbsp;Add to Cart</button>
			</div>
			<div class="input-group Qtyhide show<%=p.getId() %>">
         	<i onclick="minus('<%=p.getId() %>')" class="fa fa-minus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
            <input type="hidden" class="form-control input-number input<%=p.getId() %>" value="1" style="text-align:center;font-weight:bold;border:none;" disabled />
            <label class="<%=p.getId() %>Label" style="text-align:center; font-weight:bolder;width:50px;">1</label>
                <i onclick="plus('<%=p.getId() %>')" class="fa fa-plus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
       	</div> --%>
</article> <!-- card-body.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->
		
</div><!-- container // -->
</section>
<section class="section-main bg padding-y-sm">
<div class="container">
		
<div class="card">
	<div class="row no-gutters">
		<aside class="col-sm-12 border">
		<!-- <textarea rows="10" cols=""></textarea> -->
		</aside>
	</div>
</div>
</div>
</section>
<section class="section-request bg padding-y-sm">
<div class="container">
<header class="section-heading heading-line">
	<h4 class="title-section bg text-uppercase">Related items</h4>
</header>

<div class="row-sm">
<%
	List<Product> lsp1 = ProductOperation.getAllByCategory(p.getCid());
	for(Product q:lsp1)
	{
		if(q.getId() != p.getId())
		{
%>

<div class="col-md-3">
	<figure class="card card-product">
		<a href="RentDetails.jsp?id=<%=q.getId()%>" class="item-box">
		<div class="img-wrap"> <img src="<%= q.getImage1()%>"></div>
		<figcaption class="info-wrap">
			<h6 class="title "><%=q.getName() %></h6>
			
			<div class="price-wrap">
				<span class="price-new">
				<%
					if(u != null)
					{
						
							out.print(q.getPrice());
						
					}
					else
					{
						out.print(q.getPrice());
					}
					%>
				</span>
				<%-- <del class="price-old"><%=q.getPrice()%></del> --%>
			</div> <!-- price-wrap.// -->
			<br/>
		</a>
			<%-- <div class="price-wrap visitorHide product<%=q.getId() %>">
				<button class="btn btn-primary" style="padding-right:8px;padding-left:8px;">Buy Now</button>
				<button class="btn btn-outline-primary" onclick="addToCart(<%=q.getId() %>,1);"><i class="fa fa-shopping-cart"></i>&nbsp;Add to Cart</button>
		</div>
		<div class="input-group Qtyhide show<%=q.getId() %>">
         	<i onclick="minus('<%=q.getId() %>')" class="fa fa-minus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
            <input type="hidden" class="form-control input-number input<%=q.getId() %>" value="1" style="text-align:center;font-weight:bold;border:none;" disabled />
            <label class="<%=q.getId() %>Label" style="text-align:center; font-weight:bolder;width:50px;">1</label>
                <i onclick="plus('<%=q.getId() %>')" class="fa fa-plus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
       	</div>	 --%>
		</figcaption>
	</figure> <!-- card // -->
</div> <!-- col // -->
<%
		}
	}
%>

</div> <!-- row.// -->


</div><!-- container // -->
</section>

<!-- ========================= SECTION REQUEST .END// ========================= -->

<!-- ========================= SECTION ITEMS ========================= -->
<!-- ========================= SECTION SUBSCRIBE END.//========================= -->

<!-- ========================= FOOTER ========================= -->
<%@include file="userFooter.jsp" %>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>