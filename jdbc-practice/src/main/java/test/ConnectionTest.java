package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {
	
	public static void main(String[] args) {	
		Connection conn = null;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			// 2. 드라이버 연결하기
			String url = "jdbc:mariadb://192.168.10.121:3307/webdb?charset=utf8";   
			
			conn = DriverManager.getConnection(url, "webdb", "webdb");  // (url, 아이디, 비밀번호)
			
			System.out.println("연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);;
		} catch (SQLException e) {
			System.out.println("error: " + e);;
		} 

	}

}
