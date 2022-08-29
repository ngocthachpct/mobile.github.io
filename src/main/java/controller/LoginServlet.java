package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.LoginDAO;
import model.Cart;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			request.getSession(true).invalidate();
			HttpSession session = request.getSession(true);
			session.setAttribute("cart", cart);

			String user = request.getParameter("username");
			String password = request.getParameter("password");
			LoginDAO dao = new LoginDAO();
			Account account = dao.checkLogin(user, password);
			if (account == null) {
				session.setAttribute("error", "wrong username or password");
				response.sendRedirect("login.jsp");
			} else {
				String remember = request.getParameter("remember");
				if (remember != null) {
					Cookie cookieName = new Cookie("cookUsername", user);
					cookieName.setMaxAge(120);
					Cookie cookiePass = new Cookie("cookPassword", password);
					cookiePass.setMaxAge(120);
					Cookie cookieRemember = new Cookie("cookRemember", remember);
					cookieRemember.setMaxAge(120);
					response.addCookie(cookieName);
					response.addCookie(cookiePass);
					response.addCookie(cookieRemember);
				}
				session.setAttribute("user", user);
				if (cart != null) {
					request.getRequestDispatcher("pay.jsp").forward(request, response);
				} else {
					response.sendRedirect("index.jsp");
				}
			}

		} catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
