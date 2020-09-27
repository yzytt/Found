<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发布信息</title>
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
        function checkds(){
        	var name = document.getElementById("name");;
			var place = document.getElementById("place");
			var time1 = document.getElementById("time1");
			var time2 = document.getElementById("time2");
			var people = document.getElementById("people");
			var info = document.getElementById("info");
			//非空
			if(name.value == '') {
				alert('请填写物品类别！');
				name.focus();
				return false;
			}
        	 if(place==null||place==""){
        	    alert("请填写丢失地点！");
        	    place.focus();
        	    return false;
        	 }
        	 if(time1==null||time1==""){
        		 alert("请正确填写丢失时间段！");
        		 time1.focus()
        		 return false;
        	 }
        	 if(time2==null||time2==""){
        		 alert("请正确填写丢失时间段！");
        		 time2.focus()
        		 return false;
        	 }
        	 if(people==null||people==""){
        		 alert("请填写联系方式！");
        		 people.focus()
        		 return false;
        	 }
        	 if(info==null||info==""){
        		 alert("请填写物品详细信息！");
        		 info.focus()
        		 return false;
        	 }
        	 return true;
        	}
        function showPreview(source) {
        	var file = source.files[0];
        	if(window.FileReader) { 
        		var fr = new FileReader();
        		fr.onloadend = function(e) {
        			document.getElementById("portrait").src = e.target.result;
        			};
        			fr.readAsDataURL(file);  //也是利用将图片作为url读出
        			}
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
	     Object message = request.getAttribute("message");//放置一个字符串，并取出
	     if(message!=null && !"".equals(message)){
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
<%} %>
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
    <!-- /contact -->
    <section class="content-info py-5">
        <div class="container py-md-5">
            <div class="text-center px-lg-5">
                <h3 class="title-w3ls mb-5">寻物表单信息填写</h3>
                <div class="title-desc text-center px-lg-5">
                    <p class="px-lg-5 sub-vj">请尽可能的提供所丢失物品的详细信息，以便提高找回的成功率.莫慌！</p>
                </div>
            </div>
            <div class="contact-w3ls-form mt-5">
                <form action="${pageContext.request.contextPath }/addServlet?method=dsAdd" method="post" enctype="multipart/form-data" onsubmit="return checkds()" class="w3-pvt-contact-fm" >
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>丢失物品类型描述</label>
                                <input class="form-control" type="text" name="name"  placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label>丢失地点</label>
                                <input class="form-control" type="text" name="place" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label>丢失时间</label>
                                <input class="form-control" type="datetime-local" name="time" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label>联系方式</label>
                                <input class="form-control" type="text" name="people" placeholder="" required="">
                            </div>
                        
                            <div class="form-group">
                                <label>请选择要上传的图片文件(.JPG/.PNG)</label>
                                <input class="form-control" type="file" name="file" placeholder="" required="" onchange="showPreview(this)" >
                                <P><img id="portrait" src="" width="170" height="175">  
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>物品具体描述</label>
                                <textarea class="form-control" name="info" placeholder="" required=""></textarea>
                            </div>
                        </div>
                            <div class="form-group">
                                <label>发布人</label>
                                <input class="form-control" name="userName" value=<%=session.getAttribute("userName")%> readonly="readonly">
                                <P><img id="portrait" src="" width="170" height="175">  
                            </div>
                        <div class="form-group mx-auto mt-3">
                            <button type="submit" class="btn submit">发布</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
</body>
</html>

