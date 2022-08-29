package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;
import model.ProductOrders;

public class OrdersDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public void insertOrder(Orders o, Cart c) throws Exception {
		String query = "insert into Orders ([user_mail]\r\n" + "      ,[order_status]\r\n" + "      ,[order_date]\r\n"
				+ "      ,[order_discount_code]\r\n" + "      ,[order_address]) values (?,?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, o.getUserMail());
			ps.setInt(2, o.getStatus());
			ps.setDate(3, new Date(o.getOrderDate().getTime()));
			ps.setString(4, o.getDiscount());
			ps.setString(5, o.getAddress());
			ps.executeUpdate();

			String query1 = "select top 1 order_id from [Orders] order by order_id desc";
			PreparedStatement ps1 = conn.prepareStatement(query1);
			rs = ps1.executeQuery();
			if (rs.next()) {
				int orderId = rs.getInt("order_id");
				for (Product p : c.getItems()) {
					String query2 = "insert into [Orders_detail] values (?,?,?,?)";
					PreparedStatement ps2 = conn.prepareStatement(query2);
					ps2.setInt(1, orderId);
					ps2.setInt(2, p.getId());
					ps2.setInt(3, p.getNumber());
					ps2.setFloat(4, p.getPrice());
					ps2.executeUpdate();
				}
			}

		} catch (SQLException e) {
			System.out.print(e);
		}

	}

	public List<Orders> getOrder(String usermail) {
		List<Orders> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM Orders WHERE user_mail = ?";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, usermail);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Orders(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5),
						rs.getString(6)));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Orders> getOrdersPage(List<Orders> list, int start, int end) {
		List<Orders> list1 = new ArrayList<>();
		for (int i = start; i < end; i++) {
			list1.add(list.get(i));
		}
		return list1;
	}

	public List<ProductOrders> getProductOrdersById(String mail, int id) {
		List<ProductOrders> list = new ArrayList<ProductOrders>();
		String query = "select Orders_detail.order_id, product_id, amount_product, price_product "
				+ "from Orders_detail join Orders on Orders_detail.order_id = Orders.order_id "
				+ "where user_mail = ? and Orders_detail.order_id =?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, mail);
			ps.setInt(2, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new ProductOrders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getFloat(4)));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public static void main(String[] args) {
		OrdersDAO dao = new OrdersDAO();
		List<Orders> list = dao.getOrder("thach@funix.com");
		List<Orders> list1 = dao.getOrdersPage(list, 0, 6);
		List<Orders> list2 = dao.getOrdersPage(list, 6, 7);
		System.out.println(list.size());
		System.out.println(list1.size());
		System.out.println(list2.size());
	}
}
