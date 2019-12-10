<%@page import="com.user.City"%>
<%@page import="com.user.State"%>
<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.user.User"%>
<%@page import="com.jdbc.CityOperation"%>

<%@page import="com.jdbc.StateOperation"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<script>
function getCity(){
	var stateId=document.getElementById("state").value;
	$.ajax({	
		 type: 'POST',
        dataType: "json",
        url:"../GetCityByStateServlet",
        data: {state:stateId},
		success: function(citylist)
		{
			var result = "<option value=' '>Please select your city</option>";
			for(i=0;i<citylist.length;i++)
			{
				result= result + "<option value='"+ citylist[i].cityid.toString() +"'>"+ citylist[i].cityname.toString() +"</option>";
			}
			$("#city").html(result);
		},
		error:function()
		{
			alert("error");
		}
	});
}

</script>

<title>User Profile</title>
</head>
<!-- http://localhost:8080/B2B & B2C Management System/ -->

<body>
<%@include file="userheader.jsp" %>
<%
	String s2 = (String)session.getAttribute("uname");
	User user1 = null;
	
		user1 = UserOperation.GetUserByUserEmail(s2);
		
		
		
		
	
%>
<div class="container">
	<div class="row">
		<div class="col-md-3">
		</div>
        <div class="col-md-6">
        	<br/>
            <form action="../UpdateProfileServlet" method="post" id="fileForm" onsubmit="return check();" onchange="return check();" role="form">
            <fieldset><legend class="text-center" style="color:red;"><i class="fa fa-user-circle" style="color:blue; zoom:4;"></i><h1><center>User Profile</center></h1></legend>
            <div class="form-group">
                <label for="email">Email Address: </label> 
                    <input class="form-control" type="text" name="email" id = "email"  value="<%=user1.getEmail() %>" disabled/>  
                        <div class="status" id="status"></div>
                          <i class="icon fa fa-check ic" id="remail"></i>
                          <i class="icon fa fa-times iw" id="wemail"></i>
                          <span id="spanemail" style="color:red;"></span>
            </div>

            <div class="form-group">
            <label for="phonenumber">Phone Number: </label>
                    <input type="text"  name="phonenumber" id="phone" class="form-control phone" maxlength="10" value="<%=user1.getPhone() %>" disabled/>
                    <i class="icon fa fa-check ic" id="rphone"></i>
                    <i class="icon fa fa-times iw" id="wphone"></i>  
                    <span id="spanphone" style="color:red;"></span>
          	</div>
		
			
            <div class="form-group">
                <label for="address1">Address Line1: </label> 
                    <input class="form-control" type="text" name="address1" id = "address1" placeholder="Enter Address Line1" value="<%
                    		
								out.println(user1.getAdd1());
							
                    		
                    
                    
                    %>
                    "/>  
                        <div id="errLast"></div>
                        <i class="icon fa fa-check ic" id="raddress1"></i>
                        <i class="icon fa fa-times iw" id="waddress1"></i>
                        <span id="spanaddress1" style="color:red;"></span>
            </div>
			<div class="form-group">
                <label for="address2">Address Line2: </label> 
                    <input class="form-control" type="text" name="address2" id = "address2" placeholder="Enter Address Line2" value="<%
                    	
                    		
								out.println(user1.getAdd2());
							
                    
                    
                    %>"/>  
                        <div id="errLast"></div>
                        <i class="icon fa fa-check ic" id="raddress2"></i>
                        <i class="icon fa fa-times iw" id="waddress2"></i>
                        <span id="spanladdress2" style="color:red;"></span>
            </div>
	
			
			<div class="form-group"> 	 
                <label for="state">State: </label>
                <select id="state" class="form-control" name="state" onchange="getCity()" data-style="btn-primary">
                							<option value="0">Please Select State</option>
                							<%
                							List<State> list;
                							list=StateOperation.getAll();
                							for(State state :list){
                							

                    							
                    								if(user1.getSid() == state.getSid())
                    								{
                    						%>
                    							<option value=<%out.println(state.getSid()); %> selected><%out.println(state.getStatename());%></option>		
                    						<%			
                    								}
                    								else
                    								{
                    									%>
                            							<option value=<%out.println(state.getSid()); %>><%out.println(state.getStatename());%></option>		
                            						<%						
                    								}
                    							
                							
                							
            							
            							}
                							%>
                </select>
                		<div id="errLast"></div>
                        <i class="icon fa fa-check ic" id="rstate"></i>
                        <i class="icon fa fa-times iw" id="wstate"></i>
                        <span id="spanstate" style="color:red;"></span>
            </div>
        
		 	<div class="form-group"> 	 
                <label for="firstname">City: </label>
                <select id="city" class="form-control" name="city" data-style="btn-primary">
                		
                		
                		<%
                			List<City> c = CityOperation.getAllCity();
                			
                		for(City city :c){
							

							
								if(user1.getCid() == city.getCityid())
								{
						%>
							<option value=<%out.println(city.getCityid()); %> selected><%out.println(city.getCityname());%></option>		
						<%			
								}
								else
								{
									%>
        							<option value=<%out.println(city.getCityid()); %>> <%out.println(city.getCityname());%></option>		
        							<%
        							
								}
                		}
        							%>
							
						
						
					
									
                							
                </select>
                		<div id="errLast"></div>
                        <i class="icon fa fa-check ic" id="rcity"></i>
                        <i class="icon fa fa-times iw" id="wcity"></i>
                        <span id="spancity" style="color:red;"></span>
            </div>
        
            <div class="form-group">
                <input class="btn btn-success" type="submit" name="submit_upd" value="Update Profile" id="update" style="background-color:blue;">
              
            </div>
 			
 			 

            </fieldset>
            </form><!-- ends register form -->

		  <div style="position:relative; top:-50px; left:140px;">
		  <form action="changePassword.jsp">
		 <input class="btn btn-success" type="submit" value="Change Password" style="background-color:blue;">
		</form> 
		  </div>


<script type="text/javascript">
$(document).ready(function(){
	hideAll();
	$("#state").change(function(){
		if(document.getElementById("state").value === "0")
		{
			$("#city").prop('disabled', true);
			document.getElementById("city").value = "0";
		}
		else
		{	
			document.getElementById("city").value = "0";
			var stateId=document.getElementById("state").value;
			$.ajax({	
				 type: 'POST',
	            dataType: "json",
	            url:"../GetCityByStateServlet",
	            data: {state:stateId},
				success: function(citylist)
				{
					var result = "<option value='0'>Please select your city</option>";
					for(i=0;i<citylist.length;i++)
					{
						result= result + "<option value='"+ citylist[i].cityId.toString() +"'>"+ citylist[i].cityName.toString() +"</option>";
					}
					$("#city").html(result);
				},
				error:function()
				{
					alert("error");
				}
			});
			$("#city").prop('disabled', false);
		}
		
	});
	

});


$(document).ready(function(){
	hideAll();
});
function hideAll()
{
	$('.icon').hide();
}
function check(){
	hideAll();
	var address1=document.getElementById("address1").value;
	var city=document.getElementById("city").value;
	var state=document.getElementById("state").value;
	if(city=="0" && state=="0" ){
		document.getElementById("city").style.border="2px solid red";
		document.getElementById("state").style.border="2px solid red";
		document.getElementById("address1").style.border="2px solid red";
		$('#waddress1').show();
		$('#wcity').show();
		$('#wstate').show();
		return false;
	}
	else{
			if(address1==""){
				document.getElementById("address1").style.border="2px solid red";
				$('#waddress1').show();
				return false;
			}
			else{
				document.getElementById("address1").style.border="2px solid green";
				$('#waddress1').show();
			}
			if(state=="0"){
				document.getElementById("state").style.border="2px solid red";
				$('#wstate').show();
				return false;
			}
			else{
				document.getElementById("state").style.border="2px solid green";
				$('#spanstate').html('');
				$('#rstate').show();
			}
			if(city=="0"){
				document.getElementById("city").style.border="2px solid red";
				$('#wcity').show();
				return false;
			}
			else{
				document.getElementById("city").style.border="2px solid green";
				$('#spancity').html('');
				$('#rcity').show();
			}
	}
}
</script>
        </div><!-- ends col-6 -->
        <div class="col-md-3">
		</div>
	</div>
</div>

<%@include file="userFooter.jsp" %>
</body>
