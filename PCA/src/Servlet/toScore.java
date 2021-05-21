package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toScore
 */
@WebServlet("/toScore")
public class toScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String ID = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public toScore() {
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
		if (request.getAttribute("ID") != null || request.getAttribute("ID") != "") {
			this.ID = (String) request.getAttribute("ID");
		}
		request.setAttribute("ID", this.ID);
		request.getRequestDispatcher("score.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("score.jsp").forward(request, response);
	}

}
