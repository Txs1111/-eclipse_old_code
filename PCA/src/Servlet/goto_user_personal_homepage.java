package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.user_personal_homepage_bean;

/**
 * Servlet implementation class goto_user_personal_homepage
 */
@WebServlet("/goto_user_personal_homepage")
public class goto_user_personal_homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goto_user_personal_homepage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		String toID=request.getParameter("toID");
		String goID=(String)request.getSession().getAttribute("ID");
		user_personal_homepage_bean bean=new user_personal_homepage_bean(null);
		bean.creat_page(goID);
		System.out.println("创建个人主页"+goID);
		bean.creat_page(toID);
		System.out.println("创建个人主页"+toID);
		if(toID.equals(goID)){
			//去用户自己可编辑的主页
			System.out.println("去自己的");
			request.getRequestDispatcher("user_personal_homepage.jsp").forward(request, response);
		}else{
			//去其他用户不可编辑的主页
			System.out.println("去别人的");
			
			request.setAttribute("toID", toID);
			request.getRequestDispatcher("user_personal_homepage_for_visit.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
