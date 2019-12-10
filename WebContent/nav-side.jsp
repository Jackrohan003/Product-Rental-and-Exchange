<%@page import="org.w3c.dom.UserDataHandler"%>

<%@page import="java.util.List"%>
<nav class="navbar-default navbar-side" role="navigation">
     <div class="sidebar-collapse">
         <ul class="nav" id="main-menu">
             <li>
                 <div class="user-img-div">
                     <img src="assets/img/user.png" class="img-thumbnail" />
                     <div class="inner-text"> 
                     	<%-- <%
                     		User u = UserOperation.GetUserByUserName((String)session.getAttribute("user"));
                     		out.println(u.getFname()+" "+u.getLname());
                     	%> --%>
                     <br />
                         <!-- <small>Last Login : 2 Weeks Ago </small> -->
                     </div>
                 </div>

             </li>
           <!--   <li>
                 <a class="active-menu text-uppercase" href="dashboard.jsp"><i class="fa fa-dashboard "></i><strong >Dashboard</strong></a>
             </li> -->
             <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage User </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="ViewUser.jsp"><i class="fa fa-bell "></i>View User</a>
                     </li>  
                 </ul>
             </li>
             <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage State </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="AddState.jsp"><i class="fa fa-toggle-on"></i>Add State</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewState.jsp"><i class="fa fa-bell "></i>View State</a>
                     </li>  
                 </ul>
             </li>
             <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage city </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="AddCity.jsp"><i class="fa fa-toggle-on"></i>Add city</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewCity.jsp"><i class="fa fa-bell "></i>View city</a>
                     </li>  
                 </ul>
             </li>
             <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage Categories </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="addCategories.jsp"><i class="fa fa-toggle-on"></i>Add Category</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewCategory.jsp"><i class="fa fa-bell "></i>View Category</a>
                     </li>  
                 </ul>
             </li>
              <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage Product </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="addProductOriginal.jsp"><i class="fa fa-toggle-on"></i>Add Product</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewProduct.jsp"><i class="fa fa-bell "></i>View Product</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="UpdateProduct.jsp"><i class="fa fa-bell "></i>Update Product</a>
                     </li>    
                     
                 </ul>
             </li>
           <!--   <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage area </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="AddArea.jsp"><i class="fa fa-toggle-on"></i>Add area</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewArea.jsp"><i class="fa fa-bell "></i>View area</a>
                     </li>  
                 </ul>
             </li> -->
             <li>
                 <a class="text-uppercase" href="#"><i class="fa fa-desktop "></i><strong>Manage Security Question </strong><span class="fa arrow"></span></a>
                  <ul class="nav nav-second-level">
                     <li>
                         <a class="text-uppercase" href="AddSeqQue.jsp"><i class="fa fa-toggle-on"></i>Add Securtiy Question</a>
                     </li>
                     <li>
                         <a class="text-uppercase" href="ViewSecQue.jsp"><i class="fa fa-bell "></i>View Security Question</a>
                     </li>  
                 </ul>
             </li>
             <li>
                 <a class="text-uppercase" href="ChangePassword.jsp"><i class="fa fa-lock "></i><strong>Change Password</strong></a>
             </li>
             <li>
                 <a class="text-uppercase" href="ViewProfile.jsp"><i class="fa fa-user "></i><strong>View Proile</strong></a>
             </li>
             <li>
                 <a class="text-uppercase" href="LogoutServlet"><i class="fa fa-sign-in "></i><strong>Logout</strong></a>
             </li>
              <!--<li>
                 <a class="text-uppercase" href="product.jsp"><i class="fa fa-flash "></i><strong>Product</strong></a>
             </li>-->
         </ul>
     </div>
 </nav>
