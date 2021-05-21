package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.countpage;


@WebServlet("/finished_mission_page")
public class finished_mission_page extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public finished_mission_page() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		ID = request.getParameter("ID");
		String missionID = request.getParameter("missionID");
		String act = request.getParameter("act");
		String topage = request.getParameter("topage");
		String allpage = request.getParameter("allpage");
		String nowpage = request.getParameter("nowpage");
		countpage getpages = new countpage();
		nowpage =  getpages.getpage(act, topage, allpage, nowpage);
		System.out.println("finished_page:nowpahe:" + nowpage);
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("missionID", missionID);
		request.setAttribute("ID", ID);
		request.getRequestDispatcher("Assignment_finished_details.jsp").forward(request, response);

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
