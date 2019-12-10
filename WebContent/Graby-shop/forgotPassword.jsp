<!DOCTYPE HTML>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Forgot Password</title>

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

<!-- custom style -->
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
<style>
	
	.img-sm 
	{
  		width:auto;
  		height:100%; 
  	}
</style>
<style type="text/css">
.ic{
	position:relative;
	top:-26px;
	right:-95%;
	color:green;
}
.iw{
	position:relative;
	top:-28px;
	right:-95%;
	color:red;
}
</style>

<!-- custom javascript -->
<script src="userBootstrap/js/script.js" type="text/javascript"></script>




</head>
<body>

<%@include file="userheader.jsp" %>

<div class="container">
	<div class="row">
		<div class="col-md-3">
		</div>
        <div class="col-md-6">
        	
            	<form action="../UserSendEmailServlet" method="post" id="fileForm" role="form" onsubmit="return check1();" onchange="return check1();">
            		<fieldset><legend class="text-center" style="color:red;"><h1><center>Forgot Password</center></h1></legend>
					 	<div class="form-group">
                			<label for="email"><span class="req" style="color:red">* </span> Email Address: </label> 
                    		<input class="form-control" type="text" name="email" id = "email"  placeholder="Enter Email Address" autocomplete="off"/>   
                    		<div class="status" id="status"></div>
                          	<i class="icon fa fa-check ic" id="remail"></i>
                          	<i class="icon fa fa-times iw" id="wemail"></i>
                          <span id="spanemail" style="color:red;"></span>
            			</div>
      
            		<div class="form-group">
                		<input class="btn btn-success" type="submit" name="Send_OTP" value="Send OTP" id="submit" style="background-color:blue;">
            		</div>
            </form>
       	
            </fieldset>
            </form><!-- ends register form -->
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	hideAll();
});
function hideAll()
{
	$('.icon').hide();
}
function check1(){
	hideAll();
	var email1=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	var email=document.getElementById("email").value;
	if(email==""){
		document.getElementById("email").style.border="2px solid red";
		$('#wemail').show();
		return false;
	}
	else if(!email.match(email1))
	{
		document.getElementById("email").style.border="2px solid red";
		$('#wemail').show();
		$('#spanemail').html('Please enter correct Email');
		return false;
	}
	else
	{
		document.getElementById("email").style.border="2px solid green";
		$('#spanemail').html('');
		$('#remail').show();
	}
	return true;
}

</script>

<!-- ========================= FOOTER ========================= -->
<%@include file="userFooter.jsp" %>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>