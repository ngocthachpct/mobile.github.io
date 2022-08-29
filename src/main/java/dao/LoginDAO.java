package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.Account;
import context.DBContext;

public class LoginDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Account checkLogin(String user, String pass) {
		try {
			String query = "SELECT * FROM Account WHERE user_mail = ? and password = ? ";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6));
				return account;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}

	public int getRole(String usermail) {
		try {
			String query ="select account_role from Account where user_mail = ?";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, usermail);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public static void main(String[] args) {
		LoginDAO dao = new LoginDAO();
		System.out.println(dao.checkLogin("duongdt@fpt.com.vn", "123"));
	}
}
