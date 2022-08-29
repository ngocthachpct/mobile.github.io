package controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class SearchController
 */
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchController() {
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
		ListProductDAO dao = new ListProductDAO();

		try (PrintWriter out = response.getWriter()) {
			String action = "search";
			String name = request.getParameter("search");
			List<Product> list = dao.searchByName(name);
			if (!list.isEmpty()) {
				int page, numberPage = 6;
				int size = list.size();
				int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);
				String index = request.getParameter("index");
				if (index == null) {
					page = 1;
				} else {
					page = Integer.parseInt(index);
				}
				int start, end;
				start = (page - 1) * numberPage;
				end = Math.min(page * numberPage, size);
				List<Product> list1 = dao.getProductPage(list, start, end);
				request.setAttribute("products", list1);
				request.setAttribute("num", num);
				request.setAttribute("save", name);
				request.setAttribute("key", action);
			} else {
				request.setAttribute("mess", "product isvalid");
				request.setAttribute("alert", "warning");
			}

			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
