package accounts_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TradeDAO {
	String url = "jdbc:mysql://localhost:포트번호/DB명";
	String user = "USER";
	String password = "PASSWORD";
	Connection conn;
	
	public TradeDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. Driver 설정 성공");
		
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("2. DB 연결 성공");
	}
	
	public void insert(TradeVO vo) {
		int result = 0;
		try {
			String sql = "insert into trade (trd_date, trd_client, trd_item, trd_total) values (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTrd_date());
			ps.setString(2, vo.getTrd_client());
			ps.setString(3, vo.getTrd_item());
			ps.setInt(4, vo.getTrd_total());
			System.out.println("3. SQL문 생성 성공");
			
			result = ps.executeUpdate();
			if(result != 0) {
				System.out.println("데이터베이스에 저장 성공!");
			} else {
				System.out.println("** 데이터베이스에 저장 실패 **");
			}
			System.out.println("4. SQL문 전송 성공");
			
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(TradeVO vo) {
		int result = 0;
		try {
			String sql = "update trade set trd_date = ?, trd_client = ?, trd_item = ?, trd_total = ? where trd_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTrd_date());
			ps.setString(2, vo.getTrd_client());
			ps.setString(3, vo.getTrd_item());
			ps.setInt(4, vo.getTrd_total());
			ps.setInt(5, vo.getTrd_id());
			System.out.println("3. SQL문 생성 성공");
			
			result = ps.executeUpdate();
			if(result != 0) {
				System.out.println("데이터베이스에 저장 성공!");
			} else {
				System.out.println("** 데이터베이스에 저장 실패 **");
			}
			System.out.println("4. SQL문 전송 성공");
			
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int trd_id) {
		int result = 0;
		try {
			String sql = "delete from trade where trd_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, trd_id);
			System.out.println("3. SQL문 생성 성공");
			
			result = ps.executeUpdate();
			if(result != 0) {
				System.out.println("데이터베이스에서 삭제 성공!");
			} else {
				System.out.println("** 데이터베이스에서 삭제 실패 **");
			}
			System.out.println("4. SQL문 전송 성공");
			
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/*
	public ArrayList<TradeVO> list() {
		ArrayList<TradeVO> list = new ArrayList<>();
		try {
			String sql = "select * from trade order by trd_date";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println("3. SQL문 생성 성공");
			
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공");
			
			while(rs.next()) {
				TradeVO vo = new TradeVO();
				vo.setTrd_id(rs.getInt(1));
				vo.setTrd_date(rs.getString(2));
				vo.setTrd_client(rs.getString(3));
				vo.setTrd_item(rs.getString(4));
				vo.setTrd_total(rs.getInt(5));
				list.add(vo);
			}
			
			ps.close();
			conn.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}
	*/
}
