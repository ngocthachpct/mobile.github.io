package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.RegisterDAO;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		try {
			request.getSession(true).invalidate();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String repass = request.getParameter("repass");
			String mail = request.getParameter("mail");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			Account account = new Account(mail, password, 2, username, address, phone);
			RegisterDAO registerDAO = new RegisterDAO();
			HttpSession session = request.getSession(true);
			
			if (registerDAO.checkMail(account.getUsr())==true || registerDAO.checkPhone(account.getPhone())==true) {
				session.setAttribute("warning", "Your mail or phone already used");
				response.sendRedirect("register.jsp");
			} else if(password!=repass){
				session.setAttribute("warning", "Confirm Password different password!");
				response.sendRedirect("register.jsp");
			}else {
				registerDAO.addAccount(account);
				response.sendRedirect("login.jsp");
			}

		} catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}

}
