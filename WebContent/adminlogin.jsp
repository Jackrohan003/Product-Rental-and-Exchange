<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:35 GMT -->
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Panel</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body style="background-color: #E2E2E2;">
    <div class="container">
        <div class="row text-center " style="padding-top:100px;">
            <div class="col-md-12">
                <!--<img src="assets/img/logo-invoice.png" />--><h2><b>PRODUCT RENTAL AND EXCHANGE</b></h2>
                <% if(request.getParameter("msg") !=null){ %>
<p style="color:red">
<%= request.getParameter("msg") %>
</p>
<%} %>


<% String u=   (String)session.getAttribute("unameAdmin");
if(u != null){
	response.sendRedirect("ViewUser.jsp");
}

%>
            </div>
        </div>

       <div class="row ">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                           
                            <div class="panel-body">
                            
                                <form role="form" action="LoginAdmin" method="post">
                                    <hr />
                                    <h5><strong>ENTER YOUR DETAILS</strong></b></h5>
                                       <br />
                                       
                                     	<div class="form-group input-group">

                                                                                 
                                            <span class="input-group-addon"><i class="fa fa-user"  ></i></span>
                                            <input type="text" class="form-control" placeholder="Your Email " name="email"/>
                                        </div>
										<div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input type="password" class="form-control"  placeholder="Your Password" name="pass" />
                                        </div>
                                    	<div class="form-group">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" /><strong>REMEMBER ME</strong>
                                            </label>
                                            <span class="pull-right">
                                                   <a href="index.jsp" ><strong>FORGOT PASSWORD ?</strong> </a> 
                                            </span>
                                        </div>
                                      	<input type="submit" class="btn btn-primary" value="LOGIN NOW">
                                     <!-- <center><a href="#"class="btn btn-primary"><strong>LOGIN NOW</strong></a></center> -->
                                   <!--<hr />
                                    Not register ? <a href="index.jsp" >click here </a> or go to <a href="index.jsp">Home</a> -->
                                    </form>
                            </div>
                           
                        </div>
        </div>
    </div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','../../../../../../www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-58127580-1', 'auto');
  ga('send', 'pageview');
/
</script>
</body>

<!-- Mirrored from binarytheme.com/BTlivedemos/2014/09/16/advance-admin/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 22 Aug 2018 10:46:37 GMT -->
</html>
