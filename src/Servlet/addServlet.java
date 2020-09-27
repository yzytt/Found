package Servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dao.Dao;
import Entity.FileUploadUtils;

/**
 * Servlet implementation class addServlet
 */
@WebServlet("/addServlet")
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String method = req.getParameter("method");
		if ("dsAdd".equals(method)) {
			dsAdd(req, resp);
		} else if ("jdAdd".equals(method)) {
			jdAdd(req, resp);
		}  else if ("addTip".equals(method)) {
			addTip(req, resp);
		} else if ("deleteuser".equals(method)) {
			deleteuser(req, resp);
		}  
		else if ("deleteds".equals(method)) {
			deleteds(req, resp);
		}  
		else if ("deletejd".equals(method)) {
			deletejd(req, resp);
		} 
		else if ("updateds".equals(method)) {
			updateds(req, resp);
		} 
		else if ("updatejd".equals(method)) {
			updatejd(req, resp);
		} else if ("main_right_deleteds".equals(method)) {
			main_right_deleteds(req, resp);
		} 
		else if ("main_right_updateds".equals(method)) {
			main_right_updateds(req, resp);
		} 
		else if ("main_right1_deletejd".equals(method)) {
			main_right1_deletejd(req, resp);
		} 
		else if ("main_right1_updatejd".equals(method)) {
			main_right1_updatejd(req, resp);
		} 
	}
    Dao dao = new Dao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private void dsAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
    	// TODO Auto-generated method stub
    			//response.getWriter().append("Served at: ").append(request.getContextPath());
    			//1乱码
//    			response.getWriter().append("Served at: ").append(request.getContextPath());
    		    request.setCharacterEncoding("utf-8");
    		    response.setContentType("text/html;charset=utf-8");
    		    
    		    String path = request.getServletContext().getRealPath("/upload");//  /指的是项目路径
    		    System.out.println(path);
    		    File dir = new File(path);
    		    if(!dir.exists()) {
    		    	dir.mkdirs();//创建
    		    }
    		    
    		    
    		    //2处理文件上传
    		    
    		    
    		    //2.1创建磁盘文件工厂
    		    DiskFileItemFactory factory = new DiskFileItemFactory();
//    		    factory.setSizeThreshold(1024*100);//使用缓存，设置缓存大小100k 默认10k
    		    //设置缓存位置
//    		    factory.setRepository(new File("d:\\..."));
    		    
    		    
    		    //创建文件解析器
    		    ServletFileUpload upload = new ServletFileUpload(factory);
    		    //判断是否为多分布表单
    		    if(!upload.isMultipartContent(request)) {
    		    	return;
    		    }
    		    //解析
    		    upload.setHeaderEncoding("utf-8");//解决文件名中文乱码
    		    //控制单独文件大小2M
//    		    upload.setFileSizeMax(1024*1024*2);
//    		    //控制总文件大小
//    		    upload.setSizeMax(1024*1025*50);
    			String name = null;
    			String filenameNow = null;
    			String ext = null;
    			String newfilename = null;
    		    try {
    				List<FileItem> fileItems = upload.parseRequest(request);//表单中数据
    				if(fileItems!=null) {
    					String[] value = new String[6];
    					int i = 0;
    					for(FileItem fileItem : fileItems) {
    						//处理表单中的普通数据数据
    						if(fileItem.isFormField()) {
    						     name = fileItem.getFieldName();
    						     
    							 if(!name.equals("submit")) {
    								 value[i] = fileItem.getString("utf-8");//注意乱码 
    								 i++;
    							 }
    							
    						}else {//处理文件数据
    							//流处理
    							InputStream is = fileItem.getInputStream();
    							String filename = fileItem.getName();
    							String temp[]=filename.split("\\\\");
    						    filenameNow = temp[temp.length-1];

    							//如果满zu上传文件
    							if(filenameNow==null||filenameNow.trim().equals("")) {
    								continue;
    							}
    							//控制上传文件的类型
    							ext = filenameNow.substring(filenameNow.lastIndexOf(".")+1);
    							List<String> acceptExts = new ArrayList<String>();
    							acceptExts.add("jpg");
    							acceptExts.add("png");
    							if(!acceptExts.contains(ext)) {
    								response.getWriter().write(filenameNow+"不支持此格式文件上传");
    								continue;
    							}
    							newfilename = FileUploadUtils.getNewFilename(filenameNow);
    							FileOutputStream fos = new FileOutputStream(dir+"\\"+newfilename);
    												
    							byte[] buf = new byte[1024*4];
    							int len = 0;
    							while((len=is.read(buf))!=-1) {
    								fos.write(buf,0,len);
    								
    							}
    							fos.close();
    							is.close();
    							
    							response.getWriter().write(filenameNow+"LOAD SUCCESS！");
    							
    						}
    						
    						
    					}
    					FileUploadUtils utils = new FileUploadUtils(value[0],value[1],value[2],value[3],value[4],value[5],newfilename);
    					if(dao.dsAdd(utils)) {
    						request.setAttribute("message", "寻物表单发布成功！！！");
    						request.getRequestDispatcher("index.jsp").forward(request, response);
    					}else {
    						request.setAttribute("message", "寻物表单发布失败，请重新发布！！！");
    						request.getRequestDispatcher("contact.jsp").forward(request, response);
    					}
    				}
    				
    				
    			} catch (FileUploadException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
		
	}
    private void jdAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
    	// TODO Auto-generated method stub
    			//response.getWriter().append("Served at: ").append(request.getContextPath());
    			//1乱码
//    			response.getWriter().append("Served at: ").append(request.getContextPath());
    		    request.setCharacterEncoding("utf-8");
    		    response.setContentType("text/html;charset=utf-8");
    		    
    		    String path = request.getServletContext().getRealPath("/upload");//  /指的是项目路径
    		    System.out.println(path);
    		    File dir = new File(path);
    		    if(!dir.exists()) {
    		    	dir.mkdirs();//创建
    		    }
    		    
    		    
    		    //2处理文件上传
    		    
    		    
    		    //2.1创建磁盘文件工厂
    		    DiskFileItemFactory factory = new DiskFileItemFactory();
//    		    factory.setSizeThreshold(1024*100);//使用缓存，设置缓存大小100k 默认10k
    		    //设置缓存位置
//    		    factory.setRepository(new File("d:\\..."));
    		    
    		    
    		    //创建文件解析器
    		    ServletFileUpload upload = new ServletFileUpload(factory);
    		    //判断是否为多分布表单
    		    if(!upload.isMultipartContent(request)) {
    		    	return;
    		    }
    		    //解析
    		    upload.setHeaderEncoding("utf-8");//解决文件名中文乱码
    		    //控制单独文件大小2M
//    		    upload.setFileSizeMax(1024*1024*2);
//    		    //控制总文件大小
//    		    upload.setSizeMax(1024*1025*50);
    			String name = null;
    			String filenameNow = null;
    			String ext = null;
    			String newfilename = null;
    		    try {
    				List<FileItem> fileItems = upload.parseRequest(request);//表单中数据
    				if(fileItems!=null) {
    					String[] value = new String[6];
    					int i = 0;
    					for(FileItem fileItem : fileItems) {
    						//处理表单中的普通数据数据
    						if(fileItem.isFormField()) {
    						     name = fileItem.getFieldName();
    						     
    							 if(!name.equals("submit")) {
    								 value[i] = fileItem.getString("utf-8");//注意乱码 
    								 i++;
    							 }
    							System.out.println( name + "....." + value);
    						}else {//处理文件数据
    							//流处理
    							InputStream is = fileItem.getInputStream();
    							String filename = fileItem.getName();
    							String temp[]=filename.split("\\\\");
    						    filenameNow = temp[temp.length-1];

    							//如果满zu上传文件
    							if(filenameNow==null||filenameNow.trim().equals("")) {
    								continue;
    							}
    							//控制上传文件的类型
    							ext = filenameNow.substring(filenameNow.lastIndexOf(".")+1);
    							List<String> acceptExts = new ArrayList<String>();
    							acceptExts.add("jpg");
    							acceptExts.add("png");
    							if(!acceptExts.contains(ext)) {
    								response.getWriter().write(filenameNow+"不支持此格式文件上传");
    								continue;
    							}
    							newfilename = FileUploadUtils.getNewFilename(filenameNow);
    							FileOutputStream fos = new FileOutputStream(dir+"\\"+newfilename);
    												
    							byte[] buf = new byte[1024*4];
    							int len = 0;
    							while((len=is.read(buf))!=-1) {
    								fos.write(buf,0,len);
    								
    							}
    							fos.close();
    							is.close();
    							
    							response.getWriter().write(filenameNow+"LOAD SUCCESS！");
    							
    						}
    						
    						
    					}
    					FileUploadUtils utils = new FileUploadUtils(value[0],value[1],value[2],value[3],value[4],value[5],newfilename);
    					if(dao.jdAdd(utils)) {
    						request.setAttribute("message", "招领表单发布成功！！！");
    						request.getRequestDispatcher("index.jsp").forward(request, response);
    					}else {
    						request.setAttribute("message", "招领表单发布失败，请重新发布！！！");
    						request.getRequestDispatcher("contact1.jsp").forward(request, response);
    					}
    				}
    				
    				
    			} catch (FileUploadException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
		
	}
    @SuppressWarnings("unused")
	private void deleteuser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String[] checkuser = request.getParameterValues("checkuser");
    	int[] id = new int[checkuser.length];
    	for(int i = 0 ; i < checkuser.length;i++) {
    		id[i] = Integer.parseInt(checkuser[i]) ;
    	}
    	if(dao.deleteuser(id) ){
    		request.setAttribute("message", "删除操作成功");
			request.getRequestDispatcher("usermanager.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "删除操作失败，请重新尝试！！！");
			request.getRequestDispatcher("usermanager.jsp").forward(request, response);
		
    	}
    	
    }
    private void deleteds(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String[] checkds = request.getParameterValues("checkds");
    	int[] id = new int[checkds.length];
    	for(int i = 0 ; i < checkds.length;i++) {
    		id[i] = Integer.parseInt(checkds[i]) ;
    	}
    	if(dao.deleteds(id) ){
    		request.setAttribute("message", "删除操作成功");
			request.getRequestDispatcher("managerds.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "删除操作失败，请重新尝试！！！");
			request.getRequestDispatcher("managerds.jsp").forward(request, response);
		
    	}
    	
    }
    private void deletejd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String[] checkjd = request.getParameterValues("checkjd");
    	int[] id = new int[checkjd.length];
    	for(int i = 0 ; i < checkjd.length;i++) {
    		id[i] = Integer.parseInt(checkjd[i]) ;
    	}
    	if(dao.deletejd(id) ){
    		request.setAttribute("message", "删除操作成功");
			request.getRequestDispatcher("managerjd.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "删除操作失败，请重新尝试！！！");
			request.getRequestDispatcher("managerjd.jsp").forward(request, response);
		
    	}
    	
    }
    private void updateds(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	int id = Integer.parseInt(request.getParameter("id")) ;
    	String name = request.getParameter("name");
    	String place = request.getParameter("place");
    	String time = request.getParameter("time");
    	String people = request.getParameter("people");
    	String info = request.getParameter("info");
    	if(dao.updateds(id,name,place,time,people,info)) {
    		request.setAttribute("message", "修改成功！！！");
			request.getRequestDispatcher("managerds.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "修改失败，请重新尝试！！！");
			request.getRequestDispatcher("updateds.jsp").forward(request, response);
		
    	}
    	
    }
    private void updatejd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	int id = Integer.parseInt(request.getParameter("id"));
    	String name = request.getParameter("name");
    	String place = request.getParameter("place");
    	String time = request.getParameter("time");
    	String people = request.getParameter("people");
    	String info = request.getParameter("info");
    	if(dao.updatejd(id,name,place,time,people,info)) {
    		request.setAttribute("message", "修改成功！！！");
			request.getRequestDispatcher("managerjd.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "修改失败，请重新尝试！！！");
			request.getRequestDispatcher("updatejd.jsp").forward(request, response);
		
    	}
    	
    }
    @SuppressWarnings("unused")
	private void updateuser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("Name");
    	String email = request.getParameter("Email");
    	String message = request.getParameter("Message");
    	if(dao.addTip(name,email,message)) {
    		request.setAttribute("message", "意见提交成功！！！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "意见提交失败，请重新尝试！！！");
			request.getRequestDispatcher("search.jsp").forward(request, response);
		
    	}
    }
    private void addTip(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("Name");
    	String email = request.getParameter("Email");
    	String message = request.getParameter("Message");
    	if(dao.addTip(name,email,message)) {
    		request.setAttribute("message", "意见提交成功！！！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "意见提交失败，请重新尝试！！！");
			request.getRequestDispatcher("search.jsp").forward(request, response);
		
    	}
    	
    }
    private void main_right1_updatejd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	int id = Integer.parseInt(request.getParameter("id"));
    	String name = request.getParameter("name");
    	String place = request.getParameter("place");
    	String time = request.getParameter("time");
    	String people = request.getParameter("people");
    	String info = request.getParameter("info");
    	if(dao.updatejd(id,name,place,time,people,info)) {
    		request.setAttribute("message", "修改成功！！！");
			request.getRequestDispatcher("main_right1.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "修改失败，请重新尝试！！！");
			request.getRequestDispatcher("main_right1.jsp").forward(request, response);
		
    	}
    	
    }
  private void main_right_updateds(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	int id = Integer.parseInt(request.getParameter("id")) ;
    	String name = request.getParameter("name");
    	String place = request.getParameter("place");
    	String time = request.getParameter("time");
    	String people = request.getParameter("people");
    	String info = request.getParameter("info");
    	if(dao.updateds(id,name,place,time,people,info)) {
    		request.setAttribute("message", "修改成功！！！");
			request.getRequestDispatcher("main_right.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "修改失败，请重新尝试！！！");
			request.getRequestDispatcher("main_right.jsp").forward(request, response);
		
    	}
    	
    }
 private void main_right1_deletejd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String[] checkjd = request.getParameterValues("checkjd");
    	int[] id = new int[checkjd.length];
    	for(int i = 0 ; i < checkjd.length;i++) {
    		id[i] = Integer.parseInt(checkjd[i]) ;
    	}
    	if(dao.deletejd(id) ){
    		request.setAttribute("message", "删除操作成功");
			request.getRequestDispatcher("main_right1.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "删除操作失败，请重新尝试！！！");
			request.getRequestDispatcher("main_right1.jsp").forward(request, response);
		
    	}
    	
    }
private void main_right_deleteds(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	request.setCharacterEncoding("utf-8");
    	String[] checkds = request.getParameterValues("checkds");
    	int[] id = new int[checkds.length];
    	for(int i = 0 ; i < checkds.length;i++) {
    		id[i] = Integer.parseInt(checkds[i]) ;
    	}
    	if(dao.deleteds(id) ){
    		request.setAttribute("message", "删除操作成功");
			request.getRequestDispatcher("main_right.jsp").forward(request, response);
    	}else {
			request.setAttribute("message", "删除操作失败，请重新尝试！！！");
			request.getRequestDispatcher("main_right.jsp").forward(request, response);
		
    	}
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
