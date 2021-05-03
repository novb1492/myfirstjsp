package co.kr.member.model;

import  co.kr.member.util.*;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;


import javax.naming.*;

public class memberdao {
	
	private static memberdao dao= new memberdao();
	private static DataSource ds;//서버 content xml건드려야함
	
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
	
	public int insert(Membervo memver)
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
