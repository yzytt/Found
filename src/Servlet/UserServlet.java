package Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.Response;

import Entity.User;
import Dao.Dao;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    Dao dao = new Dao();
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String method = req.getParameter("method");
		if ("add".equals(method)) {
			add(req, resp);
		}  else if ("search".equals(method)) {
			search(req, resp);
		} 
	}
	
	
	
	private void search(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String rpassword = dao.search(username);
		String clientCheckcode=req.getParameter("yzm").toUpperCase();//接收客户端提交上来的参数，使用toUpperCase()可以实现不区分大小写
	    String serverCheckcode=(String)req.getSession().getAttribute("checkcode");//从session中提取验证码
	    if(!clientCheckcode.equals(serverCheckcode)) {
			req.setAttribute("message", "验证码输入错误!");
			req.getRequestDispatcher("jiemian.jsp").forward(req,resp);
			
		}
		if(password.equals(rpassword)) {
			req.setAttribute("message", "登陆成功！");
			int type=dao.type(username);
			if(type==1)
			{
				//req.getSession().setAttribute("name",username);
				req.setAttribute("userName",username);
				req.getRequestDispatcher("temp.jsp").forward(req,resp);
			}
			else if(type==2)
			{
				req.setAttribute("userName",username);
				req.getRequestDispatcher("temp.jsp").forward(req,resp);
			}
		}
		else {
			req.setAttribute("message", "账号不存在或密码错误！");
			req.getRequestDispatcher("jiemian.jsp").forward(req,resp);
		}
	}
	private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user= new User(username,password,1);
		if(dao.add(user)) {
			req.setAttribute("message", "注册成功!");
			req.getRequestDispatcher("jiemian.jsp").forward(req, resp);
		}else {
			req.setAttribute("message", "账号重复，请重新输入!");
			req.getRequestDispatcher("zhuce.jsp").forward(req, resp);
		}
	}


}