package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DB.db;
import Entity.FileUploadUtils;
import Entity.User;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class Dao {
	private Connection con;
    private Statement stm;
    private ResultSet rs;
	public boolean dsAdd(FileUploadUtils utils) {
		String sql = "insert into ds(name,place,time,people,photoname,info,userName) values('" + utils.getName() + "','" + utils.getPlace() + "','" + utils.getTime() + "','" + utils.getPeople() + "','" + utils.getPhotoname() + "','" + utils.getInfo() +"','" + utils.getUserName() + "')";
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0 ;
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
	public boolean jdAdd(FileUploadUtils utils) {
		String sql = "insert into jd(name,place,time,people,photoname,info,userName) values('" + utils.getName() + "','" + utils.getPlace() + "','" + utils.getTime() + "','" + utils.getPeople() + "','" + utils.getPhotoname() + "','" + utils.getInfo() +"','" + utils.getUserName() + "')";
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0 ;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
	public ResultSet  listAllds() {
		String sql = "SELECT * from ds ORDER BY id DESC";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
  	public Statement getStmed(){
    	  try{
    	     con=db.getConn();
    	     stm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    	  }catch(Exception e){e.printStackTrace(System.err);}
    	  return stm;
      }
  	public ResultSet getdsPartRs(String subsql,String subsqlvalue){
   		if(subsql==null)
   			subsql="";
   		if(subsqlvalue==null)
   			subsqlvalue="";
   		System.out.println(subsql+subsqlvalue);
   		String sql="select * from ds where "+subsql+" like '%"+subsqlvalue+"%' "; 
   		try{
			stm=getStmed();
			rs=stm.executeQuery(sql);
		}
		catch(SQLException e){e.printStackTrace();}
		return rs;
	}
  	public ResultSet getjdPartRs(String subsql,String subsqlvalue){
   		if(subsql==null)
   			subsql="";
   		if(subsqlvalue==null)
   			subsqlvalue="";
   		System.out.println(subsql+subsqlvalue);
   		String sql="select * from jd where "+subsql+" like '%"+subsqlvalue+"%' "; 
   		try{
			stm=getStmed();
			rs=stm.executeQuery(sql);
		}
		catch(SQLException e){e.printStackTrace();}
		return rs;
	}
  	public ResultSet  listAlljd() {
		String sql = "SELECT * from jd ORDER BY id DESC";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	public ResultSet  searchJdByname(int id) {
		String sql = "select * from jd where id = "+id;
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }

	public String search(String username) {
		String sql = "select * from users where ";
		if (username != "") {
			sql += "userName = '" + username + "'";
		}
		Connection conn = db.getConn();
		Statement state = null;
		ResultSet rs = null;
		String password2 = null;
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {
				password2 = rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(rs, state, conn);
		}
		return password2;
	}
	public int type(String username) {
		String sql = "select * from users where ";
		if (username != "") {
			sql += "userName = '" + username + "'";
		}
		Connection conn = db.getConn();
		Statement state = null;
		ResultSet rs = null;
		int type = 0;
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {
				type = rs.getInt("type");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(rs, state, conn);
		}
		return type;
	}
	public boolean add(User user) {
		if(type(user.getUserName())==1)
		{
			return false;
		}
		String sql = "insert into users(username, password,type) values('" + user.getUserName() + "','" + user.getPassword()
				+"'," + user.getType() + ")";
		// 创建数据库链接
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0;
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭z 连接
			db.close(state, conn);
		}

		if (a > 0) {
			f = true;
		}
		return f;
	}
	public ResultSet  searchDsByname(int id) {
		String sql = "select * from ds where id = "+id;
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	
	public ResultSet searchdsByuserName(String userName) {
		String sql = "select * from ds where userName ='"  +userName+"'";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	public ResultSet searchjdByuserName(String userName) {
		String sql = "select * from jd where userName ='"  +userName+"'";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	
	public ResultSet listdsByid(int id) {
		String sql = "select * from ds where id =" + id;
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	public ResultSet listjdByid(int id) {
		String sql = "select * from jd where id ='"  +id+"'";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
	public boolean deleteds (int id) {
		boolean f = false;
		String sql = "delete from ds where id='" + id + "'";
		
		Connection conn = db.getConn();
		Statement state = null;
		int a = 0;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
	public boolean deletejd (int id) {
		boolean f = false;
		String sql = "delete from jd where id='" + id + "'";
		
		Connection conn = db.getConn();
		Statement state = null;
		int a = 0;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
	
	public boolean deleteuser(int id) {
		boolean f = false;
		String sql = "delete from users where id='" + id + "'";
		
		Connection conn = db.getConn();
		Statement state = null;
		int a = 0;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
	
public ResultSet  listAlluser() {
		String sql = "SELECT * from users ";
	   		Connection conn = db.getConn();
	   		ResultSet rs = null;
	   		try{
				 Statement state = conn.createStatement();
				 rs=state.executeQuery(sql);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return rs;
    }
public boolean deleteuser(int [] id) {
		// TODO Auto-generated method stub
		int number = id.length;
		boolean f = false;
		int i = 0;
		int sum = 0;
		while(i < number) {
			String sql = "delete from users where id='" + id[i] + "'";
			i++;
			Connection conn = db.getConn();
			Statement state = null;
			int a = 0;
			
			try {
				state = conn.createStatement();
				a = state.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.close(state, conn);
			}
			if(a == 1 ) {
				sum = sum + 1;
			}
		}
		
		
		
		if (sum == id.length) {
			f = true;
		}
		return f;
	}
	public boolean deleteds(int [] id) {
		// TODO Auto-generated method stub
		int number = id.length;
		boolean f = false;
		int i = 0;
		int sum = 0;
		while(i < number) {
			String sql = "delete from ds where id='" + id[i] + "'";
			i++;
			Connection conn = db.getConn();
			Statement state = null;
			int a = 0;
			
			try {
				state = conn.createStatement();
				a = state.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.close(state, conn);
			}
			if(a == 1 ) {
				sum = sum + 1;
			}
		}
		
		
		
		if (sum == id.length) {
			f = true;
		}
		return f;
	}
	public boolean deletejd(int [] id) {
		// TODO Auto-generated method stub
		int number = id.length;
		boolean f = false;
		int i = 0;
		int sum = 0;
		while(i < number) {
			String sql = "delete from jd where id='" + id[i] + "'";
			i++;
			Connection conn = db.getConn();
			Statement state = null;
			int a = 0;
			
			try {
				state = conn.createStatement();
				a = state.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.close(state, conn);
			}
			if(a == 1 ) {
				sum = sum + 1;
			}
		}
		
		
		
		if (sum == id.length) {
			f = true;
		}
		return f;
	}
	
	public boolean updateds( int id,String name,String place,String time,String people,String info) {
		String sql = "update ds set name='" + name + "', place='" + place
		+ "', time='" + time + "', people='" + people +"', info='" + info + "' where id='"
		+ id + "'";
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0 ;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
		
	}
	public boolean updatejd(int id,String name,String place,String time,String people,String info) {
		String sql = "update jd set name='" + name + "', place='" + place
				+ "', time='" + time + "', people='" + people +"', info='" + info + "' where id='"
				+ id + "'";
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0 ;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
		
	}
	public boolean addTip(String name,String email,String message) {
		String sql = "insert into tip(name,email,message) values('" + name + "','" + email + "','" + message + " ')";
		Connection conn = db.getConn();
		Statement state = null;
		boolean f = false;
		int a = 0 ;
		
		try {
			state = conn.createStatement();
			a = state.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//鍏抽棴z	杩炴帴
			db.close(state, conn);
		}
		
		if (a > 0) {
			f = true;
		}
		return f;
	}
}
	

