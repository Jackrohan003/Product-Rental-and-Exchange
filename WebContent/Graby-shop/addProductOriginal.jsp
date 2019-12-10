<%@page import="java.util.List"%>
<%@page import="com.product.operation.CategoryOperation"%>
<%@page import="com.model.product.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Product</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="userBootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="userBootstrap/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="userBootstrap/js/jquery-3.1.0.min.js"></script>
    <script src="js/active.js"></script>
    <title>Admin Dashboard</title>
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
<title>product-list</title>
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

    
 	<script type="text/javascript">
 	
 	$(document).ready(function(){
    	$("#addProduct").addClass("active");
    });
   	/*	function readURL(input) {
		   if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
		       		$('.image-upload-wrap').hide();
					$('.file-upload-image').attr('src', e.target.result);
		       		$('.file-upload-content').show();
		       		$('.file-upload-btn').hide();
					$('.image-title').html(input.files[0].name);
		    	};
		    	reader.readAsDataURL(input.files[0]);
			}
		   	else
		   	{	
	     		removeUpload();
	   		}
	 	}

	 function removeUpload() {
	   $('.file-upload-input').replaceWith($('.file-upload-input').clone());
	   $('.file-upload-content').hide();
	   $('.file-upload-btn').show();
	   $('.image-upload-wrap').show();
	 }
	 $('.image-upload-wrap').bind('dragover', function () {
	 		$('.image-upload-wrap').addClass('image-dropping');
	 	});
	 	$('.image-upload-wrap').bind('dragleave', function () {
	 		$('.image-upload-wrap').removeClass('image-dropping');
	 });*/

	 function readURL1(input) {
		   if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
		       		$('#image-upload-wrap1').hide();
					$('#file-upload-image1').attr('src', e.target.result);
		       		$('#file-upload-content1').show();
		       		$('#file-upload-btn1').hide();
					$('#image-title').html(input.files[0].name);
		    	};
		    	reader.readAsDataURL(input.files[0]);
			}
		   	else
		   	{	
	     		removeUpload1();
	   		}
	 	}

	 function removeUpload1() {
	   $('#file-upload-input1').replaceWith($('#file-upload-input1').clone());
	   $('#file-upload-content1').hide();
	   $('#file-upload-btn1').show();
	   $('#image-upload-wrap1').show();
	 }
	 $('#image-upload-wrap1').bind('dragover', function () {
	 		$('#image-upload-wrap1').addClass('image-dropping');
	 	});
	 	$('#image-upload-wrap1').bind('dragleave', function () {
	 		$('#image-upload-wrap1').removeClass('image-dropping');
	 });

	 	function readURL2(input) {
			   if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
			       		$('#image-upload-wrap2').hide();
						$('#file-upload-image2').attr('src', e.target.result);
			       		$('#file-upload-content2').show();
			       		$('#file-upload-btn2').hide();
						$('#image-title').html(input.files[0].name);
			    	};
			    	reader.readAsDataURL(input.files[0]);
				}
			   	else
			   	{	
		     		removeUpload2();
		   		}
		 	}

		 function removeUpload2() {
		   $('#file-upload-input2').replaceWith($('#file-upload-input2').clone());
		   $('#file-upload-content2').hide();
		   $('#file-upload-btn2').show();
		   $('#image-upload-wrap2').show();
		 }
		 $('#image-upload-wrap2').bind('dragover', function () {
		 		$('#image-upload-wrap2').addClass('image-dropping');
		 	});
		 	$('#image-upload-wrap2').bind('dragleave', function () {
		 		$('#image-upload-wrap2').removeClass('image-dropping');
		 });
		 	
		 	function readURL3(input) {
				   if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
				       		$('#image-upload-wrap3').hide();
							$('#file-upload-image3').attr('src', e.target.result);
				       		$('#file-upload-content3').show();
				       		$('#file-upload-btn3').hide();
							$('#image-title').html(input.files[0].name);
				    	};
				    	reader.readAsDataURL(input.files[0]);
					}
				   	else
				   	{	
			     		removeUpload3();
			   		}
			 	}

			 function removeUpload3() {
			   $('#file-upload-input3').replaceWith($('#file-upload-input3').clone());
			   $('#file-upload-content3').hide();
			   $('#file-upload-btn3').show();
			   $('#image-upload-wrap3').show();
			 }
			 $('#image-upload-wrap3').bind('dragover', function () {
			 		$('#image-upload-wrap3').addClass('image-dropping');
			 	});
			 	$('#image-upload-wrap3').bind('dragleave', function () {
			 		$('#image-upload-wrap3').removeClass('image-dropping');
			 });

			 	function readURL4(input) {
					   if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
					       		$('#image-upload-wrap4').hide();
								$('#file-upload-image4').attr('src', e.target.result);
					       		$('#file-upload-content4').show();
					       		$('#file-upload-btn4').hide();
								$('#image-title').html(input.files[0].name);
					    	};
					    	reader.readAsDataURL(input.files[0]);
						}
					   	else
					   	{	
				     		removeUpload4();
				   		}
				 	}

				 function removeUpload4() {
				   $('#file-upload-input4').replaceWith($('#file-upload-input4').clone());
				   $('#file-upload-content4').hide();
				   $('#file-upload-btn4').show();
				   $('#image-upload-wrap4').show();
				 }
				 $('#image-upload-wrap4').bind('dragover', function () {
				 		$('#image-upload-wrap4').addClass('image-dropping');
				 	});
				 	$('#image-upload-wrap4').bind('dragleave', function () {
				 		$('#image-upload-wrap4').removeClass('image-dropping');
				 });


    </script>
    <style>

.file-upload {
  background-color: #ffffff;
  width: 100%;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #3498db;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #217dbb;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
  margin-top:15%;
}

.file-upload-btn:hover {
  background: #217dbb;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  
  border: 4px dashed #217dbb;
  height:150px;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  border: 4px dashed #217dbb;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: grey;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 100px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

    </style>
    </head>
    <body>

 <%
    	String user = (String)session.getAttribute("uname");
    String resp = "You must be Logged In to add Product!";
    	if(user == null)
    	{
    		response.sendRedirect("rental.jsp?msg="+resp);
    	}
    %>




         <%@include file="userheader.jsp" %>
         <div style="margin-top:50px; margin-bottom:50px;">
    		<form action="../AddRentProductServlet" method="post" enctype="multipart/form-data">
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Name
                					</div>
                					<div class="col-md-4">
                						<input type="text" class="form-control" name="productName" style="text-align:left;" required>
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/>
                				
                			<!-- 	<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Brand
                					</div>
                					<div class="col-md-4">
                						<input type="text" class="form-control" name="brand" style="text-align:left;">
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/> -->
                				
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Description
                					</div>
                					<div class="col-md-4">
                						<input type="text" class="form-control" name="productDesc" style="text-align:left;"required>
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/>
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Duration(in Months)
                					</div>
                					<div class="col-md-4">
                						<input type="number" min="0" class="form-control" name="duration" style="text-align:left;" required>
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/>
                				
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Select Product Category
                					</div>
                					<div class="col-md-4">
                						<select class="form-control" name="category" required>
                						<option value="" disabled selected>Select Category</option>
                						<%
                							List<Category> list = CategoryOperation.getAllByType(3); 
                							for(Category c:list)
                							{
                								%>
                						<option value="<%=c.getCategoryid() %>"><%=c.getCategoryname() %></option>
                						<%
                							}
                						%>
                						</select>
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/>
                				
                				<!-- <div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Size
                					</div>
                					<div class="col-md-4">
                						<input type="text" class="form-control" name="size" style="text-align:left;">
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/> -->
                				
                				
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Enter Product Price
                					</div>
                					<div class="col-md-4">
                						<input type="number" min="0" class="form-control" name="price" style="text-align:left;" required>
                					</div>
                					<div class="col-md-5"></div>
                				</div><br/><br/>

			                				
                				<div class="row">
                					<div class="col-md-3" style="text-align:right;font-size:1em;color:grey;margin-top:7px;">
                						Upload Product Images
                					</div>
                					<div class="col-md-2">
                					<div class="file-upload" id="file-upload1">
  									<div class="image-upload-wrap" id="image-upload-wrap1">
    										<input class="file-upload-input" id="file-upload-input1" type='file' name="image1" onchange="readURL1(this);" accept="image/*" required/>
    										<div class="drag-text">
      											<h3>Image 1</h3>
    										</div>
  									</div>
  									<br/>
  									<div class="file-upload-content" id="file-upload-content1">
    									<img class="file-upload-image" id="file-upload-image1" src="#" alt="your image" />
    									<div class="image-title-wrap" id="image-title-wrap1">
      										<button type="button" onclick="removeUpload1()" class="remove-image">Remove <span class="image-title">Image</span></button>
    									</div>
  									</div>
									</div>
										<button class="file-upload-btn" id="file-upload-btn1" type="button" onclick="$('#file-upload-input1').trigger( 'click' )">Upload</button>
  									
									</div>
									
									
									<div class="col-md-2">
                					<div class="file-upload" id="file-upload2">
  									<div class="image-upload-wrap" id="image-upload-wrap2">
    										<input class="file-upload-input" id="file-upload-input2" type='file' name="image2" onchange="readURL2(this);" accept="image/*" required/>
    										<div class="drag-text">
      											<h3>Image 2</h3>
    										</div>
  									</div>
  									<br/>
  									<div class="file-upload-content" id="file-upload-content2">
    									<img class="file-upload-image" id="file-upload-image2" src="#" alt="your image" />
    									<div class="image-title-wrap" id="image-title-wrap2">
      										<button type="button" onclick="removeUpload2()" class="remove-image">Remove <span class="image-title">Image</span></button>
    									</div>
  									</div>
									</div>
										<button class="file-upload-btn" id="file-upload-btn2" type="button" onclick="$('#file-upload-input2').trigger( 'click' )">Upload</button>
  									
									</div>
									
									
									<div class="col-md-2">
                					<div class="file-upload" id="file-upload3">
  									<div class="image-upload-wrap" id="image-upload-wrap3">
    										<input class="file-upload-input" id="file-upload-input3" type='file' name="image3" onchange="readURL3(this);" accept="image/*" />
    										<div class="drag-text">
      											<h3>Image 3<br/>(Optional)</h3>
    										</div>
  									</div>
  									<br/>
  									<div class="file-upload-content" id="file-upload-content3">
    									<img class="file-upload-image" id="file-upload-image3" src="#" alt="your image" />
    									<div class="image-title-wrap" id="image-title-wrap3">
      										<button type="button" onclick="removeUpload3()" class="remove-image">Remove <span class="image-title">Image</span></button>
    									</div>
  									</div>
									</div>
										<button class="file-upload-btn" id="file-upload-btn3" type="button" onclick="$('#file-upload-input3').trigger( 'click' )">Upload</button>
  									
									</div>
									
									
									<div class="col-md-2">
                					<div class="file-upload" id="file-upload4">
  									<div class="image-upload-wrap" id="image-upload-wrap4">
    										<input class="file-upload-input" id="file-upload-input4" type='file' name="image4" onchange="readURL4(this);" accept="image/*" />
    										<div class="drag-text">
      											<h3>Image 4<br/>(Optional)</h3>
    										</div>
  									</div>
  									<br/>
  									<div class="file-upload-content" id="file-upload-content4">
    									<img class="file-upload-image" id="file-upload-image4" src="#" alt="your image" />
    									<div class="image-title-wrap" id="image-title-wrap4">
      										<button type="button" onclick="removeUpload4()" class="remove-image">Remove <span class="image-title">Image</span></button>
    									</div>
  									</div>
									</div>
										<button class="file-upload-btn" id="file-upload-btn4" type="button" onclick="$('#file-upload-input4').trigger( 'click' )">Upload</button>
  									
									</div>
									
									<div class="col-md-1">
									</div>
                				</div><br/><br/>
                				       				
                				<div class="row">
                					<div class="col-md-3"></div>
                					<div class="col-md-6">
                						<input type="submit" class="btn btn-primary" value="Add Product" style="font-size:16px;padding:10px;width:35%;border-radius: 4px;border-bottom: 4px solid #217dbb;transition: all .2s ease;">
                					</div>
                					<div class="col-md-3"></div>
                				</div>
                				</form>
                				</div>
                				 <%@include file="userFooter.jsp" %> 
           		
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
</html>
       
