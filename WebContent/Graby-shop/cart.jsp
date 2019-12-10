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

<title>Cart</title>

<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
	// jQuery code
}); 
// jquery end
</script>

<script>

function updateCart(i,qty)
{
	$.ajax({	
		type: 'POST',
        url:"../UpdateCartServlet",
        data:{id:i,quantity:qty},
		success: function(result)
		{
			$('#product'+i).hide();
			$('#show'+i).show();

		},
		error:function()
		{
			
		}
	});
}

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

	function plus(id,lid,price)
	{
		var qty = $('#'+id).val();
		var total = parseFloat(document.getElementById('total').innerHTML);
		var netTotal = parseFloat(document.getElementById('netTotal').innerHTML);
		qty++;
		document.getElementById(id).value = qty;
		document.getElementById(lid).innerHTML = qty;
		updateCart(id,qty);
		document.getElementById('price'+id).innerHTML = Number.parseFloat(price*qty).toFixed(1);
		document.getElementById('total').innerHTML = Number.parseFloat(total+price).toFixed(1);
		document.getElementById('netTotal').innerHTML = Number.parseFloat(netTotal+price).toFixed(1);
	}
	function minus(id,lid,price)
	{
		var qty = $('#'+id).val();
		var total = parseFloat(document.getElementById('total').innerHTML);
		var netTotal = parseFloat(document.getElementById('netTotal').innerHTML);
		if(qty>0){
			qty--;
			document.getElementById(id).value = qty;
			document.getElementById(lid).innerHTML = qty;
		}
		if(qty==0)
		{
			deleteFromCart(id);
		}
		else
		{
			updateCart(id,qty);
			document.getElementById('price'+id).innerHTML = Number.parseFloat(price*qty).toFixed(1);
		}
		document.getElementById('total').innerHTML = Number.parseFloat(total-price).toFixed(1);
		document.getElementById('netTotal').innerHTML = Number.parseFloat(netTotal-price).toFixed(1);
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
  <th scope="col" width="120">Quantity</th>
  <th scope="col" width="120">Price</th>
  <th scope="col" class="text-right" width="200">Action</th>
</tr>
</thead>
<tbody>

<%
	String s = (String)session.getAttribute("uname");
	float total = 0.0f;
	User u=null;
	if(s != null)
	{
	u = UserOperation.GetUserByUserEmail(s);
	
	List<Cart> list = CartOperation.getAllById(u.getId());
	if(list.size()<1)
	{
		%>
		<tr>
			<td colspan="4" class="text-center">Cart is Empty</td>
		</tr>
		<%
	}
	for(Cart c : list)
	{
		Product p = ProductOperation.getAllByID(c.getProductId());
		if(u != null)
		{
			
				total+=(p.getPrice()*c.getQuantity());
			
		
		
%>
<tr>
	<td>
<figure class="media">
	<div class="img-wrap">
		<img src="<%=p.getImage1() %>" class="img-thumbnail img-sm" style="object-fit: scale-down;"></div>
	<figcaption class="media-body">
		<h6 class="title text-truncate"><%=p.getName() %></h6>
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
		<div class="form-group">
        <div class="input-group">
         	<i onclick="minus('<%=c.getProductId() %>','Label<%=c.getProductId() %>',<%if(u != null)
					{
						
							out.print(p.getPrice());
						
					}
					%>)" class="fa fa-minus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
            <input type="hidden" id="<%=c.getProductId() %>" class="form-control input-number" value="<%=c.getQuantity() %>" style="text-align:center;font-weight:bold;border:none;" disabled />
            <label style="text-align:center; font-weight:bolder;width:50px;" id="Label<%=c.getProductId() %>"><%=c.getQuantity() %></label>
                <i onclick="plus('<%=c.getProductId() %>','Label<%=c.getProductId() %>',<%
                if(u != null)
					{
							
								out.print(p.getPrice());
							
						}
						 %>)" class="fa fa-plus-circle" aria-hidden="true" style="zoom:2;color:blue;cursor:pointer;"></i>
       	</div>
    </div>
            
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price" id="price<%=c.getProductId() %>"><%if(u != null)
					{
							
								out.print(p.getPrice()*c.getQuantity());
							
						} %></var> 
			<small class="text-muted">(USD10 each)</small> 
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
	<a class="btn btn-outline-danger btn-round"  href="" onclick="deleteFromCart('<%=c.getProductId() %>');"> × Remove From Cart</a>
	</td>
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
    <div class="shp-cart-btn">
    <!-- 	<a href="ClearCartServlet"><button onclick="" class="button btn-primary">Clear shopping cart</button></a> -->
       <a href="CheckOut.jsp" ><button onclick="" class="button btn-primary" >Check Out</button></a>
    	<a href="index.jsp"><button onclick="" class="button btn-primary" style="float:right;">Continue shopping</button></a>
        </div> <!-- card.// -->

	</main> <!-- col.// -->
	<aside class="col-sm-3">
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
	</aside>
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