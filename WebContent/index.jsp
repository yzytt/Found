<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
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
<%
         //String userName=request.getParameter("userName");
         //String userName=  String.valueOf(request.getAttribute("userName"));
        // session.setAttribute("userName", userName);
         System.out.print("!"+session.getAttribute("userName"));
	     Object message = request.getAttribute("message");//放置一个字符串，并取出
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
<%} %>
    <!-- mian-content -->
    <div class="main-w3-pvt-header-sec" id="home">
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
                                        <li><a href="index.jsp?">首页</a></li>
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
        <section class="banner_w3pvt">
            <div class="csslider infinity" id="slider1">
                <input type="radio" name="slides" checked="checked" id="slides_1" />
                <input type="radio" name="slides" id="slides_2" />
                <input type="radio" name="slides" id="slides_3" />

                <ul>
                    <li>
                        <div class="banner-top">
                            <div class="overlay">
                                <div class="container">
                                    <div class="banner-info">
                                        <div class="banner-w3ls-inner">
                                            <h3>欢迎使用失物招领平台</h3> 
                                            <div class="test-info text-left mt-lg-5 mt-4">
<!--                                                 <a href="single.jsp" class="btn mr-2">阅读更多</a>
                                                <a href="contact.jsp" class="btn">联系我们</a> -->
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner-top1">
                            <div class="overlay sec">
                                <div class="container">
                                    <div class="banner-info">
                                        <div class="banner-w3ls-inner">
                                            <h3>感谢您使用此系统！</h3>                                 
                                            <div class="test-info text-left mt-lg-5 mt-4">
<!--                                                 <a href="single.jsp" class="btn mr-2">阅读更多</a>
                                                <a href="contact.jsp" class="btn">联系我们</a> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner-top2">
                            <div class="overlay">
                                <div class="container">
                                    <div class="banner-info">
                                        <div class="banner-w3ls-inner">
                                            <h3>再次感谢！</h3>
                                            <div class="test-info text-left mt-lg-5 mt-4">
<!--                                                 <a href="single.jsp" class="btn mr-2">阅读更多</a>
                                                <a href="contact.jsp" class="btn">联系我们</a> -->
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
                <div class="arrows">
                    <label for="slides_1"></label>
                    <label for="slides_2"></label>
                    <label for="slides_3"></label>
                </div>
            </div>
        </section>
        <!-- //slider -->
    </div>
</body>
</html>
</body>
</html>