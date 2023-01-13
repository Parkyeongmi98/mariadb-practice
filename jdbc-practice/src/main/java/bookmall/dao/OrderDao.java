package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrderVo;

public class OrderDao {
	public List<OrderVo> findAll() {
		List<OrderVo> result = new ArrayList<>();
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			conn = getConnection();
				
			// 3. Statement 준비
			String sql = "select a.no, a.order_no, c.name, c.email, b.count * d.price as price, a.address, d.no, d.title, b.count " 
						+ " from orders a, cart b, user c, book d"
						+ " where a.cart_no = b.no"
						+ " and a.user_no = c.no"
						+ " and b.book_no = d.no"
						+ " order by a.no desc";
			pstmt = conn.prepareStatement(sql);
				
				
			// 4. SQL 실행
			rs = pstmt.executeQuery(); 
				
			// 5. 결과 처리
			while (rs.next()) {
				OrderVo vo = new OrderVo();
				vo.setNo(rs.getLong(1));
				vo.setOrderNo(rs.getString(2));
				vo.setOrderName(rs.getString(3));
				vo.setOrderEmail(rs.getString(4));
				vo.setPrice(rs.getInt(5));
				vo.setAddress(rs.getString(6));
				vo.setBookNumber(rs.getLong(7));
				vo.setBookTitle(rs.getString(8));
				vo.setCount(rs.getLong(9));
				
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

	public void insert(OrderVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = getConnection();
			
			// 3. Statement 준비
			String sql = "insert into orders(no, order_no, price, address, user_no, cart_no) values(null, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getOrderNo());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getAddress());
			pstmt.setLong(4, vo.getUserNo());
			pstmt.setLong(5, vo.getCartNo());
		
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
		
	public void delete(OrderVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
					
			// 3. Statement 생성
			String sql = "delete" + 
					" from book" +
					" where no = ?";
			pstmt = conn.prepareStatement(sql);
				
			// 4. binding
			pstmt.setLong(1, vo.getNo());
				
			// 5. SQL 실행
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
			String url = "jdbc:mariadb://192.168.10.121:3307/bookmall?charset=utf8";   		
			// DriverManager의 Connection 불러오기
			// 2. 드라이버 연결하기
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");  // (url, 아이디, 비밀번호)
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		}
			
		return conn;
	}
}
