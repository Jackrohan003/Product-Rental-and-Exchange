<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="ViewUser.jsp">PRODUCT RENTAL AND EXCHANGE</a>
    </div>
    <%
    	String user = (String)session.getAttribute("unameAdmin");
    String resp = "Sesssion Expired!";
    	if(user == null)
    	{
    		response.sendRedirect("adminlogin.jsp?msg="+resp);
    	}
    %>
 
    <div class="header-right">
    	<a href="" class="text-uppercase" style="display: none"><i class="fa fa-user"></i><strong>VIEW PROFILE</strong></a>
    	<a href="" class="text-uppercase" style="display: none"><strong>LOGOUT</strong></a>
    </div>
</nav>