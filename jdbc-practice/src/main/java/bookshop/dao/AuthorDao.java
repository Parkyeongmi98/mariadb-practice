package bookshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookshop.vo.AuthorVo;

public class AuthorDao {
	public List<AuthorVo> findAll() {
		List<AuthorVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			// 3. Statement 준비
			String sql = " select no, name" 
						+ " from author";
			pstmt = conn.prepareStatement(sql);
			
			
			// 4. SQL 실행
			rs = pstmt.executeQuery(); 
			
			// 5. 결과 처리
			while (rs.next()) {
				AuthorVo vo = new AuthorVo();
				vo.setNo(rs.getLong(1));
				vo.setName(rs.getString(2));

				result.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("error: " + e);;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	public void insert(AuthorVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			// 3. Statement 준비
			String sql = "insert into author values(null, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
	
			// 4. SQL 실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("error: " + e);;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://192.168.10.121:3307/webdb?charset=utf8";   		
			// DriverManager의 Connection 불러오기
			// 2. 드라이버 연결하기
			conn = DriverManager.getConnection(url, "webdb", "webdb");  // (url, 아이디, 비밀번호)
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		}
		
		return conn;
	}
}


