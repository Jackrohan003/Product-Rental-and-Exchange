<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:45:12 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>View Profile</title>

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
                        <h1 class="page-head-line">VIEW PROFILE</h1>
                        <!-- <h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1> -->
                    </div>
                </div>
                <!-- /. ROW  -->                
                <div class="row">
                    <div class="col-md-8">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                        		<tbody>
                        		<%                        	
                        		%>
                        			<tr>
                        				<td>FIRSTNAME</td>
                        				<td><%-- <%=u.getFname() %> --%></td>
                        			</tr>
                        			<tr>
                        				<td>LASTNAME</td>
                        				<td><%-- <%= u.getLname()%> --%></td>
                        			</tr>
                        			<tr>
                        				<td>EMAIL</td>
                        				<td><%-- <%=u.getEmail() %> --%></td>
                        			</tr>
                        			<tr>
                        				<td>GENDER</td>
                        				<td><%-- <%= u.getGender()%> --%></td>
                        			</tr>
                        			<tr>
                        				<td>PROFILE</td>
                        				<td><%-- <%= u.getImage()%> --%></td>
                        			</tr>
                        			<tr>
                        				<td colspan="2"><a href="EditProfile.jsp"><input type="submit" class="form-control" value="EDIT PROFILE"></a></td>
                        			</tr>
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

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:10 GMT -->
</html>
