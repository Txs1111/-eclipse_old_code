package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.*;

/**
 * Servlet implementation class develop_journal
 */
@WebServlet("/develop_journal")
public class develop_journal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public develop_journal() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String ID=(String)request.getSession().getAttribute("ID");
		if(ID==null||"".equals(ID)||"null".equals(ID)){
			request.setAttribute("alter", "1");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		add_develop_journal addone = new add_develop_journal();
		int result = addone.add_journal(request.getParameter("content"), request.getParameter("role"),
				request.getParameter("version"));
		PrintWriter pw = response.getWriter();
		if (result == 1) {
			pw.write("<script language='javascript'>alert('success!!')</script>");
			response.setContentType("text/html;charset=UTF-8");
			response.setHeader("refresh", "0.5;url=todevelop_journal");
		}
		if (result == 2) {
			pw.write("<script language='javascript'>alert('No content!!')</script>");
			response.setHeader("refresh", "0.5;url=todevelop_journal");

		}
		if (result == 3) {
			pw.write("<script language='javascript'>alert('No developer')</script>");
			response.setHeader("refresh", "0.5;url=todevelop_journal");

		}
		if (result == 4) {
			pw.write("<script language='javascript'>alert('No version!!')</script>");
			response.setHeader("refresh", "0.5;url=todevelop_journal");

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
