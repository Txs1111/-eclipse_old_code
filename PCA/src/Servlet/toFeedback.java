package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/toFeedback")
public class toFeedback extends HttpServlet {
	String ifsuccess = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public toFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID = null;
		String text = null;
		if (request.getParameter("ID") != null && request.getParameter("ID") != "") {// 接受其他页面传来的Attribute
			ID = (String) request.getParameter("ID");
			text = (String) request.getParameter("text");
			feedback feedback = new feedback();
			feedback.setdate(ID, text);
			ifsuccess = "1";
			request.setAttribute("ifsuccess", this.ifsuccess);
			request.getRequestDispatcher("feedback.jsp").forward(request, response);
		} 
	}

}
