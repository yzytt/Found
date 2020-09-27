<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
    <title>登登登登</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- //Meta tag Keywords -->
    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/slider.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800" rel="stylesheet">

    <!-- //Fonts -->
</head>
<body>
<%
if(session.getAttribute("userName")==null)
{
	response.sendRedirect("jiemian.jsp");
}
%>
<div class="main-w3-pvt-header-sec page-w3pvt-inner" id="home">
        <div class="overlay-innerpage">
           <!-- header -->
            <header>
                <div class="container">
                    <div class="header d-lg-flex justify-content-between align-items-center py-lg-3 px-lg-3">
                        <!-- logo -->
                        <div id="logo">
                            <h1><a href="RJJHindex.jsp"><span class="fa fa-recycle mr-2"></span>返回首页</a></h1>
                        </div>
                        <!-- //logo -->
                        <div class="w3pvt-bg">
                            <!-- nav -->
                            <div class="nav_w3pvt">
                                <nav>
                                    <label for="drop" class="toggle">Menu</label>
                                    <input type="checkbox" id="drop" />
                                    <ul class="menu">
                                        <li><a href="hadeng.jsp?">哈登</a></li>
                                    <li>
                                            <!-- First Tier Drop Down -->
                                            <label for="drop-2" class="toggle toogle-2">詹姆斯<span class="fa fa-angle-down" aria-hidden="true"></span>
                                            </label>
                                            <a href="zhanmusizhanchang.jsp">詹姆斯 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                                            <input type="checkbox" id="drop-2" />
                                            <ul>
                                                <li><a href="zhanmusizhanchang.jsp" class="drop-text">战场图</a></li>
                                                <li><a href="zhanmusirongyu.jsp" class="drop-text">荣誉图</a></li>
                                            </ul>
                                                                        
                                    </li>
                                    <li>
                                        <label for="drop-2" class="toggle toogle-2">东契奇 <span class="fa fa-angle-down" aria-hidden="true"></span>
                                        </label>
                                        <a href="dongqiqi1.jsp">东契奇 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                                        <input type="checkbox" id="drop-2" />
                                        <ul>
                                            <li><a href="dongqiqi1.jsp" class="drop-text">生活>篮球</a></li>
                                            <li><a href="dongqiqi2.jsp" class="drop-text">领袖</a></li>
                                        </ul>
                                    </li>
                                        <li><a href="zimuge.jsp">字母哥</a></li>
                                      
                                    </ul>
                                </nav>
                            </div>
                            <!-- //nav -->
                            
                        </div>
                    </div>
                </div>
            </header>
            <!-- //header -->
            <!-- /banner-inner -->

            <!-- //banner-inner -->
        </div>
    </div>
   <!-- //banner -->
    <!-- //banner-botttom -->
    <section class="content-info py-5">
        <div class="container py-md-5">

            <div class="row">
     
          <tr align="center" valign="middle">
          	<td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng1.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
            <td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng2.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
            <td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng3.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
          </tr>
          <tr align="center" valign="middle">
          	<td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng4.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
            <td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng5.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
            <td colspan="4">
          		<div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="images/hadeng6.jpg"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     
                 </div>
                </div>
            </td>
          </tr>
          
			 <!-- mian-content -->
			    
             
    		 
    		 </div>
    		 </div>
    		 </section>
</body>
</html>
