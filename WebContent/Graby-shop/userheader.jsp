<header class="section-header">
<style>

li a:hover:not(.active) {
  background-color: #ddd;
}
</style>

<section class="header-main shadow-sm">
	<div class="container">
<div class="row-sm align-items-center">
	<a href="index.jsp"><div class="col-lg-4-24 col-sm-3">
		<img class="logo" src="userBootstrap/images/logo_ori.png" alt="Zenith Sales" width="186px" height="90px">
    </div></a>
	<div class="col-lg-9-24 col-sm-8">
			<form action="../SearchServlet" class="py-1">
				<div class="input-group w-100">
					
				    <input type="text" name="search" class="form-control" style="width:100px !important;" placeholder="Search">
				    <div class="input-group-append">
				      <button class="btn btn-primary" type="submit">
				        <i class="fa fa-search" style="color:blue;"></i> Search 
				      </button>
				    </div>
			    </div>
			</form> <!-- search-wrap .end// -->
	</div> <!-- col.// -->
	<div class="col-lg-9-24 col-sm-12" style="padding:0px;">
		<div class="widgets-wrap float-right row no-gutters py-1">
			<div class="col-auto">
			<div class="widget-header dropdown">
				<a href="signup.jsp">
					<div class="icontext">
						<div class="icon-wrap"><i class="icon-sm fa fa-user" style="color:blue;"></i></div>
						
						
						<div class="text-wrap text-dark">
						<%  
							if((String)session.getAttribute("uname") == null)
							{
						%>	Sign in <br>
						<%}
							else
							{
						%>
							<a href="../UserLogoutServlet">Log out</a> <br>
						
						<%} %>
							 
						</div>
					</div>
				</a>
				<!-- <div class="dropdown-menu">
					<form class="px-4 py-3" action="">
						<div class="form-group">
						  <label>Email address</label>
						  <input type="email" class="form-control" placeholder="email@example.com">
						</div>
						<div class="form-group">
						  <label>Password</label>
						  <input type="password" class="form-control" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-primary">Sign in</button>
						</form>
						<hr class="dropdown-divider">
						<a class="dropdown-item" href="registration.jsp">Have account? Sign up</a>
						<a class="dropdown-item" href="#">Forgot password?</a>
				</div>  dropdown-menu .// -->
			</div>  <!-- widget-header .// -->
			</div> <!-- col.// -->
			<div class="col-auto">
				<%  
							if((String)session.getAttribute("uname") == null)
							{
						%>
			
				<a href="registerfinal.jsp" class="widget-header">
					<div class="icontext">
						<div class="icon-wrap"><i class="icon-sm fa fa-user" style="color:blue;"></i></div>
						<div class="text-wrap text-dark">
							Register 
						</div>
					</div>
				</a>
				<%} %>
			</div> <!-- col.// -->
			<!-- col.// -->
			
			<%  
							if((String)session.getAttribute("uname")!= null)
							{
						%>
			<div class="col-auto" style="position:relative;top:9px;">
				<a href="Chat.jsp" class="widget-header">
					<div class="icontext">
						<div class="icon-wrap"><i class='fas fa-comments' style='font-size:24px;color:blue'></i></div>
							
						<div class="text-wrap text-dark">
							<!-- <span class="small round badge badge-secondary">0</span> -->
							<div>Chat</div>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-auto">
				<a href="cart.jsp" class="widget-header">
					<div class="icontext">
						<div class="icon-wrap"><i class="icon-sm fa fa-shopping-cart" style="color:blue;"></i></div>
						
						
						<div class="text-wrap text-dark">
							<!-- <span class="small round badge badge-secondary">0</span> -->
							<div>Cart</div>
						</div>
					</div>
				</a>
			</div> 
			
			
			
			
			
			<div class="col-auto" style="position:relative;top:9px;">
				<a href="yourOrders.jsp" class="widget-header">
					<div class="icontext">
						<div class="icon-wrap"><i class='fas fa-cart-arrow-down' style='font-size:24px;color:blue'></i></div>
						
						
						<div class="text-wrap text-dark">
							<!-- <span class="small round badge badge-secondary">0</span> -->
							<div>Your Products</div>
						</div>
					</div>
				</a>
			</div>
			
			
			
			<div class="col-auto"  style="position:absolute; left:472px;">
				<a href="userProfile.jsp" class="widget-header">
					<div class="icontext">
						<div class="icon-wrap"><i class="icon-sm fa fa-user" style="color:blue;"></i></div>
						
						
						<div class="text-wrap text-dark">
							<!-- <span class="small round badge badge-secondary">0</span> -->
							<div>Profile</div>
						</div>
					</div>
				</a>
			</div>
			<%} %>
		</div> <!-- widgets-wrap.// row.// -->
	</div> <!-- col.// -->
</div> <!-- row.// -->



	</div> <!-- container.// -->
	
</section> <!-- header-main .// -->

<ul style=" list-style-type: none;
  margin: 0;
  padding: 0;
  padding-left:510px;
  overflow: hidden;
  border: 1px solid #e7e7e7;
  background-color: transparent">
  <li style="float: left;"><a style="display: block; color: #666; text-align: center;padding: 14px 16px; text-decoration: none;" href="index.jsp">Home</a></li>
  <li style="float: left;"><a style="display: block; color: #666; text-align: center;padding: 14px 16px; text-decoration: none;" href="product-list.jsp">Buy</a></li>
  <li style="float: left;"><a style="display: block; color: #666; text-align: center;padding: 14px 16px; text-decoration: none;"  href="sell.jsp">Sell</a></li>
  <li style="float: left;"><a style="display: block; color: #666; text-align: center;padding: 14px 16px; text-decoration: none;"  href="rental.jsp">Rent</a></li>
  <li style="float: left;"><a style="display: block; color: #666; text-align: center;padding: 14px 16px; text-decoration: none;"  href="exchage.jsp">Exchange</a></li>
</ul>
</header> <!-- section-header.// -->

<!-- ========================= SECTION MAIN ========================= -->
