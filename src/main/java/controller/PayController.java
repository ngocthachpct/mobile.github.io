package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.OrdersDAO;
import model.Cart;
import model.Orders;

/**
 * Servlet implementation class PayController
 */
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PayController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			String user = request.getParameter("user");
			OrdersDAO dao = new OrdersDAO();
			Cart c = (Cart) session.getAttribute("cart");
			String discount = request.getParameter("discount");
			String address = request.getParameter("address");
			String userMail = request.getParameter("mail");

			Date date = new Date();
			Orders d = new Orders(2, date, address, userMail, discount);
			if (user != "") {
				dao.insertOrder(d, c);
				c.removeAll();
				response.sendRedirect("index.jsp");
			} else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			response.getWriter().println(e);
			e.printStackTrace();
		}
	}
}
