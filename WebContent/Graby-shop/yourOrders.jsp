<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.product.operation.CartOperation"%>
<%@page import="com.model.product.Cart"%>
<%@page import="com.user.User"%>
<%@page import="com.jdbc.model.Product"%>
<%@page import="java.util.List"%>

<%@page import="com.jdbc.UserOperation"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<!-- <link href="assets/css/style.css" rel="stylesheet">
 -->
<!-- custom style -->
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

<title>Your Products</title>

<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
	// jQuery code
}); 
// jquery end
</script>

<script>



function deleteProduct(i)
{
	$.ajax({	
		type: 'POST',
        url:"../DeleteProductServlet",
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


	function checkfun()
	{
		var checkBox = document.getElementById("check1");
		if(checkBox.checked == true){
			$("input[name=check2]").prop("checked",true);
		}
		else{
			$("input[name=check2]").prop("checked",false);
		}
	}

</script>


</head>
<body>
<%@include file="userheader.jsp" %>

<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
	<main class="col-sm-9">

<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">
<tr>
  <th scope="col">Product</th>
  <th scope="col" width="120">Uploaded For</th>
  <th scope="col" width="120">Price</th>
  <th scope="col" class="text-right" width="200">Action</th>
</tr>
</thead>
<tbody>

<%
	String s = (String)session.getAttribute("uname");
	System.out.println("email " + s);
	User u=null;
	if(s != null)
	{
	u = UserOperation.GetUserByUserEmail(s);
	
	List<Product> list = ProductOperation.getAllByEmail(s);
	System.out.println("list size " + list.size());
	if(list.size()<1)
	{
		%>
		<tr>
			<td colspan="4" class="text-center">Haven't put any products</td>
		</tr>
		<%
	}
	for(Product c : list)
	{
		/* Product p = ProductOperation.getAllByID(c.getProductId()); */
		if(u != null)
		{
			
			/* 	total+=(p.getPrice()*c.getQuantity()); */
			
		
		
%>



<tr>
<%if(c.getPtype()==2)
	{%>
	<a href="SellDetails.jsp?id=<%=c.getId()%>">
	<% 
	}
	else if(c.getPtype()==3)
	{%>
	<a href="RentDetails.jsp?id=<%=c.getId()%>">
	<%
	}
	else if(c.getPtype()==4)
	{
		 %>
	<a href="ExchangeDetails.jsp?id=<%=c.getId()%>">
	<%
	}
	%>






 
	<td>
<figure class="media">
	<div class="img-wrap">
		<img src="<%=c.getImage1() %>" class="img-thumbnail img-sm" style="object-fit: scale-down;"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate"><%=c.getName() %></h6>
		<%-- <dl class="dlist-inline small">
		  <dt>Size: </dt>
		  <dd><%= p.getSize()%></dd>
		</dl> --%>
		<%-- <dl class="dlist-inline small">
		  <dt>Brand: </dt>
		  <dd><%= p.getBrand()%></dd>
		</dl> --%>
	</figcaption>
</figure> 
	</td>
	
	
	
	
	
	 <td width=20%> 
		<div><%
		String typeis="Undefined";
		int i=c.getPtype();
		if(i==2)
		{
			typeis="Sell";
		}
		else if(i==3)
		{
			typeis="Rent";
		}
		else if(i==4)
		{
			typeis="Exchange";
		}
		
		out.print(typeis); %></div>
            
	</td>
	
	
	 <td> 
		<div class="price-wrap"> 
			<var class="price"><%
					
							
								out.print(c.getPrice());
							
						 %></var> 
			<!-- <small class="text-muted">(USD10 each)</small> --> 
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
	<a class="btn btn-outline-danger btn-round"  href="" onclick="deleteProduct('<%=c.getId() %>');"> × Remove Product</a>
	</td> 
	</a>
</tr>
<%
	
	}
	else
	{
		response.sendRedirect("userLogIn.jsp");
	}
	}
	}
%>
</tbody>
</table>
</div>
<div class="clearfix"></div>
	<br>
    <!-- card.// -->

	</main> <!-- col.// -->
	<%-- <aside class="col-sm-3">
	<div  style="position:sticky;top:10px;">
<p class="alert alert-success">Calculate Additional Delivery Charges of INR 50 and 18% GST on Total Price excluding delivery and packing charges </p>
<dl class="dlist-align">
  <dt>Total price: </dt>
  <dd class="text-right">INR <span  id='total'><%=total %></span></dd>
</dl>
<dl class="dlist-align">
  <dt>Packing Exp: </dt>
  <dd class="text-right">INR 200.0</dd>
</dl>
<dl class="dlist-align h4">
  <dt>Total:</dt>
  <dd class="text-right"><strong>INR <span id='netTotal'><%=total+200 %></span></strong></dd>
</dl>
<hr>
</div>
	</aside> --%>
	</div>

</div> <!-- container .//  -->
</section>

<%@include file="userFooter.jsp" %>
<script type="text/javascript">
	$("input[name='demo1']").TouchSpin({
		min:0,
		max=50,
		step:1,
		boostat:5,
		maxboostedstep:10,
	});
</script>
</body>
</html>