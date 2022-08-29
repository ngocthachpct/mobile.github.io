package controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListProductDAO;
import dao.LoginDAO;
import dao.OrdersDAO;
import model.Orders;
import model.Product;
import model.ProductOrders;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/accountmanager")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		OrdersDAO dao = new OrdersDAO();
		LoginDAO ldao = new LoginDAO();
		ListProductDAO pDao = new ListProductDAO();
		
		try (PrintWriter out = response.getWriter()) {
			String usermail = request.getParameter("usermail");
			HttpSession session = request.getSession(true);
			
			if (ldao.getRole(usermail)==2) {
				session.setAttribute("name", usermail);
				List<Orders> list = dao.getOrder(usermail);
				int page, numberPage = 6;
				int size = list.size();
				int num =(size%6 == 0?(size/6):((size/6))+1);
				String index = request.getParameter("index");
				if (index == null) {
					page =1;
				}else {
					page = Integer.parseInt(index);
				}
				int start, end;
				start=(page-1)*numberPage;
				end = Math.min(page*numberPage, size);
				List<Orders> list1 = dao.getOrdersPage(list, start, end);
				request.setAttribute("order", list1);
				request.setAttribute("num", num);
				String action = request.getParameter("action");
				if(action!= null && action.equalsIgnoreCase("view")) {
					request.setAttribute("view","view");
					String id = request.getParameter("id");
					int idd = Integer.parseInt(id);
					List<ProductOrders> pOrders = dao.getProductOrdersById(usermail, idd);
					request.setAttribute("detail", pOrders);
				}
				RequestDispatcher rd = request.getRequestDispatcher("user-account.jsp");
				rd.forward(request, response);
			}else {
				session.setAttribute("name", usermail);
				List<Product> list = pDao.getAllProduct();
				int page, numberPage = 6;
				int size = list.size();
				int num =(size%6 == 0?(size/6):((size/6))+1);
				String index = request.getParameter("index");
				if (index == null) {
					page =1;
				}else {
					page = Integer.parseInt(index);
				}
				int start, end;
				start=(page-1)*numberPage;
				end = Math.min(page*numberPage, size);
				List<Product> list1 = pDao.getProductPage(list, start, end);
				request.setAttribute("products", list1);
				request.setAttribute("num", num);
				RequestDispatcher rd = request.getRequestDispatcher("admin-index.jsp");
				rd.forward(request, response);
			}
			
			
		} catch (Exception ex) {
			java.util.logging.Logger.getLogger(SearchController.class.getName()).log(java.util.logging.Level.SEVERE,
					null, ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
