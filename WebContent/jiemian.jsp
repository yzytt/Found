<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/commons.css">
	<style>a {text-decoration: none}
	a:hover {
	color:orange;
	}
	a{color:blue;}
	input:focus{
	background-color:#F0FFFF;
	border: 1px solid blue;
	}
	.d1{
position:absolute; 
 left:0px;
 top:0px; 
 width:100%; 
 height:100%;
 z-index:-1;
}
	</style>
</head>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%; 
background-attachment: fixed;" >
<div class="d1"><img src="images/blog2.jpg" width="100%" height="100%"/></div>
<!--头条框-->
<%
	     Object message = request.getAttribute("message");//放置一个字符串，并取出
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
	<%} %>
<div class="denglu">
<center>
<form style="font-size:20px;" action="UserServlet?method=search" method="post" onsubmit="return check()">
<br/><br/><br/><br/><br/><br/><br/>
 <h2 style="color:#9999ff">登录</h2>
        <table class=gridtable>
            <tr>
                <td><input type="text" id="username" name="username" placeholder="用户名："  value="" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;"><br/><br/></td>
            </tr>
            <tr>
               <td> <input type="password" id="password" name="password" placeholder="密码："  name="userRePwd" id="userRePwd" size="20"  value="" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;"><br/><br/></td>
            </tr>
            
            <tr>
               <td> <input type="text"  placeholder="验证码"  name="yzm" id="yzm" size="20"  value="" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;"><br/>
               </td>
               <td><img src="${pageContext.request.contextPath}/CodeServlet" alt="验证码看不清，换一张" id="validateCodeImg" onclick="changeImg()">
   				
               <br/></td>
            </tr>
            <tr>
                 <td> <button type="submit" style="height:40px;width:300px; background-color:#ccddff">登&nbsp;&nbsp;&nbsp;&nbsp;录</button></td>
            </tr>
        </table>
        
 
<p style="font-size:10px;color:blue;">
<!-- 忘记密码？&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; -->
<a href="zhuce.jsp"> 立即注册 </a>

</p>
</form>
</center>
</div>
	<script type="text/javascript">
		function check() {
			var username = document.getElementById("username");;
			var password = document.getElementById("password");
			//非空
			if(username.value == '') {
				alert('账号不能为空');
				username.focus();
				return false;
			}
			if(password.value == '') {
				alert('密码不能为空');
				password.focus();
				return false;
			}
			
			
		}
		
    	function changeImg() {
       		 document.getElementById("validateCodeImg").src="${pageContext.request.contextPath}/CodeServlet?"+Math.random();
        		//在末尾加Math.random()的作用：<br>如果两次请求地址一样，服务器只会处理第一次请求，第二次请求返回内容和第一次一样。或者说如果地址相同，第一次请求时，将自动缓存，导致第二次不会重复请求了。Math.random()是调用javascript语法中的数学函数，能够产生随机数。<br>末尾加Math.random()使每次请求地址不相同，服务器每次都去做不同的响应。也可以使用new date()时间戳的形式作为参数传递。
   		 }
	</script>
</body>
</html>