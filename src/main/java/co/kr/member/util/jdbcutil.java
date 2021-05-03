package co.kr.member.util;

import java.sql.*;

public class jdbcutil {
	public static void close(Connection conn)
	{
		try {
			if(conn!=null)
			{
				conn.close();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt)//prepare 받을수 있다
	{
		try {
			if(stmt!=null)
			{
				stmt.close();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs)
	{
		try {
			if(rs!=null)
			{
				rs.close();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


}
