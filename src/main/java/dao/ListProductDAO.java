package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import context.DBContext;
import model.Product;

public class ListProductDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Product> getProductPage(List<Product> list,int start, int end) {
		List<Product> list1 = new ArrayList<>();
		for(int i = start; i< end; i++) {
			list1.add(list.get(i));
		}
		return list1;
	}

	public List<Product> searchByName(String name) throws Exception {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products\n" + "where [product_name] like ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + name + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public Product getProductById(int id) {
		String query = "select * from Products\n" + "where [product_id] = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}

	public static void main(String[] args) throws Exception {
		ListProductDAO dao = new ListProductDAO();
		List<Product> list = dao.searchByName("12");
		System.out.println(list);
		System.out.println();
		System.out.println();
		System.out.println(list.size());
	}
}
