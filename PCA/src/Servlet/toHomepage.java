package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/toHomepage")
public class toHomepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int apartment = 0;
	public String ID = null;

	public toHomepage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");

		if (request.getAttribute("ID") != null && request.getAttribute("ID") != "") {// 获取Login.java,或者导航栏页面传来的ID
			this.ID = (String) request.getAttribute("ID");
		}
		if (request.getParameter("ID") != null && request.getParameter("ID") != "") {// 获取Homepage.jsp,或者导航栏页面传来的ID
			this.ID = request.getParameter("ID");
		}
		if (request.getAttribute("calendar") != null) {
			this.ID = (String) request.getAttribute("calendar");
		}
		System.out.println("Homapage");
		String role = (String) request.getAttribute("role");
		System.out.println("tohomepage:" + role);
		request.setAttribute("role", role);
		request.setAttribute("ID", this.ID);
		request.setAttribute("calendar", request.getAttribute("calendar"));
		request.getRequestDispatcher("Homepage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
