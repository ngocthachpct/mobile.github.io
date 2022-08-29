package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;
import model.ProductOrders;

public class DetailDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public ProductOrders getOrder(int orderID) {

		try {
			String query = "select od.order_id\r\n" + "      ,product_id\r\n" + "      ,amount_product\r\n"
					+ "      ,price_product from Orders_detail od right join Orders o on od.order_id = o.order_id where o.order_id =?";
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, orderID);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new ProductOrders(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getFloat(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		DetailDAO dao = new DetailDAO();
		ProductOrders p = dao.getOrder(1);
		System.out.println(p);
	}
}
