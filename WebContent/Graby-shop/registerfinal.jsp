<!DOCTYPE html>
<%@page import="com.user.SecurityQuestion"%>
<%@page import="com.jdbc.SecurityQuestionOperation"%>
<%@page import="java.util.List"%>
<html lang="en">
<%@page import="com.jdbc.StateOperation"%>
<%@page import="com.user.State"%>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Register Forms </title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
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
    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
          <% if(request.getParameter("msg") !=null){ %>
<p style="color:red">
<%= request.getParameter("msg") %>
</p>
<%} %>


    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form method="POST" action="../AddUserServlet">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">first name</label>
                                    <input class="input--style-4" type="text" name="first_name" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">last name</label>
                                    <input class="input--style-4" type="text" name="last_name"required>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email"required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="number" name="phone" required>
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="Password" name="Password" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Re-Enter Password</label>
                                    <input class="input--style-4" type="Password" name="rePassword" required>
                                </div>
                            </div>
                        </div>
                       
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Address Line 1</label>
                                    <input class="input--style-4" type="text" name="add1"required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Address Line 2</label>
                                    <input class="input--style-4" type="text" name="add2">
                                </div>
                            </div>
                        </div>
                       
                     <!--    <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Birthday</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="birthday">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <div class="input-group">
                            <label class="label">State</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="state" id="state" onchange="getCity()" required>
                                    <option disabled="disabled" selected="selected">Choose state</option>
	                                   <%
                                            		List<State> l = StateOperation.getAll();
                                            		for(State s : l)
                                            		{
                                            	%>
                                            		<option value="<%=s.getSid()%>"><%=s.getStatename() %></option>
                                            	<%
                                            		}
                                            	%>
	                                   
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                         <div class="input-group">
                            <label class="label">City</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="city" id="city">
                                    <option disabled="disabled" selected>Choose city</option>
                                    
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <br>
                         <div class="input-group">
                            <label class="label">Security Question</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="Securityquestion">
                                    <option disabled="disabled" selected="selected">select question</option>
                                      
	                                   <%
                                            		List<SecurityQuestion> l3 = SecurityQuestionOperation.getAll();
                                            		for(SecurityQuestion s : l3)
                                            		{
                                            	%>
                                            		<option value="<%=s.getSqid()%>"><%=s.getQuestion() %></option>
                                            	<%
                                            		}
                                            	%>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <br>
                        <div class="input-group">
                            <label class="label">Security Answer</label>
                            <input class="input--style-4" type="text" name="securityanswer" required>
                        </div>

                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>
    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->