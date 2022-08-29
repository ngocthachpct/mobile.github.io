package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Account;
import context.DBContext;

public class RegisterDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Boolean checkMail(String mail) {
		try {
			String query = "SELECT user_mail FROM Account WHERE user_mail = ?";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, mail);
			rs = ps.executeQuery(); 
			while (rs.next()) {

				return true;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	public Boolean checkPhone(String phone) {
		try {
			String query = "SELECT user_phone FROM Account WHERE user_phone = ?";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	public Account addAccount(Account account) {
		String query = "insert into Account values(?,?,?,?,?,?);";
		try {
			conn = new DBContext().getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, account.getUsr());
			ps.setString(2, account.getPwd());
			ps.setInt(3, 2);
			ps.setString(4, account.getName());
			ps.setString(5, account.getAddress());
			ps.setString(6, account.getPhone());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
