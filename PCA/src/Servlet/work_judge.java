package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MySQL_connect;
import bean.Handle_date;
/**
 * Servlet implementation class work_judge
 */
@WebServlet("/work_judge")
public class work_judge extends HttpServlet {
	String ID = null; 
	String work_id = null;
	String points = null;
	String poster_id = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public work_judge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MySQL_connect con = new MySQL_connect();
		Handle_date hd = new Handle_date();
		if(request.getParameter("ID")!=null)
		{
			ID=request.getParameter("ID");
		}
		if(request.getParameter("work_id")!=null)
		{
			work_id=request.getParameter("work_id");
		}
		if(request.getParameter("points")!=null)
		{
			points=request.getParameter("points");
		}
		if(request.getParameter("poster_id")!=null)
		{
			poster_id=request.getParameter("poster_id");
		}
		try{
			String sql="insert into work_judge(poster_ID,judge_ID,points,judge_time,work_ID) value('"+poster_id+"','"+ID+"','"+points+"','"+hd.getDate()+"','"+work_id+"')";
			con.usercommend.executeUpdate(sql);
		}
		catch(SQLException e){
			request.getRequestDispatcher("Adminpages/check_works.jsp").forward(request,response); 
		}
		request.getRequestDispatcher("Adminpages/check_works.jsp").forward(request,response); 
	}

}
