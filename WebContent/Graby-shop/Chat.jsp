<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.user.User"%>
<%@page import="com.chat.operation.ChatOperation"%>
<%@page import="com.chat.model.Chat"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Chat </title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style-4.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  
  
 <!--  			FROM GRABYSHOP -->
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
<title>Sell </title>
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


 
  
  
  
  
  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">

    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
  
  <%@include file="userheader.jsp" %>
  
  
  
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <!-- page start-->
        <div class="chat-room mt">
          <aside class="mid-side">
            <div class="chat-room-head">
              <h3>Chat Room: Support</h3>
              
              
                <!-- <input type="text" placeholder="Search" class="form-control search-btn "> -->
              </form>
            </div>
  <div style="height:800px; width:500px;">          
             <%
    	String user = (String)session.getAttribute("uname");
    String resp = "You must be Logged In to add Product!";
    	if(user == null)
    	{
    		response.sendRedirect("exchage.jsp?msg="+resp);
    	}
    %>
            
            
            
            <%
            String fromEmail;
            String toEmail;
           /*  int  from;
            int  to;
            User u;
            User u1; */
            
            if(request.getParameter("fromEmail")!=null)
            {
            	fromEmail = request.getParameter("fromEmail");     
            }
            else
            {
            	fromEmail = user;	
            }
            
            
            
            
            toEmail = request.getParameter("toEmail");
           
    		System.out.println("FROM EMAIL :"+fromEmail);
    		System.out.println("TO EMAIL :"+toEmail);
            
	List<Chat> cp1 = ChatOperation.getChatbyTOAndFrom(fromEmail,toEmail);
	for(Chat c:cp1)
	{
		
%>
          
            <div class="group-rom">
              <div class="first-part odd"><%=c.getFromname()%></div>
              <div class="second-part"><%=c.getMsg() %></div>
  <%--              <div class="third-part"><%=c.getToname() %></div>  --%>
            </div>
         
         <%
		}
%>
        
  </div>
            <footer>
            <form action="../ChatServlet" class="pull-right position" method="post" >
              <div class="chat-txt">
                <input type="text" name="chatmsg" class="form-control" style="left:-300px; position:relative; width:350px;">
              </div>
              <div class="btn-group hidden-sm hidden-xs">
                <button type="button" class="btn btn-white"><i class="fa fa-meh-o"></i></button>
                <button type="button" class="btn btn-white"><i class=" fa fa-paperclip"></i></button>
              </div>
  <%--             <input type="hidden" class="form-control" name="from" value="<%=from %>">
			<input type="hidden" class="form-control" name="to" value="<%=to %>"> --%>
           
           <input type="hidden" class="form-control" name="fromEmail" value="<%=fromEmail %>">
			<input type="hidden" class="form-control" name="toEmail" value="<%=toEmail %>">
			  
			<% 
			
				if(toEmail!=null)
				{
			  %>
              <button class="btn btn-theme" type="submit" style="left:100px;top:-35px; position:relative;">Send</button>
          <%
				}
          %>
          
           </form>
            </footer>
          </aside>
          <aside class="right-side">
            <div class="user-head">
             <center><div style="font-size:50 ;">Chatted With</div></center>
            </div>
           
            <ul class="chat-available-user">
             
  <%            
             	ArrayList<String> cp2 = ChatOperation.getChatbyFromEmailToEmail(fromEmail);
	for(String ch:cp2)
	{
		
%>
              <li>
                <a href='Chat.jsp?fromEmail=<%=fromEmail %>&toEmail=<%=ch %>'>
                <%
            /*     		System.out.println(fromEmail); */
                %>
                <!--   <img class="img-circle" src="img/friends/fr-02.jpg" width="32"> -->
                  		<%=UserOperation.GetUserNameUserEmail(ch) %>
                  <!-- <span class="text-muted">1h:02m</span> -->
                  </a>
              </li>

         <%
		}
%>
  

            </ul>
          </aside>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
    
    
    
     <%@include file="userFooter.jsp" %> 
    
    
    
    
    <!--footer start-->
  <!--   <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
         
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="chat_room.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
     --><!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>
