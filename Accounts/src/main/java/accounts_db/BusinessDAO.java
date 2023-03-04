package accounts_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BusinessDAO {
	String url = "jdbc:mysql://localhost:포트번호/DB명";
	String user = "USER";
	String password = "PASSWORD";
	Connection conn;
	
	public BusinessDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. Driver 설정 성공");
		
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("2. DB 연결 성공");
	}
	
	public void insert(BusinessVO vo) {
		int result = 0;
		try {
			String sql = "insert into business value (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getBsn_id());
			ps.setString(2, vo.getBsn_name());
			ps.setString(3, vo.getBsn_rep());
			ps.setString(4, vo.getBsn_addr());
			ps.setString(5, vo.getBsn_indus());
			ps.setString(6, vo.getBsn_type());
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
	
	public ArrayList<BusinessVO> list() {
		ArrayList<BusinessVO> list = new ArrayList<>();
		try {
			String sql = "select * from business";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println("3. SQL문 생성 성공");
			
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공");
			
			while(rs.next()) {
				BusinessVO vo = new BusinessVO();
				vo.setBsn_id(rs.getString(1));
				vo.setBsn_name(rs.getString(2));
				vo.setBsn_rep(rs.getString(3));
				vo.setBsn_addr(rs.getString(4));
				vo.setBsn_indus(rs.getString(5));
				vo.setBsn_type(rs.getString(6));
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
}
