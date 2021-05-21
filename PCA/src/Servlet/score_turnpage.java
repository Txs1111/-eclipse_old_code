package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/score_turnpage")
public class score_turnpage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public score_turnpage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		int allpage = Integer.parseInt(request.getParameter("allpage"));
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		 ID = request.getParameter("ID");
		String act = request.getParameter("act");
		String jumpact = request.getParameter("jumpact");
		String jumppage = request.getParameter("jumppage");
		String page = ""+nowpage;// 传给score.jsp的页面值
		System.out.println(
				"act:" + act + "jumpact:" + jumpact + "jumppage:" + "nowpage:" + nowpage + "allpage:" + allpage);
		if (jumpact != null) {
			page = jumpact;
		} else if (act.equals("1")) {
			page = "1";
		} else if (act.equals("5")) {
			page = allpage + "";
		} else if (act.equals("2") && (nowpage - 1) >= 1) {
			page = (nowpage - 1) + "";
		} else if (act.equals("3")) {
			page = jumppage;
		} else if (act.equals("4") && (nowpage + 1) <= allpage) {
			page = ""+(nowpage + 1);
		}
		System.out.println("跳转的页面:" + page);
		request.setAttribute("ID", ID);
		request.setAttribute("topage", page);
		request.getRequestDispatcher("score.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
