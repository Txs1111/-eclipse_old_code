package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.add_web_journal;
import dao.userDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("ID");
		String password = request.getParameter("password");
		add_web_journal add_journal = new add_web_journal(username);
		add_journal.noothers("登录官网");
		userDao check = new userDao(username, password);// 创建对象，用来引用
		int result = check.checkuser();// 引用处理账号密码方法
		if (result == 1) {//账号密码正确， 跳转到处理主页数据页面toHomepage.java
			
			request.setAttribute("ID", username);
			request.getRequestDispatcher("toHomepage").forward(request, response);
		}
		if (result == 2) {//账号或密码密码不正确，返回到index.jsp页面收集数据，返回提示信息，passwrong
			request.setAttribute("tips", "passwrong");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		if (result == 3) {//账号不存在，返回提示信息，nouser
			request.setAttribute("tips", "nouser");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
