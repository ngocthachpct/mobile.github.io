package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=false";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}

	private static String serverName = "localhost";
	private static String dbName = "ShoppingDB";
	private static String portNumber = "1433";
	private static String userID = "sa";
	private static String password = "sa";

	public static void main(String[] args) {
		try {
			System.out.print(new DBContext().getConnection());
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
