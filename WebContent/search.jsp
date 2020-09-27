<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查询</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<%
String shouj="手机";
String fk="饭卡";
String shuj="书";
String sfz="身份证";
%>
<body>
<%
if(session.getAttribute("userName")==null)
{
	response.sendRedirect("jiemian.jsp");
}
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
            <h3 class="title-w3ls mb-5 text-center">查询及帮助</h3>
            <div class="row">
                <!-- left side -->
                <div class="col-lg-8 single-left">
                    <div class="single-left1">
                        <h5 class="card-title">
                            功能说明
                        </h5>
                        <p>你要是丢东西啦可以在右侧通过物品的描述，物品的丢失地点以及丢失物品的时间查询失物招领，看看有没有同学捡到你的东西。<br>
                        你要是捡到东西啦也可以在右侧通过物品的描述，捡到物品的地方以及捡到物品的时间查询寻物启事，看看有没有同学在找你捡到的东西。
                        </p>
                        <div class="mt-4">
                            <span class="badge badge-primary">Posted 2019-04-02 10:05:00</span>
                            <div class="float-sm-right">
                                <a href="#" class="badge badge-secondary">ToPD</a>
                                <a href="#" class="badge badge-success">龙哥</a>
                                <a href="#" class="badge badge-danger">媛姐</a>
                            </div>
                        </div>
                        <hr>
                        <img src="images/three.png" alt=" " class="img-fluid" />
                        <ul class="courses_list my-4">
                            <li>
                                <h6 class="courses-first text-bl">
                                    <span class="fa fa-user mr-2"></span>three
                                </h6>
                            </li>
                            <li>
                                <a>
                                    <span class="fa fa-heart mr-1"></span>
                                    </a>
                            </li>
                            <li>
                                <a>
                                    <span class="fa fa-comments mr-1"></span>
                                    </a>
                            </li>
                        </ul>
                        <h5 class="card-title">
                            <a href="single.html" class="text-bl">感谢！！！</a>
                        </h5>
                        <p>您的每一次使用都会给我们涨学分！！！</p>
                        <p>您的每一次使用都会给我们涨学分！！！</p>
                        <p>您的每一次使用都会给我们涨学分！！！</p>
                    </div>
                    <div class="admin p-4 my-4">
                        <p>
                            <span class="fa fa-quote-left mr-2"></span>你是一个礼物，却不能拆封。像夏夜绽放在天空的烟火，灿烂缤纷，无法触摸。像遥远的星星，在晴朗的夜空下，静静在头顶，仿佛为我存在，我们之间却有几亿光年的距离。但，无论如何，亲爱的朋友，感谢你出现在我的生命里。
                            <span class="fa fa-quote-right ml-2"></span>
                        </p>
                        <a class="mt-3 font-weight-bold text-right blockquote-footer">作者：寂地 出处：缺氧</a>
                    </div>
                    <div class="leave-coment-form text-left">
                        <h3 class="courses-title  mb-4">意见表</h3>
                    <form action="addServlet?method=addTip" method="post">
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
                </div>
                <!-- //left side -->
                <!-- right side -->
                <div class="col-lg-4 event-right mt-lg-0 mt-5">
                    <div class="event-right1">
                       <div class="categories mt-4 p-sm-4 p-3 border">
       <h3 class="courses-title ">按丢失时间查询</h3>
   <form class="form-inline" action="searchsjsw.jsp" method="post"  name="diushi" >
   <table>
    <tr>
     <td>
     <input class="form-control rounded-0 mr-sm-2" type="datetime-local" name="time" id="time">
	</td>
    </tr>
    <tr>
     <td colspan="2" align="center">
     <button class="btn read mt-3" type="submit">查询</button>
     </td>
    </tr>
   </table>
  </form>
  <br>
  <h3 class="courses-title ">按捡到时间查询</h3>
   <form class="form-inline" action="searchsjxw.jsp" method="post"  name="diushi" >
   <table>
    <tr>
     <td>
     <input class="form-control rounded-0 mr-sm-2" type="datetime-local" name="time" id="time">
	</td>
    </tr>
    <tr>
     <td colspan="2" align="center">
     <button class="btn read mt-3" type="submit">查询</button>
     </td>
    </tr>
   </table>
  </form>
                        </div>
                        <div class="categories mt-4 p-sm-4 p-3 border">
                        <h3 class="courses-title ">条件查询</h3>
     <form class="form-inline" name="searchformsw" method="post" action="searchtjsw.jsp">
     <table>
      <tr bgcolor="#f5f5f5">
        <td align="center" colspan="5">
		  条件查询失物招领：
    	  <select name="subsql">
		    <option value="name">描述</option>
		    <option value="place">地点</option>	
		  </select>
		  <input class="form-control rounded-0 mr-sm-2" type="text" name="subsqlvalue" size="17">
		  <button class="btn read mt-3" type="submit">查询</button>
        </td>
      </tr>
     </table>
     </form>
     <form class="form-inline" name="searchformxw" method="post" action="searchtjxw.jsp">
     <table>
      <tr bgcolor="#f5f5f5">
        <td align="center" colspan="5">
		  条件查询寻物启事：
    	  <select name="subsql">
		    <option value="name">描述</option>
		    <option value="place">地点</option>		
		  </select>
		  <input class="form-control rounded-0 mr-sm-2" type="text" name="subsqlvalue" size="17">
		  <button class="btn read mt-3" type="submit">查询</button>
        </td>
      </tr>
     </table>
     </form>
     </div>
                        <div class="categories mt-4 p-sm-4 p-3 border">
                            <h3 class="courses-title ">常用</h3>
                            <ul>
                                <li class="mt-3">
                                    <span class="fa fa-check mr-2"></span>
                                    <a href="hot.jsp?subsql=name&&subsqlvalue=手机"> 找手机 </a>
                                </li>
                                <li class="mt-3">
                                    <span class="fa fa-check mr-2"></span>
                                    <a href="hot.jsp?subsql=name&&subsqlvalue=饭卡">找饭卡</a>
                                </li>
                                <li class="mt-3">
                                    <span class="fa fa-check mr-2"></span>
                                    <a href="hot.jsp?subsql=name&&subsqlvalue=书">找书籍</a>
                                </li>
                                <li class="mt-3">
                                    <span class="fa fa-check mr-2"></span>
                                    <a href="hot.jsp?subsql=name&&subsqlvalue=身份证">找身份证</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tags mt-4 p-4 border">
                            <h3 class="courses-title">帮助</h3>
                            <ul class="mt-4">
                                <li>
                                    <a href="" class="text-bl border">挂失饭卡</a>
                                </li>
                                <li>
                                    <a href="" class="text-bl border">补办饭卡</a>
                                </li>
                                <li>
                                    <a href="" class="text-bl border">挂失身份证</a>
                                </li>
                                <li>
                                    <a href="" class="text-bl border">补办身份证</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- //right side -->
            </div>
        </div>
    </section>
</body>
</html>