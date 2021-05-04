package co.kr.member.model;

import  co.kr.member.util.*;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;


import javax.naming.*;

public class memberdao {
	
	private static memberdao dao= new memberdao();
	private static DataSource ds;//서버 content xml건드려야함
	private static int yes=1;
	private static int no=0;
	private static int passwordfail=-1;
	
	private memberdao(){
	try {
		Context ct = new InitialContext();///context.xml읽기 위한
		ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql2");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
	}
	
	public static memberdao getinstance()
	{
		if(dao==null)
		{
			dao=new memberdao();
		}
		return dao;
	} 
	public int delete(String id)
	{
		String sql="delete from members where id=?";
		
		Connection conn= null;
		PreparedStatement pstmt=null;
		int rn=0;
		
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료"+"update2");
			
			pstmt=conn.prepareStatement(sql);

			System.out.println(pstmt);
			pstmt.setString(1, id);
			rn=pstmt.executeUpdate();
			System.out.println(rn+"update2");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
		}

		return rn;
	}
	public int updateinfor(String id,Membervo mem)
	{
		
		String sql="update members set id=?,name=?,email=? where id=?";
		
		Connection conn= null;
		PreparedStatement pstmt=null;
		int rn=0;
		
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료"+"update2");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getEmail());
			pstmt.setString(4, id);
			System.out.println(pstmt);
			
			rn=pstmt.executeUpdate();
			System.out.println(rn+"update2");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
		}

		return rn;
	}
	public int updatepwd(String id,String newpwd)
	{
		String sql="update members set pwd=? where id=?";
		
		Connection conn= null;
		PreparedStatement pstmt=null;
		int rn=0;
		
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료"+"update");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newpwd);
			pstmt.setString(2, id);
			System.out.println(pstmt);
			
			rn=pstmt.executeUpdate();
			System.out.println(rn+"update");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
		}

	
		return rn;
	}
	public Membervo getinfor(String id)
	{
		String sql="select * from members where id=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(id);
		Membervo m=new Membervo();
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료 전체정보");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(pstmt+"전체정보");
			
			rs=pstmt.executeQuery();	
			rs.next();///제발 이거 잊어먹지마라 
			m.setId(rs.getString("id"));
			m.setPwd(rs.getString("pwd"));
			m.setName(rs.getString("name"));
			m.setEmail(rs.getString("email"));
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
			jdbcutil.close(rs);
		}
		return m;
	}
	public int login(String id,String pwd)
	{

		String sql="select pwd from members where id=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(id);
		int check=0;
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료 로그인");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(pstmt+"로그인");
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("pwd").equals(pwd))
				{
					check=yes;
				}
				else
				{
					check=passwordfail;
				}
			}
			else
			{
				check=no;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
			jdbcutil.close(rs);
		}
		return check;
	}
	public int sinup(Membervo memver)
	{
		String sql="insert into members(id,pwd,name,email)values(?,?,?,?)";
		Connection conn= null;
		PreparedStatement pstmt=null;
		int rn=0;
		
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memver.getId());
			pstmt.setString(2, memver.getPwd());
			pstmt.setString(3, memver.getName());
			pstmt.setString(4, memver.getEmail());
			System.out.println(pstmt);
			
			rn=pstmt.executeUpdate();
			System.out.println(rn+"ss");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
		}
		return rn;
	}
	
	public boolean confirmid(String id)
	{
		String sql="select id from members where id=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(id);
		boolean check=false;
		
		try {
			
			conn=ds.getConnection();
			System.out.println(conn+"접속완료");
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(pstmt);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				check= true;
			}
			else
			{
				check= false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			jdbcutil.close(conn);
			jdbcutil.close(pstmt);
			jdbcutil.close(rs);
		}
		return check;
	}
	

}
