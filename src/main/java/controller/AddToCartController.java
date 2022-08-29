package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ListProductDAO;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCartController
 */
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			String idd = request.getParameter("id");
			int id = Integer.parseInt(idd);
			String action = request.getParameter("action");
			if (action != null && action.equalsIgnoreCase("add")) {
				if (session.getAttribute("cart") == null) {
					session.setAttribute("cart", new Cart());
				}
				
				Product p = (Product) new ListProductDAO().getProductById(id);
				Cart cart = (Cart) session.getAttribute("cart");
				cart.add(new Product(p.getId(), p.getName(), p.getDescritption(), p.getPrice(), p.getSrc(), p.getType(),
						p.getBrand(), p.getNumber()));

			} else if (action != null && action.equalsIgnoreCase("decrease")) {
				Cart cart = (Cart) session.getAttribute("cart");
				Product p = (Product) new ListProductDAO().getProductById(id);
				cart.decrease(new Product(p.getId(), p.getName(), p.getDescritption(), p.getPrice(), p.getSrc(), p.getType(),
						p.getBrand(), p.getNumber()));
			} else if (action != null && action.equalsIgnoreCase("delete")) {
				
				Cart cart = (Cart) session.getAttribute("cart");
				cart.remove(id);
			}

			response.sendRedirect("cart.jsp");
		} catch (Exception e) {
			response.getWriter().println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
