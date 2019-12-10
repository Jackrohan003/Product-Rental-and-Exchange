
<%@page import="com.product.operation.OrderOperation"%>
<%@page import="com.model.product.Order"%>
<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.user.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Details</title>
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
<link href="assets/css/style.css" rel="stylesheet">
<!-- custom style -->
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />


<style type="text/css">
table, th, td 
{
  border: 2px solid black !important;
  border-collapse: collapse;
  text-align: center;
  color:black !important;
}

</style>

</head>
<body>
	<%@include file="userheader.jsp" %>
	
	
<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
	<main class="col-sm-12">
<h3>Order History</h3>
<div class="card">
	
	<table class="table shopping-cart-wrap">
	
		<tr>
			<th>Order No</th>
			<th>Order Date</th>
		<!-- 	<th>Order Status</th> -->
			<th>Total Amount</th>
			<th>Order Details</th>
		</tr>
		
		<%
			String s = (String)session.getAttribute("uname");
			if(s!=null)
			{
				User u = UserOperation.GetUserByUserEmail(s);
				
				List<Order> ls = OrderOperation.getAllById(u.getId());
				for(Order or : ls)
				{
		%>
		<tr>
			<td><%= or.getOrderNo()%></td>
			<td><%= or.getDoi()%></td>
			<%-- <%
			if(or.getStatus() == 1)
			{
				out.println("<td class='alert-warning'>Pending</td>");
			}
			else if(or.getStatus() == 2)
			{
				out.println("<td class='alert-success'>Approved</td>");
			}
			else if(or.getStatus()==3)
			{
				out.println("<td class='alert-danger'>Canceled</td>");
			}
			%> --%>
			<td><%=or.getTotalAmount() %></td>
			<td><a href="viewDetails.jsp?id=<%=or.getOrderNo() %>">View Details</a></td>
		</tr>
		<%
		
				}
			}
			else
			{
				response.sendRedirect("userLogIn.jsp");
			}
		%>
	</table>
</div>
<div class="clearfix"></div>
	       </div> <!-- card.// -->

	</main> <!-- col.// -->
	
</div> <!-- container .//  -->
</section>
	
	
	
	
	<%@include file="userFooter.jsp" %>
</body>

<script type="text/javascript">
	
	var no=parseInt(document.getElementById("amount").innerHTML);
	intToLetter(no);

	function intToLetter(num)
  	{
 	 	var words = toWords(num);
  		document.getElementById('inwords').innerHTML = words.toUpperCase()+' RUPEES';
  	}
	
	
	
</script>

</html>