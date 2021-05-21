package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.MySQL_connect;
import bean.Handle_date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Work_handle
 */
@WebServlet("/Work_handle")
public class Work_handle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String ID = null; 
	String type = null; 
	String ifsurface = null; 
	String work_tittle = null; 
	String work_content = null; 
	String ifsuccess = "0";
	String ifshow= "0";
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Work_handle() {
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
		request.setCharacterEncoding("UTF-8");
		if(request.getAttribute("ID")!=null)
		{
			ID=(String)request.getAttribute("ID");
		}else if(request.getParameter("ID")!=null)
		{
			ID=request.getParameter("ID");
		}
		
		if(request.getAttribute("ifsurface")!=null)
		{
			ifsurface=(String)request.getAttribute("ifsurface");
		}else if(request.getParameter("ifsurface")!=null)
		{
			ifsurface=request.getParameter("ifsurface");
		}
		
		if(request.getAttribute("work_tittle")!=null)
		{
			work_tittle=(String)request.getAttribute("work_tittle");
		}else if(request.getParameter("work_tittle")!=null)
		{
			work_tittle=request.getParameter("work_tittle");
		}
		
		if(request.getAttribute("ifsurface")!=null)
		{
			ifsurface=(String)request.getAttribute("ifsurface");
		}else if(request.getParameter("ifsurfacet")!=null)
		{
			ifsurface=request.getParameter("ifsurface");
		}
		
		if(request.getAttribute("type")!=null)
		{
			type=(String)request.getAttribute("type");
		}else if(request.getParameter("type")!=null)
		{
			type=request.getParameter("type");
		}
		
		
		if(request.getAttribute("work_content")!=null)
		{
			work_content=(String)request.getAttribute("work_content");
		}else if(request.getParameter("work_content")!=null)
		{
			work_content=request.getParameter("work_content");
		}
		
		if(request.getAttribute("ifshow")!=null)
		{
			ifshow=(String)request.getAttribute("ifshow");
		}else if(request.getParameter("ifshow")!=null)
		{
			ifshow=request.getParameter("ifshow");
		}
		
		if(ifsurface.equals("0")){
			try{
				String sql="insert into all_works(ID,content,finish_date,type,tittle,if_show) value('"+ID+"','"+work_content+"','"+hd.getDate()+"','"+ifsurface+"','"+work_tittle+"','"+ifshow+"')";
				con.usercommend.executeUpdate(sql);
				ifsuccess = "1";
			}
			catch(SQLException e){
				request.setAttribute("ID", this.ID);
				request.setAttribute("type", this.type);
				request.setAttribute("ifsuccess", this.ifsuccess);
				request.getRequestDispatcher("Work.jsp").forward(request,response); 
			}
		}
		request.setAttribute("ID", this.ID);
		request.setAttribute("type", this.type);
		request.setAttribute("ifsuccess", this.ifsuccess);
		con.close();
		request.getRequestDispatcher("Work.jsp").forward(request,response); 
	}

}
