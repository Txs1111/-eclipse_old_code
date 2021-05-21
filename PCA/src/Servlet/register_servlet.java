package Servlet;

import java.io.IOException;

import dao.add_user;
import dao.check_same;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register_servlet")
public class register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public register_servlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("×¢²á1");
		request.setCharacterEncoding("UTF-8");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String account = request.getParameter("account");
		String username = request.getParameter("username");
		String school_ID = request.getParameter("school_ID");
		String clas = request.getParameter("clas");
		String apartment = request.getParameter("apartment");
		System.out.println(
				"username:" + username + "/school_ID:" + school_ID + "/clas:" + clas + "/apartment:" + apartment);
		check_same con = new check_same();
		int a = con.searchID("select * from users_login where ID='" + account + "'");
		if (a == 1) {
			System.out.println("0");
			request.setAttribute("tips", "sameaccount");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (!repassword.equals(password)) {
			System.out.println("1");
			request.setAttribute("tips", "passwrong");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (account.length() < 8 || password.length() < 8) {
			System.out.println("2");
			request.setAttribute("tips", "wrong");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else if (username.equals("") || school_ID.equals("") || clas.equals("")) {
			System.out.println("3");
			request.setAttribute("tips", "infwrong");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
			System.out.println("4");
			request.setAttribute("ID", account);
			add_user add = new add_user();
			int result = add.add(account, password, username, school_ID, clas, apartment);
			if (result == 1) {
				System.out.println("Ìø");
				request.setAttribute("ID",account);
				request.getRequestDispatcher("Homepage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
