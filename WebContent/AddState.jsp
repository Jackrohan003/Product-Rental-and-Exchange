<!DOCTYPE html>
<%@page import="com.jdbc.CountryOperation"%>
<%@page import="com.user.Country"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:44 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add State</title>

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
        	<%@ include file = "nav-top.jsp"%>
        <!-- /. NAV TOP  -->
        <!-- NAV SIDE  -->
        	<%@ include file = "nav-side.jsp"%>
		<!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">ADD STATE</h1>
                        <!--<h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1>-->

                    </div>
                </div>
                
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-9 col-sm-9 col-xs-9">
                       <div class="panel panel-info">
                            <div class="panel-heading">STATE</div>
                                <div class="panel-body">
                                    <form action="StateAddServlet" method="post" role="form">
                                        <div class="form-group">
                                            <label>Select Country</label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        <div class="custom-select" style="width:200px; display: inline;">


<% List<Country> list = CountryOperation.getAll(); %>


  <select name="country">
		<%for(Country c : list){ %>
    <option value=<%out.println(c.getCid());%>><%out.println(c.getCountryname());%></option>
    <%} %>
  </select>
	</div>
                                    <br>
                                          <br>
                                
                                            <label>STATE NAME</label>
                                            <input class="form-control" type="text" name="state" required>
                                        </div> 
                                        <input type="submit" > 
                                        <button type="submit" class="btn btn-info"><strong>SUBMIT</strong></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- /. FOOTER  -->
    	<%@ include file="footer.jsp" %>
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

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/form.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:44 GMT -->
</html>
