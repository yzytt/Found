<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>详细信息</title>
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
String id = request.getParameter("id");
int id1 = Integer.parseInt(id);
ResultSet rs=dao.searchJdByname(id1);
if(rs==null){
  %>
  <tr align="center" valign="middle"><td colspan="4">没有记录显示！</td>
  </tr>
  <%
}
else{
	if(rs.next()){
    
%>
    <!-- mian-content -->
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

            <h3 class="title-w3ls mb-5 text-center">关于<%=rs.getString("name") %>的更多详细信息</h3>
            <div class="row">
                <!-- left side -->
                <div class="col-lg-8 single-left">
                    <div class="single-left1">
                        <h3 class="card-title">
                           		丢失时间: <%=rs.getString("time") %>
                        </h3>
                        <p><h3 class="card-title">
                              	 详细描述信息:
                         </h3>
                
                        <p><h4 class="card-title">
                              	<%=rs.getString("info") %>
                         </h4>
               
                        
                        <hr>
                       <h4> 失物照片如下:</h4><img src="upload/<%=rs.getString("photoname") %>" alt=" " class="img-fluid" />
                       <h6>发布人：<%=rs.getString("userName") %></h6>
                <%    
                } 
}
%>                
					</div>
				</div>
     		</div>
		</div>                   
                        
                        
                       
                    
                    
                        
                    
                  
                   <div class="leave-coment-form text-left">
                        <h3 class="courses-title  mb-4">意见表</h3>
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <input type="text" name="Name" class="form-control" placeholder="姓名" required="required">
                                </div>
                                <div class="col-sm-6 form-group">
                                    <input type="email" name="Email" class="form-control" placeholder="邮箱" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="Message" class="form-control" placeholder="意见" required="required"></textarea>
                            </div>
                            <div class="mm_single_submit">
                                <button type="submit" class="btn">提交</button>
                            </div>
                        </form>
                    </div>
                <!-- //left side -->
                <!-- right side -->
                
                <!-- //right side -->
            </div>

        </div>
    
    
</body>

</html>
