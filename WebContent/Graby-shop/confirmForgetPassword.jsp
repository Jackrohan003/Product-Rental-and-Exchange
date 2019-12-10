<!DOCTYPE HTML>
<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.jdbc.model.Product"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>Confirm Forgot Password</title>

<link rel="shortcut icon" type="image/x-icon" href="userBootstrap/images/logo_zenith.png">

<!-- jQuery -->
<script src="userBootstrap/js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="userBootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="userBootstrap/js/md5.js" type="text/javascript"></script>
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
 			<form action="../ForgotPasswordServlet" method="post" id="fileForm" role="form" onsubmit="return check(0);" onchange="return check(1);">
            		<fieldset><legend class="text-center" style="color:red;"><h1><center>Confirm Password</center></h1></legend>
            
			 <div class="form-group">
             <label for="password"><span class="req" style="color:red">* </span>New Password: </label>
                    <input name="newpassword" type="password" class="form-control inputpass" minlength="4" maxlength="24"  id="pass1" placeholder="Enter new Password" /> 
					  <i class="icon fa fa-check ic" id="rpass1"></i>
					  <i class="icon fa fa-times iw" id="wpass1"></i>
			</div>
			<div class="form-group">
                <label for="password"><span class="req" style="color:red">*</span> New Confirm Password: </label>
                    <input name="confirmpassword" type="password" class="form-control inputpass" minlength="4" maxlength="24" placeholder="Enter again to validate new Password"  id="pass2" />
                        <span id="confirmMessage" class="confirmMessage"></span>
            		  <i class="icon fa fa-check ic" id="rpass2"></i>
            		  <i class="icon fa fa-times iw" id="wpass2"></i>
            		   <span id="spanpass2" style="color:red;"></span>
            </div>

            
            <div class="form-group">
                <input class="btn btn-success" type="submit" name="confirm_reg" value="Reset Password" id="submit" style="background-color:blue;">
            </div>
            </form>
 			</span>

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
function check(i){
	hideAll();
	var pass1=document.getElementById("pass1").value;
	var pass2=document.getElementById("pass2").value;
	if(pass1=="" && pass2==""){
		document.getElementById("pass1").style.border="2px solid red";
		document.getElementById("pass2").style.border="2px solid red";
		$('#wpass1').show();
		$('#wpass2').show();
		return false;
	}
	else{
			if(pass1==""){
				document.getElementById("pass1").style.border="2px solid red";
				$('#wpass1').show();
				return false;
			}
			else{
				document.getElementById("pass1").style.border="2px solid green";
				$('#rpass1').show();
			}
			if(pass2==""){
				document.getElementById("pass2").style.border="2px solid red";
				$('#wpass2').show();
				return false;
			}
			else if(pass1!=pass2){
				document.getElementById("pass2").style.border="2px solid red";
				$('#wpass2').show();
				$('#spanpass2').html('Please enter correct confirmed Password');
				return false;
			}
			else{
				document.getElementById("pass2").style.border="2px solid green";
				$('#rpass2').show();
				$('#spanpass2').html('');
			}
	}
	if(i==0)
	{
		document.getElementById("pass1").value = calcMD5(pass1);
		document.getElementById("pass2").value = calcMD5(pass2);
	}
}

</script>

<!-- ========================= FOOTER ========================= -->
<%@include file="userFooter.jsp" %>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>