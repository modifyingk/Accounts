package accounts_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BsnTrdDAO {
	String url = "jdbc:mysql://localhost:포트번호/DB명";
	String user = "USER";
	String password = "PASSWORD";
	Connection conn;
	
	public BsnTrdDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. Driver 설정 성공");
		
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("2. DB 연결 성공");
	}
	
	public ArrayList<BsnTrdVO> list() {
		ArrayList<BsnTrdVO> list = new ArrayList<>();
		try {
			String sql = "select trd_date, bsn_name, trd_item, trd_total from trade t, business b where t.trd_client = b.bsn_id;";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println("3. SQL문 생성 성공");
			
			ResultSet rs = ps.executeQuery();
			System.out.println("4. SQL문 전송 성공");
			
			while(rs.next()) {
				BsnTrdVO vo = new BsnTrdVO();
				vo.setTrd_date(rs.getString(1));
				vo.setBsn_name(rs.getString(2));
				vo.setTrd_item(rs.getString(3));
				vo.setTrd_total(rs.getInt(4));
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
