<!DOCTYPE HTML>

<%@page import="com.jdbc.UserOperation"%>

<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Bootstrap-ecommerce by Vosidiy">

<title>User Check OTP</title>

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
        	
            	
 			<form action="../UserCheckOTPServlet" method="post" id="fileForm" role="form" onsubmit="return check2();" onchange="return check2();">
            		<fieldset><legend class="text-center" style="color:red;"><h1><center>Confirm OTP</center></h1></legend>
				<div class="form-group">
                <label for="otp"><span class="req" style="color:red">* </span>OTP: </label>
              			<input type="text" class="form-control" id="otp" name="otp" placeholder="Enter OTP" maxlength="6">
                        <i class="icon fa fa-check ic" id="rotp"></i>
					  	<i class="icon fa fa-times iw" id="wotp"></i>
					  	<span id="spanotp" style="color:red;"></span>
            </div>
             <div class="form-group">
                <input class="btn btn-success" type="submit" name="confirm_reg" value="Conform OTP" id="submit" style="background-color:blue;">
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
function check2(){
	hideAll();
	var name=document.getElementById("otp").value;
	if(name==""){
		document.getElementById("otp").style.border = "2px solid red";
		$('#wotp').show();
		return false;
	}
	else if(!(name.length == 6)){
			document.getElementById("otp").style.border = "2px solid red";
			$('#wotp').show();
			$('#spanotp').html('Please enter correct OTP');
			return false;
	}
	else if(isNaN(name))
	{
		
		document.getElementById("otp").style.border = "2px solid red";
		$('#wotp').show();
		$('#spanotp').html('Please enter correct OTP in Number');
		return false;
	}
	else{
			document.getElementById("otp").style.border = "2px solid green";
			$('#rotp').show();
			$('#spanotp').html('');
			
	}
	return true;
}

</script>

<!-- ========================= FOOTER ========================= -->
<%@include file="userFooter.jsp" %>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>