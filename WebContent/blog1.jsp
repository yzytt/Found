<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>失物招领信息</title>
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
                            <h1><a href="index.jsp"><span class="fa fa-recycle mr-2"></span>返回首页</a></h1>
                        </div>
                        <!-- //logo -->
                        <div class="w3pvt-bg">
                            <!-- nav -->
                            <div class="nav_w3pvt">
                                <nav>
                                    <label for="drop" class="toggle">Menu</label>
                                    <input type="checkbox" id="drop" />
                                    <ul class="menu">
                                        <li><a href="index.jsp">首页</a></li>
                                    <li>
                                            <!-- First Tier Drop Down -->
                                            <label for="drop-2" class="toggle toogle-2">表单信息 <span class="fa fa-angle-down" aria-hidden="true"></span>
                                            </label>
                                            <a href="blog.jsp">失物寻物信息栏 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                                            <input type="checkbox" id="drop-2" />
                                            <ul>
                                                <li><a href="blog.jsp" class="drop-text">寻物启事</a></li>
                                                <li><a href="blog1.jsp" class="drop-text">失物招领</a></li>
                                            </ul>
                                                                        
                                    </li>
                                    <li>
                                        <label for="drop-2" class="toggle toogle-2">发布信息 <span class="fa fa-angle-down" aria-hidden="true"></span>
                                        </label>
                                        <a href="contact.jsp">发布信息 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                                        <input type="checkbox" id="drop-2" />
                                        <ul>
                                            <li><a href="contact.jsp" class="drop-text">发布寻物启事</a></li>
                                            <li><a href="contact1.jsp" class="drop-text">发布失物招领</a></li>
                                        </ul>
                                    </li>
                                        <li><a href="search.jsp">查询</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- //nav -->
                            <div class="justify-content-center">
                                <!-- search -->
                               <div class="apply-w3-pvt ml-lg-3">
                                   <a class="btn read" href="linshi.jsp" role="button"><%=session.getAttribute("userName")%></a>
                                </div> 
                                <!-- //search -->
                            </div>
                              <div class="justify-content-center">
                                <!-- search -->
                                <div class="apply-w3-pvt ml-lg-3">
                                   <a class="btn read" href="jiemian.jsp" role="button">退出</a>
                                </div> 
                                <!-- //search -->
                            </div>
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
            <h3 class="title-w3ls mb-5 text-center">失物招领</h3>
            <div class="row">
      <%
        ResultSet rs=dao.listAlljd();
      if(rs==null){
    	  %>
          <tr align="center" valign="middle"><td colspan="4">没有记录显示！</td>
          </tr>
          <%
       }
      else{
		while(rs.next()){%>
			 <!-- mian-content -->
			    
             <div class="col-lg-4 col-md-6 mt-4">
                 <div class="thumbnail card">
                     <div class="position-relative">
                         <img src="upload\<%=rs.getString("photoname") %>"  width="600" height="400"class="img-fluid" alt="">
                         <ul class="blog-icons position-absolute">
                             <li><a href="#"><span class="fa fa-heart-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-comment-o"></span></a></li>
                             <li><a href="#"><span class="fa fa-share-square-o"></span></a></li>
                         </ul>
                     </div>
                     <div class="blog-info card-body">
                         <h4 class="">描述：<%=rs.getString("name") %></h4>
                         <h6 class="mt-4">地点：<%=rs.getString("place") %></h6>
                         <p class="mt-2">时间：<%=rs.getString("time") %></p>
                         <p class="mt-2">发布人<%=rs.getString("userName") %></p>
                         <div class="read-icon">
                             <a href="single1.jsp?id=<%=rs.getString("id") %>" class="btn read">更多信息</a>
                         </div>
                     </div>
                 </div>
             </div>
    		 <%
    		 }
     }
    		 %> 
    		     		 </div>
    		 </div>
    		 </section>
</body>

</html>
