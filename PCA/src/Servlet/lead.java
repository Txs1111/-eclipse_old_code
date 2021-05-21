package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lead")
public class lead extends HttpServlet {
	public String ID = null;
	private static final long serialVersionUID = 1L;

	public lead() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		int page = Integer.parseInt(request.getParameter("page"));
		if (request.getParameter("ID") != null) {
			this.ID = request.getParameter("ID");
		}

		request.setAttribute("ID", this.ID);
		if (page == 1) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toHomepage").forward(request, response);
		} else if (page == 2) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toAssignment").forward(request, response);
		} else if (page == 3) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toScore").forward(request, response);
		} else if (page == 4) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toMessage").forward(request, response);
		} else if (page == 5) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toWork").forward(request, response);
		} else if (page == 6) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toresource").forward(request, response);
		} else if (page == 7) {
			request.getSession().setAttribute("ID", this.ID);
			request.getRequestDispatcher("toSet").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
