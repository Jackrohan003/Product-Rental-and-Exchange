<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.jdbc.model.Product"%>
<%@page import="com.product.operation.CategoryOperation"%>
<%@page import="com.model.product.Category"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:45:12 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>View Product</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <!-- NAV TOP  -->
        	<%@ include file="nav-top.jsp" %>
        <!-- /. NAV TOP  -->
        <!-- NAV SIDE  -->
           <%@include file="nav-side.jsp" %>
        <!-- /. NAV SIDE  -->
        
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">VIEW PRODUCT</h1>
                        <!--<h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1>-->

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                       <!--  <th>#</th> -->
                                        <th>Product NAME</th>
                                        <th>Description</th>
                                        <th>CategoriesId</th>
                                        <!-- <th>PASSWORD</th> -->
                                        <!-- <th>GENDER</th> -->
                                        <th>Price</th>
    <!--                                     <th>ProductImage1</th> -->
                                        <!-- <th>ProductImage2</th> -->
                                       <!--  <th>City</th>
                                        <th>State</th>
                                         <th>SEQURITY QUESTION</th>
                                        <th>SEQURITY ANSWER</th>  -->
                                        <th>ISACTIVE</th>
                                        <!-- <th>DATE OF INSERT</th>
                                        <th>DATE OF UPDATE</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    List<Product>list=ProductOperation.getAllByType(); 
       							%>
    								<% 
									for (Product u: list) {
									%>
                                        <tr>
                                            <%-- <td><% out.println( u.getId());%></td> --%>
                                            <td><% out.println( u.getName());%></td>
                                            <td><% out.println( u.getDescription());%></td>
                                            <td><% out.println( u.getCid());%></td>
                                            <td><% out.println( u.getPrice());%></td>
<%--                                             <td><% out.println( u.getImage1());%></td>
                                  		 	  <td><% out.println( u.getImage2());%></td> --%>
                                        <%--    <td><% out.println( u.getAdd1());%></td>
                                            <td><% out.println( u.getAdd2());%></td>
                                            <td><% out.println( u.getCity());%></td>
                                            <td><% out.println( u.getState());%></td> --%>         
                                              <%-- <td><% out.println( u.getIsactive());%></td>  --%>
                                                 <%
                                        	if(u.getIsactive()==1)
                                        	{
                                        %>
                                        <td><a href="ProductActiveServlet?pid=<%=u.getId()%>"><button type="button" class="btn btn-xs btn-danger">INACTIVE</button></a></td>
                                        <%
                                        	}
                                        	else
                                        	{
                                        %>
                                        <td><a href="ProductActiveServlet?pid=<%=u.getId()%>"><button type="button" class="btn btn-xs btn-success">ACTIVE</button></a></td>
                                        <%
                                        	}
                                        %>                   
                                        </tr>
                                        <% 
		}
		%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--/.Row-->
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->

    <div id="footer-sec">
        &copy; 2019 PRODUCT RENTAL AND EXCHANGE | Design By : <a href="http://www.binarytheme.com/" target="_blank">BinaryTheme.com</a>
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-58127580-1', 'auto');
  ga('send', 'pageview');

</script>

</body>

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:10 GMT -->
</html>
