package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/notice_detail")
public class notice_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String notice_ID = null;
	public String ID = null;

	public notice_detail() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		notice_ID = request.getParameter("notice_ID");
		request.setAttribute("notice_ID", this.notice_ID);
		ID = request.getParameter("ID");
		request.setAttribute("ID", this.ID);
		request.getRequestDispatcher("notice_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
